#include "fintrf.h"
!----------------------------------------------------------------------------
! Gateway routine
!----------------------------------------------------------------------------
subroutine mexFunction(nlhs,plhs,nrhs,prhs)
    implicit none
    ! Arguments in mexFunction
      mwPointer  :: plhs(*), prhs(*)
      integer    :: nlhs, nrhs
    
    ! Function declarations
      mwPointer     mxCreateNumericArray ,mxGetPr, mxGetM, mxGetN
      mwPointer     mxGetDimensions, mxCreateDoubleMatrix
      integer(4)    mxClassIDFromClassName
      mwSize        mxGetNumberOfDimensions
      
      ! Pointers to input/output mxArrays:
      ! Input           
      mwPointer  :: H,T,panel_new,col,cols,col_g

       ! Output
      mwPointer  :: unc_mean
      
    ! Array size information
      integer(4) :: Nx,Ny,complexFlag,classid                       !length of input (output) array
	  mwSize     :: ndim
      mwSize     :: dims(1) ! dimensions (for mxCreateNumericArray)
!--------------------------------------------------------------------------------    
	  classid = mxClassIDFromClassName('double')
      complexFlag = 0  

! Retrieve input parameter pointers
      H = mxGetPr(prhs(1))
      T = mxGetPr(prhs(2))
      panel_new = mxGetPr(prhs(3))
      col = mxGetPr(prhs(4))
      cols = mxGetPr(prhs(5))
      col_g = mxGetPr(prhs(6))
     
! Create matrices for return arguments
      
!size of output vector
     ndim = 1
	 dims(1) = 31
     
     plhs(1) = mxCreateNumericArray(ndim, dims, classid, complexflag)
 
     unc_mean = mxGetPr(plhs(1))

!call computation function
	  call  Moment(%val(unc_mean),%val(H),%val(T),%val(panel_new),%val(col),%val(cols),%val(col_g))
						      
      return  
      
    end subroutine
    
Subroutine Moment(unc_mean,H,T,panel_new,col,cols,col_g)
implicit none

integer(4), intent(in)                           :: H,T,col,cols,col_g
real(8), dimension((T-1)*H,cols), intent(in)       :: panel_new
real(8), dimension(col), intent(out)             :: unc_mean

!define further variables
integer(4)				                 :: h1,t1
real(8), dimension(H,T-1)                :: g


!Start the Game
do h1=1,H
    do t1=1,T-1
        g(h1,t1)=panel_new((h1-1)*(T-1)+t1,col_g)
    end do
end do

do t1=1,col
    unc_mean(t1)=sum(g(:,t1))/count(g(:,t1)/=0)
end do

return
end subroutine