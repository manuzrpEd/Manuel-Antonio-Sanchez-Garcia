function z=nummobcl(par,mcl,year_birth,ED2,ED3)
% global cons year_birth ED2 ED3;

%NOTE: This returns the NUMERATOR of the multinomial logit probability.
%Have to normalize by the sum over all classes.

switch mcl
    case 1
        z=1;
    otherwise
        startpt=4*(mcl-2);%-1,0,1;-4,0,4; 8 parameters, km=1,2,3, so the trick for 4 parameters when km=3
        z=exp(par(1+startpt) + par(2+startpt)*year_birth + par(3+startpt)*ED2 + par(4+startpt)*ED3);
end