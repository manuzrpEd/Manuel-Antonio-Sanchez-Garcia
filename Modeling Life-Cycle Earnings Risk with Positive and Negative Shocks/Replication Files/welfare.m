clear all
close all
clc

%%
load('util_baseline.mat','util_baseline')
load('util_macro.mat','util_macro')

pay_baseline = min(1.2,max(-0.8,((-0.3861)./sort(util_baseline)).^(1/(-0.5))-1));
pay_macro = min(1.2,max(-0.8,((-0.4297)./sort(util_macro)).^(1/(-0.5))-1)); 


str1(1) = {['Skewness AVRM = ' num2str(sprintf('%.2f',skewness(pay_baseline)))]};
str1(2) = {['Kurtosis AVRM = ' num2str(sprintf('%.2f',kurtosis(pay_baseline)))]};
str1(3) = {['Skewness AIRM = ' num2str(sprintf('%.2f',skewness(pay_macro)))]};
str1(4) = {['Kurtosis AIRM = ' num2str(sprintf('%.2f',kurtosis(pay_macro)))]};

grid = linspace(min(min(pay_baseline),min(pay_macro)),max(max(pay_baseline),max(pay_macro)),70);
histogram(pay_baseline,grid,'Normalization','probability','FaceColor',[0 0 0])
hold on
histogram(pay_macro,grid,'Normalization','probability','FaceColor',[0.8 0.8 0.8])
hold off
text(0.74,0.87,str1,'Units','normalized','FontSize',12,'BackgroundColor',[0.75 0.75 0.75])
axis tight
width=700;
height=350;
set(gcf,'units','points','position',[0,0,width,height])
legend({'AVRM','AIRM'},'FontSize',12)
xlabel('Willingness to pay','fontsize',13,'FontWeight','bold')
ylabel('Density','fontsize',13,'FontWeight','bold','Interpreter','Latex')
