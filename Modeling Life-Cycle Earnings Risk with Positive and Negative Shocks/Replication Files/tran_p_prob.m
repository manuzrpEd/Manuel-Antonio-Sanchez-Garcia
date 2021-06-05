function P = tran_p_prob(grid_tran,mu_t,sigma_t,mu_p,sigma_pt,trunc)

%simulate random probabilities
aux1 = mu_t+sigma_t*randn(100000,1);
aux2 =  trunc_lognrnd(mu_p,sigma_pt,trunc,100000);
aux = sort(aux1+aux2); %mixture

%find position 
[~,k] = histc(aux,grid_tran);
k(aux<grid_tran(1)) = 1;
k(aux>=grid_tran(end)) = length(grid_tran)-1;

h = diff(grid_tran);
s = (aux - grid_tran(k))./h(k);
s = max(0,s);
s = min(s,1);

N = zeros(length(grid_tran),1);
for i = 1:100000
    N(k(i)) = N(k(i))+max(0,1-s(i));
    N(k(i)+1) = N(k(i)+1)+min(1,s(i));
end
P = N/100000;

end