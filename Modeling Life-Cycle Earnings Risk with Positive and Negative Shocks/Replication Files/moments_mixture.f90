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
      mwPointer  :: H,T,rho_x,rho_z &
                    ,sigma_b,cp_s,bp_s,cp_z,bp_z &
                    ,randn_ini_x,randn_ini_z,randn_b,randn_shock_ep,randn_shock_en &
                    ,randn_shock_x,randn_shock_z,rand_shock_s &
                    ,thetap_1,thetan_1,bp_s2,bp_z2,randn_tr,randn_a

       ! Output
      mwPointer  :: panel_new
      
    ! Array size information
      integer(4) :: Nx,Ny,complexFlag,classid      ! length of input (output) array
	  mwSize     :: ndim
      mwSize     :: dims(2)                    ! dimensions (for mxCreateNumericArray)
      
!--------------------------------------------------------------------------------    
	  
	  classid = mxClassIDFromClassName('double')
      complexFlag = 0  
      
    ! Retrieve input parameter pointers
      H = mxGetPr(prhs(1))
      T = mxGetPr(prhs(2))
      rho_x = mxGetPr(prhs(3))
      rho_z = mxGetPr(prhs(4))
      sigma_b = mxGetPr(prhs(5))
      cp_s = mxGetPr(prhs(6))
      bp_s = mxGetPr(prhs(7))
      cp_z = mxGetPr(prhs(8))
      bp_z = mxGetPr(prhs(9))
      randn_ini_x = mxGetPr(prhs(10))
      randn_ini_z = mxGetPr(prhs(11))
      randn_b = mxGetPr(prhs(12))
      randn_shock_ep = mxGetPr(prhs(13))
      randn_shock_en = mxGetPr(prhs(14))
      randn_shock_x = mxGetPr(prhs(15))
      randn_shock_z = mxGetPr(prhs(16))
      rand_shock_s = mxGetPr(prhs(17))
      thetap_1 = mxGetPr(prhs(18))
      thetan_1 = mxGetPr(prhs(19))
      bp_s2 = mxGetPr(prhs(20))
      bp_z2 = mxGetPr(prhs(21))
      randn_tr = mxGetPr(prhs(22))
      randn_a = mxGetPr(prhs(23))
      
     ! Create matrices for return arguments
      
     ndim = 2
	 dims(1) = 20000*32
	 dims(2) = 7

     plhs(1) = mxCreateNumericArray(ndim, dims, classid, complexflag)
 
     panel_new = mxGetPr(plhs(1))

      !call computation function
	  call  sub_val_fun(%val(panel_new),%val(H),%val(T),%val(rho_x) &
                        ,%val(rho_z),%val(sigma_b) &
                        ,%val(cp_s),%val(bp_s),%val(cp_z) &
                        ,%val(bp_z),%val(randn_ini_x),%val(randn_ini_z),%val(randn_b) &
                        ,%val(randn_shock_ep),%val(randn_shock_en),%val(randn_shock_x) &
                        ,%val(randn_shock_z),%val(rand_shock_s) &
                        ,%val(thetap_1),%val(thetan_1),%val(bp_s2),%val(bp_z2),%val(randn_tr),%val(randn_a))
								          
      return  
      
end subroutine

subroutine sub_val_fun(panel_new,H,T,rho_x &
                        ,rho_z,sigma_b &
                        ,cp_s,bp_s,cp_z,bp_z,randn_ini_x,randn_ini_z,randn_b &
                        ,randn_shock_ep,randn_shock_en,randn_shock_x,randn_shock_z &
                        ,rand_shock_s,thetap_1,thetan_1,bp_s2,bp_z2,randn_tr,randn_a)

implicit none

integer(4), intent(in)					      :: H,T
real(8), intent(in)							  :: cp_s,bp_s,cp_z,bp_z,bp_s2,bp_z2
real(8), intent(in)							  :: thetap_1,thetan_1,sigma_b,rho_z,rho_x
real(8), dimension(H), intent(in)             :: randn_b,randn_ini_x,randn_ini_z,randn_a
real(8), dimension(H,T), intent(in)           :: randn_shock_ep,randn_shock_en
real(8), dimension(H,T), intent(in)           :: randn_shock_x,randn_shock_z
real(8), dimension(H,T), intent(in)           :: randn_tr
real(8), dimension(H,T), intent(in)           :: rand_shock_s
real(8), dimension(H*T,7), intent(out)        :: panel_new

!define further variables
integer(4)				     :: i1,t1,n,m
real(8), dimension(H)        :: b_comp
real(8), dimension(H,T)      :: shock_ep,shock_en,shock_z,shock_x,shock_tr
real(8)                      :: p_s,p_z,p_s_l,p_z_l
real(8), dimension(7,T)      :: transform
real(8), dimension(T,7)      :: transform_temp
real(8), dimension(H,7,T)    :: panel

!hip component
b_comp = sigma_b*randn_b

!shock sequence
do t1 =1,T
    do i1 = 1,H
    shock_ep(i1,t1) = (randn_shock_ep(i1,t1))**(1.d0)  !*sigma_ep(t1)
    shock_en(i1,t1) = -(randn_shock_en(i1,t1))**(1.d0)  !*sigma_en(t1)
    shock_z(i1,t1) = (randn_shock_z(i1,t1))**(1.d0) !*sigma_z(t1)
    shock_x(i1,t1) = -(randn_shock_x(i1,t1))**(1.d0) !*sigma_x(t1)
    shock_tr(i1,t1) = (randn_tr(i1,t1))**(1.d0)
    end do
end do
        
