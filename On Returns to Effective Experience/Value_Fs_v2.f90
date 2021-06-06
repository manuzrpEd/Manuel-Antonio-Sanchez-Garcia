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
      mwPointer      mxCreateDoubleMatrix, mxCopyPtrToReal8, mxCopyPtrToInteger4
      integer(4)    mxClassIDFromClassName
      
      ! Pointers to input/output mxArrays:
      ! Input           
      mwPointer  :: Ne,b,beta,yd_w,Nmonths,Nwork,fe,fu,ps,pk,du,dj,mfe,mfu,mps,mpk,mdu,mdj,Pr_e,NPP
       ! Output
      mwPointer  :: V_w,V_u
      
    ! Array size information
	  mwSize	 :: nrows,ncols
      integer(4) :: Nx,Ny,complexFlag,classid      ! length of input (output) array
	  mwSize     :: ndim
      mwSize     :: dims(4),dims2(2)			   ! dimensions (for mxCreateNumericArray)
!--------------------------------------------------------------------------------    
	  classid = mxClassIDFromClassName('double')
      complexFlag = 0  
    ! Retrieve input parameter pointers
      Ne = mxGetPr(prhs(1))
      b = mxGetPr(prhs(2))
	  beta = mxGetPr(prhs(3))
      yd_w = mxGetPr(prhs(4))
      Nmonths = mxGetPr(prhs(5))
      Nwork = mxGetPr(prhs(6))
      fe = mxGetPr(prhs(7))
      fu = mxGetPr(prhs(8))
      ps = mxGetPr(prhs(9))
      pk = mxGetPr(prhs(10))
      du = mxGetPr(prhs(11))
      dj = mxGetPr(prhs(12))
      mfe = mxGetPr(prhs(13))
      mfu = mxGetPr(prhs(14))
      mps = mxGetPr(prhs(15))
      mpk = mxGetPr(prhs(16))
      mdu = mxGetPr(prhs(17))
      mdj = mxGetPr(prhs(18))
	  Pr_e = mxGetPr(prhs(19))
	  NPP = mxGetPr(prhs(20))
      
     !Create matrices for return arguments
	  ndim = 4
	  dims(1) = mxGetScalar(prhs(1))
	  dims(2) = mxGetScalar(prhs(6))
	  dims(3) = mxGetScalar(prhs(5))
	  dims(4) = mxGetScalar(prhs(20))
	  	  
	  plhs(1) = mxCreateNumericArray(ndim,dims,classid,complexflag)
      V_w = mxGetPr(plhs(1))
	  
	  ndim = 2
	  dims2(1) = mxGetScalar(prhs(6))
	  dims2(2) = mxGetScalar(prhs(5))
	  
	  plhs(2) = mxCreateNumericArray(ndim,dims2,classid,complexflag)
      V_u = mxGetPr(plhs(2))

      !call computation function
	  call  sub_val_fun(%val(V_w),%val(V_u),%val(Ne),%val(b),%val(beta),%val(yd_w),%val(Nmonths),%val(Nwork), &
	                    %val(fe),%val(fu),%val(ps),%val(pk),%val(du),%val(dj), &
						%val(mfe),%val(mfu),%val(mps),%val(mpk),%val(mdu),%val(mdj), &
						%val(Pr_e),%val(NPP))						          
      return  
      
end subroutine

subroutine sub_val_fun(V_w,V_u,Ne,b,beta,yd_w,Nmonths,Nwork,fe,fu,ps,pk,du,dj,mfe,mfu,mps,mpk,mdu,mdj,Pr_e,NPP)

implicit none

integer(4), intent(in)									    :: Ne,Nmonths,Nwork,NPP
real(8), intent(in)                                         :: beta
real(8), dimension(Nmonths), intent(in)						:: b,fe,fu,ps,pk,mfe,mfu,mps,mpk,du,dj,mdu,mdj
real(8), dimension(Nwork,Ne), intent(in)					:: Pr_e
real(8), dimension(Ne,Nwork,NPP), intent(in)				:: yd_w
real(8), dimension(Ne,Nwork,Nmonths,NPP), intent(out)		:: V_w
real(8), dimension(Nwork,Nmonths), intent(out)				:: V_u

!define further variables
integer(4)				            :: age,hc,hc_l,hc_r,i,ai
real(8)				                :: ExVu,EmaxVur,EmaxVu,int,int_l,int_r,inter,ExVw
real(8), dimension(Ne)              :: EmaxVwr,EmaxVw,EmaxVwl

V_u(:,Nmonths)      = b(Nmonths)
V_w(:,:,Nmonths,:)    = yd_w(:,:,:)
do ai=1,NPP		
    do age = Nmonths-1,1,-1 
        do hc = 1,Nwork
			! ASSUMPTION: human k shocks BEFORE labor market ones
			hc_l    = max(hc-1,1)
			hc_r    = min(Nwork,hc+1)
        
			! VALUE OF UNEMPLOYMENT
			int_l=0
			do i=1,Ne
				int_l=int_l+Pr_e(hc,i)*V_w(i,hc_l,age+1,ai)
			end do
			int=0
			do i=1,Ne
				int=int+Pr_e(hc,i)*V_w(i,hc,age+1,ai)
			end do
	
			ExVu = fu(age)*(du(age)*max(V_u(hc_l,age+1),int_l) + mdu(age)*max(V_u(hc  ,age+1),int)) &
							+ mfu(age)*(du(age)*V_u(hc_l,age+1) + mdu(age)*V_u(hc,age+1) )
        
			V_u(hc,age) = b(age) + beta*ExVu   
		
        !VALUE OF EMPLOYMENT
			int_r=0
			do i=1,Ne
				int_r=int_r+Pr_e(hc,i)*V_w(i,hc_r,age+1,ai)
			end do
			do i=1,Ne
				EmaxVwr(i)  = max(V_w(i,hc_r,age+1,ai),int_r)
				EmaxVw(i)   = max(V_w(i,hc  ,age+1,ai),int)
				EmaxVwl(i)  = max(V_w(i,hc_l,age+1,ai),int_l)
			end do
        
			EmaxVur  = max(V_u(hc_r,age+1),int_r)
			EmaxVu   = max(V_u(hc  ,age+1),int)        
			do i=1,Ne
				ExVw = ps(age)*fu(age)*(pk(age)*EmaxVur + mpk(age)*EmaxVu) + &
					ps(age)*mfu(age)*(pk(age)*V_u(hc_r,age+1) + mpk(age)*V_u(hc,age+1)) + &
					mps(age)*fe(age)*(pk(age)*mdj(age)*EmaxVwr(i) + pk(age)*dj(age)*EmaxVw(i) + &!
									 mpk(age)*mdj(age)*EmaxVw(i) +mpk(age)*dj(age)*EmaxVwl(i) ) + &  
					mps(age)*mfe(age)*(pk(age)*V_w(i,hc_r,age+1,ai) + mpk(age)*V_w(i,hc,age+1,ai))				
				V_w(i,hc,age,ai) = yd_w(i,hc,ai) + beta*ExVw
			end do
		end do
    end do
end do

end subroutine