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
      mwPointer  :: r,ro,resid_coh_x_drop,inte
                    
      ! Output
      mwPointer  :: nresid_coh_x_drop
      
    ! Array size information
      integer(4) :: Nx,Ny,complexFlag,classid      ! length of input (output) array
	  mwSize     :: ndim
      mwSize     :: dims(2)                   ! dimensions (for mxCreateNumericArray)
      mwPointer  :: mrows
      
!--------------------------------------------------------------------------------    
	  
	  classid = mxClassIDFromClassName('double')
      complexFlag = 0  
      
    ! Retrieve input parameter pointers
      r = mxGetPr(prhs(1))
      ro = mxGetPr(prhs(2))
      resid_coh_x_drop = mxGetPr(prhs(3))
      inte = mxGetPr(prhs(4))
      
     ! Create matrices for return arguments
      
      mrows = mxGetM(prhs(4))
            
     !plhs(1) = mxCreateNumericArray(ndim, dims, classid, complexflag)
      plhs(1) = mxCreateDoubleMatrix(mrows,16,0)
      nresid_coh_x_drop = mxGetPr(plhs(1))

      !call computation function
	  call  resamp(%val(r),%val(ro),%val(resid_coh_x_drop),%val(inte),%val(nresid_coh_x_drop))
								          
      return  
      
end subroutine

subroutine resamp(r,ro,resid_coh_x_drop,inte,nresid_coh_x_drop)

implicit none

integer(4), intent(in)                           :: r,ro
real(8), dimension(ro,16), intent(in)            :: resid_coh_x_drop
real(8), dimension(r,2), intent(in)              :: inte
real(8), dimension(r,16), intent(out)            :: nresid_coh_x_drop

!define further variables
integer(4)				     :: i1,t1,j1

do j1=1,r
    do i1=1,ro
        if (resid_coh_x_drop(i1,15)==inte(j1,1).AND.resid_coh_x_drop(i1,16)==inte(j1,2)) then
            !do t1=1,16
                    nresid_coh_x_drop(j1,:)=resid_coh_x_drop(i1,:)
            !end do
        end if
    end do
end do

return
end subroutine