function [grid_pers,P_p] = get_persistent_trans(Np,work,sigma_p)
%% Grid within 3 Std, otherwise there is negative consumption

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
