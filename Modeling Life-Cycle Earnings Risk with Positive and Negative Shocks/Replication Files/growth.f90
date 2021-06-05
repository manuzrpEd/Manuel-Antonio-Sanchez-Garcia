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
      mwPointer  :: panel_new,n,col,col_age,col_earn

       ! Output
      mwPointer  :: g_2,g_1,g_1f,g_f2,g_f3,g_f4,g_f5,g_f6,g_f7,g_f8,g_f9
      
    ! Array size information
      integer(4) :: Nx,Ny,complexFlag,classid                       ! length of input (output) array
	  mwSize     :: ndim
      mwSize     :: dims(1)                    ! dimensions (for mxCreateNumericArray)
      mwPointer  :: mrows
!--------------------------------------------------------------------------------    
	  classid = mxClassIDFromClassName('double')
      complexFlag = 0  

! Retrieve input parameter pointers
      panel_new = mxGetPr(prhs(1))
      n = mxGetPr(prhs(2))
      col= mxGetPr(prhs(3))
      col_age = mxGetPr(prhs(4))
      col_earn = mxGetPr(prhs(5))
     
! Create matrices for return arguments
      
!size of output vector
     mrows=mxGetM(prhs(1))

     plhs(1) = mxCreateDoubleMatrix(mrows,1,0)
     plhs(2) = mxCreateDoubleMatrix(mrows,1,0)
     plhs(3) = mxCreateDoubleMatrix(mrows,1,0)
     plhs(4) = mxCreateDoubleMatrix(mrows,1,0)
     plhs(5) = mxCreateDoubleMatrix(mrows,1,0)
     plhs(6) = mxCreateDoubleMatrix(mrows,1,0)
     plhs(7) = mxCreateDoubleMatrix(mrows,1,0)
     plhs(8) = mxCreateDoubleMatrix(mrows,1,0)
     plhs(9) = mxCreateDoubleMatrix(mrows,1,0)
     plhs(10) = mxCreateDoubleMatrix(mrows,1,0)
     plhs(11) = mxCreateDoubleMatrix(mrows,1,0)

     g_2 = mxGetPr(plhs(1))
     g_1 = mxGetPr(plhs(2))
     g_1f = mxGetPr(plhs(3))
     g_f2 = mxGetPr(plhs(4))
     g_f3 = mxGetPr(plhs(5))
     g_f4 = mxGetPr(plhs(6))
     g_f5 = mxGetPr(plhs(7))
     g_f6 = mxGetPr(plhs(8))
     g_f7 = mxGetPr(plhs(9))
     g_f8 = mxGetPr(plhs(10))
     g_f9 = mxGetPr(plhs(11))

!call computation function
	  call  growth(%val(g_2),%val(g_1),%val(g_1f),%val(g_f2),%val(g_f3),%val(g_f4),%val(g_f5) &
          ,%val(g_f6),%val(g_f7),%val(g_f8),%val(g_f9),%val(panel_new),%val(n),%val(col),%val(col_age),%val(col_earn))
								          
      return  
      
    end subroutine
    
Subroutine growth(g_2,g_1,g_1f,g_f2,g_f3,g_f4,g_f5,g_f6,g_f7,g_f8,g_f9,panel_new,n,col,col_age,col_earn)

implicit none

integer(4), intent(in)                 :: n,col,col_age,col_earn
real(8), intent(in)                    :: panel_new(n,col)
real(8), intent(out)                   :: g_2(n),g_1(n),g_1f(n)
real(8), intent(out)                   :: g_f2(n),g_f3(n),g_f4(n),g_f5(n),g_f6(n),g_f7(n),g_f8(n),g_f9(n)

!define further variables
integer(4)				            :: i1,t1,j1,age1!,m
! Quiet NAN, double precision.
REAL(8), PARAMETER :: D_QNAN = &
TRANSFER((/ Z'00000000', Z'7FF80000' /),1.0_8)
  
!Start the Game

