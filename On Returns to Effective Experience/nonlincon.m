function [c,ceq] = nonlincon(x,Nwork)
c = -(x(4)+x(4).*(1:Nwork)+x(4).*(1:Nwork).^2);
ceq = [];
end
