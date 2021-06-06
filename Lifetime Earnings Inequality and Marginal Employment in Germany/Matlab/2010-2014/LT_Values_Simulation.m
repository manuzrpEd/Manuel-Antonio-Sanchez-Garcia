
cd '\2005-2009'
clc
clear
close all
clear mex
set(0,'DefaultFigureWindowStyle','docked')
disp('LT Values Simulation, Males')
% Parameters
beta_estimate=0.95;
RR=0.6;
retirement=20;
%% Lifetime Values from workers, Unconditional Sample.
load('panel_wage_20052009.mat','panel_wage_20052009')
load('panel_wage_19992002.mat','panel_wage_19992002')

%present discounted sum of future income flows

%upon retiring, a given individual enjoys a residual present discounted sum
%of future income stream V_R
beta_20052009=zeros(size(panel_wage_20052009,1),size(panel_wage_20052009,2));
beta_19992002=zeros(size(panel_wage_19992002,1),size(panel_wage_20052009,2));
earnings_19992002=zeros(size(panel_wage_19992002,1),size(panel_wage_19992002,2));
earnings_20052009=zeros(size(panel_wage_20052009,1),size(panel_wage_20052009,2));
for s=1:size(panel_wage_20052009,2)
        beta_20052009(:,s)=beta_estimate^(s-1);
end
for s=1:size(panel_wage_20052009,2)
        beta_19992002(:,s)=beta_estimate^(s-1);
end
for i=1:size(panel_wage_20052009,1)
for s=1:size(panel_wage_20052009,2)
        earnings_20052009(i,s)=beta_20052009(i,s)*exp(panel_wage_20052009(i,s));
end
end
for i=1:size(panel_wage_19992002,1)
for s=1:size(panel_wage_19992002,2)
        earnings_19992002(i,s)=beta_19992002(i,s)*exp(panel_wage_19992002(i,s));
