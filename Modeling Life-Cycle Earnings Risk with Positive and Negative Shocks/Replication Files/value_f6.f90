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
      mwPointer  :: na,Np,Nn,NPP,nnodes,c_w,gamma,beta,agrid,EVE,anext,V

       ! Output
      mwPointer  :: output
      
    ! Array size indomation
      integer(4) :: Nx,Ny,complexFlag,classid                       ! length of input (output) array
      mwSize     :: ndim
      mwSize     :: dims(5)                    ! dimensions (do mxCreateNumericArray)
!--------------------------------------------------------------------------------    
      classid = mxClassIDFromClassName('double')
      complexFlag = 0  

! Retrieve input parameter pointers
      na = mxGetPr(prhs(1))
      Np = mxGetPr(prhs(2))
      Nn = mxGetPr(prhs(3))
      NPP = mxGetPr(prhs(4))
      nnodes = mxGetPr(prhs(5))
      c_w = mxGetPr(prhs(6))
      gamma = mxGetPr(prhs(7))
      beta = mxGetPr(prhs(8))
      agrid = mxGetPr(prhs(9))
      EVE = mxGetPr(prhs(10))
      anext = mxGetPr(prhs(11))
     
! Create matrices do return arguments
      
!size of output vector
      !size of input (and output) vector
      ndim = mxGetNumberOfDimensions(prhs(12))

      ! Retrieve size of input arguments (also size of output argument)
      call mxCopyPtrToPtrArray(mxGetDimensions(prhs(12)), dims, mxGetNumberOfDimensions(prhs(12)))

     plhs(1) = mxCreateNumericArray(ndim, dims, classid, complexflag)
 
     output = mxGetPr(plhs(1))

!call computation function
	  call  srhs_th(%val(output),%val(na),%val(Np),%val(Nn),%val(NPP),%val(nnodes),%val(c_w),%val(gamma),%val(beta) &
                 ,%val(agrid),%val(EVE),%val(anext))
				       
      return  
      
    end subroutine
    
Subroutine srhs_th(output,na,Np,Nn,NPP,nnodes,c_w,gamma,beta,agrid,EVE,anext)

implicit none
integer(4), intent(in)                                  :: na,Np,Nn,NPP,nnodes
real(8), dimension(na,Np,Nn,nnodes,NPP),intent(in)      :: c_w,anext,EVE
real(8), intent(in)                                     :: gamma,beta
real(8), dimension(na), intent(in)                      :: agrid

real(8), dimension(na,Np,Nn,nnodes,NPP), intent(out)           :: output

real(8), dimension(na)                                  :: c_temp,EVE_temp

!define further variables
integer(4)				                                :: i1,j1,k1,l1,m1,a1,b1,c1

!call sub_mexWriteString('head works')
  
!Start the Game

do i1 = 1,Np! %state
    do j1 = 1,Nn! %state
        do k1 = 1,nnodes
            do l1 = 1,NPP
                call interp1D(EVE_temp,agrid,EVE(:,i1,j1,k1,l1),anext(:,i1,j1,k1,l1),na)
                output(:,i1,j1,k1,l1) = (c_w(:,i1,j1,k1,l1)**(1-gamma))/(1-gamma)+beta*EVE_temp
            end do
        end do
    end do
end do

return
end subroutine

subroutine interp1D(y0,x,y,x0,n)

!Function lininter computes a linear interpolation do point x0
!given the vector of x-values in x and their corresponding funtional values y with length n

implicit none

!define in and outputs
integer(4), intent(in)                  :: n
real(8), intent(in)                     :: x(n),y(n)
real(8), intent(in)                     :: x0(n)
real(8), intent(out)                    :: y0(n)

!further variables 
integer(4)                              :: j,a

do a=1,n
call find_pos(x,x0(a),j,n)

if (j==0) then
    j=1
elseif (j==n) then
    j=n-1
end if

y0(a) = y(j)+(y(j+1)-y(j))*(x0(a)-x(j))/(x(j+1)-x(j))
end do

return
end subroutine interp1D

subroutine interp2D(v0,x,y,v,x0,y0,Np,Nn)

!Function lininter computes a 2D linear interpolation do point x0,y0
!given the vector of x and y-values in x and y and their 
!corresponding funtional values v 

implicit none

!define in and outputs
integer(4), intent(in)                  :: Np,Nn
real(8), intent(in)                     :: x(Np),y(Nn),v(Np,Nn)
real(8), intent(in)                     :: x0,y0
real(8), intent(out)                    :: v0

!further variables 
integer(4)                              :: jx,jy,n
real(8)                                 :: num,a00,a01,a10,a11

!call locate(x,n,x0,j)
call find_pos(x,x0,jx,Np)

if (jx==0) then
    jx=1
elseif (jx==Np) then
    jx=Np-1
end if

call find_pos(y,y0,jy,Nn)

if (jy==0) then
    jy=1
elseif (jy==Nn) then
    jy=Nn-1
end if

num = ((x(jx+1)-x(jx))*(y(jy+1)-y(jy)))
a00 = ((x(jx+1)-x0)*(y(jy+1)-y0))/num
a01 = ((x(jx+1)-x0)*(y0-y(jy)))/num
a10 = ((x0-x(jx))*(y(jy+1)-y0))/num
a11 = ((x0-x(jx))*(y0-y(jy)))/num

v0 = a00*v(jx,jy)+a01*v(jx,jy+1)+a10*v(jx+1,jy)+a11*v(jx+1,jy+1)

end subroutine interp2D

subroutine find_pos(vec_in,sca,pos,n)
!finds sca on monotone vector vec_in (number of smaller/equal points)

!define in and outputs
integer(4), intent(in)       :: n
real(8), intent(in)          :: vec_in(n),sca
integer(4), intent(out)      :: pos
integer(4)                   :: i1

pos = 0
do i1 = 1,n
    if (sca>=vec_in(i1)) then
        pos = i1
    end if
    if (vec_in(i1)>sca) exit
end do

end subroutine find_pos

subroutine sub_mexWriteString(String)
  implicit none
  character(*),intent(in):: String
  call mexPrintf(achar(10))
  call mexPrintf(trim(adjustl(String)))
end subroutine sub_mexWriteString

!subroutine CARRA(c_temp,c_w,gamma,na)
!finds sca on monotone vector vec_in (number of smaller/equal points)

!define in and outputs
!integer(4), intent(in)       :: na
!real(8), intent(in)          :: c_w(na),gamma
!integer(4), intent(out)      :: c_temp(na)
!integer(4)                   :: i1

!do i1=1,na
 !   c_temp(i1) = (c_w^(1-gamma))/(1-gamma)
!end do

!end subroutine find_pos