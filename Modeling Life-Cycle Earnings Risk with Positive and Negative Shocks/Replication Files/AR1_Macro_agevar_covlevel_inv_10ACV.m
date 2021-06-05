clear
clear mex
close all
clc
set(0,'DefaultFigureWindowStyle','docked')
%
load('optimum_simplified_2covar.mat','optimum_simplified_2covar')
col = 31;
H=20000;
T=32;
%
%
rand('seed',256344);
randn('seed',66573);
randn_b = randn(H,1);
rand_shock_s = rand(H,T);
%
rho_n=optimum_simplified_2covar(1);
rho_p=optimum_simplified_2covar(2);
sigma_b = optimum_simplified_2covar(3);
d_one_neg = optimum_simplified_2covar(4); %c_px - NEGAtive
d_two_neg = optimum_simplified_2covar(5); %b_px
d_one_pos = optimum_simplified_2covar(6); %d_one_pos - POSITIVE MARGINAL
d_two_pos = optimum_simplified_2covar(7); %d_two_pos
gamma_a_tr_p=optimum_simplified_2covar(8);%0.5
gamma_b_tr_p=optimum_simplified_2covar(9);
gamma_a_tr_n=optimum_simplified_2covar(10);
gamma_b_tr_n=optimum_simplified_2covar(11);
gamma_a_per_n=optimum_simplified_2covar(12);
gamma_b_per_n=optimum_simplified_2covar(13);
gamma_a_per_p=optimum_simplified_2covar(14);%1.85
gamma_b_per_p=optimum_simplified_2covar(15);
lambda_a_pos=optimum_simplified_2covar(16);%posit
lambda_b_pos=optimum_simplified_2covar(17);%posit
lambda_a_neg=optimum_simplified_2covar(18);%negativ
lambda_b_neg=optimum_simplified_2covar(19);%negative
d_three_neg=optimum_simplified_2covar(20);%d_three_pos - NEGAtive
d_three_pos=optimum_simplified_2covar(21);
sigma_tra=optimum_simplified_2covar(22);
sigma_trb=sigma_tra;
mu_tra=0;%-0.05
mu_trb=mu_tra;
sigma_a=optimum_simplified_2covar(23);%to be changed
sigma_epini=optimum_simplified_2covar(24);%0.5
sigma_enini=optimum_simplified_2covar(25);
mu_epini=optimum_simplified_2covar(26);%0.5
mu_enini=optimum_simplified_2covar(27);
%
randn_a=sigma_a.*randn(H,1);
sigma_ep0 = linspace(gamma_a_tr_p,gamma_a_tr_p+gamma_b_tr_p*T,T)';
sigma_en0 = linspace(gamma_a_tr_n,gamma_a_tr_n+gamma_b_tr_n*T,T)';
sigma_x0 = linspace(optimum_simplified_2covar(12),optimum_simplified_2covar(12)+gamma_b_per_n*T,T)';
sigma_z0 = linspace(optimum_simplified_2covar(14),optimum_simplified_2covar(14)+gamma_b_per_p*T,T)';
sigma_tr0 = linspace(sigma_tra,sigma_trb,T)';
mu_logna=linspace(optimum_simplified_2covar(16),optimum_simplified_2covar(16)+lambda_b_pos*T,T)';%positive
mu_lognb=linspace(optimum_simplified_2covar(18),optimum_simplified_2covar(18)+lambda_b_neg*T,T)';%negative
mu_tr=linspace(mu_tra,mu_tra,T)';
%
rand('seed',256344);
randn('seed',66573);
randn_ini_x = lognrnd(mu_enini,sigma_enini,[H,1]);
randn_ini_z = lognrnd(mu_epini,sigma_epini,[H,1]);
randn_shock_ep=zeros(H,T);
randn_shock_en=zeros(H,T);
randn_shock_x=zeros(H,T);
randn_shock_z=zeros(H,T);
randn_tr=zeros(H,T);
for i=1:T
randn_shock_ep(:,i) = lognrnd(mu_logna(i,1),sigma_ep0(i,1),[H,1]);
randn_shock_en(:,i) = lognrnd(mu_lognb(i,1),sigma_en0(i,1),[H,1]);
randn_shock_x(:,i) = lognrnd(mu_lognb(i,1),sigma_x0(i,1),[H,1]);
randn_shock_z(:,i) = lognrnd(mu_logna(i,1),sigma_z0(i,1),[H,1]);
randn_tr(:,i)=mu_tr(i,1)+sigma_tr0(i,1).*randn(H,1);
end
%
for i=1:T
    replaceIdx = (randn_shock_ep(:,i) > exp(mu_logna(i,1)+3*sigma_ep0(i,1)));
        while sum(replaceIdx)>0
            randn_shock_ep(replaceIdx,i) = lognrnd(mu_logna(i,1),sigma_ep0(i,1),1,sum(replaceIdx));
            replaceIdx = (randn_shock_ep(:,i) > exp(mu_logna(i,1)+3*sigma_ep0(i,1)));
        end
    replaceIdx = (randn_shock_en(:,i) > exp(mu_lognb(i,1)+3*sigma_en0(i,1)));
        while sum(replaceIdx)>0
            randn_shock_en(replaceIdx,i) = lognrnd(mu_lognb(i,1),sigma_en0(i,1),1,sum(replaceIdx));
            replaceIdx = (randn_shock_en(:,i) > exp(mu_lognb(i,1)+3*sigma_en0(i,1)));
        end
    replaceIdx = (randn_shock_x(:,i) > exp(mu_lognb(i,1)+3*sigma_x0(i,1)));
        while sum(replaceIdx)>0
            randn_shock_x(replaceIdx,i) = lognrnd(mu_lognb(i,1),sigma_x0(i,1),1,sum(replaceIdx));
            replaceIdx = (randn_shock_x(:,i) > exp(mu_lognb(i,1)+3*sigma_x0(i,1)));
        end
    replaceIdx = (randn_shock_z(:,i) > exp(mu_logna(i,1)+3*sigma_z0(i,1)));
        while sum(replaceIdx)>0
            randn_shock_z(replaceIdx,i) = lognrnd(mu_logna(i,1),sigma_z0(i,1),1,sum(replaceIdx));
            replaceIdx = (randn_shock_z(:,i) > exp(mu_logna(i,1)+3*sigma_z0(i,1)));
        end     