end
end
V_R_20052009=((1-beta_estimate^(retirement))/(1-beta_estimate))*RR*exp(panel_wage_20052009(:,end));
V_R_19992002=((1-beta_estimate^(retirement))/(1-beta_estimate))*RR*exp(panel_wage_19992002(:,end));
%
V_19992002=sum(earnings_19992002,2);
V_19992002=V_19992002+(beta_estimate^(retirement-1))*V_R_19992002;
V_20052009=sum(earnings_20052009,2);
V_20052009=V_20052009+(beta_estimate^(retirement-1))*V_R_20052009;
log_V_19992002=log(V_19992002);
log_V_20052009=log(V_20052009);
%
percentiles_19992002=zeros(10,1);
percentiles_20052009=zeros(10,1);
percentiles_19992002(1,1)=prctile(log_V_19992002,1);
percentiles_19992002(2,1)=prctile(log_V_19992002,5);
percentiles_19992002(3,1)=prctile(log_V_19992002,10);
percentiles_19992002(4,1)=prctile(log_V_19992002,25);
percentiles_19992002(5,1)=prctile(log_V_19992002,40);
percentiles_19992002(6,1)=prctile(log_V_19992002,60);
percentiles_19992002(7,1)=prctile(log_V_19992002,75);
percentiles_19992002(8,1)=prctile(log_V_19992002,90);
percentiles_19992002(9,1)=prctile(log_V_19992002,95);
percentiles_19992002(10,1)=prctile(log_V_19992002,99);
percentiles_20052009(1,1)=prctile(log_V_20052009,1);
percentiles_20052009(2,1)=prctile(log_V_20052009,5);
percentiles_20052009(3,1)=prctile(log_V_20052009,10);
percentiles_20052009(4,1)=prctile(log_V_20052009,25);
percentiles_20052009(5,1)=prctile(log_V_20052009,40);
percentiles_20052009(6,1)=prctile(log_V_20052009,60);
percentiles_20052009(7,1)=prctile(log_V_20052009,75);
percentiles_20052009(8,1)=prctile(log_V_20052009,90);
percentiles_20052009(9,1)=prctile(log_V_20052009,95);
percentiles_20052009(10,1)=prctile(log_V_20052009,99);
figure
plot(1:10,percentiles_19992002,'LineWidth',2.5,'Color','black')
hold on
plot(1:10,percentiles_20052009,'LineWidth',2.5,'Color','black','LineStyle','--')
hold off
grid on
axis tight
legend('1999-2002','2005-2009','Location','North')
xlabel('Deciles','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
y=ylabel('Log Lifetime Value','fontsize',24,'FontWeight','bold');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
% ylim([0.6 1])
print('percentiles_unconditional','-dpng')
%% Lifetime Values from workers, Full Time at t=1
load('panel_wage_20052009.mat','panel_wage_20052009')
load('panel_wage_19992002.mat','panel_wage_19992002')
load('panel_mob_20052009.mat','panel_mob_20052009')
load('panel_mob_19992002.mat','panel_mob_19992002')

panel_wage_19992002(panel_mob_19992002(:,1)~=1,:)=[];
panel_wage_20052009(panel_mob_20052009(:,1)~=1,:)=[];

%present discounted sum of future income flows

%upon retiring, a given individual enjoys a residual present discounted sum
%of future income stream V_R
beta_20052009=zeros(size(panel_wage_20052009,1),size(panel_wage_20052009,2));
beta_19992002=zeros(size(panel_wage_19992002,1),size(panel_wage_20052009,2));
earnings_19992002=zeros(size(panel_wage_19992002,1),size(panel_wage_19992002,2));
earnings_20052009=zeros(size(panel_wage_20052009,1),size(panel_wage_20052009,2));
for s=1:size(panel_wage_20052009,2)
        beta_20052009(:,s)=beta_estimate^(s-1);
end
for s=1:size(panel_wage_20052009,2)
        beta_19992002(:,s)=beta_estimate^(s-1);
end
for i=1:size(panel_wage_20052009,1)
for s=1:size(panel_wage_20052009,2)
        earnings_20052009(i,s)=beta_20052009(i,s)*exp(panel_wage_20052009(i,s));
end
end
for i=1:size(panel_wage_19992002,1)
for s=1:size(panel_wage_19992002,2)
        earnings_19992002(i,s)=beta_19992002(i,s)*exp(panel_wage_19992002(i,s));
end
end
V_R_20052009=((1-beta_estimate^(retirement))/(1-beta_estimate))*RR*exp(panel_wage_20052009(:,end));
V_R_19992002=((1-beta_estimate^(retirement))/(1-beta_estimate))*RR*exp(panel_wage_19992002(:,end));
%
V_19992002=sum(earnings_19992002,2);
V_19992002=V_19992002+(beta_estimate^(retirement-1))*V_R_19992002;
V_20052009=sum(earnings_20052009,2);
V_20052009=V_20052009+(beta_estimate^(retirement-1))*V_R_20052009;
log_V_19992002=log(V_19992002);
log_V_20052009=log(V_20052009);
%
percentiles_19992002=zeros(10,1);
percentiles_20052009=zeros(10,1);
percentiles_19992002(1,1)=prctile(log_V_19992002,1);
percentiles_19992002(2,1)=prctile(log_V_19992002,5);
percentiles_19992002(3,1)=prctile(log_V_19992002,10);
percentiles_19992002(4,1)=prctile(log_V_19992002,25);
percentiles_19992002(5,1)=prctile(log_V_19992002,40);
percentiles_19992002(6,1)=prctile(log_V_19992002,60);
percentiles_19992002(7,1)=prctile(log_V_19992002,75);
percentiles_19992002(8,1)=prctile(log_V_19992002,90);
percentiles_19992002(9,1)=prctile(log_V_19992002,95);
percentiles_19992002(10,1)=prctile(log_V_19992002,99);
percentiles_20052009(1,1)=prctile(log_V_20052009,1);
percentiles_20052009(2,1)=prctile(log_V_20052009,5);
percentiles_20052009(3,1)=prctile(log_V_20052009,10);
percentiles_20052009(4,1)=prctile(log_V_20052009,25);
percentiles_20052009(5,1)=prctile(log_V_20052009,40);
percentiles_20052009(6,1)=prctile(log_V_20052009,60);
percentiles_20052009(7,1)=prctile(log_V_20052009,75);
percentiles_20052009(8,1)=prctile(log_V_20052009,90);
percentiles_20052009(9,1)=prctile(log_V_20052009,95);
percentiles_20052009(10,1)=prctile(log_V_20052009,99);
figure
plot(1:10,percentiles_19992002,'LineWidth',2.5,'Color','black')
hold on
plot(1:10,percentiles_20052009,'LineWidth',2.5,'Color','black','LineStyle','--')
hold off
grid on
axis tight
legend('1999-2002','2005-2009','Location','North')
xlabel('Deciles','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
y=ylabel('Log Lifetime Value','fontsize',24,'FontWeight','bold');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
% ylim([0.6 1])
print('percentiles_FT','-dpng')
% %% Lifetime Values from workers, Part Time at t=1
% load('panel_wage_20052009.mat','panel_wage_20052009')
% load('panel_wage_19992002.mat','panel_wage_19992002')
% load('panel_mob_20052009.mat','panel_mob_20052009')
% load('panel_mob_19992002.mat','panel_mob_19992002')
% 
% panel_wage_19992002(panel_mob_19992002(:,1)~=2,:)=[];
% panel_wage_20052009(panel_mob_20052009(:,1)~=2,:)=[];
% 
% %present discounted sum of future income flows
% 
% %upon retiring, a given individual enjoys a residual present discounted sum
% %of future income stream V_R
% beta_20052009=zeros(size(panel_wage_20052009,1),size(panel_wage_20052009,2));
% beta_19992002=zeros(size(panel_wage_19992002,1),size(panel_wage_20052009,2));
% earnings_19992002=zeros(size(panel_wage_19992002,1),size(panel_wage_19992002,2));
% earnings_20052009=zeros(size(panel_wage_20052009,1),size(panel_wage_20052009,2));
% for s=1:size(panel_wage_20052009,2)
%         beta_20052009(:,s)=beta_estimate^(s-1);
% end
% for s=1:size(panel_wage_20052009,2)
%         beta_19992002(:,s)=beta_estimate^(s-1);
% end
% for i=1:size(panel_wage_20052009,1)
% for s=1:size(panel_wage_20052009,2)
%         earnings_20052009(i,s)=beta_20052009(i,s)*exp(panel_wage_20052009(i,s));
% end
% end
% for i=1:size(panel_wage_19992002,1)
% for s=1:size(panel_wage_19992002,2)
%         earnings_19992002(i,s)=beta_19992002(i,s)*exp(panel_wage_19992002(i,s));
% end
% end
% V_R_20052009=((1-beta_estimate^(retirement))/(1-beta_estimate))*RR*exp(panel_wage_20052009(:,end));
% V_R_19992002=((1-beta_estimate^(retirement))/(1-beta_estimate))*RR*exp(panel_wage_19992002(:,end));
% %
% V_19992002=sum(earnings_19992002,2);
% V_19992002=V_19992002+(beta_estimate^(retirement-1))*V_R_19992002;
% V_20052009=sum(earnings_20052009,2);
% V_20052009=V_20052009+(beta_estimate^(retirement-1))*V_R_20052009;
% log_V_19992002=log(V_19992002);
% log_V_20052009=log(V_20052009);
% %
% percentiles_19992002=zeros(10,1);
% percentiles_20052009=zeros(10,1);
% percentiles_19992002(1,1)=prctile(log_V_19992002,1);
% percentiles_19992002(2,1)=prctile(log_V_19992002,5);
% percentiles_19992002(3,1)=prctile(log_V_19992002,10);
% percentiles_19992002(4,1)=prctile(log_V_19992002,25);
% percentiles_19992002(5,1)=prctile(log_V_19992002,40);
% percentiles_19992002(6,1)=prctile(log_V_19992002,60);
% percentiles_19992002(7,1)=prctile(log_V_19992002,75);
% percentiles_19992002(8,1)=prctile(log_V_19992002,90);
% percentiles_19992002(9,1)=prctile(log_V_19992002,95);
% percentiles_19992002(10,1)=prctile(log_V_19992002,99);
% percentiles_20052009(1,1)=prctile(log_V_20052009,1);
% percentiles_20052009(2,1)=prctile(log_V_20052009,5);
% percentiles_20052009(3,1)=prctile(log_V_20052009,10);
% percentiles_20052009(4,1)=prctile(log_V_20052009,25);
% percentiles_20052009(5,1)=prctile(log_V_20052009,40);
% percentiles_20052009(6,1)=prctile(log_V_20052009,60);
% percentiles_20052009(7,1)=prctile(log_V_20052009,75);
% percentiles_20052009(8,1)=prctile(log_V_20052009,90);
% percentiles_20052009(9,1)=prctile(log_V_20052009,95);
% percentiles_20052009(10,1)=prctile(log_V_20052009,99);
% figure
% plot(1:10,percentiles_19992002,'LineWidth',2.5,'Color','black')
% hold on
% plot(1:10,percentiles_20052009,'LineWidth',2.5,'Color','black','LineStyle','--')
% hold off
% grid on
% axis tight
% legend('1999-2002','2005-2009','Location','North')
% xlabel('Deciles','fontsize',24,'FontWeight','bold')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 24)
% y=ylabel('Log Lifetime Value','fontsize',24,'FontWeight','bold');
% set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
% % ylim([0.6 1])
% print('percentiles_PT','-dpng')
%% Lifetime Values from workers, Marginally Employed at t=1
load('panel_wage_20052009.mat','panel_wage_20052009')
load('panel_wage_19992002.mat','panel_wage_19992002')
load('panel_mob_20052009.mat','panel_mob_20052009')
load('panel_mob_19992002.mat','panel_mob_19992002')

panel_wage_19992002(panel_mob_19992002(:,1)~=3,:)=[];
panel_wage_20052009(panel_mob_20052009(:,1)~=3,:)=[];

%present discounted sum of future income flows

%upon retiring, a given individual enjoys a residual present discounted sum
%of future income stream V_R
beta_20052009=zeros(size(panel_wage_20052009,1),size(panel_wage_20052009,2));
beta_19992002=zeros(size(panel_wage_19992002,1),size(panel_wage_20052009,2));
earnings_19992002=zeros(size(panel_wage_19992002,1),size(panel_wage_19992002,2));
earnings_20052009=zeros(size(panel_wage_20052009,1),size(panel_wage_20052009,2));
for s=1:size(panel_wage_20052009,2)
        beta_20052009(:,s)=beta_estimate^(s-1);
end
for s=1:size(panel_wage_20052009,2)
        beta_19992002(:,s)=beta_estimate^(s-1);
end
for i=1:size(panel_wage_20052009,1)
for s=1:size(panel_wage_20052009,2)
        earnings_20052009(i,s)=beta_20052009(i,s)*exp(panel_wage_20052009(i,s));
end
end
for i=1:size(panel_wage_19992002,1)
for s=1:size(panel_wage_19992002,2)
        earnings_19992002(i,s)=beta_19992002(i,s)*exp(panel_wage_19992002(i,s));
end
end
V_R_20052009=((1-beta_estimate^(retirement))/(1-beta_estimate))*RR*exp(panel_wage_20052009(:,end));
V_R_19992002=((1-beta_estimate^(retirement))/(1-beta_estimate))*RR*exp(panel_wage_19992002(:,end));
%
V_19992002=sum(earnings_19992002,2);
V_19992002=V_19992002+(beta_estimate^(retirement-1))*V_R_19992002;
V_20052009=sum(earnings_20052009,2);
V_20052009=V_20052009+(beta_estimate^(retirement-1))*V_R_20052009;
log_V_19992002=log(V_19992002);
log_V_20052009=log(V_20052009);
%
percentiles_19992002=zeros(10,1);
percentiles_20052009=zeros(10,1);
percentiles_19992002(1,1)=prctile(log_V_19992002,1);
percentiles_19992002(2,1)=prctile(log_V_19992002,5);
percentiles_19992002(3,1)=prctile(log_V_19992002,10);
percentiles_19992002(4,1)=prctile(log_V_19992002,25);
percentiles_19992002(5,1)=prctile(log_V_19992002,40);
percentiles_19992002(6,1)=prctile(log_V_19992002,60);
percentiles_19992002(7,1)=prctile(log_V_19992002,75);
percentiles_19992002(8,1)=prctile(log_V_19992002,90);
percentiles_19992002(9,1)=prctile(log_V_19992002,95);
percentiles_19992002(10,1)=prctile(log_V_19992002,99);
percentiles_20052009(1,1)=prctile(log_V_20052009,1);
percentiles_20052009(2,1)=prctile(log_V_20052009,5);
percentiles_20052009(3,1)=prctile(log_V_20052009,10);
percentiles_20052009(4,1)=prctile(log_V_20052009,25);
percentiles_20052009(5,1)=prctile(log_V_20052009,40);
percentiles_20052009(6,1)=prctile(log_V_20052009,60);
percentiles_20052009(7,1)=prctile(log_V_20052009,75);
percentiles_20052009(8,1)=prctile(log_V_20052009,90);
percentiles_20052009(9,1)=prctile(log_V_20052009,95);
percentiles_20052009(10,1)=prctile(log_V_20052009,99);
figure
plot(1:10,percentiles_19992002,'LineWidth',2.5,'Color','black')
hold on
plot(1:10,percentiles_20052009,'LineWidth',2.5,'Color','black','LineStyle','--')
hold off
grid on
axis tight
legend('1999-2002','2005-2009','Location','North')
xlabel('Deciles','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
y=ylabel('Log Lifetime Value','fontsize',24,'FontWeight','bold');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
% ylim([0.6 1])
print('percentiles_ME','-dpng')
%% Lifetime Values from workers, Non-Employment at t=1
load('panel_wage_20052009.mat','panel_wage_20052009')
load('panel_wage_19992002.mat','panel_wage_19992002')
load('panel_mob_20052009.mat','panel_mob_20052009')
load('panel_mob_19992002.mat','panel_mob_19992002')

panel_wage_19992002(panel_mob_19992002(:,13)~=4,:)=[];
panel_wage_20052009(panel_mob_20052009(:,13)~=4,:)=[];

%present discounted sum of future income flows

%upon retiring, a given individual enjoys a residual present discounted sum
%of future income stream V_R
beta_20052009=zeros(size(panel_wage_20052009,1),size(panel_wage_20052009,2));
beta_19992002=zeros(size(panel_wage_19992002,1),size(panel_wage_20052009,2));
earnings_19992002=zeros(size(panel_wage_19992002,1),size(panel_wage_19992002,2));
earnings_20052009=zeros(size(panel_wage_20052009,1),size(panel_wage_20052009,2));
for s=1:size(panel_wage_20052009,2)
        beta_20052009(:,s)=beta_estimate^(s-1);
end
for s=1:size(panel_wage_20052009,2)
        beta_19992002(:,s)=beta_estimate^(s-1);
end
for i=1:size(panel_wage_20052009,1)
for s=1:size(panel_wage_20052009,2)
        earnings_20052009(i,s)=beta_20052009(i,s)*exp(panel_wage_20052009(i,s));
end
end
for i=1:size(panel_wage_19992002,1)
for s=1:size(panel_wage_19992002,2)
        earnings_19992002(i,s)=beta_19992002(i,s)*exp(panel_wage_19992002(i,s));
end
end
V_R_20052009=((1-beta_estimate^(retirement))/(1-beta_estimate))*RR*exp(panel_wage_20052009(:,end));
V_R_19992002=((1-beta_estimate^(retirement))/(1-beta_estimate))*RR*exp(panel_wage_19992002(:,end));
%
V_19992002=sum(earnings_19992002,2);
V_19992002=V_19992002+(beta_estimate^(retirement-1))*V_R_19992002;
V_20052009=sum(earnings_20052009,2);
V_20052009=V_20052009+(beta_estimate^(retirement-1))*V_R_20052009;
log_V_19992002=log(V_19992002);
log_V_20052009=log(V_20052009);
%
percentiles_19992002=zeros(10,1);
percentiles_20052009=zeros(10,1);
percentiles_19992002(1,1)=prctile(log_V_19992002,1);
percentiles_19992002(2,1)=prctile(log_V_19992002,5);
percentiles_19992002(3,1)=prctile(log_V_19992002,10);
percentiles_19992002(4,1)=prctile(log_V_19992002,25);
percentiles_19992002(5,1)=prctile(log_V_19992002,40);
percentiles_19992002(6,1)=prctile(log_V_19992002,60);
percentiles_19992002(7,1)=prctile(log_V_19992002,75);
percentiles_19992002(8,1)=prctile(log_V_19992002,90);
percentiles_19992002(9,1)=prctile(log_V_19992002,95);
percentiles_19992002(10,1)=prctile(log_V_19992002,99);
percentiles_20052009(1,1)=prctile(log_V_20052009,1);
percentiles_20052009(2,1)=prctile(log_V_20052009,5);
percentiles_20052009(3,1)=prctile(log_V_20052009,10);
percentiles_20052009(4,1)=prctile(log_V_20052009,25);
percentiles_20052009(5,1)=prctile(log_V_20052009,40);
percentiles_20052009(6,1)=prctile(log_V_20052009,60);
percentiles_20052009(7,1)=prctile(log_V_20052009,75);
percentiles_20052009(8,1)=prctile(log_V_20052009,90);
percentiles_20052009(9,1)=prctile(log_V_20052009,95);
percentiles_20052009(10,1)=prctile(log_V_20052009,99);
figure
plot(1:10,percentiles_19992002,'LineWidth',2.5,'Color','black')
hold on
plot(1:10,percentiles_20052009,'LineWidth',2.5,'Color','black','LineStyle','--')
hold off
grid on
axis tight
legend('1999-2002','2005-2009','Location','North')
xlabel('Deciles','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
y=ylabel('Log Lifetime Value','fontsize',24,'FontWeight','bold');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
% ylim([0.6 1])
print('percentiles_NE','-dpng')
%% Lifetime Values from workers, Non-Employment at t=1
% load('panel_wage_20052009.mat','panel_wage_20052009')
% load('panel_wage_19992002.mat','panel_wage_19992002')
% load('panel_mob_20052009.mat','panel_mob_20052009')
% load('panel_mob_19992002.mat','panel_mob_19992002')
% 
% panel_wage_19992002(panel_mob_19992002(:,1)~=5,:)=[];
% panel_wage_20052009(panel_mob_20052009(:,1)~=5,:)=[];
% 
% %present discounted sum of future income flows
% 
% %upon retiring, a given individual enjoys a residual present discounted sum
% %of future income stream V_R
% beta_20052009=zeros(size(panel_wage_20052009,1),size(panel_wage_20052009,2));
% beta_19992002=zeros(size(panel_wage_19992002,1),size(panel_wage_20052009,2));
% earnings_19992002=zeros(size(panel_wage_19992002,1),size(panel_wage_19992002,2));
% earnings_20052009=zeros(size(panel_wage_20052009,1),size(panel_wage_20052009,2));
% for s=1:size(panel_wage_20052009,2)
%         beta_20052009(:,s)=beta_estimate^(s-1);
% end
% for s=1:size(panel_wage_20052009,2)
%         beta_19992002(:,s)=beta_estimate^(s-1);
% end
% for i=1:size(panel_wage_20052009,1)
% for s=1:size(panel_wage_20052009,2)
%         earnings_20052009(i,s)=beta_20052009(i,s)*exp(panel_wage_20052009(i,s));
% end
% end
% for i=1:size(panel_wage_19992002,1)
% for s=1:size(panel_wage_19992002,2)
%         earnings_19992002(i,s)=beta_19992002(i,s)*exp(panel_wage_19992002(i,s));
% end
% end
% V_R_20052009=((1-beta_estimate^(retirement))/(1-beta_estimate))*RR*exp(panel_wage_20052009(:,end));
% V_R_19992002=((1-beta_estimate^(retirement))/(1-beta_estimate))*RR*exp(panel_wage_19992002(:,end));
% %
% V_19992002=sum(earnings_19992002,2);
% V_19992002=V_19992002+(beta_estimate^(retirement-1))*V_R_19992002;
% V_20052009=sum(earnings_20052009,2);
% V_20052009=V_20052009+(beta_estimate^(retirement-1))*V_R_20052009;
% log_V_19992002=log(V_19992002);
% log_V_20052009=log(V_20052009);
% %
% percentiles_19992002=zeros(10,1);
% percentiles_20052009=zeros(10,1);
% percentiles_19992002(1,1)=prctile(log_V_19992002,1);
% percentiles_19992002(2,1)=prctile(log_V_19992002,5);
% percentiles_19992002(3,1)=prctile(log_V_19992002,10);
% percentiles_19992002(4,1)=prctile(log_V_19992002,25);
% percentiles_19992002(5,1)=prctile(log_V_19992002,40);
% percentiles_19992002(6,1)=prctile(log_V_19992002,60);
% percentiles_19992002(7,1)=prctile(log_V_19992002,75);
% percentiles_19992002(8,1)=prctile(log_V_19992002,90);
% percentiles_19992002(9,1)=prctile(log_V_19992002,95);
% percentiles_19992002(10,1)=prctile(log_V_19992002,99);
% percentiles_20052009(1,1)=prctile(log_V_20052009,1);
% percentiles_20052009(2,1)=prctile(log_V_20052009,5);
% percentiles_20052009(3,1)=prctile(log_V_20052009,10);
% percentiles_20052009(4,1)=prctile(log_V_20052009,25);
% percentiles_20052009(5,1)=prctile(log_V_20052009,40);
% percentiles_20052009(6,1)=prctile(log_V_20052009,60);
% percentiles_20052009(7,1)=prctile(log_V_20052009,75);
% percentiles_20052009(8,1)=prctile(log_V_20052009,90);
% percentiles_20052009(9,1)=prctile(log_V_20052009,95);
% percentiles_20052009(10,1)=prctile(log_V_20052009,99);
% figure
% plot(1:10,percentiles_19992002,'LineWidth',2.5,'Color','black')
% hold on
% plot(1:10,percentiles_20052009,'LineWidth',2.5,'Color','black','LineStyle','--')
% hold off
% grid on
% axis tight
% legend('1999-2002','2005-2009','Location','North')
% xlabel('Deciles','fontsize',24,'FontWeight','bold')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 24)
% y=ylabel('Log Lifetime Value','fontsize',24,'FontWeight','bold');
% set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
% % ylim([0.6 1])
% print('percentiles_CJ','-dpng')
%%
disp('Finished!')
beep