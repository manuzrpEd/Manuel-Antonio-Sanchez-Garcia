function P = tran_prob(grid_tran,mu_t,sigma_t)


stepp=diff(grid_tran);
bounds=[-Inf; grid_tran(1:end-1)+stepp/2; Inf];
bounds(1)=bounds(2)-99999999999;
bounds(end)=bounds(end-1)+99999999999;
P = zeros(length(grid_tran),1);
for i = 1:length(grid_tran) %state
    P(i,1) = normcdf(bounds(i+1),mu_t,sigma_t)-normcdf(bounds(i),mu_t,sigma_t);
end

end