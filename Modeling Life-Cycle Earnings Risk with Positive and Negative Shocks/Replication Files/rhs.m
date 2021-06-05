function B = rhs(c,beta,R,gamma,na,nnodes,Np,Nn,NPP,...
                    grid_p,grid_n,grid_p_rho,grid_n_rho,...
                    P_t,P_tn,P_tp,P_p,P_n,prob_pp,prob_nn) 
clear mex
%% consumtion transitory shocks
%expected consumption given persistent productivitz transitions
c_t=zeros(na,Np,Nn,nnodes,NPP);
c_t=srhs_o(int32(na),int32(Np),int32(Nn),int32(NPP),int32(nnodes),grid_p,grid_n,c,grid_p_rho,grid_n_rho,c_t);

%% consumption positive shocks
c_p=zeros(na,Np,Nn,nnodes,NPP);
c_p=srhs_t(int32(na),int32(Np),int32(Nn),int32(NPP),int32(nnodes),grid_n,c,grid_n_rho,c_p);

%% consumption negative shocks

%productivity transitions
c_n=zeros(na,Np,Nn,nnodes,NPP);
c_n=srhs_th(int32(na),int32(Np),int32(Nn),int32(NPP),int32(nnodes),grid_p,c,grid_p_rho,c_n);

%% Sum over probability weighted marginal utilities
c_t = c_t.^(-gamma);
c_p = c_p.^(-gamma);
c_n = c_n.^(-gamma);

%weight conditional marginal utilities transitory shocks
P_tL = repmat(reshape(P_t,[1 1 1 1 nnodes]),[na Np Nn NPP 1]);
c_tt = sum(permute(c_t,[1 2 3 5 4]).*P_tL,5);
%B=srhs(prob_pp,prob_nn,c_tt,c_p,c_n,beta,R,int32(na),int32(Np),int32(Nn),int32(NPP),int32(nnodes),P_tn,P_n,P_tp,P_p);
%
%weight conditional marginal positive shocks

P_tpL = repmat(reshape(P_tp,[1 1 nnodes]),[na Nn 1]);

c_pp = zeros(na,Np,Nn,NPP); 
c_pp=srhs_f(int32(na),int32(Np),int32(Nn),int32(NPP),int32(nnodes),c_p,P_p,P_tpL,c_pp);

%c_nn = zeros(na,Np,Nn,NPP);
P_tnL = repmat(reshape(P_tn,[1 1 nnodes]),[na Np 1]);

c_nn = zeros(na,Np,Nn,NPP); 
c_nn=srhs_fi(int32(na),int32(Np),int32(Nn),int32(NPP),int32(nnodes),c_n,P_n,P_tnL,c_nn);

c_w = (1-prob_pp-prob_nn)*c_tt+prob_pp*c_pp+prob_nn*c_nn;
B = beta*R*c_w;
B = reshape(B,[na Np Nn 1 NPP]);
B = repmat(B,[1 1 1 nnodes 1]); %expected consumption independent of current transitory state
%
end