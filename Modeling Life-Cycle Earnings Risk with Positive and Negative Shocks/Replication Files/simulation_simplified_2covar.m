close all
clear
clear mex
pack
clc
tic
set(0,'DefaultFigureWindowStyle','docked')
load('data_simplified.mat','data_simplified')
load('optimum_simplified_2covar.mat','optimum_simplified_2covar')
col = 31;
H=20000;
T=32;
%81.9522
estimates_simplified_2covar.rho_n=optimum_simplified_2covar(1);
estimates_simplified_2covar.rho_p=optimum_simplified_2covar(2);
estimates_simplified_2covar.sigma_b = optimum_simplified_2covar(3); %c_px - NEGAtive
estimates_simplified_2covar.d_one_neg = optimum_simplified_2covar(4); %b_px
estimates_simplified_2covar.d_two_neg = optimum_simplified_2covar(5); %d_one_pos - POSITIVE MARGINAL
estimates_simplified_2covar.d_one_pos = optimum_simplified_2covar(6); %d_two_pos
estimates_simplified_2covar.d_two_pos = optimum_simplified_2covar(7);%transitory negative shocks
estimates_simplified_2covar.gamma_a_tr_p= optimum_simplified_2covar(8); %b_px
estimates_simplified_2covar.gamma_b_tr_p= optimum_simplified_2covar(9); %b_px
estimates_simplified_2covar.gamma_a_tr_n = optimum_simplified_2covar(10); %d_one_pos - POSITIVE MARGINAL
estimates_simplified_2covar.gamma_b_tr_n = optimum_simplified_2covar(11); %d_two_pos
estimates_simplified_2covar.gamma_a_per_n = optimum_simplified_2covar(12);%transitory negative shocks
estimates_simplified_2covar.gamma_b_per_n=optimum_simplified_2covar(13);
estimates_simplified_2covar.gamma_a_per_p= optimum_simplified_2covar(14); %c_px - NEGAtive
estimates_simplified_2covar.gamma_b_per_p=optimum_simplified_2covar(15);
estimates_simplified_2covar.lambda_a_pos=optimum_simplified_2covar(16); %positive
estimates_simplified_2covar.lambda_b_pos=optimum_simplified_2covar(17);
estimates_simplified_2covar.lambda_a_neg=optimum_simplified_2covar(18); %NEGAtive
estimates_simplified_2covar.lambda_b_neg=optimum_simplified_2covar(19);
estimates_simplified_2covar.d_three_neg=optimum_simplified_2covar(20);
estimates_simplified_2covar.d_three_pos=optimum_simplified_2covar(21);
estimates_simplified_2covar.sigma_tra=optimum_simplified_2covar(22);
estimates_simplified_2covar.sigma_trb=estimates_simplified_2covar.sigma_tra;
estimates_simplified_2covar.sigma_a=optimum_simplified_2covar(23);
estimates_simplified_2covar.gamma_epini=optimum_simplified_2covar(24);
estimates_simplified_2covar.gamma_enini=optimum_simplified_2covar(25);
estimates_simplified_2covar.mu_epini=optimum_simplified_2covar(26);
estimates_simplified_2covar.mu_enini=optimum_simplified_2covar(27);
estimates_simplified_2covar.theta_p=optimum_simplified_2covar(28);
estimates_simplified_2covar.theta_n=optimum_simplified_2covar(29);
save('estimates_simplified_2covar.mat','estimates_simplified_2covar')
%}
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
theta_p=optimum_simplified_2covar(28);%0.5
theta_n=optimum_simplified_2covar(29);
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
panel_new=zeros(H*T,10);
panel_new(:,1:7) = moments_mixture(int32(H),int32(T),rho_n,rho_p,sigma_b,d_one_neg,d_two_neg,d_one_pos,d_two_pos,randn_ini_x,randn_ini_z,randn_b,randn_shock_ep,randn_shock_en ...
                        ,randn_shock_x,randn_shock_z,rand_shock_s,theta_p,theta_n,d_three_neg,d_three_pos,randn_tr,randn_a);
