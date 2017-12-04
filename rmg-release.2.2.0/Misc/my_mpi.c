/************************** SVN Revision Information **************************
 **    $Id: my_mpi.c 2216 2014-03-21 20:58:30Z ebriggs $    **
******************************************************************************/

#include "main.h"


void my_barrier ()
{
    MPI_Barrier (pct.img_comm);
    /*MPI_Barrier (MPI_COMM_WORLD);*/

}

