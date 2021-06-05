cd 'C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Matlab\MonthlyIncome\1999-2002'
clc
clear
close all
clear mex
set(0,'DefaultFigureWindowStyle','docked')
disp('LifeTime Values Graphs')
%
load('panel_wage_LT_19992002_male.mat','panel_wage_LT_19992002_male')
load('panel_wage_LT_19992002_female.mat','panel_wage_LT_19992002_female')
load('panel_wage_LT_20052009_male.mat','panel_wage_LT_20052009_male')
load('panel_wage_LT_20052009_female.mat','panel_wage_LT_20052009_female')
%
load('panel_mob_LT_19992002_Male.mat','panel_mob_LT_19992002_Male')
load('panel_mob_LT_19992002_Female.mat','panel_mob_LT_19992002_Female')
load('panel_mob_LT_20052009_Male.mat','panel_mob_LT_20052009_Male')
load('panel_mob_LT_20052009_Female.mat','panel_mob_LT_20052009_Female')
%
load('empstate_19992002_male.mat','empstate_19992002_male')
load('empstate_20052009_male.mat','empstate_20052009_male')
load('empstate_19992002_female.mat','empstate_19992002_female')
load('empstate_20052009_female.mat','empstate_20052009_female')
load('wages_19992002_male.mat','wages_19992002_male')
load('wages_20052009_male.mat','wages_20052009_male')
load('wages_19992002_female.mat','wages_19992002_female')
load('wages_20052009_female.mat','wages_20052009_female')

%Graphs
x = 2:0.5:12;

%1) Distribution of Within Gender Wages Before and After:
A=wages_19992002_male;
A=(A(~isnan(A)));
B=wages_20052009_male;
B=(B(~isnan(B)));

before_log_ave_wage = fitdist(A,'Normal');
after_log_ave_wage = fitdist(B,'Normal');

figure
hold on
plot(x,pdf(before_log_ave_wage,x),'Color','blue')
hold on
plot(x,pdf(after_log_ave_wage,x),'Color','blue','LineStyle','--')
title('Model Wage Distribution - Males')
xlabel('Log Ave Wage')
hold off
legend('Before','After')
print('dist_beforeafter_Male','-dpng')

A=wages_19992002_female;
A=(A(~isnan(A)));
B=wages_20052009_female;
B=(B(~isnan(B)));

before_log_ave_wage = fitdist(A,'Normal');
after_log_ave_wage = fitdist(B,'Normal');

figure
hold on
plot(x,pdf(before_log_ave_wage,x),'Color','blue')
hold on
plot(x,pdf(after_log_ave_wage,x),'Color','blue','LineStyle','--')
title('Model Wage Distribution - Females')
xlabel('Log Ave Wage')
hold off
legend('Before','After')
print('dist_beforeafter_Female','-dpng')

%2) Distribution of Gender Wages Before and After:

A=wages_19992002_male;
A=(A(~isnan(A)));
B=wages_19992002_female;
B=(B(~isnan(B)));

male_log_ave_wage = fitdist(A,'Normal');
female_log_ave_wage = fitdist(B,'Normal');

figure
hold on
plot(x,pdf(male_log_ave_wage,x),'Color','blue')
hold on
plot(x,pdf(female_log_ave_wage,x),'Color','blue','LineStyle','--')
title('Gender Wage Distribution - Before')
xlabel('Log Ave Wage')
hold off
legend('Male','Female')
print('dist_gender_before','-dpng')

A=wages_20052009_male;
A=(A(~isnan(A)));
B=wages_20052009_female;
B=(B(~isnan(B)));

male_log_ave_wage = fitdist(A,'Normal');
female_log_ave_wage = fitdist(B,'Normal');

figure
hold on
plot(x,pdf(male_log_ave_wage,x),'Color','blue')
hold on
plot(x,pdf(female_log_ave_wage,x),'Color','blue','LineStyle','--')
title('Gender Wage Distribution - After')
xlabel('Log Ave Wage')
hold off
legend('Male','Female')
print('dist_gender_after','-dpng')

%3) Distribution of Wage Employment States:

wages=[wages_19992002_male; wages_19992002_female];
empstate=[empstate_19992002_male; empstate_19992002_female];

A=wages;
A=(A(empstate==1));
A=(A(~isnan(A)));
B=wages;
B=(B(empstate==2));
B=(B(~isnan(B)));
C=wages;
C=(C(empstate==3));
C=(C(~isnan(C)));
D=wages;
D=(D(empstate==4));
D=(D(~isnan(D)));

FT_log_ave_wage = fitdist(A,'Normal');
PT_log_ave_wage = fitdist(B,'Normal');
MJ_log_ave_wage = fitdist(C,'Normal');
NE_log_ave_wage = fitdist(D,'Normal');