end
replaceIdx = (randn_ini_x > exp(mu_enini+3*sigma_enini));
while sum(replaceIdx)>0
randn_ini_x(replaceIdx,1) = lognrnd(mu_enini,sigma_enini,1,sum(replaceIdx));
replaceIdx = (randn_ini_x(:,1) > exp(mu_enini+3*sigma_enini));
end
replaceIdx = (randn_ini_z > exp(mu_epini+3*sigma_epini));
while sum(replaceIdx)>0
randn_ini_z(replaceIdx,1) = lognrnd(mu_epini,sigma_epini,1,sum(replaceIdx));
replaceIdx = (randn_ini_z(:,1) > exp(mu_epini+3*sigma_epini));
end   
%
panel_new=zeros(H*T,8);
panel_new(:,1:7) = moments_mixture(int32(H),int32(T),rho_n,rho_p,sigma_b,d_one_neg,d_two_neg,d_one_pos,d_two_pos,randn_ini_x,randn_ini_z,randn_b,randn_shock_ep,randn_shock_en ...
                        ,randn_shock_x,randn_shock_z,rand_shock_s,0,0,d_three_neg,d_three_pos,randn_tr,randn_a);
panel_new(:,8)=panel_new(:,5);
%
%Unconditional Autocovariance:
M_ave=zeros(T,T);
for i=1:T%autocovariance lag
res=panel_new;
fcn = @(x){expect_t2(x,i-1)}; 
res(:,end+1) = accumarray_expand(res(:,5),res(:,7),fcn);
aux_u = res(logical(isnan(res(:,end))==0),:);
fcn = @(x)mean(x);
aux_u = sortrows(aux_u,6);
covar_u = accumarray_expand_s(aux_u(:,end),aux_u(:,6),fcn);
if length(covar_u)==T
    M_ave(:,i) = covar_u';
else
    M_ave(:,i) = [NaN(T-length(covar_u),1); covar_u]';
