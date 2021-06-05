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
      mwPointer  :: r,input,matrix,ro
                    
      ! Output
      mwPointer  :: output
      
    ! Array size information
      integer(4) :: Nx,Ny,complexFlag,classid      ! length of input (output) array
	  mwSize     :: ndim
      mwSize     :: dims(2)                   ! dimensions (for mxCreateNumericArray)
      mwPointer  :: mrows,mcol
      
!--------------------------------------------------------------------------------    
	  
	  classid = mxClassIDFromClassName('double')
      complexFlag = 0  
      
    ! Retrieve input parameter pointers
      r = mxGetPr(prhs(1))
      input = mxGetPr(prhs(2))
      matrix= mxGetPr(prhs(3))
      ro= mxGetPr(prhs(4))
      
     ! Create matrices for return arguments
      
      mrows = mxGetM(prhs(2))
            
     !plhs(1) = mxCreateNumericArray(ndim, dims, classid, complexflag)
      plhs(1) = mxCreateDoubleMatrix(mrows,1,0)
      output = mxGetPr(plhs(1))

      !call computation function
	  call  resamp(%val(output),%val(r),%val(input),%val(matrix),%val(ro))								          
      return  
      
end subroutine

subroutine resamp(output,r,input,matrix,ro)

implicit none


integer(4), intent(in)                           :: r,ro
real(8), dimension(ro), intent(in)               :: matrix
real(8), dimension(r), intent(in)                :: input
real(8), dimension(r), intent(out)               :: output

!define further variables
integer(4)				     :: i1,t1,j1

do i1=1,r
    output(i1)=count(matrix==input(i1))
end do

return
end subroutine