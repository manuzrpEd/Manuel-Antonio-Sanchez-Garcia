rand('seed',8842554);
clear
clear mex
close all
clc
cd 'C:\Users\Tony\Desktop\Projects\OccupationsChile\Matlab\v3_newstats'
tic
set(0,'DefaultFigureWindowStyle','docked')
set(0,'DefaultLegendAutoUpdate','off')
% parameters 
Nwork   = 35;       % years of work
Nmonths   = Nwork*12;       % months of work
% 
beta    = 0.99;     % discount factor
Ne      = 500;      % Grid of log-normal match quality shocks
Nsim    = 5000;   % for simulation 100000 20000
NPP = 8;% permanent heterogeneity individual-specific
%% Data Load
disp(' ')
disp('%% Data Load')
% polynomial parameters for fitting demand side returns
% --> external file contains estimates from trabajando.com and lagakos et.
% al (JPE paper) for life-cycle wages for the "demand" and the
% "supply" side respectively. The "demand" side parameters are smoothed
% using a polynomial of order Npol_demand
load profiles_data.mat;

Npol_demand = 5; 
pol_x       = polyfit(1:35,profiles(:,2)',Npol_demand);
xgrid       = polyval(pol_x,1:35)';
pol_s       = polyfit(1:35,profiles(:,1)',Npol_demand);
sgrid       = polyval(pol_s,1:35)';

[num,~,~] = xlsread('External_data.xlsx');
data_EU=num(:,2);
data_JJ=num(:,3);
data_UE=num(:,4);

eugrid      = polyfit(1:32,data_EU',Npol_demand);
eugrid       = polyval(eugrid,1:32)';
jjgrid      = polyfit(1:32,data_JJ',Npol_demand);
jjgrid       = polyval(jjgrid,1:32)';
uegrid      = polyfit(1:32,data_UE',Npol_demand);
uegrid       = polyval(uegrid,1:32)';

data_fit=[data_EU, data_JJ, data_UE, xgrid(1:end-3), sgrid(1:end-3)];
data_fit(1,6)=-0.0663496;
data_fit(1,7)=0.055;

[num,~,~] = xlsread('employment_age.xlsx');
data_emp=num(:,2);
emp      = polyfit(1:34,data_emp',Npol_demand);
emp       = polyval(emp,1:34)';

%% SIMULATIONS
disp(' ')
disp('%% Simulation')

NPAR=16;
load('optimum.mat','optimum')
% optimum(1)=0;%% value of unemployment
% optimum(2)=-0.001;%% value of unemployment
% optimum(3)=-0;%% value of unemployment
% optimum(4)=optimum(4)-2.3;%% std dev of match quality shock
% optimum(5)=0;%dj prob of human k depreciation during JJ
% optimum(6)=0;%dj prob of human k depreciation during JJ
% optimum(7)=0;%dj prob of human k depreciation during JJ
% optimum(8)=0;%du prob of human k depreciation during U
% optimum(9)=0.001;%du prob of human k depreciation during U
% optimum(10)=0;%du prob of human k depreciation during U
% optimum(11)=0.5;%fe gamma finding prob from E JJ
% optimum(12)=-0.01;%0
% optimum(13)=0;
% optimum(14)=0.5;%omega fu finding prob from U UE
% optimum(15)=0.005;
% optimum(16)=-0.0001;
% optimum(17)=0.05;%pi ps separation prob EU
% optimum(18)=-0.001;%0
% optimum(19)=0;%0
% optimum(20)=0;%pk rho prob of accumulating human k 0.05
% optimum(21)=0;%0
optimum(23:24)=0;
optimum(22)=1/12;
% optimum=[optimum(1:4,1); 0;0; optimum(5:end,1)];
% save('optimum.mat','optimum')
param=optimum
[L_sim,ws_sim,JJ_sim,UE_sim,EU_sim,yd_w,V_u,V_w,xsim,EuE_change,JJ_change] = simulat(param,Nsim,Nwork,Ne,xgrid,Nmonths,beta, NPP);
%% Counterfactual Features, Plots
disp(' ')
disp('%% Model Features, Plots')

b=(optimum(1)+optimum(2).*(1:Nwork)+optimum(3).*(1:Nwork).^2)';
Sig_e=sqrt(exp(optimum(4)+optimum(5).*(1:Nwork)+optimum(6).*(1:Nwork).^2))';
dj=(optimum(7)+optimum(8).*(1:Nwork)+optimum(9).*(1:Nwork).^2)';
du=(optimum(10)+optimum(11).*(1:Nwork)+optimum(12).*(1:Nwork).^2)';
fe=(optimum(13)+optimum(14).*(1:Nwork)+optimum(15).*(1:Nwork).^2)';
fu=(optimum(16)+optimum(17).*(1:Nwork)+optimum(18).*(1:Nwork).^2)';
ps=(optimum(19)+optimum(20).*(1:Nwork)+optimum(21).*(1:Nwork).^2)';
pk=(optimum(22)+optimum(23).*(1:Nwork)+optimum(24).*(1:Nwork).^2)';
sigma_a=optimum(25);

% From *_sim arrays, create life-cycle profiles

employment   = mean(L_sim);
EuE_change   = nanmean(EuE_change);
JJ_change   = nanmean(JJ_change);
unemployment = 1-employment;
wages_demand = mean(mean(yd_w,3))';
wages_survey = sum(ws_sim,1) ./ sum(ws_sim~=0,1);
wages2=ws_sim;
wages2(wages2==0)=NaN;
ginic_rho_x_01=ginicoeff(wages2,1);
save('ginic_rho_x_01.mat','ginic_rho_x_01')
job2job     =[1, sum(JJ_sim(:,2:Nmonths),1) ./ sum(L_sim(:,1:Nmonths-1)==1,1)];
ave_V_u_a=mean(V_u,1);%average across k and hence shown by k
ave_V_u_k=mean(V_u,2);%average across age and hence shown by age
ave_V_w=mean(V_w,1);%average across epsilon
ave_V_w=squeeze(ave_V_w);
ave_V_w_a=mean(ave_V_w,1);%average across k and hence shown by k
ave_V_w_k=mean(ave_V_w,2);%average across age and hence shown by age
ave_xsim=mean(xsim,1);
sd_xsim=std(xsim,1);
u2e          =[1, sum(UE_sim(:,2:Nmonths),1) ./ sum(L_sim(:,1:Nmonths-1)==0,1)];
e2u          =[1, sum(EU_sim(:,2:Nmonths),1) ./ sum(L_sim(:,1:Nmonths-1)==1,1)];

employment = accumarray(ceil((1:numel(employment))/12)',employment(:),[],@nanmean);
EuE_change = accumarray(ceil((1:numel(EuE_change))/12)',EuE_change(:),[],@nanmean);
JJ_change = accumarray(ceil((1:numel(JJ_change))/12)',JJ_change(:),[],@nanmean);
unemployment = accumarray(ceil((1:numel(unemployment))/12)',unemployment(:),[],@nanmean);
wages_survey = accumarray(ceil((1:numel(wages_survey))/12)',wages_survey(:),[],@nanmean);
job2job = accumarray(ceil((1:numel(job2job))/12)',job2job(:),[],@nanmean);
ave_V_u_a = accumarray(ceil((1:numel(ave_V_u_a))/12)',ave_V_u_a(:),[],@nanmean);
ave_V_w_a = accumarray(ceil((1:numel(ave_V_w_a))/12)',ave_V_w_a(:),[],@nanmean);
ave_xsim = accumarray(ceil((1:numel(ave_xsim))/12)',ave_xsim(:),[],@nanmean);
sd_xsim = accumarray(ceil((1:numel(sd_xsim))/12)',sd_xsim(:),[],@nanmean);
u2e = accumarray(ceil((1:numel(u2e))/12)',u2e(:),[],@nanmean);
e2u = accumarray(ceil((1:numel(e2u))/12)',e2u(:),[],@nanmean);

%% Counterfactual Graph
load('model_wages_survey.mat','model_wages_survey')
figure
subplot(4,2,1)
plot(EuE_change,'LineWidth',1.5,'Color','black')
hold on
yline(data_fit(1,6),'LineWidth',1.5,'Color','blue','LineStyle','--');
hold off
grid on
% h=legend('EUE Loss - Model','EUE Loss - Data','Location','NorthEast');
% legend boxoff
% set(h,'FontSize',6); 
axis tight
xlabel('Age','fontsize',5,'FontWeight','bold')
%ylabel('% Change','fontsize',5,'FontWeight','bold');
set(gca,'FontSize',10)
title('E\rightarrowU\rightarrowE Loss, % Change')
subplot(4,2,2)
plot(JJ_change,'LineWidth',1.5,'Color','black')
hold on
yline(data_fit(1,7),'LineWidth',1.5,'Color','blue','LineStyle','--');
hold off
grid on
% h=legend('JJ Gain - Model','JJ Gain - Data','Location','SouthEast');
% legend boxoff
% set(h,'FontSize',6); 
axis tight
xlabel('Age','fontsize',5,'FontWeight','bold')
%ylabel('% Change','fontsize',5,'FontWeight','bold');
set(gca,'FontSize',10)
title('J\rightarrowJ Gain, % Change')
subplot(4,2,[3 4])
plot(ave_xsim,'LineWidth',1.5,'Color','black')
hold on
plot(ave_xsim+1.*sd_xsim,'LineWidth',1.5,'Color','black','LineStyle',':')
hold on
plot(ave_xsim-1.*sd_xsim,'LineWidth',1.5,'Color','black','LineStyle',':')
hold off
grid on
% set(h,'FontSize',6); 
axis tight
xlabel('Age','fontsize',5,'FontWeight','bold')
%ylabel('x','fontsize',12,'FontWeight','bold');
set(gca,'FontSize',10)
title('Human capital, x')
subplot(4,2,5)
plot(employment(1:34),'LineWidth',1.5,'Color','black')
hold on
plot(emp,'LineWidth',1.5,'LineStyle','--','Color','black')
hold on
plot(unemployment(1:34),'LineWidth',1.5,'Color','yellow')
hold on
plot(1-emp,'LineWidth',1.5,'LineStyle','--','Color','yellow')
hold off
grid on
% h=legend('Employment - Model','Employment - Data','Non-employment - Model','Non-employment - Data','Location','East');
% legend boxoff
% set(h,'FontSize',6); 
axis tight
xlabel('Age','fontsize',5,'FontWeight','bold')
%ylabel('Share','fontsize',5,'FontWeight','bold');
ylim([0 1])
ytickformat('%.2f')
set(gca,'FontSize',10)
title('\color{black}Employment & Non-employment\color{black}, Share')
subplot(4,2,6)
plot(u2e(3:end),'LineWidth',1.5,'Color','cyan')
hold on
plot(uegrid,'LineWidth',1.5,'LineStyle','--','Color','cyan')
hold on
plot(e2u(3:end),'LineWidth',1.5,'Color','green')
hold on
plot(eugrid,'LineWidth',1.5,'LineStyle','--','Color','green')
grid on
% h=legend('UE - Model','UE - Data','EU - Model','EU - Data','Location','East');
% legend boxoff
% set(h,'FontSize',6); 
axis tight
xlabel('Age','fontsize',5,'FontWeight','bold')
%ylabel('Share','fontsize',5,'FontWeight','bold');
ylim([0 0.7])
ytickformat('%.2f')
set(gca,'FontSize',10)
title('U\rightarrowE \color{black}& E\rightarrowU\color{black}, Share')
subplot(4,2,7)
plot(job2job(4:end),'LineWidth',1.5,'Color','magenta')
hold on
plot(jjgrid,'LineWidth',1.5,'LineStyle','--','Color','magenta')
grid on
% h=legend('JJ - Model','JJ - Data','Location','Northeast');
% legend boxoff
% set(h,'FontSize',6); 
axis tight
xlabel('Age','fontsize',5,'FontWeight','bold')
%ylabel('Share','fontsize',5,'FontWeight','bold');
ylim([0 0.4])
set(gca,'FontSize',10)
ytickformat('%.2f')
title('J\rightarrowJ, Share')
subplot(4,2,8)
plot(wages_demand,'LineWidth',1.5,'Color','blue')
hold on
plot(wages_survey,'LineWidth',1.5,'Color','red')
hold on
plot(xgrid,'LineWidth',1.5,'LineStyle','--','Color','blue')
hold on
plot(sgrid,'LineWidth',1.5,'LineStyle','--','Color','red')
hold off
grid on
% h=legend('Demand (firms) - Model','Supply (workers) - Model','Demand (firms) - Data','Supply (workers) - Data','Location','Southeast');
% legend boxoff
% set(h,'FontSize',6); 
axis tight
xlabel('Age','fontsize',5,'FontWeight','bold')
%ylabel('Wages (%)','fontsize',12,'FontWeight','bold');
ytickformat('%.2f')
set(gca,'FontSize',10)
title('Lifecycle Wages (%), Demand \color{black}& Supply')
set(gcf, 'PaperPosition', [0 0 20 15]); % 0 0 width height
saveas(gcf,'Counterfactual_rho_x_01.png')

figure
plot(wages_survey,'LineWidth',2.5,'Color','red')
hold on
plot(model_wages_survey,'LineWidth',2.5,'LineStyle','--','Color','red')
hold off
grid on
h=legend('$\bar{\rho}_x=1/12$','Baseline','Location','Northwest');
legend boxoff
set(h,'FontSize',25,'interpreter', 'latex'); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
%ylabel('Wages (%)','fontsize',24,'FontWeight','bold');
ylim([0 1.2])
ytickformat('%.2f')
set(gca,'FontSize',18)
saveas(gcf,'Counterfactual_rho_x_01_lcsupply.png')

%%
disp('Finished!')
beep on