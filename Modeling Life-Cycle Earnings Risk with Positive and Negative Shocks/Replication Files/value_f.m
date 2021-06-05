function V = value_f(c_w,V_w,anext,gamma,beta,agrid,grid_p_rho,grid_n_rho,grid_p,grid_n,Np,Nn,na,nnodes,NPP...
    ,P_p,P_n,prob_pp,prob_nn,P_t,P_tp,P_tn)             
%% expected value function transitory shocks
EVE_s=zeros(na,Np,Nn,nnodes,NPP);
EVE_s=value_f1(int32(na),int32(Np),int32(Nn),int32(NPP),int32(nnodes),grid_p,grid_n,V_w,grid_p_rho,grid_n_rho,EVE_s);


%% value function after positive shocks
EVE_ps=zeros(na,Np,Nn,nnodes,NPP);
EVE_ps=value_f2(int32(na),int32(Np),int32(Nn),int32(NPP),int32(nnodes),grid_n,V_w,grid_n_rho,EVE_ps);


%% value function after negative shocks
EVE_ns=zeros(na,Np,Nn,nnodes,NPP);
EVE_ns=value_f3(int32(na),int32(Np),int32(Nn),int32(NPP),int32(nnodes),grid_p,V_w,grid_p_rho,EVE_ns);


%% Sum over probabilities

%weight value functions transitory shocks
P_tL = repmat(reshape(P_t,[1 1 1 1 nnodes]),[na Np Nn NPP 1]);
EVE_s = sum(permute(EVE_s,[1 2 3 5 4]).*P_tL,5);

%weight value functions positive shocks
P_tpL = repmat(reshape(P_tp,[1 1 nnodes]),[na Nn 1]);

EVE_ps2=zeros(na,Np,Nn,NPP);
EVE_ps2=value_f4(int32(na),int32(Np),int32(Nn),int32(NPP),int32(nnodes),P_p,EVE_ps,P_tpL,EVE_ps2);

%weight value functions negative shocks
P_tnL = repmat(reshape(P_tn,[1 1 nnodes]),[na Np 1]);

EVE_ns2=zeros(na,Np,Nn,NPP);
EVE_ns2=value_f5(int32(na),int32(Np),int32(Nn),int32(NPP),int32(nnodes),P_n,EVE_ns,P_tnL,EVE_ns2);

EVE = (1-prob_pp-prob_nn)*EVE_s+prob_pp*EVE_ps2+prob_nn*EVE_ns2;
EVE = reshape(EVE,[na Np Nn 1 NPP]);
EVE = repmat(EVE,[1 1 1 nnodes 1]); %expected value independent of current transitory state

V=zeros(na,Np,Nn,nnodes,NPP);
V=value_f6(int32(na),int32(Np),int32(Nn),int32(NPP),int32(nnodes),c_w,gamma,beta,agrid,EVE,anext,V);
end