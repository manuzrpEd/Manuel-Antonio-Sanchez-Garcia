%% Initialization and Parameteres
%0.7337
%Reestimate reconstruct with new set of moments
%use individuals always working to be used for estimation of "demand" side
%data in Excel of Sekyu.
rand('seed',8842554);
clear
clear mex
close all
clc
cd 'C:\Users\Tony\Desktop\Projects\OccupationsChile\Matlab\v3_newstats_noalpha'
tic
set(0,'DefaultFigureWindowStyle','docked')
% set(0,'DefaultLegendAutoUpdate','off')

disp(' ')
disp('%% Parameters and Initialization')

% parameters 
Nwork   = 35;       % years of work
Nmonths   = Nwork*12;       % months of work
%
beta    = 0.99;     % discount factor
% b       = 0.25;     % value of unemployment
% 
% du      = 0.05;     % prob of human k depreciation during U
% dj      = 0.01;     % prob of human k depreciation during J2J
% pk1      = 0.60;     % prob of accumulating human k
% pk2      = -0.001;     % prob of accumulating human k
% pk3      = 0.0001;     % prob of accumulating human k
% fu1      = 0.75;     % finding prob from U
% fu2      = -0.01;     % finding prob from U
% fu3      = 0.0001;     % finding prob from U
% ps1      = 0.05;     % separation prob
% ps2      = 0.001;     % separation prob
% ps3      = -0.0001;     % separation prob
% fe1      = 0.50;     % finding prob from E
% fe2      = 0.001;     % finding prob from E
% fe3      = -0.0001;     % finding prob from E
% 
% Sig_e   = 0.5;      % std dev of match quality shock
% 
Ne   = 500;      % Grid of log-normal match quality shocks
Nsim = 5000;   % for simulation 100000 20000
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
pol_x       = polyfit(1:Nwork,profiles(:,2)',Npol_demand);
xgrid       = polyval(pol_x,1:Nwork)';
pol_s       = polyfit(1:35,profiles(:,1)',Npol_demand);
sgrid       = polyval(pol_s,1:Nwork)';

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
% data_fit(1,6)=-0.0663496;
data_fit(1,6)=-0.0390;
% data_fit(1,7)=0.055;
data_fit(1,7)=0.0224;

[num,~,~] = xlsread('employment_age.xlsx');
data_emp=num(:,2);
emp      = polyfit(1:34,data_emp',Npol_demand);
emp       = polyval(emp,1:34)';

load('data_gini.mat')
data_gini=y;
%% SIMULATIONS
disp(' ')
disp('%% Simulation')

NPAR=24;
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
% optimum(19)=0.09;%pi ps separation prob EU
% optimum(18)=-0.001;%0
% optimum(19)=0;%0
% optimum(20)=0;%pk rho prob of accumulating human k 0.05
% optimum(21)=0.0015;%0
% optimum(22)=-0.00005;
% optimum=[optimum(1:4,1); 0;0; optimum(5:end,1)];
% optimum(25)=optimum(25);
% save('optimum.mat','optimum')
% optimum(22)=0.01
% optimum(10)=0.02
% optimum(7)=0.04%this causes trembling alone!
% optimum(13)=0.5
param=optimum(1:NPAR,1);

[L_sim,ws_sim,JJ_sim,UE_sim,EU_sim,yd_w,V_u,V_w,xsim,EuE_change,JJ_change,ginic_baseline,var_baseline] = simulat(param,Nsim,Nwork,Ne,xgrid,Nmonths,beta);
%% Model Features, Plots
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
%
du(du<0)=0;
du(du>1)=1;
dj(dj<0)=0;
dj(dj>1)=1;
fe(fe>1)=1;
fu(fu>1)=1;
fe(fe<0)=0;
fu(fu<0)=0;
ps(ps>1)=1;
ps(ps<0)=0;
pk(pk>1)=1;
pk(pk<0)=0;

% From *_sim arrays, create life-cycle profiles

employment   = mean(L_sim);
EuE_change   = nanmean(EuE_change);
JJ_change   = nanmean(JJ_change);
unemployment = 1-employment;
wages_demand = mean(mean(yd_w,3))';
wages_survey = sum(ws_sim,1) ./ sum(ws_sim~=0,1);
wages2=ws_sim;
wages2(wages2==0)=NaN;
share_wages2_last_ab60=sum(wages2(:,end)>=0.6)/(size(xsim(:,end),1)-sum(isnan(wages2(:,end))))
% ginic_baseline=ginicoeff(wages2,1);
save('ginic_baseline.mat','ginic_baseline')
ginic_baseline = accumarray(ceil((1:numel(ginic_baseline))/12)',ginic_baseline(:),[],@nanmean);
var_baseline = accumarray(ceil((1:numel(var_baseline))/12)',var_baseline(:),[],@nanmean);
job2job     =[1, sum(JJ_sim(:,2:Nmonths),1) ./ sum(L_sim(:,1:Nmonths-1)==1,1)];
fract_gain_JJ=nan(size(JJ_sim,1),size(JJ_sim,2));
for i=1:size(JJ_sim,1)
    for j=1:size(JJ_sim,2)
        if JJ_sim(i,j)==1
            if ws_sim(i,j)>ws_sim(i,j-1)
                fract_gain_JJ(i,j)=1;
            else
                fract_gain_JJ(i,j)=0;
            end
        end
    end
end
ave_fract_gain_JJ=nanmean( fract_gain_JJ);
ave_lc_fract_gain_JJ=nanmean(ave_fract_gain_JJ)
%
ave_V_u_a=mean(V_u,1);%average across k and hence shown by age
ave_V_u_k=mean(V_u,2);%average across age and hence shown by k
ave_V_w=mean(V_w,1);%average across epsilon
ave_V_w=squeeze(ave_V_w);
int=mean(ave_V_w,3);
int=squeeze(int);
ave_V_w_a=mean(int,1);%average across k and hence shown by a
ave_V_w_k=mean(int,2);%average across age and hence shown by k
ave_xsim=mean(xsim,1);
share_xsim_last_ab10=sum(xsim(:,end)>=10)/size(xsim(:,end),1)
sd_xsim=std(xsim,1);
u2e          =[1, sum(UE_sim(:,2:Nmonths),1) ./ sum(L_sim(:,1:Nmonths-1)==0,1)];
e2u          =[1, sum(EU_sim(:,2:Nmonths),1) ./ sum(L_sim(:,1:Nmonths-1)==1,1)];
%
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

error_JJ=10*((job2job(4:end)-data_fit(:,2))./1)'*((job2job(4:end)-data_fit(:,2))./1)
error_UE=2*((u2e(4:end)-data_fit(:,3))./1)'*((u2e(4:end)-data_fit(:,3))./1)
error_EU=3*((e2u(4:end)-data_fit(:,1))./1)'*((e2u(4:end)-data_fit(:,1))./1)
error_xgrid=.05*((wages_demand(4:end)-data_fit(:,4))./1)'*((wages_demand(4:end)-data_fit(:,4))./1)
error_sgrid=4*((wages_survey(4:end)-data_fit(:,5))./1)'*((wages_survey(4:end)-data_fit(:,5))./1)
error_EUE=3000*((mean(EuE_change)-data_fit(1,6))./1)'*((mean(EuE_change)-data_fit(1,6))./1)
error_JJG=1000*((mean(JJ_change)-data_fit(1,7))./1)'*((mean(JJ_change)-data_fit(1,7))./1)
% error_ineq=(1/4)*((ginic_baseline-data_gini(1:35))./1)'*((ginic_baseline-data_gini(1:35))./1)
error_emp=1*((employment(2:end,1)-emp(:,1))./1)'*((employment(2:end,1)-emp(:,1))./1)
loss=error_JJ+error_UE+error_EU+error_xgrid+error_sgrid+error_EUE+error_JJG+error_emp

disp('Data : ')
data_mean_JJ=mean(data_fit(:,2))
data_mean_UE=mean(data_fit(:,3))
data_mean_EU=mean(data_fit(:,1))
data_mean_xgrid=mean(data_fit(:,4))
data_mean_sgrid=mean(data_fit(:,5))
data_mean_EuE_change=data_fit(1,6)
data_mean_JJ_change=data_fit(1,7)
data_Employment=mean(emp)
data_Unemployment=1-data_Employment
data_mean_gini=mean(data_gini)
disp('Model : ')
mean_JJ=mean(job2job)
mean_UE=mean(u2e)
mean_EU=mean(e2u)
mean_xgrid=mean(wages_demand)
mean_sgrid=mean(wages_survey)
mean_EuE_change=mean(EuE_change)
mean_JJ_change=mean(JJ_change)
mean_Employment=mean(employment)
mean_Unemployment=mean(unemployment)
mean_gini=mean(ginic_baseline)

disp('Average Parameter : ')
pk_ave=mean(pk)
dj_ave=mean(dj)
du_ave=mean(du)
Sig_e_ave=mean(Sig_e)
fu_ave=mean(fu)
ps_ave=mean(ps)
fe_ave=mean(fe)
b_ave=mean(b)

figure
subplot(1,2,1)
plot(ave_V_u_a,'LineWidth',2.5)
hold on
plot(ave_V_w_a,'LineWidth',2.5)
hold off
grid on
h=legend('V_{U}^{a}','V_{W}^{a}','Location','NorthEast');
legend boxoff
set(h,'FontSize',18); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
ylabel('Value','fontsize',24,'FontWeight','bold');
% ylim([0 35])
% ytickformat('%.1f')
set(gca,'FontSize',20)
subplot(1,2,2)
plot(ave_V_u_k,'LineWidth',2.5)
hold on
plot(ave_V_w_k,'LineWidth',2.5)
hold off
grid on
h=legend('V_{U}^{x}','V_{W}^{x}','Location','NorthWest');
legend boxoff
set(h,'FontSize',18); 
axis tight
xlabel('x','fontsize',24,'FontWeight','bold')
ylabel('Value','fontsize',24,'FontWeight','bold');
% ylim([0 35])
% ytickformat('%.1f')
set(gca,'FontSize',20)
saveas(gcf,'Optimum_Vfs.png')

figure
subplot(1,3,1)
plot(fe,'LineWidth',2.5)
hold on
plot(fu,'LineWidth',2.5)
hold on
plot(ps,'LineWidth',2.5,'Color','yellow')
hold on
plot(pk,'LineWidth',2.5,'Color',[0.4940, 0.1840, 0.5560])
hold on
plot(du,'LineWidth',2.5,'Color','green')
hold on
plot(dj,'LineWidth',2.5,'Color','cyan')
hold off
grid on
h=legend('$f_t^E$','$f_t$','$s_t$','$\rho_x$','$\delta_{x}$','$\kappa_{x}$','Location','bestoutside');
legend boxoff
set(h,'FontSize',18,'interpreter', 'latex'); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
% ylabel('Probabilities','fontsize',24,'FontWeight','bold');
ylim([0 1])
ytickformat('%.2f')
set(gca,'FontSize',20)
subplot(1,3,2)
plot(b,'LineWidth',2.5,'Color','red')
grid on
h=legend('$b$','Location','NorthEast');
legend boxoff
set(h,'FontSize',18,'interpreter', 'latex'); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
% ylabel('Outside option','fontsize',24,'FontWeight','bold');
% yline(0,'LineWidth',2.5,'Color','black','LineStyle','--');
ytickformat('%.2f')
set(gca,'FontSize',20)
subplot(1,3,3)
plot(Sig_e,'LineWidth',2.5,'Color','magenta')
grid on
h=legend('$\sigma_{\epsilon}$','Location','NorthEast');
legend boxoff
set(h,'FontSize',18,'interpreter', 'latex'); 
axis tight
xlabel('x','fontsize',24,'FontWeight','bold')
% ylabel('Volatility','fontsize',24,'FontWeight','bold');
% yline(0,'LineWidth',2.5,'Color','black','LineStyle','--');
ytickformat('%.2f')
set(gca,'FontSize',20)
ylim([0 0.4])
saveas(gcf,'Optimum_probabilities.png')

figure
subplot(1,2,1)
plot(b,'LineWidth',2.5,'Color','red')
grid on
h=legend('$b$','Location','NorthEast');
legend boxoff
set(h,'FontSize',18,'interpreter', 'latex'); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
% ylabel('Outside option','fontsize',24,'FontWeight','bold');
yline(0,'LineWidth',2.5,'Color','black','LineStyle','--');
ytickformat('%.2f')
set(gca,'FontSize',20)
subplot(1,2,2)
plot(Sig_e,'LineWidth',2.5,'Color','magenta')
grid on
h=legend('$\sigma_{\epsilon}$','Location','NorthEast');
legend boxoff
set(h,'FontSize',18,'interpreter', 'latex'); 
axis tight
xlabel('x','fontsize',24,'FontWeight','bold')
% ylabel('Volatility','fontsize',24,'FontWeight','bold');
% yline(0,'LineWidth',2.5,'Color','black','LineStyle','--');
ytickformat('%.2f')
set(gca,'FontSize',20)
ylim([0 0.4])
saveas(gcf,'Optimum_probabilities_1.png')

figure
subplot(1,2,1)
plot(fe,'LineWidth',2.5)
hold on
plot(fu,'LineWidth',2.5)
hold off
grid on
h=legend('$f_t^E$','$f_t$','Location','bestoutside');
legend boxoff
set(h,'FontSize',18,'interpreter','latex');
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
ylim([0.2 1])
ytickformat('%.2f')
set(gca,'FontSize',20)
subplot(1,2,2)
plot(ps,'LineWidth',2.5,'Color','yellow')
hold on
plot(pk,'LineWidth',2.5,'Color',[0.4940, 0.1840, 0.5560])
hold on
plot(du,'LineWidth',2.5,'Color','green')
hold on
plot(dj,'LineWidth',2.5,'Color','cyan')
hold off
grid on
h=legend('$s_t$','$\rho_x$','$\delta_{x}$','$\kappa_{x}$','Location','NorthEast');
legend boxoff
set(h,'FontSize',18,'interpreter', 'latex'); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
% ylabel('Outside option','fontsize',24,'FontWeight','bold');
yline(0,'LineWidth',2.5,'Color','black','LineStyle','--');
ytickformat('%.2f')
set(gca,'FontSize',20)
ylim([0 0.4])
saveas(gcf,'Optimum_probabilities_2.png')

figure
plot(ave_xsim,'LineWidth',2.5,'Color','black')
hold on
plot(ave_xsim+1.*sd_xsim,'LineWidth',2.5,'Color','black','LineStyle',':')
hold on
plot(ave_xsim-1.*sd_xsim,'LineWidth',2.5,'Color','black','LineStyle',':')
hold off
grid on
% h=legend('K','Location','NorthEast');
% legend boxoff
set(h,'FontSize',18); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
ylabel('x','fontsize',24,'FontWeight','bold');
% ylim([0 35])
% ytickformat('%.1f')
set(gca,'FontSize',20)
saveas(gcf,'Optimum_xsim.png')

figure
subplot(3,2,1)
plot(employment(1:34),'LineWidth',2.5,'Color','black')
hold on
plot(emp,'LineWidth',2.5,'LineStyle','--','Color','black')
hold on
plot(unemployment(1:34),'LineWidth',2.5,'Color','yellow')
hold on
plot(1-emp,'LineWidth',2.5,'LineStyle','--','Color','yellow')
hold off
grid on
% h=legend('Employment - Model','Employment - Data','Non-employment - Model','Non-employment - Data','Location','East');
% legend boxoff
% set(h,'FontSize',5); 
axis tight
xlabel('Age','fontsize',24)
% ylabel('Share','fontsize',24);
ylim([0 1])
ytickformat('%.2f')
yticks([0 0.2 0.4 0.6 0.8 1])
title('\color{black}Employment & Non-employment\color{black}, Share')
set(gca,'FontSize',10)
% job transition profiles
subplot(3,2,2)
plot(u2e(3:end),'LineWidth',2.5,'Color','cyan')
hold on
plot(uegrid,'LineWidth',2.5,'LineStyle','--','Color','cyan')
hold on
plot(e2u(3:end),'LineWidth',2.5,'Color','green')
hold on
plot(eugrid,'LineWidth',2.5,'LineStyle','--','Color','green')
grid on
% h=legend('UE - Model','UE - Data','EU - Model','EU - Data','Location','East');
% legend boxoff
% set(h,'FontSize',5); 
axis tight
xlabel('Age','fontsize',24)
% ylabel('Share','fontsize',24);
ylim([0 0.7])
ytickformat('%.2f')
yticks([0 0.2 0.4 0.6])
title('U\rightarrowE \color{black}& E\rightarrowU\color{black}, Share')
set(gca,'FontSize',10)
% J2J profiles
subplot(3,2,3)
plot(job2job(4:end),'LineWidth',2.5,'Color','magenta')
hold on
plot(jjgrid,'LineWidth',2.5,'LineStyle','--','Color','magenta')
grid on
% h=legend('JJ - Model','JJ - Data','Location','Northeast');
% legend boxoff
% set(h,'FontSize',10); 
axis tight
xlabel('Age','fontsize',24)
% ylabel('Share','fontsize',24);
ylim([0 0.4])
yticks([0 0.1 0.2 0.3 0.4])
title('J\rightarrowJ, Share')
set(gca,'FontSize',10)
ytickformat('%.2f')
% wage profiles
subplot(3,2,4)
plot(wages_demand,'LineWidth',2.5,'Color','blue')
hold on
plot(wages_survey,'LineWidth',2.5,'Color','red')
hold on
plot(xgrid,'LineWidth',2.5,'LineStyle','--','Color','blue')
hold on
plot(sgrid,'LineWidth',2.5,'LineStyle','--','Color','red')
hold off
grid on
% h=legend('Demand - Model','Supply - Model','Demand - Data','Supply - Data','Location','Southeast');
% legend boxoff
% set(h,'FontSize',5); 
axis tight
xlabel('Age','fontsize',24)
% ylabel('Wages (%)','fontsize',24);
% ylim([0 2])
ytickformat('%.2f')
title('Lifecycle Wages (%), Demand \color{black}& Supply')
set(gca,'FontSize',10)
subplot(3,2,5)
plot(EuE_change,'LineWidth',2.5,'Color','black')
hold on
yline(data_fit(1,6),'LineWidth',2.5,'Color','blue','LineStyle','--');
hold off
grid on
% h=legend('EUE Loss - Model','EUE Loss - Data','Location','NorthEast');
% legend boxoff
% set(h,'FontSize',10); 
axis tight
xlabel('Age','fontsize',24)
% ylabel('% Change','fontsize',24);
ylim([-0.06 0])
% ytickformat('%.1f')
yticks([-0.06 -0.04 -0.02  0])
title('E\rightarrowU\rightarrowE Loss, % Change')
set(gca,'FontSize',10)
subplot(3,2,6)
plot(JJ_change,'LineWidth',2.5,'Color','black')
hold on
yline(data_fit(1,7),'LineWidth',2.5,'Color','blue','LineStyle','--');
hold off
grid on
% h=legend('JJ Gain - Model','JJ Gain - Data','Location','SouthEast');
% legend boxoff
% set(h,'FontSize',10); 
axis tight
xlabel('Age','fontsize',24)
% ylabel('% Change','fontsize',24);
ylim([0 0.04])
% ytickformat('%.1f')
yticks([0 0.01 0.02 0.03 0.04])
set(gca,'FontSize',10)
title('J\rightarrowJ Gain, % Change')
set(gcf, 'PaperPosition', [0 0 20 15]); % 0 0 width height
saveas(gcf,'Optimum.png')

figure
plot(ginic_baseline,'LineWidth',2.5,'Color','black')
hold on
plot(data_gini(1:35),'LineWidth',2.5,'Color','black','LineStyle','--')
hold off
grid on
h=legend('Baseline','Data','Location','NorthWest');
legend boxoff
set(h,'FontSize',25,'interpreter', 'latex'); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
ylabel('Gini','fontsize',24,'FontWeight','bold');
ytickformat('%.1f')
set(gca,'FontSize',20)
saveas(gcf,'Optimum_ginis_data.png')

figure
plot(var_baseline,'LineWidth',2.5,'Color','black')
hold off
grid on
h=legend('Baseline','Location','NorthWest');
legend boxoff
set(h,'FontSize',25,'interpreter', 'latex'); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
ylabel('Var [log Earnings]','fontsize',24,'FontWeight','bold');
ytickformat('%.4f')
set(gca,'FontSize',20)
saveas(gcf,'Optimum_var_data.png')

model_wages_survey=wages_survey;
save('model_wages_survey.mat','model_wages_survey')

save('ave_xsim.mat','ave_xsim')
%% Optimization
disp(' ')
close all
clearvars -except optimum Nsim Nwork Ne xgrid data_fit data_gini Nmonths NPAR emp uegrid eugrid jjgrid xgrid sgrid
%
lb=zeros(NPAR,1);
ub=zeros(NPAR,1);
lb(1,1) = -0.5;
ub(1,1) = 1;
lb(2,1) = -0.004;
ub(2,1) = 0.003;
lb(3,1) = -0.0004;
ub(3,1) = 0.0003;
lb(4,1) = -Inf;
ub(4,1) = Inf;
lb(5,1) = -Inf;
ub(5,1) = Inf;
lb(6,1) = -Inf;
ub(6,1) = Inf;
lb(7,1) = 0;
ub(7,1) = 1;
lb(8,1) = -0.004;
ub(8,1) = 0.003;
lb(9,1) = -0.0003;
ub(9,1) = 0.0003;
lb(10,1) = 0;
ub(10,1) = 1;
lb(11,1) = -0.003;
ub(11,1) = 0.003;
lb(12,1) = -0.0003;
ub(12,1) = 0.0003;
lb(13,1) = 0;
ub(13,1) = 1;
lb(14,1) = -0.003;
ub(14,1) = 0.003;
lb(15,1) = -0.0004;
ub(15,1) = 0.0003;
lb(16,1) = 0;
ub(16,1) = 1;
lb(17,1) = -0.004;
ub(17,1) = 0.003;
lb(18,1) = -0.0003;
ub(18,1) = 0.0004;
lb(19,1) = 0;
ub(19,1) = 1;
lb(20,1) = -0.003;
ub(20,1) = 0.003;
lb(21,1) = -0.0003;
ub(21,1) = 0.0003;
lb(22,1) = 0;
ub(22,1) = 1;
lb(23,1) = -0.003;
ub(23,1) = 0.003;
lb(24,1) = -0.0003;
ub(24,1) = 0.0003;
beta=0.99;
%1.5534
% before=loss_simulat(param,Nsim,Nwork,Ne,xgrid,data_fit)
optimum=optimum(1:NPAR,1);
before=loss_simulat(optimum,Nsim,Nwork,Ne,xgrid,data_fit,Nmonths,beta,emp)

opts_pattern=psoptimset('Display','iter','TolMesh',1e-05,'MaxFunEvals',1000000,'MaxIter',1e6,'InitialMeshSize',1,'CompleteSearch','on','CompletePoll','on');%
% opts_fmincon = optimoptions('fmincon','Display','iter','Algorithm','sqp','MaxFunEvals',1000000,'MaxIter',1e6,'TolFun',1e-6);
%
optimum=patternsearch(@(x) loss_simulat(x,Nsim,Nwork,Ne,xgrid,data_fit,Nmonths,beta,emp),optimum,[],[],[],[],lb,ub,[],opts_pattern)
% optimum=patternsearch(@(x) loss_simulat(x,Nsim,Nwork,Ne,xgrid,data_fit),param,[],[],[],[],lb,ub,[],opts_pattern)
% optimum=fmincon(@(x) loss_simulat(x,Nsim,Nwork,Ne,xgrid,data_fit,Nmonths,beta),optimum,[],[],[],[],lb,ub,[],opts_fmincon)
%
disp(' ')
after=loss_simulat(optimum,Nsim,Nwork,Ne,xgrid,data_fit,Nmonths,beta,emp)
save('optimum.mat','optimum')

%Simulate Optimum:

[L_sim,ws_sim,JJ_sim,UE_sim,EU_sim,yd_w,V_u,V_w,xsim,EuE_change,JJ_change,ginic_baseline,var_baseline] = simulat(optimum,Nsim,Nwork,Ne,xgrid,Nmonths,beta);

% From *_sim arrays, create life-cycle profiles

b=(optimum(1)+optimum(2).*(1:Nwork)+optimum(3).*(1:Nwork).^2)';
Sig_e=sqrt(exp(optimum(4)+optimum(5).*(1:Nwork)+optimum(6).*(1:Nwork).^2))';
dj=(optimum(7)+optimum(8).*(1:Nwork)+optimum(9).*(1:Nwork).^2)';
du=(optimum(10)+optimum(11).*(1:Nwork)+optimum(12).*(1:Nwork).^2)';
fe=(optimum(13)+optimum(14).*(1:Nwork)+optimum(15).*(1:Nwork).^2)';
fu=(optimum(16)+optimum(17).*(1:Nwork)+optimum(18).*(1:Nwork).^2)';
ps=(optimum(19)+optimum(20).*(1:Nwork)+optimum(21).*(1:Nwork).^2)';
pk=(optimum(22)+optimum(23).*(1:Nwork)+optimum(24).*(1:Nwork).^2)';
%
du(du<0)=0;
du(du>1)=1;
dj(dj<0)=0;
dj(dj>1)=1;
fe(fe>1)=1;
fu(fu>1)=1;
fe(fe<0)=0;
fu(fu<0)=0;
ps(ps>1)=1;
ps(ps<0)=0;
pk(pk>1)=1;
pk(pk<0)=0;

employment   = mean(L_sim);
EuE_change   = nanmean(EuE_change);
JJ_change   = nanmean(JJ_change);
unemployment = 1-employment;
wages_demand = mean(mean(yd_w,3))';
wages_survey = sum(ws_sim,1) ./ sum(ws_sim~=0,1);
% job2job      = mean(JJ_sim);
job2job     =[1, sum(JJ_sim(:,2:Nmonths),1) ./ sum(L_sim(:,1:Nmonths-1)==1,1)];
% ave_V_u_a=mean(V_u,1);%average across k and hence shown by k
% ave_V_u_k=mean(V_u,2);%average across age and hence shown by age
% ave_V_w=mean(V_w,1);%average across epsilon
% ave_V_w=squeeze(ave_V_w);
% ave_V_w_a=mean(ave_V_w,1);%average across k and hence shown by k
% ave_V_w_k=mean(ave_V_w,2);%average across age and hence shown by age
%
ave_V_u_a=mean(V_u,1);%average across k and hence shown by age
ave_V_u_k=mean(V_u,2);%average across age and hence shown by k
ave_V_w=mean(V_w,1);%average across epsilon
ave_V_w=squeeze(ave_V_w);
int=mean(ave_V_w,3);
int=squeeze(int);
ave_V_w_a=mean(int,1);%average across k and hence shown by a
ave_V_w_k=mean(int,2);%average across age and hence shown by k
%
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

% wages2=ws_sim;
% wages2(wages2==0)=NaN;
% ginic_baseline=ginicoeff(wages2,1);
ginic_baseline = accumarray(ceil((1:numel(ginic_baseline))/12)',ginic_baseline(:),[],@nanmean);

error_JJ=10*((job2job(4:end)-data_fit(:,2))./1)'*((job2job(4:end)-data_fit(:,2))./1)
error_UE=2*((u2e(4:end)-data_fit(:,3))./1)'*((u2e(4:end)-data_fit(:,3))./1)
error_EU=3*((e2u(4:end)-data_fit(:,1))./1)'*((e2u(4:end)-data_fit(:,1))./1)
error_xgrid=.05*((wages_demand(4:end)-data_fit(:,4))./1)'*((wages_demand(4:end)-data_fit(:,4))./1)
error_sgrid=4*((wages_survey(4:end)-data_fit(:,5))./1)'*((wages_survey(4:end)-data_fit(:,5))./1)
error_EUE=3000*((mean(EuE_change)-data_fit(1,6))./1)'*((mean(EuE_change)-data_fit(1,6))./1)
error_JJG=1000*((mean(JJ_change)-data_fit(1,7))./1)'*((mean(JJ_change)-data_fit(1,7))./1)
% error_ineq=(1/4)*((ginic_baseline-data_gini(1:35))./1)'*((ginic_baseline-data_gini(1:35))./1)
error_emp=1*((employment(2:end,1)-emp(:,1))./1)'*((employment(2:end,1)-emp(:,1))./1)
loss=error_JJ+error_UE+error_EU+error_xgrid+error_sgrid+error_EUE+error_JJG+error_emp

mean_EuE_change=mean(EuE_change)
data_mean_EuE_change=data_fit(1,6)
mean_JJ_change=mean(JJ_change)
data_mean_JJ_change=data_fit(1,7)

figure
subplot(1,2,1)
plot(ave_V_u_a,'LineWidth',2.5)
hold on
plot(ave_V_w_a,'LineWidth',2.5)
hold off
grid on
h=legend('V_{U}^{a}','V_{W}^{a}','Location','NorthEast');
legend boxoff
set(h,'FontSize',18); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
ylabel('Value','fontsize',24,'FontWeight','bold');
% ylim([0 35])
% ytickformat('%.1f')
set(gca,'FontSize',20)
subplot(1,2,2)
plot(ave_V_u_k,'LineWidth',2.5)
hold on
plot(ave_V_w_k,'LineWidth',2.5)
hold off
grid on
h=legend('V_{U}^{x}','V_{W}^{x}','Location','NorthWest');
legend boxoff
set(h,'FontSize',18); 
axis tight
xlabel('x','fontsize',24,'FontWeight','bold')
ylabel('Value','fontsize',24,'FontWeight','bold');
% ylim([0 35])
% ytickformat('%.1f')
set(gca,'FontSize',20)
saveas(gcf,'Optimum_Vfs.png')%here

figure
subplot(1,3,1)
plot(fe,'LineWidth',2.5)
hold on
plot(fu,'LineWidth',2.5)
hold on
plot(ps,'LineWidth',2.5)
hold on
plot(pk,'LineWidth',2.5)
hold on
plot(du,'LineWidth',2.5)
hold on
plot(dj,'LineWidth',2.5)
hold off
grid on
h=legend('$f_t^E$','$f_t$','$s_t$','$\rho_x$','$\delta_{x}$','$\kappa_{x}$','Location','bestoutside');
legend boxoff
set(h,'FontSize',18,'interpreter', 'latex'); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
% ylabel('Probabilities','fontsize',24,'FontWeight','bold');
ylim([0 1])
ytickformat('%.2f')
set(gca,'FontSize',20)
subplot(1,3,2)
plot(b,'LineWidth',2.5,'Color','red')
grid on
h=legend('$b$','Location','NorthEast');
legend boxoff
set(h,'FontSize',18,'interpreter', 'latex'); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
% ylabel('Outside option','fontsize',24,'FontWeight','bold');
% yline(0,'LineWidth',2.5,'Color','black','LineStyle','--');
ytickformat('%.2f')
set(gca,'FontSize',20)
subplot(1,3,3)
plot(Sig_e,'LineWidth',2.5,'Color','magenta')
grid on
h=legend('$\sigma_{\epsilon}$','Location','NorthEast');
legend boxoff
set(h,'FontSize',18,'interpreter', 'latex'); 
axis tight
xlabel('x','fontsize',24,'FontWeight','bold')
% ylabel('Volatility','fontsize',24,'FontWeight','bold');
% yline(0,'LineWidth',2.5,'Color','black','LineStyle','--');
ytickformat('%.2f')
set(gca,'FontSize',20)
ylim([0 0.4])
saveas(gcf,'Optimum_probabilities.png')

figure
plot(ave_xsim,'LineWidth',2.5,'Color','black')
hold on
plot(ave_xsim+1.*sd_xsim,'LineWidth',2.5,'Color','black','LineStyle',':')
hold on
plot(ave_xsim-1.*sd_xsim,'LineWidth',2.5,'Color','black','LineStyle',':')
hold off
grid on
% h=legend('K','Location','NorthEast');
% legend boxoff
set(h,'FontSize',18); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
ylabel('x','fontsize',24,'FontWeight','bold');
% ylim([0 35])
% ytickformat('%.1f')
set(gca,'FontSize',20)
saveas(gcf,'Optimum_xsim.png')

figure
subplot(3,2,1)
plot(employment(1:34),'LineWidth',2.5,'Color','black')
hold on
plot(emp,'LineWidth',2.5,'LineStyle','--','Color','black')
hold on
plot(unemployment(1:34),'LineWidth',2.5,'Color','yellow')
hold on
plot(1-emp,'LineWidth',2.5,'LineStyle','--','Color','yellow')
hold off
grid on
% h=legend('Employment - Model','Employment - Data','Non-employment - Model','Non-employment - Data','Location','East');
% legend boxoff
% set(h,'FontSize',5); 
axis tight
xlabel('Age','fontsize',24)
% ylabel('Share','fontsize',24);
ylim([0 1])
ytickformat('%.2f')
yticks([0 0.2 0.4 0.6 0.8 1])
title('\color{black}Employment & Non-employment\color{black}, Share')
set(gca,'FontSize',10)
% job transition profiles
subplot(3,2,2)
plot(u2e(3:end),'LineWidth',2.5,'Color','cyan')
hold on
plot(uegrid,'LineWidth',2.5,'LineStyle','--','Color','cyan')
hold on
plot(e2u(3:end),'LineWidth',2.5,'Color','green')
hold on
plot(eugrid,'LineWidth',2.5,'LineStyle','--','Color','green')
grid on
% h=legend('UE - Model','UE - Data','EU - Model','EU - Data','Location','East');
% legend boxoff
% set(h,'FontSize',5); 
axis tight
xlabel('Age','fontsize',24)
% ylabel('Share','fontsize',24);
ylim([0 0.7])
ytickformat('%.2f')
yticks([0 0.2 0.4 0.6])
title('U\rightarrowE \color{black}& E\rightarrowU\color{black}, Share')
set(gca,'FontSize',10)
% J2J profiles
subplot(3,2,3)
plot(job2job(4:end),'LineWidth',2.5,'Color','magenta')
hold on
plot(jjgrid,'LineWidth',2.5,'LineStyle','--','Color','magenta')
grid on
% h=legend('JJ - Model','JJ - Data','Location','Northeast');
% legend boxoff
% set(h,'FontSize',10); 
axis tight
xlabel('Age','fontsize',24)
% ylabel('Share','fontsize',24);
ylim([0 0.4])
yticks([0 0.1 0.2 0.3 0.4])
title('J\rightarrowJ, Share')
set(gca,'FontSize',10)
ytickformat('%.2f')
% wage profiles
subplot(3,2,4)
plot(wages_demand,'LineWidth',2.5,'Color','blue')
hold on
plot(wages_survey,'LineWidth',2.5,'Color','red')
hold on
plot(xgrid,'LineWidth',2.5,'LineStyle','--','Color','blue')
hold on
plot(sgrid,'LineWidth',2.5,'LineStyle','--','Color','red')
hold off
grid on
% h=legend('Demand - Model','Supply - Model','Demand - Data','Supply - Data','Location','Southeast');
% legend boxoff
% set(h,'FontSize',5); 
axis tight
xlabel('Age','fontsize',24)
% ylabel('Wages (%)','fontsize',24);
% ylim([0 2])
ytickformat('%.2f')
title('Lifecycle Wages (%), Demand \color{black}& Supply')
set(gca,'FontSize',10)
subplot(3,2,5)
plot(EuE_change,'LineWidth',2.5,'Color','black')
hold on
yline(data_fit(1,6),'LineWidth',2.5,'Color','blue','LineStyle','--');
hold off
grid on
% h=legend('EUE Loss - Model','EUE Loss - Data','Location','NorthEast');
% legend boxoff
% set(h,'FontSize',10); 
axis tight
xlabel('Age','fontsize',24)
% ylabel('% Change','fontsize',24);
ylim([-0.06 0])
% ytickformat('%.1f')
yticks([-0.06 -0.04 -0.02  0])
title('E\rightarrowU\rightarrowE Loss, % Change')
set(gca,'FontSize',10)
subplot(3,2,6)
plot(JJ_change,'LineWidth',2.5,'Color','black')
hold on
yline(data_fit(1,7),'LineWidth',2.5,'Color','blue','LineStyle','--');
hold off
grid on
% h=legend('JJ Gain - Model','JJ Gain - Data','Location','SouthEast');
% legend boxoff
% set(h,'FontSize',10); 
axis tight
xlabel('Age','fontsize',24)
% ylabel('% Change','fontsize',24);
ylim([0 0.04])
% ytickformat('%.1f')
yticks([0 0.01 0.02 0.03 0.04])
set(gca,'FontSize',10)
title('J\rightarrowJ Gain, % Change')
set(gcf, 'PaperPosition', [0 0 20 15]); % 0 0 width height
saveas(gcf,'Optimum.png')

figure
plot(ginic_baseline,'LineWidth',2.5,'Color','black')
hold on
plot(data_gini(1:35),'LineWidth',2.5,'Color','black','LineStyle','--')
hold off
grid on
h=legend('Baseline','Data','Location','NorthWest');
legend boxoff
set(h,'FontSize',25,'interpreter', 'latex'); 
axis tight
xlabel('Age','fontsize',24,'FontWeight','bold')
ylabel('Gini','fontsize',24,'FontWeight','bold');
ytickformat('%.1f')
set(gca,'FontSize',20)
saveas(gcf,'Optimum_ginis_data.png')

disp(' ')
disp('Finished!')
beep on
