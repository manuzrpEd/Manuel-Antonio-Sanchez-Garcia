clear
close all
clear mex
clc
tic
set(0,'DefaultFigureWindowStyle','docked')
rand('seed',8842554); 
randn('seed',5578462); 
lognrnd('seed',6247887); 
% define parameters
H = 20000;
work = 32;
retire = 20;
life=work+retire;
%% Consumption shock net of transitory Method 1 & 2
load('baseline.mat','baseline')
panel = baseline.panel_insure;

%regression
fcn = @(x){cumsum(x)};
panel(:,15) = 1;
panel(:,15) = accumarray_expand(panel(:,15),panel(:,1),fcn);

pers_shocks=[panel(:,10), panel(:,15)];
pers_shocks(pers_shocks(:,1)==0,:)=[];
%
age_var=zeros(31,1);
for i=2:32
    aux=pers_shocks;
    aux(aux(:,2)~=i,:)=[];    
    age_var(i,1)=var(aux(:,1));
end

mean_age_var=mean(age_var)%cross-sectionally is quite similar

fcn = @(x){n_diff(x,1)};
panel(:,16) = accumarray_expand(log(panel(:,7)),panel(:,1),fcn);

est=zeros(work-1,5);

X=[panel(:,1), panel(:,11:16)];

for i=2:work 
    X_base=X;
    X_base(X_base(:,6)~=i,:)=[];
    y_base=X_base(:,end);
    X_base=X_base(:,2:5);
    X_base(:,end+1)=1;
    est(i-1,:) = regress( y_base , X_base);
end

panel(:,13:end)=[];
%age
fcn = @(x){cumsum(x)};
panel(:,13) = 1;
panel(:,13) = accumarray_expand(panel(:,13),panel(:,1),fcn);

%difference from non shock consumption
fcn = @(x){n_diff(x,1)};
panel(:,14) = accumarray_expand(log(panel(:,7)),panel(:,1),fcn);



% panel(:,12) = log(panel(:,7))-log(panel(:,8));
aux = panel(panel(:,13)>1,:);
% age varying neg:
insurance_model_tran_2_age_neg=zeros(work-1,1);
insurance_model_perm_2_age_neg=zeros(work-1,1);
for i=2:work
aux2 = aux(aux(:,13)==i,:);
aux4 = aux2(aux2(:,11)<-0,:);
aux3 = cov(aux4(:,14),aux4(:,11));
insurance_model_tran_2_age_neg(i-1) = 1-(aux3(2,1)./var(aux4(:,11)));
aux4 = aux2(aux2(:,10)<0,:);
aux3 = cov(aux4(:,14),aux4(:,10));
insurance_model_perm_2_age_neg(i-1) = 1-(aux3(2,1)./var(aux4(:,10)));
end

fcn = @(x){n_diff(x,1)};
panel(:,14) = accumarray_expand(log(panel(:,7)),panel(:,1),fcn);
% panel(:,12) = log(panel(:,7))-log(panel(:,8));
aux = panel(panel(:,13)>1,:);
% age varying neg:
insurance_model_tran_2_age_pos=zeros(work-1,1);
insurance_model_perm_2_age_pos=zeros(work-1,1);
for i=2:work
aux2 = aux(aux(:,13)==i,:);
aux4 = aux2(aux2(:,12)>0,:);
aux3 = cov(aux4(:,14),aux4(:,12));
insurance_model_tran_2_age_pos(i-1) = 1-(aux3(2,1)./var(aux4(:,12)));
aux4 = aux2(aux2(:,10)>0,:);
aux3 = cov(aux4(:,14),aux4(:,10));
insurance_model_perm_2_age_pos(i-1) = 1-(aux3(2,1)./var(aux4(:,10)));
end

%% AR 1 Insurance Coefficients - Consumption Growth Method 
%
load('ar1.mat','ar1')
panel_macro=ar1.macro_covar_inv.panel_macro;
for i=1:H
    for j=1:work
        panel_macro(j+(i-1)*life,10)=ar1.macro_covar_inv.shocks_pe(i,j);%pers
        panel_macro(j+(i-1)*life,11)=ar1.macro_covar_inv.shocks_tr(i,j);%trans
    end
end

%regression
panel_macro(panel_macro(:,7)>32,:)=[];

var_pers_macro=var(panel_macro(:,10))
var_trans_macro=var(panel_macro(:,11))

fcn = @(x){n_diff(x,1)};
panel_macro(:,12) = accumarray_expand(log(panel_macro(:,6)),panel_macro(:,1),fcn);

panel_macro(:,end+1)=panel_macro(:,10).*(panel_macro(:,10)>0);
panel_macro(:,end+1)=panel_macro(:,10).*(panel_macro(:,10)<0);
panel_macro(:,end+1)=panel_macro(:,11).*(panel_macro(:,11)>0);
panel_macro(:,end+1)=panel_macro(:,11).*(panel_macro(:,11)<0);

est_macro=zeros(work-1,5);

X=[panel_macro(:,7), panel_macro(:,12:16)];

for i=2:work 
    X_base=X;
    X_base(X_base(:,1)~=i,:)=[];
    y_base=X_base(:,2);
    X_base=X_base(:,3:end);
    X_base(:,end+1)=1;
    est_macro(i-1,:) = regress( y_base , X_base);
