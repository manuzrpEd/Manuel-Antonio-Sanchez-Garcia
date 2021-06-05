close all
clear
clear mex
clc
load('mom_bootstrap.mat','mom_bootstrap')
load('data_simplified.mat','data_simplified')
%
col=31;
T=32;
draws=100;%
%
outbound=NaN(col,draws);
mean=NaN(col,draws);
fract_p=NaN(col,draws);
kurt_cs=NaN(col,draws);
skew=NaN(col,draws);
skew_kelly=NaN(col,draws);
var_p=NaN(col,draws);
var_n=NaN(col,draws);
mean_n=NaN(col,draws);
mean_p=NaN(col,draws);
covar1_p=NaN(col,draws);
covar1_n=NaN(col,draws);
covar2_p=NaN(col,draws);
covar2_n=NaN(col,draws);
hump=NaN(T,draws);
unc_var=NaN(col,draws);
M_ave=NaN(col,draws);
%
for i=1:draws
    outbound(:,i)=mom_bootstrap(i).outbound;
    mean(:,i)=mom_bootstrap(i).mean;
    fract_p(:,i)=mom_bootstrap(i).fract_p;
    kurt_cs(:,i)=mom_bootstrap(i).kurt_cs;
    skew(:,i)=mom_bootstrap(i).skew;
    skew_kelly(:,i)=mom_bootstrap(i).skew_kelly;
    var_p(:,i)=mom_bootstrap(i).var_p;
    var_n(:,i)=mom_bootstrap(i).var_n;
    mean_n(:,i)=mom_bootstrap(i).mean_n;
    mean_p(:,i)=mom_bootstrap(i).mean_p;
    covar1_p(:,i)=mom_bootstrap(i).covar1_p;
    covar1_n(:,i)=mom_bootstrap(i).covar1_n;
    covar2_p(:,i)=mom_bootstrap(i).covar2_p;
    covar2_n(:,i)=mom_bootstrap(i).covar2_n;
    hump(:,i)=mom_bootstrap(i).hump;
    unc_var(:,i)=mom_bootstrap(i).unc_var;
    M_ave(:,i)=mom_bootstrap(i).M_ave;
