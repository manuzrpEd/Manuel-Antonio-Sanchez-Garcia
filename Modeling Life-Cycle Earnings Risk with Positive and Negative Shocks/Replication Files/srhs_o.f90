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
      mwPointer  :: na,Np,Nn,NPP,nnodes,grid_p,grid_n,c,grid_p_rho,grid_n_rho,c_t

       ! Output
      mwPointer  :: output
      
    ! Array size information
      integer(4) :: Nx,Ny,complexFlag,classid                       ! length of input (output) array
      mwSize     :: ndim
      mwSize     :: dims(5)                    ! dimensions (for mxCreateNumericArray)
!--------------------------------------------------------------------------------    
      classid = mxClassIDFromClassName('double')
      complexFlag = 0  

! Retrieve input parameter pointers
      na = mxGetPr(prhs(1))
      Np = mxGetPr(prhs(2))
      Nn = mxGetPr(prhs(3))
      NPP = mxGetPr(prhs(4))
      nnodes = mxGetPr(prhs(5))
      grid_p = mxGetPr(prhs(6))
      grid_n = mxGetPr(prhs(7))
      c = mxGetPr(prhs(8))
      grid_p_rho = mxGetPr(prhs(9))
      grid_n_rho = mxGetPr(prhs(10))

     
! Create matrices for return arguments
      
!size of output vector
      !size of input (and output) vector
      ndim = mxGetNumberOfDimensions(prhs(11))

      ! Retrieve size of input arguments (also size of output argument)
      call mxCopyPtrToPtrArray(mxGetDimensions(prhs(11)), dims, mxGetNumberOfDimensions(prhs(11)))

     plhs(1) = mxCreateNumericArray(ndim, dims, classid, complexflag)
 
     output = mxGetPr(plhs(1))

!call computation function
	  call  srhs(%val(output),%val(na),%val(Np),%val(Nn),%val(NPP),%val(nnodes),%val(grid_p),%val(grid_n),%val(c) &
                ,%val(grid_p_rho),%val(grid_n_rho))
                !,%val(P_tp),%val(P_p),%val(prob_pp),%val(prob_nn))								  
        
      return  
      
    end subroutine
    
Subroutine srhs(output,na,Np,Nn,NPP,nnodes,grid_p,grid_n,c,grid_p_rho,grid_n_rho)

implicit none

integer(4), intent(in)                                  :: na,Np,Nn,NPP,nnodes
real(8), dimension(na,Np,Nn,nnodes,NPP),intent(in)      :: c
real(8), dimension(Np), intent(in)                      :: grid_p,grid_p_rho
real(8), dimension(Nn), intent(in)                      :: grid_n,grid_n_rho

real(8), dimension(na,Np,Nn,nnodes,NPP), intent(out)    :: output

!define further variables
integer(4)				                                :: i1,j1,k1,l1,m1,a1,b1,c1
real(8), dimension(na,Np,Nn,nnodes,NPP)                 :: c_tt

!call sub_mexWriteString('head works')
  
!Start the Game

do i1 = 1,Np
    do j1 = 1,Nn
        do l1 = 1,na
            do k1 = 1,nnodes
                do m1 = 1,NPP
                	call interp2D(c_tt(l1,i1,j1,k1,m1),grid_p,grid_n,c(l1,:,:,k1,m1),grid_p_rho(i1),grid_n_rho(j1),Np,Nn)!yi(i1),zi(j1),
                end do
            end do
        end do
    end do
end do

!call sub_mexWriteString('works to point 1')

output = max(c_tt,0.d0)
 
return
end subroutine

subroutine interp1D(v0,x,v,x0,Nn)

!Function lininter computes a linear interpolation for point x0
!given the vector of x-values in x and their corresponding funtional values y with length n

implicit none

!define in and outputs
integer(4), intent(in)                  :: Nn
real(8), intent(in)                     :: x(Nn),v(Nn)
real(8), intent(in)                     :: x0(Nn)
real(8), intent(out)                    :: v0(Nn)

!further variables 
integer(4)                              :: j,a

do a=1,Nn
call find_pos(x,x0(a),j,Nn)

if (j==0) then
    j=1
elseif (j==Nn) then
    j=Nn-1
end if

v0(a) = v(j)+(v(j+1)-v(j))*(x0(a)-x(j))/(x(j+1)-x(j))
end do

return
end subroutine interp1D

subroutine interp2D(v0,x,y,v,x0,y0,Np,Nn)

!Function lininter computes a 2D linear interpolation for point x0,y0
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