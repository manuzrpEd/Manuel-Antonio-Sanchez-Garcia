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
      mwPointer  :: M_ave
      
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
 
     M_ave = mxGetPr(plhs(1))

!call computation function
	  call  Moment(%val(M_ave),%val(H),%val(T),%val(panel_new),%val(col),%val(cols),%val(col_g))
						      
      return  
      
    end subroutine
    
Subroutine Moment(M_ave,H,T,panel_new,col,cols,col_g)
implicit none

integer(4), intent(in)                           :: H,T,col,cols,col_g
real(8), dimension((T-1)*H,cols), intent(in)       :: panel_new
real(8), dimension(col), intent(out)             :: M_ave

!define further variables
integer(4)				                 :: h1,t1,i1,t2
real(8), dimension(H,T-1)                :: g
real(8), dimension(T-1,1)                :: ge
real(8), dimension(1,T-1)                :: ge2
real(8)                                  :: unit,unit_j
real(8), dimension(T-1,T-1)              :: mi,mi_j
integer(4), dimension(T-1,T-1)           :: n,n_j

!Start the Game
do h1=1,H
    do t1=1,T-1
        g(h1,t1)=panel_new((h1-1)*(T-1)+t1,col_g)
    end do
end do
mi=0.d0
n=0.d0
n_j=0.d0
ge=0.d0
ge2=0.d0
do h1=1,H
    do i1=1,col
        ge(i1,1)=g(h1,i1)
    end do!column
    do i1=1,col
        ge2(1,i1)=ge(i1,1)
    end do!column
    !ge2=TRANSPOSE(ge)!row
    mi_j(1:col,1:col)=matmul(ge,ge2)
   do t1=1,T-1
       do t2=1,T-1
           if (mi_j(t1,t2)/=0) then
                n_j(t1,t2)=1
           else if (mi_j(t1,t2)==0) then
               n_j(t1,t2)=0.d0
           end if
       end do
   end do
   mi=mi+mi_j
   n=n+n_j
end do
do t1=1,T-1
    do t2=1,T-1
        mi(t1,t2)=mi(t1,t2)/n(t1,t2)
    end do
end do
unit=0.d0
do t1=1,T-1
    unit_j=mi(t1,t1)
    unit=unit+unit_j
end do
M_ave(1)=unit/(T-1)
do i1 = 1,col-1
   unit=0.d0
   do t1=1,T-1-i1
   unit_j=mi(t1,t1+i1)
   unit=unit+unit_j
   end do
M_ave(i1+1)=unit/(T-1-i1)
end do

return

end subroutine