!initialization
do i1 =1,H
    p_s = min(1.d0,max(0.d0,cp_s+bp_s*1+bp_s2*(1**2))) !probability to draw a negative shock
    p_z = min(1.d0,max(0.d0,cp_z+bp_z*1+bp_z2*(1**2))) !conditional probability to draw a positive shock
        call find_pos(p_s,rand_shock_s(i1,1),n,1)
        call find_pos(p_z+p_s,rand_shock_s(i1,1),m,1) 
        n = n+1
        m=m+1
        if (n==1) then !negative shock only
            panel(i1,1,1) = 0.d0
            panel(i1,2,1) = 0.d0!-(randn_ini_x(i1))**(1.d0)
            panel(i1,3,1) = 0.d0
            panel(i1,4,1) = -(randn_ini_x(i1))
        end if
        
        if (n==2.AND.m==1) then !positive shock only
            panel(i1,1,1) = 0.d0!(randn_ini_z(i1))**(1.d0)
            panel(i1,2,1) = 0.d0
            panel(i1,3,1) = (randn_ini_z(i1))
            panel(i1,4,1) = 0.d0
        end if
        
        if (n==2.AND.m==2) then !no shock
            panel(i1,1,1) = 0.d0
            panel(i1,2,1) = 0.d0
            panel(i1,3,1) = 0.d0
            panel(i1,4,1) = 0.d0
        end if
            !panel(i1,1,1) = 0.d0
            !panel(i1,2,1) = 0.d0!-(randn_ini_x(i1))**(1.d0)
            !panel(i1,3,1) = (randn_ini_z(i1))
            !panel(i1,4,1) = -(randn_ini_x(i1))
    panel(i1,5,1) = panel(i1,1,1)+panel(i1,2,1)+panel(i1,3,1)+panel(i1,4,1)+shock_tr(i1,1)+randn_a(i1)
    panel(i1,6,1) = 1 !period
    panel(i1,7,1) = i1 !id
end do

do t1 = 2,T
    p_s = min(1.d0,max(0.d0,cp_s+bp_s*t1+bp_s2*(t1**2))) !probability to draw a negative shock
    p_z = min(1.d0,max(0.d0,cp_z+bp_z*t1+bp_z2*(t1**2))) !conditional probability to draw a positive shock
    do i1 = 1,H
        call find_pos(p_s,rand_shock_s(i1,t1),n,1)
        call find_pos(p_z+p_s,rand_shock_s(i1,t1),m,1) 
        n = n+1
        m=m+1
        if (n==1) then !negative shock only
            panel(i1,1,t1) = rho_z*panel(i1,1,t1-1)
            panel(i1,2,t1) = rho_x*panel(i1,2,t1-1)+shock_x(i1,t1)
            panel(i1,3,t1) = 0.d0
            panel(i1,4,t1) = shock_en(i1,t1)
        end if
        
        if (n==2.AND.m==1) then !positive shock only
            panel(i1,1,t1) = rho_z*panel(i1,1,t1-1)+shock_z(i1,t1)
            panel(i1,2,t1) = rho_x*panel(i1,2,t1-1)
            panel(i1,3,t1) = shock_ep(i1,t1)
            panel(i1,4,t1) = 0.d0
        end if
        
        if (n==2.AND.m==2) then !no shock
            panel(i1,1,t1) = rho_z*panel(i1,1,t1-1)
            panel(i1,2,t1) = rho_x*panel(i1,2,t1-1)
            panel(i1,3,t1) = 0.d0
            panel(i1,4,t1) = 0.d0
        end if
            
        if (t1==2) then
            panel(i1,5,t1) = panel(i1,1,t1)+panel(i1,2,t1)+panel(i1,3,t1)+panel(i1,4,t1)+b_comp(i1)*t1+shock_tr(i1,t1)+randn_a(i1)!log earnings
        !elseif (t1==3) then
        !    panel(i1,5,t1) = panel(i1,1,t1)+panel(i1,2,t1)+panel(i1,3,t1)+panel(i1,4,t1) &
        !        +b_comp(i1)*t1+thetap_1*panel(i1,3,t1-1)+thetan_1*panel(i1,4,t1-1)+shock_tr(i1,t1)+randn_a(i1)
        else
            panel(i1,5,t1) = panel(i1,1,t1)+panel(i1,2,t1)+panel(i1,3,t1)+panel(i1,4,t1) &
                +b_comp(i1)*t1+thetap_1*panel(i1,3,t1-1)+thetan_1*panel(i1,4,t1-1)+shock_tr(i1,t1)+randn_a(i1)
        end if
        panel(i1,6,t1) = t1
        panel(i1,7,t1) =i1
      
end do
end do

do i1 = 1,H
    transform = RESHAPE(panel(i1,:,:),(/7, T/))
    transform_temp = TRANSPOSE(transform)
    panel_new(1+(i1-1)*(T):i1*(T),:) = transform_temp
end do

end subroutine

subroutine find_pos(vec_in,sca,pos,n)
!finds sca on monotone vector vec_in (number of smaller/equal points)
!ps
!rndshocks
!n
!if the random shock is beyond the probability, then n==1, which means n=n+1!=1, which means n=n+1==1
!you drew this ps.
!define in and outputs
integer(4), intent(in)    :: n
real(8), intent(in)       :: vec_in(n),sca
integer(4), intent(out)   :: pos
integer(4)                :: i1

pos = 0
do i1 = 1,n
	if (sca>=vec_in(i1)) then
		pos = i1
	end if
	if (vec_in(i1)>sca) exit!n==0 if random shock below ps then n=n+1==1, this shock!!
end do

end subroutine