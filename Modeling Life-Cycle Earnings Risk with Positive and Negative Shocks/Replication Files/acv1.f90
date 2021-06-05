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
      mwPointer  :: panel_new,num,col,col_age,col_g

       ! Output
      mwPointer  :: cov_1_pos,cov_1_neg
      
    ! Array size information
      integer(4) :: Nx,Ny,complexFlag,classid                       ! length of input (output) array
	  mwSize     :: ndim
      mwSize     :: dims(1) ! dimensions (for mxCreateNumericArray)
!--------------------------------------------------------------------------------    
	  classid = mxClassIDFromClassName('double')
      complexFlag = 0  

! Retrieve input parameter pointers
      panel_new = mxGetPr(prhs(1))
      num = mxGetPr(prhs(2))
      col = mxGetPr(prhs(3))
      col_age = mxGetPr(prhs(4))
      col_g = mxGetPr(prhs(5))
     
! Create matrices for return arguments
      
!size of output vector
     ndim = 1
	 dims(1) = 30
  
     plhs(1) = mxCreateNumericArray(ndim, dims, classid, complexflag)
     plhs(2) = mxCreateNumericArray(ndim, dims, classid, complexflag)
     
     cov_1_pos = mxGetPr(plhs(1))
     cov_1_neg = mxGetPr(plhs(2))

!call computation function
	  call  acv1(%val(cov_1_pos),%val(cov_1_neg),%val(panel_new),%val(num),%val(col),%val(col_age),%val(col_g))
								        
      return  
      
    end subroutine
    
subroutine acv1(cov_1_pos,cov_1_neg,panel_new,num,col,col_age,col_g)

implicit none
integer(4), intent(in)                     :: num,col,col_age,col_g
real(8), dimension(num,col), intent(in)      :: panel_new
real(8), dimension(30), intent(out)        :: cov_1_pos,cov_1_neg

!define further variables
integer(4)                                 :: i1,age1
integer(4)                                 :: pos_t2(num,1),neg_t2(num,1)
REAL, DIMENSION(:), ALLOCATABLE :: pos_t1,neg_t1

ALLOCATE ( pos_t1(num) )
ALLOCATE ( neg_t1(num) )

!Start the Game
do i1=1,num
    if (panel_new(i1,col_age).le.30.AND.panel_new(i1,col_g)>=0) then
        pos_t1(i1)=panel_new(i1+1,col_g)*panel_new(i1,col_g)
    else if (panel_new(i1,col_age).le.30.AND.panel_new(i1,col_g)<=0) then
        neg_t1(i1)=panel_new(i1+1,col_g)*panel_new(i1,col_g)
    end if
end do
do i1=1,num
pos_t2(i1,1)=panel_new(i1,col_age)
neg_t2(i1,1)=panel_new(i1,col_age)
end do

do age1=1,30
cov_1_pos(age1)=sum(pos_t1(:),pos_t1(:)/=0.AND.pos_t2(:,1)==age1)/count(pos_t1(:)/=0.AND.pos_t2(:,1)==age1)
cov_1_neg(age1)=sum(neg_t1(:),neg_t1(:)/=0.AND.neg_t2(:,1)==age1)/count(neg_t1(:)/=0.AND.neg_t2(:,1)==age1)
end do

return

end subroutine