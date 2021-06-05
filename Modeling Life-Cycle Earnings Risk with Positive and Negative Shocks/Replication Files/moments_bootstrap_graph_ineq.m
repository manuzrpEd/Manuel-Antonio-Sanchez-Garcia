close all
clear
clear mex
clc
load('mom_bootstrap_ineq.mat','mom_bootstrap_ineq')
load('data_simplified.mat','data_simplified')
%
col=31;
T=32;
draws=100;%
%
hump=NaN(T,draws);
%
for i=1:draws
    hump(:,i)=mom_bootstrap_ineq(i,:);
end
%
hump=sort(hump,2);
%
hump=hump(:,6:95);
%
hump=[hump(:,1) hump(:,end)];
%
%
%Figures
figure
plot(24:1:55, data_simplified.hump,'LineWidth',2.5,'Color', 'blue')
hold on
plot(24:1:55,hump(:,1),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold on
plot(24:1:55,hump(:,2),'LineWidth',2.5, 'Color', 'blue','LineStyle','-.')
hold off
axis tight
hold off
grid on
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
y=ylabel('$Var [y_{i,h}]$','fontsize',24,'interpreter','latex');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([0.00 0.3])
print('MEG_ci_hump','-depsc')