figure
hold on
plot(x,pdf(FT_log_ave_wage,x),'Color','blue')
hold on
plot(x,pdf(PT_log_ave_wage,x),'Color','red','LineStyle','--')
hold on
plot(x,pdf(MJ_log_ave_wage,x),'Color','green','LineStyle','-.')
hold on
plot(x,pdf(NE_log_ave_wage,x),'x','Color','magenta','LineStyle',':','Linewidth',1.5)
title('Employment State Wage Distribution - Before')
xlabel('Log Ave Wage')
hold off
legend('FT','PT','MJ','NE')
print('dist_empstate_19992002','-dpng')

wages=[wages_20052009_male; wages_20052009_female];
empstate=[empstate_20052009_male; empstate_20052009_female];

A=wages;
A=(A(empstate==1));
A=(A(~isnan(A)));
B=wages;
B=(B(empstate==2));
B=(B(~isnan(B)));
C=wages;
C=(C(empstate==3));
C=(C(~isnan(C)));
D=wages;
D=(D(empstate==4));
D=(D(~isnan(D)));
E=wages;
E=(E(empstate==5));
E=(E(~isnan(E)));

FT_log_ave_wage = fitdist(A,'Normal');
PT_log_ave_wage = fitdist(B,'Normal');
MJ_log_ave_wage = fitdist(C,'Normal');
NE_log_ave_wage = fitdist(D,'Normal');
CJ_log_ave_wage = fitdist(E,'Normal');

figure
hold on
plot(x,pdf(FT_log_ave_wage,x),'Color','blue')
hold on
plot(x,pdf(PT_log_ave_wage,x),'Color','red','LineStyle','--')
hold on
plot(x,pdf(MJ_log_ave_wage,x),'Color','green','LineStyle','-.')
hold on
plot(x,pdf(NE_log_ave_wage,x),'x','Color','magenta','LineStyle',':','Linewidth',1.5)
hold on
plot(x,pdf(CJ_log_ave_wage,x),'+','Color','cyan','Linewidth',1.5,'LineStyle','--')
title('Employment State Wage Distribution - After')
xlabel('Log Ave Wage')
hold off
legend('FT','PT','MJ','NE','CJ')
print('dist_empstate_20052009','-dpng')

%4) LT Values Before-After:
x = 0:1000:800000;

A=panel_wage_LT_19992002_male;
A=exp(A);
sum_values=A;
for i=1:size(A,1)
    beta=0.98;
    for j=1:size(A,2)
        if rem(j, 12) == 0
            beta=beta*beta;
        end
        if isnan(sum_values(i,j))==0
            sum_values(i,j)=sum_values(i,j)*beta;
        end
    end
end
A=nansum(sum_values,2);
A=(A(~isnan(A)));
B=panel_wage_LT_20052009_male;
B=exp(B);
sum_values=B;
for i=1:size(B,1)
    beta=0.98;
    for j=1:size(B,2)
        if rem(j, 12) == 0
            beta=beta*beta;
        end
        if isnan(sum_values(i,j))==0
            sum_values(i,j)=sum_values(i,j)*beta;
        end
    end
end
B=nansum(sum_values,2);
B=(B(~isnan(B)));

A=A(A<800000);
B=B(B<800000);

figure
histogram(A,'Normalization','pdf')
hold on;
histogram(B,'Normalization','pdf')
title('Male LT Distribution')
legend('Before','After')
print('dist_LT_male_beforeafter','-dpng')

A=panel_wage_LT_19992002_female;
A=exp(A);
sum_values=A;
for i=1:size(A,1)
    beta=0.98;
    for j=1:size(A,2)
        if rem(j, 12) == 0
            beta=beta*beta;
        end
        if isnan(sum_values(i,j))==0
            sum_values(i,j)=sum_values(i,j)*beta;
        end
    end
end
A=nansum(sum_values,2);
A=(A(~isnan(A)));
B=panel_wage_LT_20052009_female;
B=exp(B);
sum_values=B;
for i=1:size(B,1)
    beta=0.98;
    for j=1:size(B,2)
        if rem(j, 12) == 0
            beta=beta*beta;
        end
        if isnan(sum_values(i,j))==0
            sum_values(i,j)=sum_values(i,j)*beta;
        end
    end
end
B=nansum(sum_values,2);
B=(B(~isnan(B)));

A=A(A<800000);
B=B(B<800000);

figure
histogram(A,'Normalization','pdf')
hold on;
histogram(B,'Normalization','pdf')
title('Female LT Distribution')
legend('Before','After')
print('dist_LT_female_beforeafter','-dpng')

%5) LT Values Deciles Before-After:
% x = 0:1000:800000;

