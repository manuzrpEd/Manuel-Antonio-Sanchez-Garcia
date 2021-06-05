function error_total=loss_simplified_se(para,data,H,T,randn_b,rand_shock_s,col,randn_a0)
clear mex
rand('seed',256344);
randn('seed',66573);
rho_n=para(1);
rho_p=para(2);
sigma_b = para(3);
d_one_neg = para(4); %c_px - NEGAtive
d_two_neg = para(5); %b_px
d_one_pos = para(6); %d_one_pos - POSITIVE MARGINAL
d_two_pos = para(7); %d_two_pos
sigma_ep0 = linspace(para(8),para(8)+para(9)*T,T)';
sigma_en0 = linspace(para(10),para(10)+para(11)*T,T)';
sigma_x0 = linspace(para(12),para(12)+para(13)*T,T)';
sigma_z0 = linspace(para(14),para(14)+para(15)*T,T)';
mu_logna=linspace(para(16),para(16)+para(17)*T,T)';%positive
mu_lognb=linspace(para(18),para(18)+para(19)*T,T)';%negative
d_three_neg=para(20);%d_three_neg - NEGAtive
d_three_pos=para(21);
sigma_tr0 = linspace(para(22),para(22),T)';
sigma_a=para(23);%to be changed
sigma_epini=para(24);%0.5
sigma_enini=para(25);
mu_epini=para(26);%0.5
mu_enini=para(27);
theta_p=para(28);%0.5
theta_n=para(29);
mu_tr=linspace(0,0,T)';
randn_a=sigma_a.*randn_a0;
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
for i=1:T
    replaceIdx = (randn_shock_ep(:,i) > exp(mu_logna(i,1)+3*sigma_ep0(i,1)));
        while sum(replaceIdx)>0,
            randn_shock_ep(replaceIdx,i) = lognrnd(mu_logna(i,1),sigma_ep0(i,1),1,sum(replaceIdx));
            replaceIdx = (randn_shock_ep(:,i) > exp(mu_logna(i,1)+3*sigma_ep0(i,1)));
        end
    replaceIdx = (randn_shock_en(:,i) > exp(mu_lognb(i,1)+3*sigma_en0(i,1)));
        while sum(replaceIdx)>0,
            randn_shock_en(replaceIdx,i) = lognrnd(mu_lognb(i,1),sigma_en0(i,1),1,sum(replaceIdx));
            replaceIdx = (randn_shock_en(:,i) > exp(mu_lognb(i,1)+3*sigma_en0(i,1)));
        end
    replaceIdx = (randn_shock_x(:,i) > exp(mu_lognb(i,1)+3*sigma_x0(i,1)));
        while sum(replaceIdx)>0,
            randn_shock_x(replaceIdx,i) = lognrnd(mu_lognb(i,1),sigma_x0(i,1),1,sum(replaceIdx));
            replaceIdx = (randn_shock_x(:,i) > exp(mu_lognb(i,1)+3*sigma_x0(i,1)));
        end
    replaceIdx = (randn_shock_z(:,i) > exp(mu_logna(i,1)+3*sigma_z0(i,1)));
        while sum(replaceIdx)>0,
            randn_shock_z(replaceIdx,i) = lognrnd(mu_logna(i,1),sigma_z0(i,1),1,sum(replaceIdx));
            replaceIdx = (randn_shock_z(:,i) > exp(mu_logna(i,1)+3*sigma_z0(i,1)));
        end     
end
replaceIdx = (randn_ini_x > exp(mu_enini+3*sigma_enini));
while sum(replaceIdx)>0,
randn_ini_x(replaceIdx,1) = lognrnd(mu_enini,sigma_enini,1,sum(replaceIdx));
replaceIdx = (randn_ini_x(:,1) > exp(mu_enini+3*sigma_enini));
end
replaceIdx = (randn_ini_z > exp(mu_epini+3*sigma_epini));
while sum(replaceIdx)>0,
randn_ini_z(replaceIdx,1) = lognrnd(mu_epini,sigma_epini,1,sum(replaceIdx));
replaceIdx = (randn_ini_z(:,1) > exp(mu_epini+3*sigma_epini));
end   
% toc
panel_new=zeros(H*T,10);
panel_new(:,1:7) = moments_mixture(int32(H),int32(T),rho_n,rho_p,sigma_b,d_one_neg,d_two_neg,d_one_pos,d_two_pos,randn_ini_x,randn_ini_z,randn_b,randn_shock_ep,randn_shock_en ...
                        ,randn_shock_x,randn_shock_z,rand_shock_s,theta_p,theta_n,d_three_neg,d_three_pos,randn_tr,randn_a);