panel_new(:,8)=panel_new(:,5);
save('panel_new.mat','panel_new')
% %fraction of shocks that are large and come from transitory shocks:
% int=panel_new(:,1:7);
% int(:,end+1)=(panel_new(:,3))>0.1823;
% int2=abs(panel_new(:,4))>0.2231;
% int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=[0; (panel_new(2:end,2)-panel_new(1:end-1,2)).*(panel_new(2:end,6)>1)];
% int(:,end+1)=[0; (panel_new(2:end,1)-panel_new(1:end-1,1)).*(panel_new(2:end,6)>1)];
% %
% int(:,end+1)=(int(:,10))>0.1823;
% int2=abs(int(:,9))>0.2231;
% int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=int(:,8)+int(:,11);
% %
% [a,~,c] = unique(int(:,6));
% tot_shocks = [a, accumarray(c,int(:,12))];
% [a,~,c] = unique(int(:,6));
% tot_shocks_trans = [a, accumarray(c,int(:,8))];
% %
% fract_shocks_trans_large=tot_shocks_trans(:,2)./tot_shocks(:,2);
% fract_shocks_trans_large(1,:)=[];
% save('fract_shocks_trans_large.mat','fract_shocks_trans_large')
% %fraction of shocks that are mid-large and come from transitory shocks:
% int=panel_new(:,1:7);
% int(:,end+1)=((panel_new(:,3))<0.1823).*((panel_new(:,3))>0.1);
% int2=abs((panel_new(:,4))<0.2231).*((panel_new(:,4))>0.1);
% int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=[0; (panel_new(2:end,2)-panel_new(1:end-1,2)).*(panel_new(2:end,6)>1)];
% int(:,end+1)=[0; (panel_new(2:end,1)-panel_new(1:end-1,1)).*(panel_new(2:end,6)>1)];
% %
% int(:,end+1)=((int(:,10))<0.1823).*((int(:,10))>0.1);
% int2=(abs(int(:,9))<0.2231).*(abs(int(:,9))>0.1);
% int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=int(:,8)+int(:,11);
% %
% [a,~,c] = unique(int(:,6));
% tot_shocks = [a, accumarray(c,int(:,12))];
% [a,~,c] = unique(int(:,6));
% tot_shocks_trans = [a, accumarray(c,int(:,8))];
% %
% fract_shocks_trans_mid=tot_shocks_trans(:,2)./tot_shocks(:,2);
% fract_shocks_trans_mid(1,:)=[];
% save('fract_shocks_trans_mid.mat','fract_shocks_trans_mid')
% %fraction of shocks that are large and come from transitory shocks:
% int=panel_new(:,1:7);
% int(:,end+1)=(panel_new(:,3))<0.1;
% int2=abs(panel_new(:,4))<0.1;
% int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=[0; (panel_new(2:end,2)-panel_new(1:end-1,2)).*(panel_new(2:end,6)>1)];
% int(:,end+1)=[0; (panel_new(2:end,1)-panel_new(1:end-1,1)).*(panel_new(2:end,6)>1)];
% %
% int(:,end+1)=(int(:,10))<0.1;
% int2=abs(int(:,9))<0.1;
% int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=int(:,8)+int(:,11);
% %
% [a,~,c] = unique(int(:,6));
% tot_shocks = [a, accumarray(c,int(:,12))];
% [a,~,c] = unique(int(:,6));
% tot_shocks_trans = [a, accumarray(c,int(:,8))];
% %
% fract_shocks_trans_small=tot_shocks_trans(:,2)./tot_shocks(:,2);
% fract_shocks_trans_small(1,:)=[];
% save('fract_shocks_trans_small.mat','fract_shocks_trans_small')
% %
% %
% figure
% plot(25:1:55,fract_shocks_trans_large,'LineWidth',2.5,'Color','blue')
% hold on
% plot(25:1:55,fract_shocks_trans_mid,'LineWidth',2.5,'Color','blue','Marker','o')
% hold on
% plot(25:1:55,fract_shocks_trans_small,'LineWidth',2.5,'Color','blue','Marker','x')
% hold off
% grid on
% axis tight
% legend('> 20%','< 20% & > 10%','< 10%','Location','Northeast')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 30)
% xlabel('Age','fontsize',40,'FontWeight','bold')
% ylabel('Fraction','fontsize',40,'FontWeight','bold')
% ylim([0 1])
% print('predfraction_trans_shocks','-dpng')
% %pos
% %fraction of shocks that are large and come from transitory shocks:
% int=panel_new(:,1:7);
% int(:,end+1)=(panel_new(:,3))>0.1823;
% % int2=abs(panel_new(:,4))>0.2231;
% % int(:,end)=int(:,end)+int2;
% %
% % int(:,end+1)=[0; (panel_new(2:end,2)-panel_new(1:end-1,2)).*(panel_new(2:end,6)>1)];
% int(:,end+1)=[0; (panel_new(2:end,1)-panel_new(1:end-1,1)).*(panel_new(2:end,6)>1)];
% %
% int(:,end+1)=(int(:,9))>0.1823;
% % int2=abs(int(:,9))>0.2231;
% % int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=int(:,8)+int(:,10);
% %
% [a,~,c] = unique(int(:,6));
% tot_shocks = [a, accumarray(c,int(:,11))];
% [a,~,c] = unique(int(:,6));
% tot_shocks_trans = [a, accumarray(c,int(:,8))];
% %
% fract_shocks_trans_large_pos=tot_shocks_trans(:,2)./tot_shocks(:,2);
% fract_shocks_trans_large_pos(1,:)=[];
% save('fract_shocks_trans_large_pos.mat','fract_shocks_trans_large_pos')
% %fraction of shocks that are mid-large and come from transitory shocks:
% int=panel_new(:,1:7);
% int(:,end+1)=((panel_new(:,3))<0.1823).*((panel_new(:,3))>0.1);
% % int2=abs((panel_new(:,4))<0.2231).*((panel_new(:,4))>0.1);
% % int(:,end)=int(:,end)+int2;
% %
% % int(:,end+1)=[0; (panel_new(2:end,2)-panel_new(1:end-1,2)).*(panel_new(2:end,6)>1)];
% int(:,end+1)=[0; (panel_new(2:end,1)-panel_new(1:end-1,1)).*(panel_new(2:end,6)>1)];
% %
% int(:,end+1)=((int(:,9))<0.1823).*((int(:,9))>0.1);
% % int2=(abs(int(:,9))<0.2231).*(abs(int(:,9))>0.1);
% % int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=int(:,8)+int(:,10);
% %
% [a,~,c] = unique(int(:,6));
% tot_shocks = [a, accumarray(c,int(:,11))];
% [a,~,c] = unique(int(:,6));
% tot_shocks_trans = [a, accumarray(c,int(:,8))];
% %
% fract_shocks_trans_mid_pos=tot_shocks_trans(:,2)./tot_shocks(:,2);
% fract_shocks_trans_mid_pos(1,:)=[];
% save('fract_shocks_trans_mid_pos.mat','fract_shocks_trans_mid_pos')
% %fraction of shocks that are large and come from transitory shocks:
% int=panel_new(:,1:7);
% int(:,end+1)=(panel_new(:,3))<0.1;
% % int2=abs(panel_new(:,4))<0.1;
% % int(:,end)=int(:,end)+int2;
% %
% % int(:,end+1)=[0; (panel_new(2:end,2)-panel_new(1:end-1,2)).*(panel_new(2:end,6)>1)];
% int(:,end+1)=[0; (panel_new(2:end,1)-panel_new(1:end-1,1)).*(panel_new(2:end,6)>1)];
% %
% int(:,end+1)=(int(:,9))<0.1;
% % int2=abs(int(:,9))<0.1;
% % int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=int(:,8)+int(:,10);
% %
% [a,~,c] = unique(int(:,6));
% tot_shocks = [a, accumarray(c,int(:,11))];
% [a,~,c] = unique(int(:,6));
% tot_shocks_trans = [a, accumarray(c,int(:,8))];
% %
% fract_shocks_trans_small_pos=tot_shocks_trans(:,2)./tot_shocks(:,2);
% fract_shocks_trans_small_pos(1,:)=[];
% save('fract_shocks_trans_small_pos.mat','fract_shocks_trans_small_pos')
% %
% %
% figure
% plot(25:1:55,fract_shocks_trans_large_pos,'LineWidth',2.5,'Color','red')
% hold on
% plot(25:1:55,fract_shocks_trans_mid_pos,'LineWidth',2.5,'Color','red','Marker','o')
% hold on
% plot(25:1:55,fract_shocks_trans_small_pos,'LineWidth',2.5,'Color','red','Marker','x')
% hold off
% grid on
% axis tight
% legend('> 20%','< 20% & > 10%','< 10%','Location','Northeast')
% xlabel('Age','fontsize',24,'FontWeight','bold')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 24)
% ylabel('Fraction','fontsize',24,'FontWeight','bold')
% ylim([0 1])
% print('predfraction_trans_shocks_pos','-dpng')
% %neg
% %fraction of shocks that are large and come from transitory shocks:
% int=panel_new(:,1:7);
% % int(:,end+1)=(panel_new(:,3))>0.1823;
% int(:,end+1)=abs(panel_new(:,4))>0.2231;
% % int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=[0; (panel_new(2:end,2)-panel_new(1:end-1,2)).*(panel_new(2:end,6)>1)];
% % int(:,end+1)=[0; (panel_new(2:end,1)-panel_new(1:end-1,1)).*(panel_new(2:end,6)>1)];
% %
% % int(:,end+1)=(int(:,10))>0.1823;
% int(:,end+1)=abs(int(:,9))>0.2231;
% % int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=int(:,8)+int(:,10);
% %
% [a,~,c] = unique(int(:,6));
% tot_shocks = [a, accumarray(c,int(:,11))];
% [a,~,c] = unique(int(:,6));
% tot_shocks_trans = [a, accumarray(c,int(:,8))];
% %
% fract_shocks_trans_large_neg=tot_shocks_trans(:,2)./tot_shocks(:,2);
% fract_shocks_trans_large_neg(1,:)=[];
% save('fract_shocks_trans_large_neg.mat','fract_shocks_trans_large_neg')
% %fraction of shocks that are mid-large and come from transitory shocks:
% int=panel_new(:,1:7);
% % int(:,end+1)=((panel_new(:,3))<0.1823).*((panel_new(:,3))>0.1);
% int(:,end+1)=abs((panel_new(:,4))<0.2231).*(abs(panel_new(:,4))>0.1);
% % int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=[0; (panel_new(2:end,2)-panel_new(1:end-1,2)).*(panel_new(2:end,6)>1)];
% % int(:,end+1)=[0; (panel_new(2:end,1)-panel_new(1:end-1,1)).*(panel_new(2:end,6)>1)];
% %
% % int(:,end+1)=((int(:,10))<0.1823).*((int(:,10))>0.1);
% int(:,end+1)=(abs(int(:,9))<0.2231).*(abs(int(:,9))>0.1);
% % int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=int(:,8)+int(:,10);
% %
% [a,~,c] = unique(int(:,6));
% tot_shocks = [a, accumarray(c,int(:,11))];
% [a,~,c] = unique(int(:,6));
% tot_shocks_trans = [a, accumarray(c,int(:,8))];
% %
% fract_shocks_trans_mid_neg=tot_shocks_trans(:,2)./tot_shocks(:,2);
% fract_shocks_trans_mid_neg(1,:)=[];
% save('fract_shocks_trans_mid_neg.mat','fract_shocks_trans_mid_neg')
% %fraction of shocks that are large and come from transitory shocks:
% int=panel_new(:,1:7);
% % int(:,end+1)=(panel_new(:,3))<0.1;
% int(:,end+1)=abs(panel_new(:,4))<0.1;
% % int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=[0; (panel_new(2:end,2)-panel_new(1:end-1,2)).*(panel_new(2:end,6)>1)];
% % int(:,end+1)=[0; (panel_new(2:end,1)-panel_new(1:end-1,1)).*(panel_new(2:end,6)>1)];
% %
% % int(:,end+1)=(int(:,10))<0.1;
% int(:,end+1)=abs(int(:,9))<0.1;
% % int(:,end)=int(:,end)+int2;
% %
% int(:,end+1)=int(:,8)+int(:,10);
% %
% [a,~,c] = unique(int(:,6));
% tot_shocks = [a, accumarray(c,int(:,11))];
% [a,~,c] = unique(int(:,6));
% tot_shocks_trans = [a, accumarray(c,int(:,8))];
% %
% fract_shocks_trans_small_neg=tot_shocks_trans(:,2)./tot_shocks(:,2);
% fract_shocks_trans_small_neg(1,:)=[];
% save('fract_shocks_trans_small_neg.mat','fract_shocks_trans_small_neg')
% %
% %
% figure
% plot(25:1:55,fract_shocks_trans_large_neg,'LineWidth',2.5,'Color','green')
% hold on
% plot(25:1:55,fract_shocks_trans_mid_neg,'LineWidth',2.5,'Color','green','Marker','o')
% hold on
% plot(25:1:55,fract_shocks_trans_small_neg,'LineWidth',2.5,'Color','green','Marker','x')
% hold off
% grid on
% axis tight
% legend('> 20%','< 20% & > 10%','< 10%','Location','Northeast')
% xlabel('Age','fontsize',24,'FontWeight','bold')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 24)
% ylabel('Fraction','fontsize',24,'FontWeight','bold')
% ylim([0 1])
% print('predfraction_trans_shocks_neg','-dpng')
% %
% figure
% plot(25:1:55,fract_shocks_trans_large_pos,'LineWidth',2.5,'Color','red')
% hold on
% plot(25:1:55,fract_shocks_trans_large_neg,'LineWidth',2.5,'Color','green','LineStyle','--')
% hold off
% grid on
% axis tight
% legend('Positive','Negative','Location','Northeast')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 30)
% xlabel('Age','fontsize',40,'FontWeight','bold')
% y=ylabel('Fraction','fontsize',24,'FontWeight','bold');
% set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
% ylim([0 1])
% % yticks(0:0.25:1)
% print('predfraction_trans_shocks_large_cond','-dpng')
% %
% lc_ave_trans_pos=mean(fract_shocks_trans_large_pos)
% lc_ave_trans_neg=mean(fract_shocks_trans_large_neg)
%
[panel_new(:,9),~,~,~,~,~,~,~,~,~,~]=growth(panel_new,int32(length(panel_new)),int32(size(panel_new,2)),int32(6),int32(8));
fcn = @(x)var(x); 
inter = sortrows(panel_new,6); 
var_hump = accumarray_expand_s(inter(:,5),inter(:,6),fcn);
fcn = @(x)mean(x); 
mean_learn_age = accumarray_expand_s(inter(:,5),inter(:,6),fcn);
panel_new(panel_new(:,6)==32,:) = [];
[mean_p,mean_n,var_p,var_n,skew,kurt]=moments(panel_new,int32(length(panel_new)),int32(size(panel_new,2)),int32(9));
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
[unc_max_dev,~]=max(abs(uncmean));
uncmean_mean=mean(uncmean);
[unc_max_dev_data,I]=max(abs(data_simplified.mean));
uncmean_mean_data=mean(data_simplified.mean);
uncvar=unc_var(int32(H),int32(T),panel_new,int32(col),int32(size(panel_new,2)),int32(9));
panel_new = sortrows(panel_new,6); 
panel_new(:,10)=abs(panel_new(:,9))>0.05;
fcn = @(x)mean(x); 
outbound = accumarray_expand_s(panel_new(:,10),panel_new(:,6),fcn);
%
% panel_new(:,10)=abs(panel_new(:,3))>0.1823;
% int=abs(panel_new(:,4))>0.2231;
% panel_new(:,10)=int+panel_new(:,10);
% outbound_20_trans=accumarray_expand_s(panel_new(:,10),panel_new(:,6),fcn);
% save('outbound_20_trans.mat','outbound_20_trans')
%
%
[pneg,ppos]=probs(d_one_neg,d_two_neg,d_three_neg,d_one_pos,d_two_pos,d_three_pos);
ppos=ppos
pneg=pneg
cum_prob=pneg+ppos;
cum_prob=min(cum_prob,1);
%
gamma_b_tr_p=estimates_simplified_2covar.gamma_b_tr_p
gamma_b_tr_n=estimates_simplified_2covar.gamma_b_tr_n
gamma_b_per_n=estimates_simplified_2covar.gamma_b_per_n
gamma_b_per_p=estimates_simplified_2covar.gamma_b_per_p
lambda_b_pos=estimates_simplified_2covar.lambda_b_pos
lambda_b_neg=estimates_simplified_2covar.lambda_b_neg
gamma_b_tr=0
lambda_b_tr=0
%variance
transf_varp_p=zeros(31,1);
transf_varp_n=zeros(31,1);
transf_vartr_p=zeros(31,1);
transf_vartr_n=zeros(31,1);
transf_vartr=zeros(31,1);
for i=2:32
    transf_varp_p(i-1)=(exp((estimates_simplified_2covar.gamma_a_per_p+gamma_b_per_p*i)^2)-1)*(exp(2*(estimates_simplified_2covar.lambda_a_pos+lambda_b_pos*i)+(estimates_simplified_2covar.gamma_a_per_p+gamma_b_per_p*i)^2));
