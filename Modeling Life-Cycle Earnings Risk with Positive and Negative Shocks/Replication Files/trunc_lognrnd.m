function out = trunc_lognrnd(mu,sigma,trunc,H)

%generate H random draws from truncated log normal distribution

out = zeros(H,1);
for i = 1:H
    index = 1;
    while index>0
        aux = sigma*randn;
        if aux < trunc*sigma && aux>-trunc*sigma %shock within truncation
            index=0;
        end
    end
    out(i,1) = exp(mu+aux);
end


end