panel_new(:,8)=panel_new(:,5);
[panel_new(:,9),~,~,~,~,~,~,~,~,~,~]=growth(panel_new,int32(length(panel_new)),int32(size(panel_new,2)),int32(6),int32(8));
fcn = @(x)var(x); 
inter = sortrows(panel_new,6); 
var_hump = accumarray_expand_s(inter(:,5),inter(:,6),fcn);
panel_new(panel_new(:,6)==32,:) = [];
[mean_p,mean_n,var_p,var_n,~,~]=moments(panel_new,int32(length(panel_new)),int32(size(panel_new,2)),int32(9));
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(panel_new,6);
pctile10 = accumarray_expand_s(aux(:,9),aux(:,6),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,9),aux(:,6),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,9),aux(:,6),fcn90);%growth from today to tomorrow
skew_kelly = (pctile90+pctile10-2*pctile50)./(pctile90-pctile10);
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
pctile975 = accumarray_expand_s(aux(:,9),aux(:,6),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,9),aux(:,6),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,9),aux(:,6),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,9),aux(:,6),fcn25);%growth from today to tomorrow
kurt_cs = (pctile975-pctile025)./(pctile75-pctile25);
[cov_1_pos,cov_1_neg]=acv1(panel_new,int32(length(panel_new)),int32(size(panel_new,2)),int32(6),int32(9));
[cov_2_pos,cov_2_neg]=acv2(panel_new,int32(length(panel_new)),int32(size(panel_new,2)),int32(6),int32(9));
fract_p=fract(panel_new,int32(length(panel_new)),int32(size(panel_new,2)),int32(6),int32(9));
M_ave_est=uncacv(int32(H),int32(T),panel_new,int32(col),int32(size(panel_new,2)),int32(9));
uncmean=unc_mean(int32(H),int32(T),panel_new,int32(col),int32(size(panel_new,2)),int32(9));
panel_new = sortrows(panel_new,6);
panel_new(:,10)=abs(panel_new(:,9))>0.05;
fcn = @(x)mean(x); 
outbound = accumarray_expand_s(panel_new(:,10),panel_new(:,6),fcn);
mean_learn_age = accumarray_expand_s(panel_new(:,5),panel_new(:,6),fcn);
data.M_ave(6:end)=mean(data.M_ave(6:end));
error_mean_p=((mean_p-data.mean_p)./(prctile(abs(data.skew),17)))'*((mean_p-data.mean_p)./(prctile(abs(data.skew),17)));
error_mean_n=((mean_n-data.mean_n)./(prctile(abs(data.skew),17)))'*((mean_n-data.mean_n)./(prctile(abs(data.skew),17)));
error_var_p=((var_p-data.var_p)./(prctile(abs(data.skew),6)))'*((var_p-data.var_p)./(prctile(abs(data.skew),6)));
error_var_n=((var_n-data.var_n)./(prctile(abs(data.skew),6)))'*((var_n-data.var_n)./(prctile(abs(data.skew),6)));
error_skew_kelly=((skew_kelly-data.skew_kelly)./(prctile(abs(data.skew),65)))'*((skew_kelly-data.skew_kelly)./(prctile(abs(data.skew),65)));
error_kurt_cs=((kurt_cs-data.kurt_cs)./(8*prctile(abs(data.skew),97)))'*((kurt_cs-data.kurt_cs)./(8*prctile(abs(data.skew),97)));
error_fract_p=((fract_p(1:31)-data.fract_p)./(prctile(abs(data.var_p),86)))'*((fract_p(1:31)-data.fract_p)./(prctile(abs(data.var_p),86)));
error_cov1_n=((cov_1_neg-data.covar1_n(1:30))./(prctile(abs(data.skew),5)))'*((cov_1_neg-data.covar1_n(1:30))./(prctile(abs(data.skew),5)));
error_cov1_p=((cov_1_pos-data.covar1_p(1:30))./(prctile(abs(data.skew),5)))'*((cov_1_pos-data.covar1_p(1:30))./(prctile(abs(data.skew),5)));
error_cov2_n=((cov_2_neg-data.covar2_n(1:29))./(prctile(abs(data.covar2_p(1:29)),90)))'*((cov_2_neg-data.covar2_n(1:29))./(prctile(abs(data.covar2_p(1:29)),90)));
error_cov2_p=((cov_2_pos-data.covar2_p(1:29))./(prctile(abs(data.covar2_p(1:29)),90)))'*((cov_2_pos-data.covar2_p(1:29))./(prctile(abs(data.covar2_p(1:29)),90)));
error_uncmean=((uncmean-data.mean)./(prctile(abs(data.covar2_p(1:30)),93)))'*((uncmean-data.mean)./(prctile(abs(data.covar2_p(1:30)),93)));
error_outbound=((outbound-data.outbound)./(prctile(abs(data.var_p),85)))'*((outbound-data.outbound)./(prctile(abs(data.var_p),85)));
error_unc_acv=((M_ave_est-data.M_ave)./(prctile(abs(data.covar2_p(1:29)),72)))'*((M_ave_est-data.M_ave)./(prctile(abs(data.covar2_p(1:29)),72)));
error_mean_learn_age=((mean_learn_age(1)-0)./(prctile(abs(data.covar1_p(1:30)),95)))'*((mean_learn_age(1)-0)./(prctile(abs(data.covar1_p(1:30)),95)));
error_ineq=((var_hump-data.hump)./(prctile(abs(data.skew),8)))'*((var_hump-data.hump)./(prctile(abs(data.skew),8)));
error_total=error_uncmean+error_mean_learn_age+error_ineq+error_outbound+ +error_var_p+error_var_n+error_kurt_cs+error_cov1_n+error_cov1_p+error_cov2_n+error_cov2_p+error_unc_acv+error_fract_p+error_skew_kelly+error_mean_p+error_mean_n;