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
      mwPointer  :: na,Np,Nn,NPP,nnodes,P_n,EVE_ns,P_tnL,Eve_ns2

       ! Output
      mwPointer  :: output
      
    ! Array size indomation
      integer(4) :: Nx,Ny,complexFlag,classid                       ! length of input (output) array
      mwSize     :: ndim
      mwSize     :: dims(4)                    ! dimensions (do mxCreateNumericArray)
!--------------------------------------------------------------------------------    
      classid = mxClassIDFromClassName('double')
      complexFlag = 0  

! Retrieve input parameter pointers
      na = mxGetPr(prhs(1))
      Np = mxGetPr(prhs(2))
      Nn = mxGetPr(prhs(3))
      NPP = mxGetPr(prhs(4))
      nnodes = mxGetPr(prhs(5))
      P_n = mxGetPr(prhs(6))
      EVE_ns = mxGetPr(prhs(7))
      P_tnL = mxGetPr(prhs(8))
     
! Create matrices do return arguments
      
!size of output vector
      !size of input (and output) vector
      ndim = mxGetNumberOfDimensions(prhs(9))

      ! Retrieve size of input arguments (also size of output argument)
      call mxCopyPtrToPtrArray(mxGetDimensions(prhs(9)), dims, mxGetNumberOfDimensions(prhs(9)))

     plhs(1) = mxCreateNumericArray(ndim, dims, classid, complexflag)
 
     output = mxGetPr(plhs(1))

!call computation function
	  call  srhs_th(%val(output),%val(na),%val(Np),%val(Nn),%val(NPP),%val(nnodes),%val(P_n) &
                 ,%val(EVE_ns),%val(P_tnL))
				       
      return  
      
    end subroutine
    
Subroutine srhs_th(output,na,Np,Nn,NPP,nnodes,P_n,EVE_ns,P_tnL)

implicit none
integer(4), intent(in)                                  :: na,Np,Nn,NPP,nnodes
real(8), dimension(Nn,Nn),intent(in)                    :: P_n
real(8), dimension(na,Np,Nn,nnodes,NPP), intent(in)     :: EVE_ns
real(8), dimension(na,Np,nnodes), intent(in)            :: P_tnL

real(8), dimension(na,Np,Nn,NPP), intent(out)           :: output

!define further variables
integer(4)				                                :: i1,j1,k1,l1,m1,a1,b1,c1

!call sub_mexWriteString('head works')
  
!Start the Game

do i1 =1,Nn !state
    do j1 = 1,Nn !transition to
        do k1 = 1,NPP
            output(:,:,i1,k1) = output(:,:,i1,k1)+P_n(i1,j1)*sum((EVE_ns(:,:,j1,:,k1)*P_tnL),3)
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