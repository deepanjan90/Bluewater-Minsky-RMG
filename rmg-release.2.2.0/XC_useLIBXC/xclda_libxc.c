/************************** SVN Revision Information **************************
 **    $Id: xclda_libxc.c 3140 2015-08-06 15:48:24Z luw $    **
******************************************************************************/
#include "main.h"
#include "common_prototypes.h"
#include <float.h>
#include <math.h>
#include "xc.h"   
/* include Libxc's header file */


void xclda_libxc (double * rho, double * vxc, double * exc)
{
   /* XC_LDA_X = 1, XC_LDA_C_PZ = 9, XC_LDA_C_PW = 12*/
    int func_id_x = 1, func_id_c = 9; 
    int FP0_BASIS;
    xc_func_type func_x, func_c;
    double *ec, *vc; 
    int idx;

    FP0_BASIS = get_FP0_BASIS();

    if(xc_func_init(&func_x, func_id_x, XC_UNPOLARIZED) != 0)
    {
	if (pct.imgpe == 0)    
    		printf( "Functional %d not found\n", func_id_x);
    	exit(1);
    }
    
    if(xc_func_init(&func_c, func_id_c, XC_UNPOLARIZED) != 0)
    {
	if (pct.imgpe == 0)    
    		printf( "Functional %d not found\n", func_id_c);
    	exit(1);
    } 

    my_calloc (ec, 2 * FP0_BASIS, double);
    vc = ec + FP0_BASIS; 

    
    /* get the exchange part for energy and potential first*/    
    if (func_x.info->family == XC_FAMILY_LDA)
        xc_lda_exc_vxc (&func_x, FP0_BASIS, rho, exc, vxc); 


    /* get the correlation part for energy and potential */    
    if (func_c.info->family == XC_FAMILY_LDA)
        xc_lda_exc_vxc (&func_c, FP0_BASIS, rho, ec, vc); 
    
    xc_func_end (&func_x);
    xc_func_end (&func_c); 

    
    /* add exchange correlation together */ 
    for (idx = 0; idx < FP0_BASIS; idx++) 
    {
	    vxc[idx] += vc[idx];
	    exc[idx] += ec[idx];
    }

    my_free (ec);
}