end
for i=2:32
    transf_varp_n(i-1)=(exp((estimates_simplified_2covar.gamma_a_per_n+gamma_b_per_n*i)^2)-1)*(exp(2*(mu_lognb(i))+(estimates_simplified_2covar.gamma_a_per_n+gamma_b_per_n*i)^2));
end
for i=2:32
    transf_vartr_p(i-1)=(exp((estimates_simplified_2covar.gamma_a_tr_p+gamma_b_tr_p*i)^2)-1)*(exp(2*(estimates_simplified_2covar.lambda_a_pos+lambda_b_pos*i)+(estimates_simplified_2covar.gamma_a_tr_p+gamma_b_tr_p*i)^2));
end
for i=2:32
    transf_vartr_n(i-1)=(exp((estimates_simplified_2covar.gamma_a_tr_n+gamma_b_tr_n*i)^2)-1)*(exp(2*(mu_lognb(i))+(estimates_simplified_2covar.gamma_a_tr_n+gamma_b_tr_n*i)^2));
end
for i=2:32
    transf_vartr(i-1)=(estimates_simplified_2covar.sigma_tra+gamma_b_tr*i)^2;
end
%mean
transf_meanp_p=zeros(31,1);
transf_meanp_n=zeros(31,1);
transf_meantr_p=zeros(31,1);
transf_meantr_n=zeros(31,1);
transf_meantr=zeros(31,1);
for i=2:32
    transf_meanp_p(i-1)=(exp(estimates_simplified_2covar.lambda_a_pos+lambda_b_pos*i+((estimates_simplified_2covar.gamma_a_per_p+gamma_b_per_p*i)^2)/2));