end
end
% %
% M_ave_vect=[M_ave(:,1);M_ave(2:end,2);M_ave(3:end,3)];
M_ave_vect=M_ave(:,1);
for q=2:10
    M_ave_vect=[M_ave_vect; M_ave(q:end,q)];
end
%
%
NPARMS=5;
para=zeros(NPARMS,1);
para(1)=0.99; %AR(1)
para(2)=0.2; %sigma alpha
para(3)=0.04; %sigma transitory
para(4)=0.006; %sigma persistent
para(5)=0.04; %sigma transitory
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
options =optimoptions('fmincon','TolCon',1e-6,'TolFun',1e-6,'TolX',1e-6,'MaxIter',200,'Display','iter');
%
[paraopt_ar1_macro_agevar_covlevel_inv_10ACV,fval,exitflag,output]=fmincon(@(x) loss_agevar_covlevel_inv_10ACV(x,T,M_ave_vect),para',[],[],[],[],lb',ub',[],options);
save('paraopt_ar1_macro_agevar_covlevel_inv_10ACV.mat','paraopt_ar1_macro_agevar_covlevel_inv_10ACV')
rho=paraopt_ar1_macro_agevar_covlevel_inv_10ACV(1)
sigma_alpha=sqrt(paraopt_ar1_macro_agevar_covlevel_inv_10ACV(2))
sigma_transitory=sqrt(paraopt_ar1_macro_agevar_covlevel_inv_10ACV(3))
sigma_persistent=sqrt(paraopt_ar1_macro_agevar_covlevel_inv_10ACV(4))
sigma_transitory_24=sqrt(paraopt_ar1_macro_agevar_covlevel_inv_10ACV(5))
%% Simulation / Comparison:
rho = paraopt_ar1_macro_agevar_covlevel_inv_10ACV(1);
sigma_a = paraopt_ar1_macro_agevar_covlevel_inv_10ACV(2);
sigma_tr = paraopt_ar1_macro_agevar_covlevel_inv_10ACV(3);
sigma_p = paraopt_ar1_macro_agevar_covlevel_inv_10ACV(4); %c_px - NEGAtive
sigma_tr_24 = paraopt_ar1_macro_agevar_covlevel_inv_10ACV(5);
M=NaN(T,T);

%variance
%
M(1,1)=sigma_a+sigma_tr+sigma_p;
    
sum=sigma_p(1);
for i=2:T
        M(i,1)=sigma_a+sigma_tr+(rho^(2))*sum+sigma_p;
        sum=(rho^(2))*sum+sigma_p;
end

M(2,2)=sigma_a+rho*sigma_p;%
sum=rho*sigma_p;
for i=3:T
        M(i,2)=sigma_a+(rho^(2))*sum+rho*sigma_p;
        sum=(rho^(2))*sum+rho*sigma_p;
end

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
plot(M_ave(:,1),'LineWidth',2.5)
hold on
plot(M(:,1),'LineWidth',2.5)
hold off
grid on
legend('Baseline','AR1 Macro Covariances Invariant','Location','Northwest')
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Var[log Earnings]','fontsize',24,'FontWeight','bold')
% ylim([0 0.2])
print('beta_FullMacCov_inv_cov0_10ACV','-dpng')

%
figure
plot(M_ave(2:end,2),'LineWidth',2.5)
hold on
plot(M(2:end,2),'LineWidth',2.5)
hold off
grid on
legend('Baseline','AR1 Macro Covariances Invariant','Location','Northwest')
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Covar[log Earnings]_1','fontsize',24,'FontWeight','bold')
% ylim([0 0.2])
print('beta_FullMacCov_inv_cov1_10ACV','-dpng')

%
figure
plot(M_ave(3:end,3),'LineWidth',2.5)
hold on
plot(M(3:end,3),'LineWidth',2.5)
hold off
grid on
legend('Baseline','AR1 Macro Covariances Invariant','Location','Northwest')
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Covar[log Earnings]_2','fontsize',24,'FontWeight','bold')
% ylim([0 0.2])
print('beta_FullMacCov_inv_cov2_10ACV','-dpng')

var_covar=M(:,1);

cov1_covar=M(:,2);

cov2_covar=M(:,3);
%
beep on
disp('Finished!')