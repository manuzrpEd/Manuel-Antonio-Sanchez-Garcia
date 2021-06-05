function g = expect_t2(x,t)
aux = length(x);
if aux>t
    g = x(1:end-t,1).*x(t+1:end,1);
    g = [g; NaN(t,1)];
else
    g = NaN(aux,1);
end
end