end
for i=2:32
    transf_meanp_n(i-1)=(exp(mu_lognb(i)+((estimates_simplified_2covar.gamma_a_per_n+gamma_b_per_n*i)^2)/2));
end
for i=2:32
    transf_meantr_p(i-1)=(exp(estimates_simplified_2covar.lambda_a_pos+lambda_b_pos*i+((estimates_simplified_2covar.gamma_a_tr_p+gamma_b_tr_p*i)^2)/2));
end
for i=2:32
    transf_meantr_n(i-1)=(exp(mu_lognb(i)+((estimates_simplified_2covar.gamma_a_tr_n+gamma_b_tr_n*i)^2)/2));
end
for i=2:32
    transf_meantr(i-1)=0+lambda_b_tr*i;
end
%}
%
% data_hump=data_simplified.hump+(data_simplified.hump_coh-data_simplified.hump(1));
%
figure
plot(25:55,data_simplified.mean_p,'LineWidth',2.5, 'Color', 'red','Marker','o')
hold on
plot(25:55,mean_p,'LineWidth',2.5, 'Color', 'red')
hold on
plot(25:55,data_simplified.mean_n,'LineWidth',2.5, 'Color', 'green','Marker','o','LineStyle','--')
hold on
plot(25:55,mean_n,'LineWidth',2.5,'LineStyle','--', 'Color', 'green')
hold on
line([25 55],[0 0],'LineWidth',2.5,'LineStyle',':', 'Color', 'black')
hold off
grid on
legend('Positive - Data','Positive - Model','Negative - Data','Negative - Model','Location','North')
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('E[g]','fontsize',24,'FontWeight','bold')
ylim([-0.4 0.55])
print('pred_2covar_mean','-dpng')
%}
figure
plot(25:55,data_simplified.var_p,'LineWidth',2.5, 'Color', 'red','Marker','o')
hold on
plot(25:55,var_p,'LineWidth',2.5, 'Color', 'red')
hold on
plot(25:55,data_simplified.var_n,'LineWidth',2.5, 'Color', 'green','LineStyle','--','Marker','o')
hold on
plot(25:55,var_n,'LineWidth',2.5,'LineStyle','--', 'Color', 'green')
hold off
grid on
legend('Positive - Data','Positive - Model','Negative - Data','Negative - Model','Location','North')
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Var[g]','fontsize',24,'FontWeight','bold')
ylim([0 0.20])
print('pred_2covar_var','-dpng')
%
figure
plot(25:1:55, data_simplified.unc_var,'LineWidth',2.5,'Color', 'blue','Marker','o')
hold on
plot(25:1:55, uncvar,'LineWidth',2.5, 'Color', 'cyan','LineStyle','--')
hold off
grid on
legend('Data','Model','Location','North')
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Var[g]','fontsize',24,'FontWeight','bold')
ylim([0 0.20])
print('pred_2covar_LCV','-dpng')
%
figure
plot(25:55,data_simplified.skew,'LineWidth',2.5, 'Color', 'blue','Marker','o')
hold on
plot(25:55,skew,'LineWidth',2.5, 'Color', 'cyan','LineStyle','--')
hold on
line([25 55],[0 0],'LineWidth',2.5,'LineStyle','--', 'Color', 'black')
hold off
grid on
axis tight
legend('Data','Model')
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Skew[g]','fontsize',24,'FontWeight','bold')
ylim([-2 1.5])
print('pred_2covar_skew','-dpng')
%
%
figure
plot(25:55,data_simplified.skew_kelly,'LineWidth',2.5, 'Color', 'blue','Marker','o')
hold on
plot(25:55,skew_kelly,'LineWidth',2.5, 'Color', 'cyan','LineStyle','--')
hold on
line([25 55],[0 0],'LineWidth',2.5,'LineStyle','--', 'Color', 'black')
hold off
grid on
axis tight
legend('Data','Model')
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Kelly''s Skewness[g]','fontsize',24,'FontWeight','bold')
ylim([-2 1.5])
print('pred_2covar_skew_kelly','-dpng')
%
figure
plot(25:1:55,data_simplified.fract_p(1:31),'LineWidth',2.5,'Color','blue','Marker','o')
hold on
plot(25:1:55,fract_p(1:31),'LineWidth',2.5,'Color','cyan','LineStyle','--')
hold on
line([25 55],[0.5 0.5],'LineWidth',2.5,'LineStyle','--', 'Color', 'black')
hold off
grid on
axis tight
legend('Data','Model','Location','North')
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Prob[g+]','fontsize',24,'FontWeight','bold')
ylim([0 1])
print('pred_2covar_fractionp','-dpng')
%}
for i=1:31
    if (ppos(i)>0 && ppos(i)<1)
        ppos(i)=ppos(i);
    elseif ppos(i)<0
        ppos(i)=0;
    elseif ppos(i)>1
        ppos(i)=1;
    end