A=panel_wage_LT_19992002_male;
A=exp(A);
sum_values=A;
for i=1:size(A,1)
    beta=0.98;
    for j=1:size(A,2)
        if rem(j, 12) == 0
            beta=beta*beta;
        end
        if isnan(sum_values(i,j))==0
            sum_values(i,j)=sum_values(i,j)*beta;
        end
    end
end
A=nansum(sum_values,2);
A=(A(~isnan(A)));
B=panel_wage_LT_20052009_male;
B=exp(B);
sum_values=B;
for i=1:size(B,1)
    beta=0.98;
    for j=1:size(B,2)
        if rem(j, 12) == 0
            beta=beta*beta;
        end
        if isnan(sum_values(i,j))==0
            sum_values(i,j)=sum_values(i,j)*beta;
        end
    end
end
B=nansum(sum_values,2);
B=(B(~isnan(B)));

A=A(A<800000);
B=B(B<800000);

% figure
% histogram(A,'Normalization','pdf')
% hold on;
% histogram(B,'Normalization','pdf')
% legend('Before','After')
% print('dist_LT_male_beforeafter','-dpng')

disp('Male LT Std. Dev. distribution. Before : ')
std(log(A))
disp('Male LT Std. Dev. distribution. After : ')
std(log(B))

Y_A=zeros(9,1);
Y_A(1,1) = quantile(A,0.1);
Y_A(2,1) = quantile(A,0.2);
Y_A(3,1) = quantile(A,0.3);
Y_A(4,1) = quantile(A,0.4);
Y_A(5,1) = quantile(A,0.5);
Y_A(6,1) = quantile(A,0.6);
Y_A(7,1) = quantile(A,0.7);
Y_A(8,1) = quantile(A,0.8);
Y_A(9,1) = quantile(A,0.9);

Y_B=zeros(9,1);
Y_B(1,1) = quantile(B,0.1);
Y_B(2,1) = quantile(B,0.2);
Y_B(3,1) = quantile(B,0.3);
Y_B(4,1) = quantile(B,0.4);
Y_B(5,1) = quantile(B,0.5);
Y_B(6,1) = quantile(B,0.6);
Y_B(7,1) = quantile(B,0.7);
Y_B(8,1) = quantile(B,0.8);
Y_B(9,1) = quantile(B,0.9);

figure
plot(Y_A)
hold on
plot(Y_B)
legend('Before','After')
title('Male Decile LT Distribution')
xlim([0 10])
print('dist_LTdeciles_male_beforeafter','-dpng')


A=panel_wage_LT_19992002_female;
A=exp(A);
sum_values=A;
for i=1:size(A,1)
    beta=0.98;
    for j=1:size(A,2)
        if rem(j, 12) == 0
            beta=beta*beta;
        end
        if isnan(sum_values(i,j))==0
            sum_values(i,j)=sum_values(i,j)*beta;
        end
    end
end
A=nansum(sum_values,2);
A=(A(~isnan(A)));
B=panel_wage_LT_20052009_female;
B=exp(B);
sum_values=B;
for i=1:size(B,1)
    beta=0.98;
    for j=1:size(B,2)
        if rem(j, 12) == 0
            beta=beta*beta;
        end
        if isnan(sum_values(i,j))==0
            sum_values(i,j)=sum_values(i,j)*beta;
        end
    end
end
B=nansum(sum_values,2);
B=(B(~isnan(B)));

A=A(A<800000);
B=B(B<800000);
B=B(B~=0);

disp('Female LT Std. Dev. distribution. Before : ')
std(log(A))
disp('Female LT Std. Dev. distribution. After : ')
std(log(B))

Y_A=zeros(9,1);
Y_A(1,1) = quantile(A,0.1);
Y_A(2,1) = quantile(A,0.2);
Y_A(3,1) = quantile(A,0.3);
Y_A(4,1) = quantile(A,0.4);
Y_A(5,1) = quantile(A,0.5);
Y_A(6,1) = quantile(A,0.6);
Y_A(7,1) = quantile(A,0.7);
Y_A(8,1) = quantile(A,0.8);
Y_A(9,1) = quantile(A,0.9);

Y_B=zeros(9,1);
Y_B(1,1) = quantile(B,0.1);
Y_B(2,1) = quantile(B,0.2);
Y_B(3,1) = quantile(B,0.3);
Y_B(4,1) = quantile(B,0.4);
Y_B(5,1) = quantile(B,0.5);
Y_B(6,1) = quantile(B,0.6);
Y_B(7,1) = quantile(B,0.7);
Y_B(8,1) = quantile(B,0.8);
Y_B(9,1) = quantile(B,0.9);

figure
plot(Y_A)
hold on
plot(Y_B)
legend('Before','After')
title('Female Decile LT Distribution')
xlim([0 10])
print('dist_LTdeciles_female_beforeafter','-dpng')



%
disp('Finished!')
beep