function U = u_uncertain(c,beta,gamma,t,T)
%utility of a specific amount of certain consume given age t, and life span
%T
%clear mex
U = 0;
rest = T-t+1; %periods to live
for s = 1:rest
    U = U + (beta^(s-1))*CARRA(c(s,1),gamma);
end


end