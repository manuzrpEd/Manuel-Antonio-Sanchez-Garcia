function z=numinccl(par,wcl,year_birth,ED2,ED3)
% global cons year_birth ED2 ED3;

%NOTE: This returns the NUMERATOR of the multinomial logit probability.
%Have to normalize by the sum over all classes.

switch wcl
    case 1
        z=1;
    otherwise
        startpt=4*(wcl-2);
        z=exp(par(1+startpt) + par(2+startpt).*year_birth + par(3+startpt).*ED2 + par(4+startpt).*ED3);
end