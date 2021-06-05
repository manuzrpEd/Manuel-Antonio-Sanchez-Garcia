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
      mwPointer  :: panel_new,n,col,col_g

       ! Output
      mwPointer  :: ave_p,ave_n,var_p,var_n,skew,curt
      
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
      col_g = mxGetPr(prhs(4))
     
! Create matrices for return arguments
      
!size of output vector
     ndim = 1
	 dims(1) = 31

     plhs(1) = mxCreateNumericArray(ndim, dims, classid, complexflag)
     plhs(2) = mxCreateNumericArray(ndim, dims, classid, complexflag)
     plhs(3) = mxCreateNumericArray(ndim, dims, classid, complexflag)
     plhs(4) = mxCreateNumericArray(ndim, dims, classid, complexflag)
     plhs(5) = mxCreateNumericArray(ndim, dims, classid, complexflag)
     plhs(6) = mxCreateNumericArray(ndim, dims, classid, complexflag)
 
     ave_p = mxGetPr(plhs(1))
     ave_n = mxGetPr(plhs(2))
     var_p = mxGetPr(plhs(3))
     var_n = mxGetPr(plhs(4))
     skew = mxGetPr(plhs(5))
     curt = mxGetPr(plhs(6))

!call computation function
	  call  Moment(%val(ave_p),%val(ave_n),%val(var_p),%val(var_n),%val(skew),%val(curt) &
                        ,%val(panel_new),%val(n),%val(col),%val(col_g))
								  
        
      return  
      
    end subroutine
    
Subroutine Moment(ave_p,ave_n,var_p,var_n,skew,curt,panel_new,n,col,col_g)

implicit none

integer(4), intent(in)             :: n,col,col_g
real(8), intent(in)            :: panel_new(n,col)

real(8), intent(out)                   :: ave_p(31),ave_n(31),var_p(31),var_n(31),skew(31),curt(31)

!define further variables
integer(4)				            :: i1,t1,j1,age1
real(8), dimension(31,n/31)        :: age,pos,neg
logical, dimension(n/31)           :: mask
real(8), dimension(31)              :: count_pos,count_neg,ave,var
  
!Start the Game
!Unconditional Kurtosis and Skewness
do age1=1,31
age(age1,1)=panel_new(age1,col_g)
do i1=2,n/31
    age(age1,i1)=panel_new(age1+(i1-1)*31,col_g)
end do
end do

do age1=1,31
ave(age1)=sum(age(age1,:))/(n/31)
end do
do age1=1,31
var(age1)=sum((age(age1,:)-ave(age1))**2)/(n/31)
end do
do age1=1,31
skew(age1)=sum((((age(age1,:)-ave(age1))/sqrt(var(age1)))**3))/(n/31)
end do
do age1=1,31
curt(age1)=sum((((age(age1,:)-ave(age1))/sqrt(var(age1)))**4))/(n/31)
end do

!Conditional Average and Variance
do age1=1,31
mask=age(age1,:).gt.0.d0
count_pos(age1)=count(mask)
count_neg(age1)=(n/31)-count_pos(age1)
end do

do age1=1,31
ave_p(age1)=sum(age(age1,:),age(age1,:)>0)/count_pos(age1)
end do
do age1=1,31
ave_n(age1)=sum(age(age1,:),age(age1,:)<0)/count_neg(age1)
end do
do age1=1,31
var_p(age1)=sum((age(age1,:)-ave_p(age1))**2,age(age1,:)>0)/count_pos(age1)
end do
do age1=1,31
var_n(age1)=sum((age(age1,:)-ave_n(age1))**2,age(age1,:)<0)/count_neg(age1)
end do

return
end subroutine