end
%
outbound=sort(outbound,2);
mean=sort(mean,2);
fract_p=sort(fract_p,2);
kurt_cs=sort(kurt_cs,2);
skew=sort(skew,2);
skew_kelly=sort(skew_kelly,2);
var_p=sort(var_p,2);
var_n=sort(var_n,2);
mean_n=sort(mean_n,2);
mean_p=sort(mean_p,2);
covar1_p=sort(covar1_p,2);
covar1_n=sort(covar1_n,2);
covar2_p=sort(covar2_p,2);
covar2_n=sort(covar2_n,2);
hump=sort(hump,2);
unc_var=sort(unc_var,2);
M_ave=sort(M_ave,2);
%
outbound=outbound(:,6:95);
mean=mean(:,6:95);
fract_p=fract_p(:,6:95);
kurt_cs=kurt_cs(:,6:95);
skew=skew(:,6:95);
skew_kelly=skew_kelly(:,6:95);
var_p=var_p(:,6:95);
var_n=var_n(:,6:95);
mean_n=mean_n(:,6:95);
mean_p=mean_p(:,6:95);
covar1_p=covar1_p(:,6:95);
covar1_n=covar1_n(:,6:95);
covar2_p=covar2_p(:,6:95);
covar2_n=covar2_n(:,6:95);
hump=hump(:,6:95);
unc_var=unc_var(:,6:95);
M_ave=M_ave(:,6:95);
%
outbound=[outbound(:,1) outbound(:,end)];
mean=[mean(:,1) mean(:,end)];
fract_p=[fract_p(:,1) fract_p(:,end)];
kurt_cs=[kurt_cs(:,1) kurt_cs(:,end)];
skew=[skew(:,1) skew(:,end)];
skew_kelly=[skew_kelly(:,1) skew_kelly(:,end)];
var_p=[var_p(:,1) var_p(:,end)];
var_n=[var_n(:,1) var_n(:,end)];
mean_n=[mean_n(:,1) mean_n(:,end)];
mean_p=[mean_p(:,1) mean_p(:,end)];
covar1_p=[covar1_p(:,1) covar1_p(:,end)];
covar1_n=[covar1_n(:,1) covar1_n(:,end)];
covar2_p=[covar2_p(:,1) covar2_p(:,end)];
covar2_n=[covar2_n(:,1) covar2_n(:,end)];
hump=[hump(:,1) hump(:,end)];
unc_var=[unc_var(:,1) unc_var(:,end)];
M_ave=[M_ave(:,1) M_ave(:,end)];
%
%
%Figures
set(0,'DefaultFigureWindowStyle','docked')
figure
plot(25:55,data_simplified.mean_p,'LineWidth',2.5, 'Color', 'red')
hold on
plot(25:55,data_simplified.mean_n,'LineWidth',2.5, 'Color', 'green','LineStyle','--')
hold on
plot(25:55,mean_p(:,1),'LineWidth',2.5, 'Color', 'red','LineStyle','-.')
hold on
plot(25:55,mean_p(:,2),'LineWidth',2.5, 'Color', 'red','LineStyle','-.')
hold on
plot(25:55,mean_n(:,1),'LineWidth',2.5, 'Color', 'green','LineStyle','-.')
hold on
plot(25:55,mean_n(:,2),'LineWidth',2.5, 'Color', 'green','LineStyle','-.')
hold on
line([25 55],[0 0],'LineWidth',2.5,'LineStyle',':', 'Color', 'black')
hold off
grid on
h=legend('Positive','Negative','Location','North');
set(h,'FontSize',20); 
axis tight
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
y=ylabel('$E [g_{i,h} | g_{i,h} > 0,  g_{i,h} < 0]$','fontsize',24,'FontWeight','bold','interpreter','latex');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
xlabel('Age','fontsize',24,'FontWeight','bold')
ylim([-0.3 0.4])
print('MEG_ci_mean','-depsc')
%
figure
plot(25:55,data_simplified.var_p,'LineWidth',2.5, 'Color', 'red')
hold on
plot(25:55,data_simplified.var_n,'LineWidth',2.5, 'Color', 'green','LineStyle','--')
hold on
plot(25:55,var_p(:,1),'LineWidth',2.5, 'Color', 'red','LineStyle','-.')
hold on
plot(25:55,var_p(:,2),'LineWidth',2.5, 'Color', 'red','LineStyle','-.')
hold on
plot(25:55,var_n(:,1),'LineWidth',2.5, 'Color', 'green','LineStyle','-.')
hold on
plot(25:55,var_n(:,2),'LineWidth',2.5, 'Color', 'green','LineStyle','-.')
hold off
grid on
h=legend('Positive','Negative','Location','North');
set(h,'FontSize',20); 
axis tight
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
xlabel('Age','fontsize',24,'FontWeight','bold')
y=ylabel('$Var [g_{i,h} | g_{i,h} > 0,  g_{i,h} < 0]$','fontsize',24,'FontWeight','bold','interpreter','latex');
% yticks(0.04:0.04:0.2)
ylim([0.04 0.16])
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
print('MEG_ci_var','-depsc')
%
figure
plot(25:1:55, data_simplified.unc_var,'LineWidth',2.5,'Color', 'blue')
hold on
plot(25:55,unc_var(:,1),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
plot(25:55,unc_var(:,2),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold off
grid on
axis tight
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
xlabel('Age','fontsize',24,'FontWeight','bold')
y=ylabel('$Var [g_{i,h}]$','fontsize',24,'FontWeight','bold','interpreter','latex');
% yticks(0.04:0.04:0.2)
ylim([0.04 0.16])
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
print('MEG_ci_LCV','-depsc')
%
%
figure
plot(25:55,data_simplified.skew,'LineWidth',2.5, 'Color', 'blue')
hold on
plot(25:55,skew(:,1),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
plot(25:55,skew(:,2),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
line([25 55],[0 0],'LineWidth',2.5,'LineStyle',':', 'Color', 'black')
hold off
grid on
axis tight
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
xlabel('Age','fontsize',24,'FontWeight','bold')
y=ylabel('$Skew [g_{i,h}]$','fontsize',24,'FontWeight','bold','interpreter','latex');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([-1.5 1.5])
% yticks(-1:0.5:1)
print('MEG_ci_skew','-depsc')
%
figure
plot(25:55,data_simplified.skew_kelly,'LineWidth',2.5, 'Color', 'blue')
hold on
plot(25:55,skew_kelly(:,1),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
plot(25:55,skew_kelly(:,2),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
line([25 55],[0 0],'LineWidth',2.5,'LineStyle',':', 'Color', 'black')
hold off
grid on
axis tight
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
xlabel('Age','fontsize',24,'FontWeight','bold')
y=ylabel('$Skewness [g_{i,h}]$','fontsize',24,'FontWeight','bold','interpreter','latex');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([-0.5 0.5])
print('MEG_ci_skew_kelly','-depsc')
%
figure
plot(25:1:55,data_simplified.fract_p(1:31),'LineWidth',2.5,'Color','blue')
hold on
plot(25:55,fract_p(:,1),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
plot(25:55,fract_p(:,2),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold off
grid on
axis tight
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
xlabel('Age','fontsize',24,'FontWeight','bold')
y=ylabel('$Prob [g_{i,h} > 0]$','fontsize',24,'FontWeight','bold','interpreter','latex');
set(y, 'Units', 'Normalized', 'Position', [-0.11, 0.5, 0]);
ylim([0.2 0.8])
print('MEG_ci_fractionp','-depsc')
%
figure
plot(25:55,data_simplified.kurt_cs,'LineWidth',2.5, 'Color', 'blue')
hold on
plot(25:55,kurt_cs(:,1),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
plot(25:55,kurt_cs(:,2),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
line([25 55],[3 3],'LineWidth',2.5,'LineStyle',':', 'Color', 'black')
hold off
grid on
axis tight
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
xlabel('Age','fontsize',24,'FontWeight','bold')
y=ylabel('$Kurtosis [g_{i,h}]$','fontsize',24,'FontWeight','bold','interpreter','latex');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([0 30])
print('MEG_ci_kurt_cs','-depsc')

%
figure
plot(25:1:54,data_simplified.covar1_p(1:30),'LineWidth',2.5,'Color','red')
hold on
plot(25:1:54,data_simplified.covar1_n(1:30),'LineWidth',2.5,'Color','green','LineStyle','--')
hold on
plot(25:55,covar1_p(:,1),'LineWidth',2.5, 'Color', 'red','LineStyle','-.')
hold on
plot(25:55,covar1_p(:,2),'LineWidth',2.5, 'Color', 'red','LineStyle','-.')
hold on
plot(25:55,covar1_n(:,1),'LineWidth',2.5, 'Color', 'green','LineStyle','-.')
hold on
plot(25:55,covar1_n(:,2),'LineWidth',2.5, 'Color', 'green','LineStyle','-.')
hold on
line([25 54],[0 0],'LineWidth',2.5,'LineStyle',':', 'Color', 'black')
hold off
grid on
h=legend('Positive','Negative','Location','South');
set(h,'FontSize',20); 
axis tight
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
xlabel('Age','fontsize',24,'FontWeight','bold')
y=ylabel({'$E[g_{i,h}*g_{i,h+1} | g_{i,h} > 0,  g_{i,h} < 0]$'},'fontsize',24,'FontWeight','bold','interpreter','latex');
set(y, 'Units', 'Normalized', 'Position', [-0.14, 0.5, 0]);
ylim([-0.08 0.02])
print('MEG_ci_1stcov','-depsc')
%
figure
plot(25:1:53,data_simplified.covar2_p(1:29),'LineWidth',2.5,'Color','red')
hold on
plot(25:1:53,data_simplified.covar2_n(1:29),'LineWidth',2.5,'Color','green','LineStyle','--')
hold on
plot(25:53,covar2_p(1:29,1),'LineWidth',2.5, 'Color', 'red','LineStyle','-.')
hold on
plot(25:53,covar2_p(1:29,2),'LineWidth',2.5, 'Color', 'red','LineStyle','-.')
hold on
plot(25:53,covar2_n(1:29,1),'LineWidth',2.5, 'Color', 'green','LineStyle','-.')
hold on
plot(25:53,covar2_n(1:29,2),'LineWidth',2.5, 'Color', 'green','LineStyle','-.')
hold on
line([25 53],[0 0],'LineWidth',2.5,'LineStyle',':', 'Color', 'black')
hold off
grid on
h=legend('Positive','Negative','Location','South');
set(h,'FontSize',20); 
axis tight
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
xlabel('Age','fontsize',24,'FontWeight','bold')
y=ylabel('$E[g_{i,h}*g_{i,h+2} | g_{i,h} > 0,  g_{i,h} < 0]$','fontsize',24,'FontWeight','bold','interpreter','latex');
set(y, 'Units', 'Normalized', 'Position', [-0.11, 0.5, 0]);
print('MEG_ci_2ndcov','-depsc')

%
figure
plot(25:1:55,data_simplified.mean(1:31),'LineWidth',2.5,'Color','blue')
hold on
plot(25:55,mean(:,1),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
plot(25:55,mean(:,2),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
line([25 55],[0 0],'LineWidth',2.5,'LineStyle',':', 'Color', 'black')
hold off
grid on
axis tight
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
xlabel('Age','fontsize',24,'FontWeight','bold')
y=ylabel('$E [g_{i,h}]$','fontsize',24,'FontWeight','bold','interpreter','latex');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([-0.04 0.08])
print('MEG_ci_uncmean','-depsc')
%
sigma_s=sqrt(data_simplified.unc_var);
share=zeros(col,1);
for t=1:col
    aux = sigma_s(t,1)*randn(20000,1);
    share(t,1) = sum(logical(aux>=-0.05).*logical(aux<=0.05))/length(aux);
end
share=1-share
max_share_diff=max(share)-min(share)
cs_share=sum(share)/length(share)
%
cs_share_data=sum(data_simplified.outbound(:,1))/length(data_simplified.outbound(:,1))
%
figure
plot(25:55,data_simplified.outbound(1:31),'LineWidth',2.5,'Color','blue')
hold on
plot(25:55,outbound(:,1),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
plot(25:55,outbound(:,2),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
plot(25:55,share,'LineWidth',2.5, 'Color', 'black','LineStyle',':')
axis tight
hold off
grid on
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
xlabel('Age','fontsize',24,'FontWeight','bold')
y=ylabel('$Prob [|g_{i,h}| > 0.05]$','fontsize',24,'FontWeight','bold','interpreter','latex');
set(y, 'Units', 'Normalized', 'Position', [-0.11, 0.5, 0]);
ylim([0 1])
print('MEG_ci_outbound','-depsc')
%
figure
plot(data_simplified.M_ave(1:5), 'Color', 'blue','LineWidth',2)
hold on
plot(M_ave(1:5,1),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
plot(M_ave(1:5,2),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold off
grid on
axis tight
set(gca,'XTick',[1 2 3 4 5] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[0 1 2 3 4] ); %This is what it's going to appear in those places.
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
xlabel('Leads','fontsize',24,'FontWeight','bold')
y=ylabel('Covariances (0-4)','fontsize',24);
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
print('MEG_ci_2UNCACV','-depsc')
%
figure
plot(data_simplified.M_ave(3:end), 'Color', 'blue','LineWidth',2)
hold on
plot(M_ave(3:end,1),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
plot(M_ave(3:end,2),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold off
grid on
axis tight
set(gca,'XTick',[1 6 11 16 21 26] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[2 7 12 17 22 27] ); %This is what it's going to appear in those places.
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
xlabel('Leads','fontsize',24,'FontWeight','bold')
y=ylabel('Covariances (2-30)','fontsize',24);
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
print('MEG_ci_3UNCACV','-depsc')
%