g_2=D_QNAN
!g_1=D_QNAN
!g_1f=D_QNAN
!panel_new(:,9)
do i1=1,((n)-1)
g_2(i1) = panel_new(i1+1,col_earn)-panel_new(i1,col_earn)
end do
!m=
!do i1=1,n/32
!    g_2(32+52*(i1-1)) = D_QNAN
!end do
!panel_new(:,10)
!do i1=2,n
!g_1(i1) = panel_new(i1,col_earn)-panel_new(i1-1,col_earn)
!end do
!g_1(1) = D_QNAN
!do i1=2,n/32
!    g_1(1+(i1-1)*32) = D_QNAN
!end do
!panel_new(:,11)
!do i1=2,n
!g_1f(i1) = panel_new(i1,col_earn)-panel_new(i1-2,col_earn)
!end do
!g_1f(1) = D_QNAN
!g_1f(2) = D_QNAN
!do i1=2,n/32
!    g_1f(1+(i1-1)*32:2+(i1-1)*32) = D_QNAN
!end do
!growths with respect to current period
!panel_new(:,12)
!do i1=1,n
!g_f2(i1) = panel_new(i1+2,col_earn)-panel_new(i1,col_earn)
!end do
!panel_new(:,13)
!do i1=1,n
!g_f3(i1) = panel_new(i1+3,col_earn)-panel_new(i1,col_earn)
!end do
!panel_new(:,14)
!do i1=1,n
!g_f4(i1) = panel_new(i1+4,col_earn)-panel_new(i1,col_earn)
!end do
!panel_new(:,15)
!do i1=1,n
!g_f5(i1) = panel_new(i1+5,col_earn)-panel_new(i1,col_earn)
!end do
!panel_new(:,16)
!do i1=1,n
!g_f6(i1) = panel_new(i1+6,col_earn)-panel_new(i1,col_earn)
!end do
!panel_new(:,17)
!do i1=1,n
!g_f7(i1) = panel_new(i1+7,col_earn)-panel_new(i1,col_earn)
!end do
!panel_new(:,18)
!do i1=1,n
!g_f8(i1) = panel_new(i1+8,col_earn)-panel_new(i1,col_earn)
!end do
!panel_new(:,19)
!do i1=1,n
!g_f9(i1) = panel_new(i1+9,col_earn)-panel_new(i1,col_earn)
!end do

!set to NaN
!where (panel_new(:,col_age)==31)
!    g_f2=D_QNAN
!    g_f3=D_QNAN
!    g_f4=D_QNAN
!    g_f5=D_QNAN
!    g_f6=D_QNAN
!    g_f7=D_QNAN
!    g_f8=D_QNAN
!    g_f9=D_QNAN
!end where
!where (panel_new(:,col_age)==30)
!    g_f3=D_QNAN
!    g_f4=D_QNAN
!    g_f5=D_QNAN
!    g_f6=D_QNAN
!    g_f7=D_QNAN
!    g_f8=D_QNAN
!    g_f9=D_QNAN
!end where
!where (panel_new(:,col_age)==29)
!    g_f4=D_QNAN
!    g_f5=D_QNAN
!    g_f6=D_QNAN
!    g_f7=D_QNAN
!    g_f8=D_QNAN
!    g_f9=D_QNAN
!end where
!where (panel_new(:,col_age)==28)
!    g_f5=D_QNAN
!    g_f6=D_QNAN
!    g_f7=D_QNAN
!    g_f8=D_QNAN
!    g_f9=D_QNAN
!end where
!where (panel_new(:,col_age)==27)
!    g_f6=D_QNAN
!    g_f7=D_QNAN
!    g_f8=D_QNAN
!    g_f9=D_QNAN
!end where
!where (panel_new(:,col_age)==26)
!    g_f7=D_QNAN
!    g_f8=D_QNAN
!    g_f9=D_QNAN
!end where
!where (panel_new(:,col_age)==25)
!    g_f8=D_QNAN
!    g_f9=D_QNAN
!end where
!where (panel_new(:,col_age)==24)
!    g_f9=D_QNAN
!end where

return
end subroutine