function [grid_tran,P_t,P_n,P_p] = get_transitory(nnodes,work,mu_t,sigma_t,mu_p,sigma_pt,mu_n,sigma_nt)


%% Grid within 3 Std, otherwise there is negative consumption
shock_tp = zeros(10000,work);%pos transitory productivity shocks
shock_tn = zeros(10000,work);
shock_t = zeros(10000,work);
transitory = zeros(3,10000,work);
for t =1:work
    shock_t(:,t) = trunc_nrnd(mu_t(t,1),sigma_t(t,1),10,10000);%transitory not truncated
    shock_tp(:,t)=trunc_lognrnd(mu_p(t,1),sigma_pt(t,1),3,10000); 
    shock_tn(:,t)=-trunc_lognrnd(mu_n(t,1),sigma_nt(t,1),3,10000);
    transitory(1,:,t) = shock_t(:,t);
    transitory(2,:,t) = shock_t(:,t)+shock_tp(:,t);
    transitory(3,:,t) = shock_t(:,t)+shock_tn(:,t);
end

%common transitory shock grid
grid_tran = linspace(-5,2,nnodes)';% decrease I guess

%% Obtain probabilities of getting to grid conditional on specific shock

%only transitory shocks (probability of reaching grid point nnodes(i))
P_t = zeros(nnodes,work);
for t = 1:work
    P_t(:,t) = tran_prob(grid_tran,mu_t(t,1),sigma_t(t,1));
end

%positive log normal and transitory shock (probability of reaching grid point nnodes(i))
P_p = zeros(nnodes,work);
for t = 1:work
    P_p(:,t) = tran_p_prob(grid_tran,mu_t(t,1),sigma_t(t,1),mu_p(t,1),sigma_pt(t,1),3);
end

%positive log normal and transitory shock (probability of reaching grid point nnodes(i))
P_n = zeros(nnodes,work);
for t = 1:work
    P_n(:,t) = tran_n_prob(grid_tran,mu_t(t,1),sigma_t(t,1),mu_n(t,1),sigma_nt(t,1),3);
end
end
