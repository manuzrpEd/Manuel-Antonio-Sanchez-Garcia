clc
clear all
num=1;
% while num<4
% num=input('number of program 1 cond. 2 Dec. 3 Matlab?');
% switch num
% case 1
% program 1 Generate observation of Multivariate Normal by conditional with Box_Muller Method
disp('Result of conditional method')
n=1;% n is sample size.
Rep=2;% number of replications
% t0=cputime();
rand('seed',n);
s_m=0;
ssme =[0 0];
ssva=[0 0];
SS_MS=0;
mu=[2.6 ; 4]
sigma=[1 -1;-1 2]
% rho=sigma(1,2)/(sigma(1,1)*sigma(2,2))^0.5
rho=1
l=length(mu);
for r=1:Rep
U=unifrnd(0,1,2,n);
U1=U(1,:);
U2=U(2,:);
ph=2*(pi)*U1;
R=(-2*log(U2)).^0.5;
z1=R.*cos(ph);
z2=R.*sin(ph);
x1=mu(1,1)+z1*sigma(1,1)^0.5;
y2=rho*z1+sqrt(1-(rho)^2)*z2;
x2=mu(2,1)+sigma(2,2)^0.5*y2;
x=[x1;x2]';
% me=mean(x);
% ssme=ssme+me;ssva=ssva+var(x) ;
% SS_MS=SS_MS+(me'-mu)*(me'-mu)';
end
% U
x
mean(x,1)