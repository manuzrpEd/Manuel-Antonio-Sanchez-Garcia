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
	  double precision mxGetScalar
      mwPointer     mxGetDimensions, mxCreateDoubleMatrix, mxCopyPtrToReal8
      integer(4)    mxClassIDFromClassName
      mwSize        mxGetNumberOfDimensions
      
      ! Pointers to input/output mxArrays:
      ! Input           
      mwPointer  :: Nsim,Nmonths,Nwork,Ne,e_s,d_s,pk_s,ps_s,f_s,Pr_e_c,fu,fe,pk,ps,du,dj,V_w,V_u,yd_w,egrid
	  mwPointer	 :: NPP,prob_perm,a_s
	  ! Output
      mwPointer  :: L_sim,x_sim,ws_sim,EU_sim,UE_sim,JJ_sim
	  !,V_u
      
    ! Array size information
	  mwSize	 :: nrows,ncols
      integer(4) :: Nx,Ny,complexFlag,classid,classid_int      ! length of input (output) array
	  mwSize     :: ndim
      mwSize     :: dims(2)                   ! dimensions (for mxCreateNumericArray)
      
!--------------------------------------------------------------------------------    
	  
	  classid = mxClassIDFromClassName('double')
	  classid_int = mxClassIDFromClassName('int32')
      complexFlag = 0  
      
    ! Retrieve input parameter pointers
      Nsim = mxGetPr(prhs(1))
      Nmonths = mxGetPr(prhs(2))
	  Nwork = mxGetPr(prhs(3))
	  Ne = mxGetPr(prhs(4))
	  e_s = mxGetPr(prhs(5))
	  d_s = mxGetPr(prhs(6))
	  pk_s = mxGetPr(prhs(7))
	  ps_s = mxGetPr(prhs(8))
	  f_s = mxGetPr(prhs(9))
	  Pr_e_c = mxGetPr(prhs(10))
	  fu = mxGetPr(prhs(11))
	  fe = mxGetPr(prhs(12))
	  pk = mxGetPr(prhs(13))
	  ps = mxGetPr(prhs(14))
	  du = mxGetPr(prhs(15))
	  dj = mxGetPr(prhs(16))
	  V_w = mxGetPr(prhs(17))
	  V_u = mxGetPr(prhs(18))
	  yd_w = mxGetPr(prhs(19))
	  egrid = mxGetPr(prhs(20))
	  NPP = mxGetPr(prhs(21))
	  prob_perm = mxGetPr(prhs(22))
	  a_s = mxGetPr(prhs(23))
      
     ! Create matrices for return arguments
      ndim = 2
	  dims(1) = mxGetM(prhs(5))
	  dims(2) = mxGetN(prhs(5))	  	  
	  plhs(1) = mxCreateNumericArray(ndim,dims,classid,complexflag)
	  plhs(2) = mxCreateNumericArray(ndim,dims,classid_int,complexflag)
	  plhs(3) = mxCreateNumericArray(ndim,dims,classid,complexflag)
	  plhs(4) = mxCreateNumericArray(ndim,dims,classid,complexflag)
	  plhs(5) = mxCreateNumericArray(ndim,dims,classid,complexflag)
	  plhs(6) = mxCreateNumericArray(ndim,dims,classid,complexflag)
      L_sim = mxGetPr(plhs(1))
	  x_sim = mxGetPr(plhs(2))
	  ws_sim = mxGetPr(plhs(3))
	  EU_sim = mxGetPr(plhs(4))
	  UE_sim = mxGetPr(plhs(5))
	  JJ_sim = mxGetPr(plhs(6))

      !call computation function
	  call  sub_val_fun(%val(L_sim),%val(x_sim),%val(ws_sim),%val(EU_sim),%val(UE_sim),%val(JJ_sim) &
	                    ,%val(Nsim),%val(Nmonths),%val(Nwork),%val(Ne)                              &
						,%val(e_s),%val(d_s),%val(pk_s),%val(ps_s),%val(f_s),%val(Pr_e_c)           &
						,%val(fu),%val(fe),%val(pk),%val(ps),%val(du),%val(dj)                      &
						,%val(V_w),%val(V_u),%val(yd_w),%val(egrid),%val(NPP),%val(prob_perm)		&
						,%val(a_s))				          
      return  
