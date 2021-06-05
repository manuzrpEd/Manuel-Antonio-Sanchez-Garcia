function P = trans_logn(mu,sigma,rho,grid,N)
%transition probabilities in log normal distribution, given an exogenous



stepp=diff(grid);
bounds=[-Inf; grid(1:end-1)+stepp/2; Inf]; %around centered grid points
bounds(1)=bounds(2)-99999999999; %make finite
bounds(end)=bounds(end-1)+99999999999;
P = zeros(N,N);
for i = 1:N %state
    for j = 1:N %transition to
        P(i,j) = logncdf(bounds(j+1,1)-rho*grid(i,1),mu,sigma)-logncdf(bounds(j,1)-rho*grid(i,1),mu,sigma);
    end
end
end