clear
clear mex
close all
clc
set(0,'DefaultFigureWindowStyle','docked')
%
load('data_simplified.mat','data_simplified')
col = 31;
H=20000;
T=32;
%
M_ave_vect=[data_simplified.hump;data_simplified.le_cov1;data_simplified.le_cov2;data_simplified.le_cov3...
    ;data_simplified.le_cov4;data_simplified.le_cov5;data_simplified.le_cov6;data_simplified.le_cov7...
    ;data_simplified.le_cov8;data_simplified.le_cov9];%need to change this! ;data_simplified.le_cov10
%
% lower_triang = tril(true(size(M_ave)));
% M_ave_vect = M_ave(lower_triang);
%
%
NPARMS=5;
para=zeros(NPARMS,1);
para(1)=0.99; %AR(1)
para(2)=0.2; %sigma alpha
para(3)=0.04; %sigma transitory
para(4)=0.006; %sigma persistent
para(5)=0.04; %sigma transitory age 24
lb=zeros(NPARMS,1);
lb(1)=-1;
lb(2)=0;
lb(3)=0;
lb(4)=0;
lb(5)=0;
ub=zeros(NPARMS,1);
ub(1)=1;
ub(2)=Inf;
ub(3)=Inf;
ub(4)=Inf;
ub(5)=Inf;
%,'Algorithm','sqp'
options =optimoptions('fmincon','TolCon',1e-6,'TolFun',1e-6,'TolX',1e-6,'MaxIter',2000,'Display','iter');
%
[paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV,fval,exitflag,output]=fmincon(@(x) loss_agevar_covlevel_inv_10ACV(x,T,M_ave_vect),para',[],[],[],[],lb',ub',[],options);
save('paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV.mat','paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV')
rho=paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV(1)
sigma_alpha=sqrt(paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV(2))
sigma_transitory=sqrt(paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV(3))
sigma_persistent=sqrt(paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV(4))
sigma_transitory_24=sqrt(paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV(5))
%% Simulation / Comparison:
rho = paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV(1);
sigma_a = paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV(2);
sigma_tr = paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV(3);
sigma_p = paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV(4); %c_px - NEGAtive
sigma_tr_24 = paraopt_ar1_macro_agevar_covlevel_inv_data_10ACV(5);
M=NaN(T,T);

%variance
%
M(1,1)=sigma_a+sigma_tr_24+sigma_p;

% M(2,1)=sigma_a+sigma_tr+(rho^2)*sigma_p(1)+sigma_p(2);
% M(3,1)=sigma_a+sigma_tr+(rho^4)*sigma_p(1)+(rho^2)*sigma_p(2)+sigma_p(3);
% ...
    
sum=sigma_p(1);
for i=2:T
        M(i,1)=sigma_a+sigma_tr+(rho^(2))*sum+sigma_p;
        sum=(rho^(2))*sum+sigma_p;
end
% caca

% M(2,2)=sigma_a+rho*sigma_p(1);
% M(2,3)=sigma_a+rho*sigma_p(2)+(rho^3)*sigma_p(3);
% ...

M(2,2)=sigma_a+rho*sigma_p;%
sum=rho*sigma_p;
for i=3:T
        M(i,2)=sigma_a+(rho^(2))*sum+rho*sigma_p;
        sum=(rho^(2))*sum+rho*sigma_p;
end

% M(3,3)=sigma_a+(rho^(2))*sigma_p(1);
% sum=(rho^(2))*sigma_p(1);
% for i=4:T
%    M(3,i)=sigma_a+(rho^(2))*sum+(rho^(2))*sigma_p(i-2);
% end

for j=3:T
    M(j,j)=sigma_a+(rho^(j-1))*sigma_p;%
    sum=(rho^(j-1))*sigma_p;
    for i=(j+1):T
            M(i,j)=sigma_a+(rho^(2))*sum+(rho^(j-2))*sigma_p;%
            sum=(rho^(2))*sum+(rho^(j-2))*sigma_p;
    end
end
%
M_vect=[mean(M(:,1));mean(M(2:end,2));mean(M(3:end,3))];

%%%
% load('paraopt_ar1_macro_agevar_covlevel.mat','paraopt_ar1_macro_agevar_covlevel')

%

figure
plot(data_simplified.hump,'LineWidth',2.5)
hold on
plot(M(:,1),'LineWidth',2.5)
hold off
grid on
legend('Data','AR1 Macro Covariances Invariant','Location','Northwest')
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Var[log Earnings]','fontsize',24,'FontWeight','bold')
% ylim([0 0.2])
print('MacCov_inv_data_cov0_10ACV','-dpng')

%
figure
plot(data_simplified.le_cov1,'LineWidth',2.5)
hold on
plot(M(2:end,2),'LineWidth',2.5)
hold off
grid on
legend('Data','AR1 Macro Covariances Invariant','Location','Northwest')
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Covar[log Earnings]_1','fontsize',24,'FontWeight','bold')
% ylim([0 0.2])
print('MacCov_inv_data_cov1_10ACV','-dpng')

%
figure
plot(data_simplified.le_cov2,'LineWidth',2.5)
hold on
plot(M(3:end,3),'LineWidth',2.5)
hold off
grid on
legend('Data','AR1 Macro Covariances Invariant','Location','Northwest')
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Covar[log Earnings]_2','fontsize',24,'FontWeight','bold')
% ylim([0 0.2])
print('MacCov_inv_data_cov2_10ACV','-dpng')

var_covar=M(:,1);

cov1_covar=M(:,2);

cov2_covar=M(:,3);
%
beep on
disp('Finished!')