end
for i=1:31
    if (pneg(i)>0 && pneg(i)<1)
        pneg(i)=pneg(i);
    elseif pneg(i)<0
        pneg(i)=0;
    elseif pneg(i)>1
        pneg(i)=1;
    end
end
figure
plot(25:1:55,ppos(1:31),'LineWidth',2.5,'Color','red')
hold on
plot(25:1:55,pneg(1:31),'LineWidth',2.5,'Color','green','LineStyle','--')
hold on
plot(25:1:55,cum_prob(1:31),'LineWidth',2.5,'Color','black','LineStyle',':')
hold off
grid on
axis tight
legend('Positive','Negative','Pos + Neg','Location','North')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 30)
xlabel('Age','fontsize',40,'FontWeight','bold')
y=ylabel('Probabilities','fontsize',40,'FontWeight','bold');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([0 1])
set(gca,'YTick',0:0.2:1)
% yticks()
xlim([25 55])
print('pred_2covar_probs','-dpng')
%
%
figure
plot(25:1:55,transf_varp_p(1:31),'LineWidth',3,'Color','red')
hold on
plot(25:1:55,transf_varp_n(1:31),'LineWidth',3,'Color','green','LineStyle','--')
hold off
grid on
axis tight
legend('Positive','Negative','Location','Northeast')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 30)
xlabel('Age','fontsize',40,'FontWeight','bold')
y=ylabel('Var [\xi]','fontsize',40,'FontWeight','bold');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([0 0.1])
set(gca,'YTick',0:0.02:1)
% yticks(0:0.02:0.1)
xlim([25 55])
print('pred_2covar_transfpers','-dpng')
%}
%
figure
plot(25:1:55,transf_vartr_p(1:31),'LineWidth',3,'Color','red')
hold on
plot(25:1:55,transf_vartr_n(1:31),'LineWidth',3,'Color','green','LineStyle','--')
hold on
plot(25:1:55,transf_vartr(1:31),'LineWidth',3,'Color','black','LineStyle',':','Marker','o')
hold off
grid on
axis tight
legend('Positive','Negative','Neutral','Location','Northwest')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 30)
xlabel('Age','fontsize',40,'FontWeight','bold')
y=ylabel('Var [\iota]','fontsize',40,'FontWeight','bold');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([0 0.4])
xlim([25 55])
print('pred_2covar_transftrans','-dpng')
%}
%
figure
plot(25:1:55,transf_meanp_p(1:31),'LineWidth',3,'Color','red')
hold on
plot(25:1:55,-transf_meanp_n(1:31),'LineWidth',3,'Color','green','LineStyle','--')
% hold on
% plot([25 55],[0 0],'LineWidth',2.5,'Color','black','LineStyle',':')
hold off
grid on
axis tight
legend('Positive','Negative','Location','Northeast')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 30)
xlabel('Age','fontsize',40,'FontWeight','bold')
y=ylabel('E[\xi]','fontsize',40,'FontWeight','bold');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([-0.3 0.3])
set(gca,'YTick',-0.2:0.1:0.2)
% yticks()
xlim([25 55])
print('pred_2covar_transfpers_mean','-dpng')
%}
%
figure
plot(25:1:55,transf_meantr_p(1:31),'LineWidth',3,'Color','red')
hold on
plot(25:1:55,-transf_meantr_n(1:31),'LineWidth',3,'Color','green','LineStyle','--')
% hold on
% plot(25:1:55,transf_meantr(1:31),'LineWidth',3,'Color','black','LineStyle',':')
% hold on
% plot([25 55],[0 0],'LineWidth',2.5,'Color','black','LineStyle','--')
hold off
grid on
axis tight
legend('Positive','Negative','Location','Northeast')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 30)
xlabel('Age','fontsize',40,'FontWeight','bold')
y=ylabel('E[\iota]','fontsize',40,'FontWeight','bold');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([-0.4 0.4])
xlim([25 55])
print('pred_2covar_transftrans_mean','-dpng')
%}
%
figure
plot(25:55,data_simplified.kurt,'LineWidth',2.5, 'Color', 'blue','Marker','o')
hold on
plot(25:55,kurt,'LineWidth',2.5, 'Color', 'cyan','LineStyle','--')
hold off
grid on
axis tight
legend('Data','Model','Location','North')
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Kurt[g]','fontsize',24,'FontWeight','bold')
ylim([0 30])
print('pred_2covar_kurt','-dpng')
%
figure
plot(25:55,data_simplified.kurt_cs,'LineWidth',2.5, 'Color', 'blue','Marker','o')
hold on
plot(25:55,kurt_cs,'LineWidth',2.5, 'Color', 'cyan','LineStyle','--')
hold off
grid on
axis tight
legend('Data','Model','Location','North')
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Kurtosis [g]','fontsize',24,'FontWeight','bold')
ylim([0 30])
print('pred_2covar_kurt_cs','-dpng')
%
%
figure
plot(25:1:54,data_simplified.covar1_p(1:30),'LineWidth',2.5,'Color','red','Marker','o')
hold on
plot(25:1:54,cov_1_pos,'LineWidth',2.5,'Color','red')
hold on
plot(25:1:54,data_simplified.covar1_n(1:30),'LineWidth',2.5,'Color','green','Marker','o','LineStyle','--')
hold on
plot(25:1:54,cov_1_neg,'LineWidth',2.5,'Color','green','LineStyle','--')
hold on
line([25 54],[0 0],'LineWidth',2.5,'LineStyle',':', 'Color', 'black')
hold off
grid on
legend('Positive - Data','Positive - Model','Negative - Data','Negative - Model','Location','South')
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('E[g_{h}*g_{h+1}]','fontsize',24,'FontWeight','bold')
ylim([-0.1 0.02])
print('pred_2covar_1stcov','-dpng')
%}
%
figure
plot(25:1:53,data_simplified.covar2_p(1:29),'LineWidth',2.5,'Color','red','Marker','o')
hold on
plot(25:1:53,cov_2_pos,'LineWidth',2.5,'Color','red')
hold on
plot(25:1:53,data_simplified.covar2_n(1:29),'LineWidth',2.5,'Color','green','Marker','o','LineStyle','--')
hold on
plot(25:1:53,cov_2_neg,'LineWidth',2.5,'Color','green','LineStyle','--')
hold on
line([25 53],[0 0],'LineWidth',2.5,'LineStyle',':', 'Color', 'black')
hold off
grid on
legend('Positive - Data','Positive - Model','Negative - Data','Negative - Model','Location','South')
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('E[g_{h}*g_{h+2}]','fontsize',24,'FontWeight','bold')
ylim([-0.015 0.005])
print('pred_2covar_2ndcov','-dpng')
%}
%
%Unconditional Mean
figure
plot(25:1:55,data_simplified.mean(1:31),'LineWidth',2.5,'Color','blue','Marker','o')
hold on
plot(25:1:55,uncmean(1:31),'LineWidth',2.5,'Color','cyan','LineStyle','--')
% hold on
% line([25 55],[0 0],'LineWidth',2.5,'LineStyle',':', 'Color', 'black')
hold off
grid on
legend('Data','Model','Location','North')
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('E[g]','fontsize',24,'FontWeight','bold')
ylim([-0.04 0.08])
print('pred_2covar_uncmean','-dpng')
%}
%
figure
plot(25:1:55,data_simplified.outbound(1:31),'LineWidth',2.5,'Color','blue','Marker','o')
hold on
plot(25:1:55,outbound(1:31),'LineWidth',2.5,'Color','cyan','LineStyle','--')
hold off
grid on
legend('Data','Model','Location','North')
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Prob[|g| > 0.05]','fontsize',24,'FontWeight','bold')
ylim([0.2 1])
print('pred_2covar_outbound','-dpng')
%}
%
figure
plot(data_simplified.M_ave(1:5), 'Color', 'blue','LineWidth',2,'Marker','o')
hold on
plot(M_ave_est(1:5), 'Color', 'cyan','LineWidth',2,'LineStyle','--')
hold off
grid on
legend('Data','Model')
axis tight
set(gca,'XTick',[1 2 3 4 5] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[0 1 2 3 4] ); %This is what it's going to appear in those places.
xlabel('Lags','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Auto-Covariance (0-4)','fontsize',24,'FontWeight','bold')
print('pred_2covar_2UNCACV','-dpng')
%}
%
figure
plot(data_simplified.M_ave(3:end), 'Color', 'blue','LineWidth',2,'Marker','o')
hold on
plot(M_ave_est(3:31), 'Color', 'cyan','LineWidth',2,'LineStyle','--')
hold off
grid on
legend('Data','Model','Location','south')
axis tight
set(gca,'XTick',[1 6 11 16 21 26] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[2 7 12 17 22 27] ); %This is what it's going to appear in those places.
xlabel('Lags','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Auto-Covariance (2-30)','fontsize',24,'FontWeight','bold')
print('pred_2covar_3UNCACV','-dpng')
%}
%
figure
plot(24:1:55, data_simplified.hump,'LineWidth',2.5,'Color', 'blue','Marker','o')
hold on
plot(24:1:55, var_hump,'LineWidth',2.5, 'Color', 'cyan','LineStyle','--')
hold off
grid on
legend('Data','Model','Location','North')
axis tight
set(gca,'XTick',[1 11 25 35 45 55] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 25 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Var[log earnings]','fontsize',24,'FontWeight','bold')
ylim([0.05 0.3])
print('pred_2covar_hump','-dpng')
%
%
figure
plot(mean_learn_age(1:end,1))
legend('Model','Location','north')
axis tight
grid on
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Years','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('E[log earnings]','fontsize',24,'FontWeight','bold')
print('pred_2covar_MeanLogEarn','-dpng')
%}
%
%data kernel
% [f,x]=ksdensity(data_simplified.gr_36);
% figure
% plot(x,f,'Color', 'blue','LineWidth',2)
% hold off
% grid on
% axis tight
% xlabel('x','fontsize',24,'FontWeight','bold')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 24)
% ylabel('f(x)','fontsize',24,'FontWeight','bold')
% ylim([0 7])
% print('MEGkernel36','-dpng')
% %}
%
% %simulation age of 36
% [f_ini_en,ini_en]=ksdensity(randn_shock_en(:,13));
% [f_ini_ep,ini_ep]=ksdensity(randn_shock_ep(:,13));
% [f_ini_tr,ini_tr]=ksdensity(randn_tr(:,13));
% figure
% plot(ini_ep,f_ini_ep*(d_one_pos+d_two_pos*13+d_three_pos*13^2),'LineWidth',2,'Color','red')
% hold on
% plot(-ini_en,f_ini_en*(d_one_neg+d_three_pos*13+d_three_pos*13^2),'LineWidth',2,'Color','green','Marker','x')
% hold on
% plot(ini_tr,f_ini_tr,'LineWidth',2,'Color','blue')
% hold off
% grid on
% legend('Positive','Negative','iid')
% axis tight
% set(gca,'XTick',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This are going to be the only values affected.
% set(gca,'XTickLabel',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This is what it's going to appear in those places.
% xlabel('x','fontsize',24,'FontWeight','bold')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 24)
% ylabel('f(x)','fontsize',24,'FontWeight','bold')
% xlim([-1 1])
% print('pred_2covar__logndens_trans','-dpng')
% %
%simulation age of 36
%pers
%{
randn_mod_x=zeros(H,1);
randn_mod_z=zeros(H,1);
for i = 1:H
    randn_mod_x(i) = exp(mu_lognb+lambda_b_neg*13)*randn_shock_x(i,13)^(gamma_a_per_n+gamma_b_per_n*13); %this is the part to replace in fortran
end
for i = 1:H
    randn_mod_z(i) = exp(lambda_a_pos+lambda_b_pos*13)*randn_shock_z(i,13)^(gamma_a_per_p+gamma_b_per_p*13); %this is the part to replace in fortran
end
[f_ini_x,ini_x]=ksdensity(-randn_mod_x);
[f_ini_z,ini_z]=ksdensity(randn_mod_z);
figure
plot(ini_z,f_ini_z,'LineWidth',2,'Color','red')
hold on
plot(ini_x,f_ini_x,'LineWidth',2,'Color','green','Marker','x')
hold off
grid on
legend('Positive','Negative')
axis tight
xlabel('x','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('f(x)','fontsize',24,'FontWeight','bold')
%ylim([0 6])
print('logndens_pers','-dpng')
%
figure
plot(ini_z,f_ini_z*(d_one_pos+d_two_pos*13+d_three_pos*13^2),'LineWidth',2,'Color','red')
hold on
plot(ini_x,f_ini_x*(d_one_neg+d_three_pos*13+d_three_pos*13^2),'LineWidth',2,'Color','green','Marker','x')
hold off
grid on
legend('Positive','Negative')
axis tight
xlabel('x','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('f(x)','fontsize',24,'FontWeight','bold')
%ylim([0 6])
print('logndens_pers_weighted','-dpng')
%trans
randn_mod_x=zeros(H,1);
randn_mod_z=zeros(H,1);
for i = 1:H
    randn_mod_x(i) = exp(mu_lognb+lambda_b_neg*13)*randn_shock_en(i,13)^(gamma_a_tr_n+gamma_b_tr_n*13); %this is the part to replace in fortran
end
for i = 1:H
    randn_mod_z(i) = exp(lambda_a_pos+lambda_b_pos*13)*randn_shock_ep(i,13)^(gamma_a_tr_p+gamma_b_tr_p*13); %this is the part to replace in fortran
end
[f_ini_x,ini_x]=ksdensity(-randn_mod_x);
[f_ini_z,ini_z]=ksdensity(randn_mod_z);
figure
plot(ini_z,f_ini_z,'LineWidth',2,'Color','red')
hold on
plot(ini_x,f_ini_x,'LineWidth',2,'Color','green','Marker','x')
hold off
grid on
legend('Positive','Negative')
axis tight
xlabel('x','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('f(x)','fontsize',24,'FontWeight','bold')
%ylim([0 6])
print('logndens_trans','-dpng')
%
figure
plot(ini_z,f_ini_z*(d_one_pos+d_two_pos*13+d_three_pos*13^2),'LineWidth',2,'Color','red')
hold on
plot(ini_x,f_ini_x*(d_one_neg+d_three_pos*13+d_three_pos*13^2),'LineWidth',2,'Color','green','Marker','x')
hold off
grid on
legend('Positive','Negative')
axis tight
xlabel('x','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('f(x)','fontsize',24,'FontWeight','bold')
%ylim([0 6])
print('logndens_trans_weighted','-dpng')
%}
%UNCONDITIONAL
%
% predgr_26=panel_new(:,9);
% predgr_26=predgr_26(logical(panel_new(:,6)==(27-24)));
% [g,y]=ksdensity(predgr_26);
% [f,x]=ksdensity(data_simplified.gr_26);
% figure
% plot(x,f,'Color', 'blue','LineWidth',2)
% hold on
% plot(y,g,'Color', 'blue','LineWidth',2,'Color','cyan','LineStyle','--')
% hold off
% legend('Data','Model')
% axis tight
% set(gca,'XTick',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This are going to be the only values affected.
% set(gca,'XTickLabel',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This is what it's going to appear in those places.
% ylabel('Kernel_{26}','fontsize',13,'FontWeight','bold')
% ylim([0 7])
% xlim([-1 1])
% print('pred_2covar_kernel26','-dpng')
% %}
% %
% predgr_30=panel_new(:,9);
% predgr_30=predgr_30(logical(panel_new(:,6)==(31-24)));
% [g,y]=ksdensity(predgr_30);
% [f,x]=ksdensity(data_simplified.gr_30);
% figure
% plot(x,f,'Color', 'blue','LineWidth',2)
% hold on
% plot(y,g,'Color', 'blue','LineWidth',2,'Color','cyan','LineStyle','--')
% hold off
% legend('Data','Model')
% axis tight
% set(gca,'XTick',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This are going to be the only values affected.
% set(gca,'XTickLabel',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This is what it's going to appear in those places.
% ylabel('Kernel_{30}','fontsize',13,'FontWeight','bold')
% ylim([0 7])
% xlim([-1 1])
% print('pred_2covar_kernel30','-dpng')
% %}
% %
% predgr_36=panel_new(:,9);
% predgr_36=predgr_36(logical(panel_new(:,6)==(37-24)));
% [g,y]=ksdensity(predgr_36);
% [f,x]=ksdensity(data_simplified.gr_36);
% figure
% plot(x,f,'Color', 'blue','LineWidth',2)
% hold on
% plot(y,g,'LineWidth',2,'Color','cyan','LineStyle','--')
% hold off
% legend('Data','Model')
% axis tight
% set(gca,'XTick',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This are going to be the only values affected.
% set(gca,'XTickLabel',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This is what it's going to appear in those places.
% ylabel('Kernel_{36}','fontsize',13,'FontWeight','bold')
% ylim([0 7])
% xlim([-1 1])
% print('pred_2covar_kernel36','-dpng')
% %}
% %
% predgr_40=panel_new(:,9);
% predgr_40=predgr_40(logical(panel_new(:,6)==(41-24)));
% [g,y]=ksdensity(predgr_40);
% [f,x]=ksdensity(data_simplified.gr_40);
% figure
% plot(x,f,'Color', 'blue','LineWidth',2)
% hold on
% plot(y,g,'Color', 'blue','LineWidth',2,'Color','cyan','LineStyle','--')
% hold off
% legend('Data','Model')
% axis tight
% set(gca,'XTick',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This are going to be the only values affected.
% set(gca,'XTickLabel',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This is what it's going to appear in those places.
% ylabel('Kernel_{40}','fontsize',13,'FontWeight','bold')
% ylim([0 7])
% xlim([-1 1])
% print('pred_2covar_kernel40','-dpng')
% %}
% %
% predgr_46=panel_new(:,9);
% predgr_46=predgr_46(logical(panel_new(:,6)==(47-24)));
% [g,y]=ksdensity(predgr_46);
% [f,x]=ksdensity(data_simplified.gr_46);
% figure
% plot(x,f,'Color', 'blue','LineWidth',2)
% hold on
% plot(y,g,'LineWidth',2,'Color','cyan','LineStyle','--')
% hold off
% legend('Data','Model')
% axis tight
% set(gca,'XTick',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This are going to be the only values affected.
% set(gca,'XTickLabel',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This is what it's going to appear in those places.
% ylabel('Kernel_{46}','fontsize',13,'FontWeight','bold')
% ylim([0 7])
% xlim([-1 1])
% print('pred_2covar_kernel46','-dpng')
% %}
% %
% predgr_50=panel_new(:,9);
% predgr_50=predgr_50(logical(panel_new(:,6)==(51-24)));
% [g,y]=ksdensity(predgr_50);
% [f,x]=ksdensity(data_simplified.gr_50);
% figure
% plot(x,f,'Color', 'blue','LineWidth',2)
% hold on
% plot(y,g,'Color', 'blue','LineWidth',2,'Color','cyan','LineStyle','--')
% hold off
% legend('Data','Model')
% axis tight
% set(gca,'XTick',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This are going to be the only values affected.
% set(gca,'XTickLabel',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This is what it's going to appear in those places.
% ylabel('Kernel_{50}','fontsize',13,'FontWeight','bold')
% ylim([0 7])
% xlim([-1 1])
% print('pred_2covar_kernel50','-dpng')
% %}
% %
% predgr_54=panel_new(:,9);
% predgr_54=predgr_54(logical(panel_new(:,6)==(55-24)));
% [g,y]=ksdensity(predgr_54);
% [f,x]=ksdensity(data_simplified.gr_54);
% figure
% plot(x,f,'Color', 'blue','LineWidth',2)
% hold on
% plot(y,g,'Color', 'blue','LineWidth',2,'Color','cyan','LineStyle','--')
% hold off
% legend('Data','Model')
% axis tight
% set(gca,'XTick',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This are going to be the only values affected.
% set(gca,'XTickLabel',[-1 -0.5 -0.1 0 0.1 0.5 1] ); %This is what it's going to appear in those places.
% ylabel('Kernel_{54}','fontsize',13,'FontWeight','bold')
% ylim([0 7])
% xlim([-1 1])
% print('pred_2covar_kernel54','-dpng')
%}
%purely transitory:
%trans
%
data_simplified.M_ave(6:end)=mean(data_simplified.M_ave(6:end));
data_covar1_n=data_simplified.covar1_n(1:30);
data_covar1_p=data_simplified.covar1_p(1:30);
data_covar2_n=data_simplified.covar2_n(1:29);
data_covar2_p=data_simplified.covar2_p(1:29);
error.mean_p=((mean_p-data_simplified.mean_p)./(prctile(abs(data_simplified.skew),17)))'*((mean_p-data_simplified.mean_p)./(prctile(abs(data_simplified.skew),17)));
error.mean_n=((mean_n-data_simplified.mean_n)./(prctile(abs(data_simplified.skew),17)))'*((mean_n-data_simplified.mean_n)./(prctile(abs(data_simplified.skew),17)));
error.var_p=((var_p-data_simplified.var_p)./(prctile(abs(data_simplified.skew),6)))'*((var_p-data_simplified.var_p)./(prctile(abs(data_simplified.skew),6)));
error.var_n=((var_n-data_simplified.var_n)./(prctile(abs(data_simplified.skew),6)))'*((var_n-data_simplified.var_n)./(prctile(abs(data_simplified.skew),6)));
error.skew_kelly=((skew_kelly-data_simplified.skew_kelly)./(prctile(abs(data_simplified.skew),65)))'*((skew_kelly-data_simplified.skew_kelly)./(prctile(abs(data_simplified.skew),65)));
error.kurt_cs=((kurt_cs-data_simplified.kurt_cs)./(8*prctile(abs(data_simplified.skew),97)))'*((kurt_cs-data_simplified.kurt_cs)./(8*prctile(abs(data_simplified.skew),97)));
error.fract_p=((fract_p(1:31)-data_simplified.fract_p)./(prctile(abs(data_simplified.var_p),86)))'*((fract_p(1:31)-data_simplified.fract_p)./(prctile(abs(data_simplified.var_p),86)));
error.cov1_n=((cov_1_neg-data_simplified.covar1_n(1:30))./(prctile(abs(data_simplified.skew),5)))'*((cov_1_neg-data_simplified.covar1_n(1:30))./(prctile(abs(data_simplified.skew),5)));
error.cov1_p=((cov_1_pos-data_simplified.covar1_p(1:30))./(prctile(abs(data_simplified.skew),5)))'*((cov_1_pos-data_simplified.covar1_p(1:30))./(prctile(abs(data_simplified.skew),5)));
error.cov2_n=((cov_2_neg-data_simplified.covar2_n(1:29))./(prctile(abs(data_simplified.covar2_p(1:29)),90)))'*((cov_2_neg-data_simplified.covar2_n(1:29))./(prctile(abs(data_simplified.covar2_p(1:29)),90)));
error.cov2_p=((cov_2_pos-data_simplified.covar2_p(1:29))./(prctile(abs(data_simplified.covar2_p(1:29)),90)))'*((cov_2_pos-data_simplified.covar2_p(1:29))./(prctile(abs(data_simplified.covar2_p(1:29)),90)));
error.uncmean=((uncmean-data_simplified.mean)./(prctile(abs(data_simplified.covar2_p(1:30)),93)))'*((uncmean-data_simplified.mean)./(prctile(abs(data_simplified.covar2_p(1:30)),93)));
error.outbound=((outbound-data_simplified.outbound)./(prctile(abs(data_simplified.var_p),85)))'*((outbound-data_simplified.outbound)./(prctile(abs(data_simplified.var_p),85)));
error.unc_acv=((M_ave_est-data_simplified.M_ave)./(prctile(abs(data_simplified.covar2_p(1:29)),72)))'*((M_ave_est-data_simplified.M_ave)./(prctile(abs(data_simplified.covar2_p(1:29)),72)));
error.mean_learn_age=((mean_learn_age(1)-0)./(prctile(abs(data_simplified.covar1_p(1:30)),95)))'*((mean_learn_age(1)-0)./(prctile(abs(data_simplified.covar1_p(1:30)),95)));
error.ineq=((var_hump-data_simplified.hump)./(prctile(abs(data_simplified.skew),8)))'*((var_hump-data_simplified.hump)./(prctile(abs(data_simplified.skew),8)));
error.total=error.uncmean+error.mean_learn_age+error.ineq+error.outbound+error.var_p+error.var_n+error.kurt_cs+error.cov1_n+error.cov1_p+error.cov2_n+error.cov2_p+error.unc_acv+error.fract_p+error.skew_kelly+error.mean_p+error.mean_n;
fprintf('mean_p=%.2f', error.mean_p)
fprintf('\n')
fprintf('mean_n=%.2f', error.mean_n)
fprintf('\n')
fprintf('var_p=%.2f', error.var_p)
fprintf('\n')
fprintf('var_n=%.2f', error.var_n)
fprintf('\n')
fprintf('skew_kelly=%.2f', error.skew_kelly)
fprintf('\n')
fprintf('kurt_cs=%.2f', error.kurt_cs)
fprintf('\n')
fprintf('fract_p=%.2f', error.fract_p)
fprintf('\n')
fprintf('cov1_n=%.2f', error.cov1_n)
fprintf('\n')
fprintf('cov1_p=%.2f', error.cov1_p)
fprintf('\n')
fprintf('cov2_n=%.2f', error.cov2_n)
fprintf('\n')
fprintf('cov2_p=%.2f', error.cov2_p)
fprintf('\n')
fprintf('uncmean=%.2f', error.uncmean)
fprintf('\n')
fprintf('outbound=%.2f', error.outbound)
fprintf('\n')
fprintf('unc_acv=%.2f', error.unc_acv)
fprintf('\n')
fprintf('mean_learn_age=%.2f', error.mean_learn_age)
% fprintf('\n')
% fprintf('ineq_init=%.2f', error.ineq_init)
fprintf('\n')
fprintf('ineq=%.2f', error.ineq)
fprintf('\n')
fprintf('total=%.2f', error.total)
fprintf('\n')
optimum_simplified_2covar
% save('panel_new.mat','panel_new')
save('error.mat','error')
%
toc
disp(datestr(datenum(0,0,0,0,0,toc),'HH:MM:SS'))
beep