end%trans_neg, trans_pos, pers_neg pers_pos

%consumption growth macro - neg
fcn = @(x){n_diff(x,1)};
panel_macro(:,12) = accumarray_expand(log(panel_macro(:,6)),panel_macro(:,1),fcn); 
aux = panel_macro(panel_macro(:,7)>1,:);
% age varying:
insurance_model_tran_2_age_macro_neg=zeros(work-1,1);
insurance_model_perm_2_age_macro_neg=zeros(work-1,1);
for i=2:work
aux2 = aux(aux(:,7)==i,:);
aux4 = aux2(aux2(:,11)<0,:);
aux3 = cov(aux4(:,12),aux4(:,11));
insurance_model_tran_2_age_macro_neg(i-1) = 1-(aux3(2,1)./var(aux2(:,11)));
aux4 = aux2(aux2(:,10)<0,:);
aux3 = cov(aux2(:,12),aux2(:,10));
insurance_model_perm_2_age_macro_neg(i-1) = 1-(aux3(2,1)./var(aux2(:,10)));
end

%consumption growth macro - pos
fcn = @(x){n_diff(x,1)};
panel_macro(:,12) = accumarray_expand(log(panel_macro(:,6)),panel_macro(:,1),fcn); 
aux = panel_macro(panel_macro(:,7)>1,:);
% age varying:
insurance_model_tran_2_age_macro_pos=zeros(work-1,1);
insurance_model_perm_2_age_macro_pos=zeros(work-1,1);
for i=2:work
aux2 = aux(aux(:,7)==i,:);
aux4 = aux2(aux2(:,11)>0,:);
aux3 = cov(aux4(:,12),aux4(:,11));
insurance_model_tran_2_age_macro_pos(i-1) = 1-(aux3(2,1)./var(aux2(:,11)));
aux4 = aux2(aux2(:,10)>0,:);
aux3 = cov(aux2(:,12),aux2(:,10));
insurance_model_perm_2_age_macro_pos(i-1) = 1-(aux3(2,1)./var(aux2(:,10)));
end

%projections
aux=insurance_model_perm_2_age_pos(1:31);
one=1:31;
constant=ones(31,1);
two=one.^2;
three=one.^3;
four=one.^4;
five=one.^5;
six=one.^6;
seven=one.^7;
eight=one.^8;
nine=one.^9;
% X=[constant, one'];
X=[constant, one', two', three', four'];
p_model_perm_2_age_pos = ols(aux,X);

aux=insurance_model_perm_2_age_neg(1:31);
X=[constant, one', two', three', four'];
p_model_perm_2_age_neg = ols(aux,X);

aux=insurance_model_tran_2_age_pos(1:31);
X=[constant, one', two', three'];
p_model_tran_2_age_pos = ols(aux,X);

aux=insurance_model_tran_2_age_neg(1:31);
X=[constant, one', two', three'];
p_model_tran_2_age_neg = ols(aux,X);

%}
%% graphs AR1 Comparison:

figure
plot(25:1:55,1-est(:,4),'LineWidth',2.5,'Color','blue')
hold on
plot(25:1:55,1-est_macro(:,1),'LineWidth',2.5,'Marker','o','Color','red')
hold on
plot(25:1:55,1-est(:,3),'LineWidth',2.5,'Color','blue','LineStyle','--')
hold on
plot(25:1:55,1-est_macro(:,2),'LineWidth',2.5,'Marker','o','Color','red','LineStyle','--')
hold off
h=legend('AVRM Positive','AIRM Positive','AVRM Negative','AIRM Negative','Location','North');
set(h,'FontSize',20); 
axis tight
grid on
xt = get(gca, 'XTick');
set(gca, 'FontSize', 20)
xlabel('Age','fontsize',20,'FontWeight','bold')
y=ylabel('Insurance','fontsize',20);
set(y, 'Units', 'Normalized', 'Position', [-0.12, 0.5, 0]);
ylim([0.4 1])
% yticks(0:0.2:1)
print('ic_true_covar_inv_perm_beta_cond','-dpng')

aux=est(:,2);
X=[constant, one', two'];
p_model_tran_pos = ols(aux,X);

aux=est(:,1);
X=[constant, one', two'];
p_model_tran_neg = ols(aux,X);

figure
plot(25:1:55,1-p_model_tran_pos.yhat,'LineWidth',2.5,'Color','blue')
hold on
plot(25:1:55,1-est_macro(:,3),'LineWidth',2.5,'Marker','o','Color','red')
hold on
plot(25:1:55,1-p_model_tran_neg.yhat,'LineWidth',2.5,'Color','blue','LineStyle','--')
hold on
plot(25:1:55,1-est_macro(:,4),'LineWidth',2.5,'Marker','o','Color','red','LineStyle','--')
hold off
h=legend('AVRM Positive','AIRM Positive','AVRM Negative','AIRM Negative','Location','South');
set(h,'FontSize',20); 
axis tight
grid on
xt = get(gca, 'XTick');
set(gca, 'FontSize', 20)
xlabel('Age','fontsize',20,'FontWeight','bold')
y=ylabel('Insurance','fontsize',20);
set(y, 'Units', 'Normalized', 'Position', [-0.12, 0.5, 0]);
ylim([0.4 1])
print('ic_true_covar_inv_trans_beta_cond','-dpng')
%
toc
disp('Finished!')