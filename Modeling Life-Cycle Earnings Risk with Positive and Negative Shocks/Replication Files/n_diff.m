function g = n_diff(x,n)
aux = length(x);
if aux>n
    g = x(1+n:end,1)-x(1:end-n,1);
    g = [NaN(n,1); g];
else
    g = NaN(aux,1);
end
end