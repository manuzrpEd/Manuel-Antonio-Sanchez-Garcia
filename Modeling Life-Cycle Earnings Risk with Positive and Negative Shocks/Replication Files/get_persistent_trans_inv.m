function [grid_pers,P_p] = get_persistent_trans_inv(Np,work,sigma_p)
%% Grid within 3 Std, otherwise there is negative consumption
pers= zeros(10000,work);
for t =1:work
    pers(:,t) = trunc_nrnd(0,sigma_p(t,1),10,10000);%transitory not truncated
end

% aux = pers(:);
%max(transitory(:))=1.6813
%min(transitory(:))=-3.7501
% max_shock =prctile(aux,99);%0.49
% min_shock=prctile(aux,1);%-1.0907
%the above limits generate 0 negative consumption, but little var log
%earnings, which shall equal the econ process and the data as we
%estimated...
% max_shock = max(max(max(transitory)));
% min_shock = min(min(min(transitory)));

%common transitory shock grid
grid_pers = linspace(-1.5,1.5,Np)';
% grid_tran = linspace(-3,1.5,nnodes)';
% grid_tran = linspace(max_shock,min_shock,nnodes)';
%% Obtain probabilities of getting to grid conditional on specific shock
%only transitory shocks (probability of reaching grid point nnodes(i))
P_p = zeros(Np,work);
for t = 1:work
    P_p(:,t) = tran_prob(grid_pers,0,sigma_p(t,1));
end
end
