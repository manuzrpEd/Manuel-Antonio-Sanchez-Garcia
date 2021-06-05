clear
clear mex
close all
clc
%
load('data_simplified.mat','data_simplified')
col = 31;
H=20000;
T=32;
M_ave_vect=[data_simplified.M_ave];
NPARMS=3;
initial=zeros(NPARMS,1);
initial(1)=0.9; %AR(1)
initial(2)=0.027; %sigma transitory
initial(3)=0.016; %sigma persistent
lb=zeros(NPARMS,1);
lb(1)=-1;
lb(2)=0;
lb(3)=0;
ub=zeros(NPARMS,1);
ub(1)=1;
ub(2)=Inf;
ub(3)=Inf;
options =optimoptions('fmincon','Algorithm','sqp','TolCon',1e-6,'TolFun',1e-6,'TolX',1e-6,'MaxIter',2000,'Display','iter');
%
[paraopt_ar1_micro_inv_data,fval,exitflag,output]=fmincon(@(x) loss_micro_inv(x,col,M_ave_vect),initial',[],[],[],[],lb',ub',[],options);
save('paraopt_ar1_micro_inv_data.mat','paraopt_ar1_micro_inv_data')
rho=paraopt_ar1_micro_inv_data(1)
sigma_transitory=sqrt(paraopt_ar1_micro_inv_data(2))
sigma_persistent=sqrt(paraopt_ar1_micro_inv_data(3))
%% Simulation
m=zeros(col,col);
phi=0;
sigmatr=paraopt_ar1_micro_inv_data(2);
theta=0;
sigmah=0;
sigmap=paraopt_ar1_micro_inv_data(3);
rho=paraopt_ar1_micro_inv_data(1);
sigmame=0;
psi=theta+phi;
mult=-rho*sigmap*(1-rho)/(1+rho)+sigmatr*(psi*(phi-1)+psi*phi*(phi-1)*(psi-1)+phi^2*psi^2*(1-phi)*(1+phi)^(-1));
%Autocovariance of order 0
for j=1:col
    m(j,j)=2*sigmap/(1+rho)+sigmah+sigmatr*(1+(psi-1)^2+psi^2*(1-phi)*(1+phi)^(-1))+2*sigmame;
end
%Autocovariance of order 1
m1=-(1-rho)/(1+rho)*sigmap+sigmah+sigmatr*((psi-1)+psi*(phi-1)*(psi-1)+phi*psi^2*(1-phi)*(1+phi)^(-1))-sigmame;
vm1=m1*ones(col-1,1);
m1=diag(vm1);
m1=horzcat(vertcat(zeros(col-1,1)',m1),zeros(col,1));
%Autocovariance of order 2
m2=sigmah+mult;
vm2=m2*ones(col-2,1);
m2=diag(vm2);
m2=horzcat(horzcat(vertcat(vertcat(zeros(col-2,1)',zeros(col-2,1)',m2)),zeros(col,1),zeros(col,1)));
%Entire matrix
m=m+m1+m2;
for i=1:col
    for j=1:col
        m(i,j)=m(j,i);
    end
end
%Autocovariance of order 3 or higher
for i=1:col-3
    for j=i+3:col
        m(i,j)=-sigmap*rho^(j-i-1)*(1-rho)/(1+rho)+sigmah+phi^(j-i-2)*mult;
    end
end
for i=1:col
    for j=1:col
        m(j,i)=m(i,j);
    end
end
M_vect=m(:,1);
%
figure
plot(data_simplified.M_ave,'LineWidth',2.5)
hold on
plot(M_vect(:,1),'LineWidth',2.5)
hold off
grid on
legend('Data','AR1 Macro Covariances Invariant','Location','Northeast')
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Var[log Earnings]','fontsize',24,'FontWeight','bold')
% ylim([0 0.2])
print('Micro_inv_data_ACV','-dpng')