end subroutine

subroutine sub_val_fun(L_sim,x_sim,ws_sim,EU_sim,UE_sim,JJ_sim,Nsim,Nmonths,Nwork,Ne,e_s,d_s,pk_s,ps_s,f_s,Pr_e_c &
						,fu,fe,pk,ps,du,dj,V_w,V_u,yd_w,egrid,NPP,prob_perm,a_s)

implicit none

integer(4), intent(in)									    :: Nsim,Nmonths,Nwork,Ne,NPP
real(8), dimension(Nsim,Nmonths), intent(in)				:: e_s,d_s,pk_s,ps_s,f_s
real(8), dimension(Nsim), intent(in)						:: a_s
real(8), dimension(Ne,Nwork,Nmonths,NPP), intent(in)		:: V_w
real(8), dimension(Nwork,Nmonths), intent(in)				:: V_u
real(8), dimension(Ne,Nwork,NPP), intent(in)				:: yd_w
real(8), dimension(Nmonths), intent(in)						:: fu,fe,pk,ps,du,dj
real(8), dimension(Nwork,Ne), intent(in)					:: Pr_e_c
real(8), dimension(NPP), intent(in)							:: prob_perm
real(8), dimension(Ne,Nwork), intent(in)					:: egrid
real(8), dimension(Nsim,Nmonths), intent(out)				:: L_sim,ws_sim,EU_sim,UE_sim,JJ_sim
integer(4), dimension(Nsim,Nmonths), intent(out)			:: x_sim

!define further variables
integer(4)													:: i,a,e_t,hc_t,hc_t2,a_t
integer(4), ALLOCATABLE			                            :: e_sim_ind(:,:)
real(8), ALLOCATABLE				                        :: e_sim_grid(:,:)
REAL(8), PARAMETER :: D_QNAN = &
    TRANSFER((/Z'00000000', Z'7FF80000'/),1.0_8)
allocate(e_sim_ind(Nsim,Nmonths))
allocate(e_sim_grid(Nsim,Nmonths))

x_sim=1

