/************************** SVN Revision Information **************************
 **    $Id: InitWeight.cpp 3731 2016-06-16 15:20:20Z luw $    **
******************************************************************************/

#include <float.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <sstream>

#include <complex>

#include "make_conf.h"
#include "const.h"
#include "grid.h"
#include "rmgtypedefs.h"
#include "typedefs.h"
#include "Kpoint.h"
#include "common_prototypes.h"
#include "common_prototypes1.h"
#include "transition.h"
#include "RmgException.h"
#include "RmgShm.h"


/*This sets loop over species does forward fourier transofrm, finds and stores whatever is needed so that
 * only backwards Fourier transform is needed in the calculation*/
void InitWeight (void)
{

    int ip, prjcount, isp, size, tot_proj;
    SPECIES *sp;
    fftw_plan p2_forward, p2_backward;
    fftw_complex *in, *out, *betaptr;
    std::complex<double> *phaseptr;
    int xdim, ydim, zdim, nldim_max;

    typedef struct {int species; int ip; int l; int m; int proj_index;} PROJ_INFO;
    PROJ_INFO proj;
    std::vector<PROJ_INFO> proj_iter;

    
    RmgTimer RT0("Weight");
    // get tot number of projectors and their information

    nldim_max = 0;
    tot_proj = 0;
    
    RmgTimer *RT1= new RmgTimer("Weight: phase and set");
    for (isp = 0; isp < ct.num_species; isp++)
    {
        /* Get species type */
        sp = &ct.sp[isp];

        nldim_max = std::max(nldim_max, sp->nldim);
        size = sp->nldim * sp->nldim * sp->nldim;
        sp->phase = new fftw_complex[size * ct.num_kpts_pe];
        phaseptr = (std::complex<double> *)sp->phase;
        GetPhaseSpecies(sp, phaseptr);
        /*Loop over all betas to calculate num of projectors for given species */
        prjcount = 0;
        for (ip = 0; ip < sp->nbeta; ip++)
        {

            for(int m = 0; m < 2*sp->llbeta[ip]+1; m++)
            {
                proj.species = isp;
                proj.ip = ip;
                proj.l = sp->llbeta[ip];
                proj.m = m;
                proj.proj_index = prjcount;
                proj_iter.push_back(proj);
                prjcount++;
            }
        }

        size = sp->nldim * sp->nldim * sp->nldim;
        if(!ct.localize_projectors) size = get_NX_GRID() * get_NY_GRID() * get_NZ_GRID();
        sp->num_projectors = prjcount;

        /*This array will store forward fourier transform on the coarse grid for all betas */
/*
        if(pct.procs_per_host > 1) {
            char sname[256];
            snprintf(sname, sizeof(sname), "RMG_ForwardBeta_%s", sp->atomic_symbol);
            sp->forward_beta = (fftw_complex *)AllocSharedMemorySegment(sname, sizeof(fftw_complex) * sp->num_projectors * size * ct.num_kpts_pe);
        }
        if(!sp->forward_beta) {
        }
*/
        sp->forward_beta = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * sp->num_projectors * size * ct.num_kpts_pe);

        if (sp->forward_beta == NULL)
            throw RmgFatalException() << "cannot allocate mem "<< " at line " << __LINE__ << "\n";

        tot_proj += prjcount;
    }

    delete RT1;

    xdim = std::max(nldim_max, get_NX_GRID() );
    ydim = std::max(nldim_max, get_NY_GRID() );
    zdim = std::max(nldim_max, get_NZ_GRID() );
    in = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * xdim * ydim * zdim);
    out = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * xdim * ydim * zdim);

    if(!in || !out)
        throw RmgFatalException() << "cannot allocate mem "<< " at line " << __LINE__ << "\n";


    RmgTimer *RT3= new RmgTimer("Weight: proj cal");
    for(int iproj = pct.gridpe; iproj < tot_proj; iproj+=pct.grid_npes)
    {
        proj = proj_iter[iproj];

        sp = &ct.sp[proj.species];

        // if sp->nldim > get_NX_GRID, folding of neighbor cells are needed. 
        xdim = sp->nldim;
        ydim = sp->nldim;
        zdim = sp->nldim;
        size = xdim * ydim * zdim;

        if(!ct.localize_projectors) {
            xdim = get_NX_GRID();
            ydim = get_NY_GRID();
            zdim = get_NZ_GRID();
            size = xdim * ydim * zdim;
        }


        p2_backward = fftw_plan_dft_3d (sp->nldim, sp->nldim, sp->nldim, in, out, FFTW_BACKWARD, FFTW_ESTIMATE);
        p2_forward = fftw_plan_dft_3d (xdim, ydim, zdim, in, out, FFTW_FORWARD, FFTW_ESTIMATE);


        for(int kpt = 0; kpt <ct.num_kpts_pe; kpt++)
        {
            phaseptr = (std::complex<double> *) &sp->phase[kpt * sp->nldim * sp->nldim * sp->nldim];
            betaptr = &sp->forward_beta[kpt *sp->num_projectors *size + proj.proj_index * size];
            InitWeightOne(sp, betaptr, phaseptr, proj.ip, proj.l, proj.m, p2_forward, p2_backward);
        }

        fftw_destroy_plan (p2_forward);
        fftw_destroy_plan (p2_backward);

    }                           /* end for */

    fftw_free(out);
    fftw_free(in);
    delete RT3;
    RmgTimer *RT4= new RmgTimer("Weight: bcast");

    int root;
    for(int iproj = 0; iproj < tot_proj; iproj++)
    {
        proj = proj_iter[iproj];
        sp = &ct.sp[proj.species];
        root = iproj % pct.grid_npes;
        size = sp->nldim * sp->nldim * sp->nldim;
        if(!ct.localize_projectors) size = get_NX_GRID() * get_NY_GRID() * get_NZ_GRID();

        for(int kpt = 0; kpt <ct.num_kpts_pe; kpt++)
        {
            betaptr = &sp->forward_beta[kpt *sp->num_projectors *size + proj.proj_index * size];
            MPI_Bcast(betaptr, 2*size, MPI_DOUBLE, root, pct.grid_comm);
        }
    }

    for (isp = 0; isp < ct.num_species; isp++)
    {
        sp = &ct.sp[isp];
        //        delete sp->phase;
    }


    delete RT4;
    RmgTimer *RT5= new RmgTimer("Weight: distr");
    // Next if using non-localized projectors we need to remap the global forward beta into domain-decomposed
    // forward beta
    if(ct.localize_projectors) return;

    int ilo = get_PX_OFFSET();
    int jlo = get_PY_OFFSET();
    int klo = get_PZ_OFFSET();
    int ihi = ilo + get_PX0_GRID();
    int jhi = jlo + get_PY0_GRID();
    int khi = klo + get_PZ0_GRID();
    int dimx = get_NX_GRID();
    int dimy = get_NY_GRID();
    int dimz = get_NZ_GRID();
    size = dimx * dimy * dimz;
    int dist_size = get_PX0_GRID() *  get_PY0_GRID() * get_PZ0_GRID();

    for (isp = 0; isp < ct.num_species; isp++)
    {
        /* Get species type */
        sp = &ct.sp[isp];

        std::complex<double> *saved_beta_all = (std::complex<double> *)sp->forward_beta;
        sp->forward_beta = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * dist_size * sp->num_projectors * ct.num_kpts_pe);

        for(int kpt = 0; kpt < ct.num_kpts_pe; kpt++){
            std::complex<double> *fptr = (std::complex<double> *)&sp->forward_beta[kpt * sp->num_projectors * dist_size];
            std::complex<double> *saved_beta = &saved_beta_all[kpt * sp->num_projectors * size];

            for(int iproj = 0;iproj < sp->num_projectors;iproj++) 
            {
                for(int i = 0;i < dimx;i++) {
                    for(int j = 0;j < dimy;j++) {
                        for(int k = 0;k < dimz;k++) {
                            bool map = (i >= ilo) && (i < ihi) && (j >= jlo) && (j < jhi) && (k >= klo) && (k < khi);
                            if(map) {
                                int idx1 = (i - ilo) * (jhi - jlo) * (khi - klo) + (j - jlo) * (khi - klo) + (k - klo);
                                int idx2 = i * dimy * dimz + j * dimz + k;
                                fptr[iproj * dist_size + idx1] = saved_beta[iproj * size + idx2]; 
                            }
                        }
                    }
                }
            }
        }

    }
    delete RT5;


}                               /* end InitWeight */
