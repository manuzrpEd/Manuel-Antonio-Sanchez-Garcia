function P = pers_prob(grid_pers,mu_p,sigma_p,rho,N)

% %simulate random probabilities
% aux = mu_t+sigma_t*randn(100000,1);
% aux = sort(aux);
% 
% %find position 
% [~,k] = histc(aux,grid_tran);
% k(aux<grid_tran(1)) = 1;
% k(aux>=grid_tran(end)) = length(grid_tran)-1;
% 
% h = diff(grid_tran);
% s = (aux - grid_tran(k))./h(k);
% 
% N = zeros(length(grid_tran),1);
% for i = 1:100000
%     N(k(i)) = N(k(i))+max(0,1-s(i));
%     N(k(i)+1) = N(k(i)+1)+min(1,s(i));
% end
% P = N/100000;


stepp=diff(grid_pers);
bounds=[-Inf; grid_pers(1:end-1)+stepp/2; Inf];
bounds(1)=bounds(2)-99999999999;
bounds(end)=bounds(end-1)+99999999999;
P = zeros(N,N);
for i = 1:N %state
    for j = 1:N %transition to
        P(i,j) = normcdf(bounds(j+1)-rho*grid_pers(i,1),mu_p,sigma_p)-normcdf(bounds(j,1)-rho*grid_pers(i,1),mu_p,sigma_p);
    end
end
end