do i = 1,Nsim    
	!permanent type
	a_t=minloc(prob_perm,DIM=1,MASK=a_s(i)<prob_perm)
	!minloc(prob_perm(:),DIM=1,MASK=a_s(i)<prob_perm(:))!takes forever

    ! First period: employment decision (from U)
    e_t = (minloc(Pr_e_c(1,:),DIM=1,MASK=e_s(i,1)<Pr_e_c(1,:)))
    
    if (f_s(i,1)<=fu(1)) then    ! if find a job
        if  (V_w(e_t,1,1,a_t) >= V_u(1,1)) then
            L_sim(i,1)      = 1
            ws_sim(i,1)		= yd_w(e_t,1,a_t)
            e_sim_ind(i,1)  = e_t!this is currently an index, not the value, will change for a value...
            e_sim_grid(i,1)	= egrid(e_t,1)
            UE_sim(i,1)     = 1
        else
            L_sim(i,1)    = 0            
        end if
    else                ! if didn't find a job
        L_sim(i,1)    = 0   
    end if
    
    ! Rest of periods
    do a = 2,Nmonths
        ! match quality shock. Use this for both the UE and EE sims
        !e_t = (minloc(Pr_e_c,DIM=1,MASK=e_s(i,a)<Pr_e_c))
		!need to do this not here as Sig_e is on human capital, not age
        
        if (L_sim(i,a-1) == 0) then      ! If coming from UNEMPLOYMENT
            
             !Update human k
            if (d_s(i,a)<=du(a)) then
                hc_t = max(x_sim(i,a-1)-1,1)
            else
                hc_t = x_sim(i,a-1)
            end if   
			e_t = (minloc(Pr_e_c(hc_t,:),DIM=1,MASK=e_s(i,a)<Pr_e_c(hc_t,:)))
                        
            if (f_s(i,a)<=fu(a))  then    ! if found job
                
                if (V_w(e_t,hc_t,a,a_t) >= V_u(hc_t,a)) then ! if E better than U
                    L_sim(i,a)    = 1
                    x_sim(i,a)    = hc_t                        
                    ws_sim(i,a)    = yd_w(e_t,hc_t,a_t)
                    e_sim_ind(i,a)    = e_t
                    e_sim_grid(i,a)  = egrid(e_t,hc_t)
                    UE_sim(i,a)   = 1
                
                else
                    L_sim(i,a)    = 0
                    x_sim(i,a)    = hc_t
                    
                end if
                    
            else                ! if no job found
                L_sim(i,a)    = 0
                x_sim(i,a)    = hc_t                        
                ws_sim(i,a)    = 0
            
            end if
        
        elseif (L_sim(i,a-1) == 1) then   ! If coming from EMPLOYMENT
            
            ! Update human k
            if (pk_s(i,a)<=pk(a)) then
                hc_t = min(x_sim(i,a-1)+1,Nwork)
            else
                hc_t = x_sim(i,a-1)
            end if
			e_t = (minloc(Pr_e_c(hc_t,:),DIM=1,MASK=e_s(i,a)<Pr_e_c(hc_t,:)))
            
            if (ps_s(i,a) > ps(a)) then       ! If NO separation shock
            
                if (f_s(i,a)<=fe(a)) then     ! if outside offer
                    ! what happens with human k if j2j this is correct
                    if (d_s(i,a)<=dj(a)) then
                        hc_t2 = max(hc_t-1,1)
                    else
                        hc_t2 = hc_t
                    end if
                
                    if (V_w(e_t,hc_t2,a,a_t) >= V_w(e_sim_ind(i,a-1),hc_t,a,a_t)) then ! if outside offer better
                        L_sim(i,a)    = 1
                        x_sim(i,a)    = hc_t2
                        ws_sim(i,a)    = yd_w(e_t,hc_t2,a_t)
                        e_sim_ind(i,a)    = e_t
                        e_sim_grid(i,a)  = egrid(e_t,hc_t)                       
                        JJ_sim(i,a)   = 1
                    !
                    else    ! if outside offer worse
                        L_sim(i,a)    = 1
                        x_sim(i,a)    = hc_t
                        ws_sim(i,a)    = yd_w(e_sim_ind(i,a-1),hc_t,a_t)
                        e_sim_ind(i,a)    = e_sim_ind(i,a-1)
                        e_sim_grid(i,a)  = egrid(e_sim_ind(i,a-1),hc_t)
                        JJ_sim(i,a)   = 0
                    !
                    end if
                
                elseif (f_s(i,a)>fe(a)) then   ! if no outside offer
                    L_sim(i,a)    = 1
                    x_sim(i,a)    = hc_t
                    ws_sim(i,a)    = yd_w(e_sim_ind(i,a-1),hc_t,a_t)
                    e_sim_ind(i,a)    = e_sim_ind(i,a-1)
                    e_sim_grid(i,a)  = egrid(e_sim_ind(i,a-1),hc_t)
                    JJ_sim(i,a)   = 0
                end if
                
            else ! if SEPARATION SHOCK
                L_sim(i,a)    = 0
                x_sim(i,a)    = hc_t
                ws_sim(i,a)    = 0
                e_sim_ind(i,a)  = 0
                e_sim_grid(i,a)  = D_QNAN
                EU_sim(i,a)   = 1
                
            end if ! End condition on separation shocks
            
        end if     ! End conditional on past employment
        
    end do     ! end age loop of simulation    
end do        ! end sim loop 

end subroutine