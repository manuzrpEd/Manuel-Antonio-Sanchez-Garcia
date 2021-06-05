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
      mwPointer  :: resid_coh_x_drop,ro,r,ores_x
                    
      ! Output
      mwPointer  :: res_x
      
    ! Array size information
      mwPointer  :: mrows,ncols
      integer(4) :: Nx,Ny,complexFlag,classid      ! length of input (output) array
	  mwSize     :: ndim
      mwSize     :: dims(2)                   ! dimensions (for mxCreateNumericArray)
      
!--------------------------------------------------------------------------------    
      
	  classid = mxClassIDFromClassName('double')
      complexFlag = 0  
      
     ! Retrieve input parameter pointers
      resid_coh_x_drop = mxGetPr(prhs(1))
      ro = mxGetPr(prhs(2))
      r = mxGetPr(prhs(3))
      
     ! Create matrices for return arguments
     mrows=mxGetM(prhs(4))
      
     !plhs(1) = mxCreateNumericArray(ndim, dims, classid, complexflag)
     plhs(1) = mxCreateDoubleMatrix(mrows,31,0)
     res_x = mxGetPr(plhs(1))

      !call computation function
	  call  wide(%val(resid_coh_x_drop),%val(ro),%val(r),%val(res_x))
								          
      return  
      
    end subroutine

subroutine wide(resid_coh_x_drop,ro,r,res_x)
implicit none
integer(4), intent(in)                           :: r,ro
real(8), dimension(ro,17), intent(in)            :: resid_coh_x_drop
real(8), dimension(r,31), intent(out)            :: res_x

!define further variables
integer(4)  :: k1,l1,p1

!Start the game
do k1=1,r
    do p1=1,ro
        do l1=1,31
            if (l1==resid_coh_x_drop(p1,1)-23.AND.resid_coh_x_drop(p1,18)==k1) then
                res_x(k1,l1)=resid_coh_x_drop(p1,3)
            end if
        end do
    end do
end do

return
end subroutine