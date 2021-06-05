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
      mwPointer  :: panel_new,n,col,col_age,col_g

       ! Output
      mwPointer  :: fract_p
      
    ! Array size information
      integer(4) :: Nx,Ny,complexFlag,classid                       ! length of input (output) array
	  mwSize     :: ndim
      mwSize     :: dims(1)                    ! dimensions (for mxCreateNumericArray)
!--------------------------------------------------------------------------------    
	  classid = mxClassIDFromClassName('double')
      complexFlag = 0  

! Retrieve input parameter pointers
      panel_new = mxGetPr(prhs(1))
      n = mxGetPr(prhs(2))
      col = mxGetPr(prhs(3))
      col_age = mxGetPr(prhs(4))
      col_g = mxGetPr(prhs(5))
     
! Create matrices for return arguments
      
!size of output vector
     ndim = 1
	 dims(1) = 31

     plhs(1) = mxCreateNumericArray(ndim, dims, classid, complexflag)
 
     fract_p = mxGetPr(plhs(1))

!call computation function
	  call  fract(%val(fract_p),%val(panel_new),%val(n),%val(col),%val(col_age),%val(col_g))								  
        
      return  
      
    end subroutine
    
Subroutine fract(fract_p,panel_new,n,col,col_age,col_g)

implicit none

integer(4), intent(in)                           :: n,col,col_age,col_g
real(8), dimension(n,col), intent(in)            :: panel_new

real(8), dimension(32), intent(out)                   :: fract_p

!define further variables
integer(4)				            :: i1,t1,j1,age1
real(8), dimension(32)              :: sum_p,sum_n
  
!Start the Game

!Unconditional Kurtosis and Skewness

do age1=1,(32)
do i1=1,n
    if (panel_new(i1,col_age)==age1) then
    if (panel_new(i1,col_g)>0) then
        sum_p(age1)=sum_p(age1)+1
    elseif (panel_new(i1,col_g)<0) then
        sum_n(age1)=sum_n(age1)+1
    end if
    end if
end do
end do
do age1=1,(32)
fract_p(age1)=sum_p(age1)/(sum_p(age1)+sum_n(age1))
end do

return
end subroutine