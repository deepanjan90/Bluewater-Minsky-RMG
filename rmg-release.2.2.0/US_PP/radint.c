/************************** SVN Revision Information **************************
 **    $Id: radint.c 1402 2011-05-13 17:20:54Z luw $    **
******************************************************************************/

/****f* QMD-MGDFT/radint.c *****
 * NAME
 *   Ab initio real space code with multigrid acceleration
 *   Quantum molecular dynamics package.
 *   Version: 2.1.5
 * COPYRIGHT
 *   Copyright (C) 1995  Emil Briggs
 *   Copyright (C) 1998  Emil Briggs, Charles Brabec, Mark Wensell, 
 *                       Dan Sullivan, Chris Rapcewicz, Jerzy Bernholc
 *   Copyright (C) 2001  Emil Briggs, Wenchang Lu,
 *                       Marco Buongiorno Nardelli,Charles Brabec, 
 *                       Mark Wensell,Dan Sullivan, Chris Rapcewicz,
 *                       Jerzy Bernholc
 * FUNCTION
 *   double radint(double *f, double *r, int n, double al)
 *   Radial integation function for data defined on a log grid.
 *   We assume that the function being integrated goes to zero at
 *   for large r-values.
 * INPUTS
 *   f:   function being integrated
 *   r:   array of r-values in log-mesh
 *   n:   number of points in radial mesh
 *   al:  log mesh parameter
 * OUTPUT
 *   integrated result is returned
 * PARENTS
 *   init_kbr.c rft.c
 * CHILDREN
 *   nothing 
 * SOURCE
 */
#include <math.h>
#include "main.h"
#include <float.h>

double radint (double *f, double *r, int n, double al)
{

    int i;
    double rval = (9.0 * f[0] * r[0] * r[0] * r[0] +
                   28.0 * f[1] * r[1] * r[1] * r[1] + 23.0 * f[2] * r[2] * r[2] * r[2]) / 24.0;


    for (i = 3; i < n; i++)
        rval += f[i] * r[i] * r[i] * r[i];


    rval = al * rval + (f[0] * r[0] * r[0] * r[0]) / 3.0;

    return rval;
}



/******/
