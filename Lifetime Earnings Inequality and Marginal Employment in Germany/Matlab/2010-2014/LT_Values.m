cd 'C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Matlab\GoodFitSearch\2005-2009'
clc
clear
close all
clear mex
set(0,'DefaultFigureWindowStyle','docked')
disp('LT Values, Males, 2005-2009')
%
load('phat_male.mat','phat_male')
load('data_male.mat','data_male')
par0=zeros(1,1);
% %iniPT
par0(1,1)=phat_male(1,1);%cons
par0(2,1)=phat_male(2,1);%lmexp
par0(3,1)=phat_male(3,1);%ed2
par0(4,1)=phat_male(4,1);%ed3
par0(5,1)=phat_male(5,1);%mcl2
% %iniMJ
par0(6,1)=phat_male(6,1);
par0(7,1)=phat_male(7,1);
par0(8,1)=phat_male(8,1);
par0(9,1)=phat_male(9,1);
par0(10,1)=phat_male(10,1);
% %iniCJ
par0(11,1)=phat_male(11,1);
par0(12,1)=phat_male(12,1);
par0(13,1)=phat_male(13,1);
par0(14,1)=phat_male(14,1);
par0(15,1)=phat_male(15,1);
% %PT 
par0(16,1)=phat_male(16,1);%cons
par0(17,1)=phat_male(17,1);%lmexp
par0(18,1)=phat_male(18,1);%ed2
par0(19,1)=phat_male(19,1);%ed3
par0(20,1)=phat_male(20,1);%PT
par0(21,1)=phat_male(21,1);%MJ
par0(22,1)=phat_male(22,1);%NE
par0(23,1)=phat_male(23,1);%CJ
par0(24,1)=phat_male(24,1);%CJ
par0(25,1)=phat_male(25,1);%mcl2
% %MJ
par0(26,1)=phat_male(26,1);
par0(27,1)=phat_male(27,1);
par0(28,1)=phat_male(28,1);
par0(29,1)=phat_male(29,1);
par0(30,1)=phat_male(30,1);%PT
par0(31,1)=phat_male(31,1);%MJ
par0(32,1)=phat_male(32,1);%NE
par0(33,1)=phat_male(33,1);%CJ
par0(34,1)=phat_male(34,1);%CJ
par0(35,1)=phat_male(35,1);%mcl2
% %NE
par0(36,1)=phat_male(36,1);
par0(37,1)=phat_male(37,1);
par0(38,1)=phat_male(38,1);
par0(39,1)=phat_male(39,1);
par0(40,1)=phat_male(40,1);%PT
par0(41,1)=phat_male(41,1);%MJ
par0(42,1)=phat_male(42,1);%NE
par0(43,1)=phat_male(43,1);%CJ
par0(44,1)=phat_male(44,1);%CJ
par0(45,1)=phat_male(45,1);%mcl2
% %CJ
par0(46,1)=phat_male(46,1);
par0(47,1)=phat_male(47,1);
par0(48,1)=phat_male(48,1);
par0(49,1)=phat_male(49,1);
par0(50,1)=phat_male(50,1);%PT
par0(51,1)=phat_male(51,1);%MJ
par0(52,1)=phat_male(52,1);%NE
par0(53,1)=phat_male(53,1);%CJ
par0(54,1)=phat_male(54,1);%CJ
par0(55,1)=phat_male(55,1);%mcl2
% %mcl
par0(56,1)=phat_male(56,1);%cons
par0(57,1)=phat_male(57,1);%year_birth
par0(58,1)=phat_male(58,1);%ED2
par0(59,1)=phat_male(59,1);%ED3

% %mu
par0(60,1)=phat_male(60,1);%cons
par0(61,1)=phat_male(61,1);%ED2
par0(62,1)=phat_male(62,1);%ED3
par0(63,1)=phat_male(63,1);%lmexp
par0(64,1)=phat_male(64,1);%PT
par0(65,1)=phat_male(65,1);%MJ
par0(66,1)=phat_male(66,1);%NE
par0(67,1)=phat_male(67,1);%CJ
par0(68,1)=phat_male(68,1);%wcl
% %sigma
par0(69,1)=phat_male(69,1);%cons
par0(70,1)=phat_male(70,1);%lmexp
par0(71,1)=phat_male(71,1);%PT
par0(72,1)=phat_male(72,1);%MJ
par0(73,1)=phat_male(73,1);%CJ
par0(74,1)=phat_male(74,1);%wcl
% %tau1
par0(75:85,1)=phat_male(75:85,1);
% %wcl
par0(86,1)=phat_male(86,1);%cons
par0(87,1)=phat_male(87,1);%year_birth
par0(88,1)=phat_male(88,1);%ED2
par0(89,1)=phat_male(89,1);%ED3

%% Mobility and Wage Classes:

%mobility classes:
rand('seed',123456)
rand_samp_mob=rand(size(data_male.year_birth,1),1);
%sample
prob_mcl_1=zeros(size(data_male.year_birth,1),1);
fract_mcl=zeros(size(data_male.year_birth,1),1);
for i=1:size(data_male.year_birth,1)
    prob_mcl_1(i,1)=1./(1+exp(par0(56,1)+par0(57,1)*1977+par0(58,1)*data_male.ED2(i,1)+par0(59,1)*data_male.ED3(i,1)));
    if prob_mcl_1(i,1)>rand_samp_mob(i,1)
        fract_mcl(i,1)=1;
    elseif prob_mcl_1(i,1)<rand_samp_mob(i,1)
        fract_mcl(i,1)=2;
    end
end

% wage classes
rand_samp_wage=rand(size(data_male.year_birth,1),1);
%
prob_wcl=zeros(size(data_male.year_birth,1),1);
fract_wcl=zeros(size(data_male.year_birth,1),1);
for i=1:size(data_male.year_birth,1)
    prob_wcl(i,1)=1./(1+exp(par0(86,1)+par0(87,1)*1977+par0(88,1)*data_male.ED2(i,1)+par0(89,1)*data_male.ED3(i,1)));
    if prob_wcl(i,1)>rand_samp_wage(i,1)
        fract_wcl(i,1)=1;
    elseif prob_wcl(i,1)<rand_samp_wage(i,1)
        fract_wcl(i,1)=2;
    end
end
%

%% mobility class 1 wage class 1 
panel_mob=zeros(size(data_male.log_ave_wage,1),34*12);
panel_mob(fract_wcl==2,:)=NaN;
panel_mob(fract_mcl==2,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year
load('data_male.mat','data_male')
exper=zeros(size(data_male.log_ave_wage,1),34*12);
exper(:,1)=1.2;
for j=2:size(exper,2)
    exper(:,j)=exper(:,j-1)+0.1;
end
exper(isnan(aux(:,1))==1,:)=[];
yr=zeros(size(data_male.log_ave_wage,1),34*12);
yr(:,1)=19.99;
for j=12:12:((34-1)*12)
    yr(:,j)=19.99+0.01*j/12;
end
for j=2:size(yr,2)
    if yr(:,j)==0
        yr(:,j)=yr(:,j-1);
    end
end
yr(isnan(aux(:,1))==1,:)=[];
%
educ2=data_male.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_male.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
% FT=data_male.FT;
% FT(isnan(aux(:,1))==1,:)=[];
% PT=data_male.PT;
% PT(isnan(aux(:,1))==1,:)=[];
% MJ=data_male.MJ;
% MJ(isnan(aux(:,1))==1,:)=[];
% NE=data_male.NE;
% NE(isnan(aux(:,1))==1,:)=[];
% CJ=data_male.CJ;
% CJ(isnan(aux(:,1))==1,:)=[];
% empstate=data_male.empstate;
% empstate(isnan(aux(:,1))==1,:)=[];

%initial state:
rand_state=rand(size(panel_mob,1),size(panel_mob,2));
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(1,1) +par0(2,1)*exper(:,1) + par0(3,1)*educ2 + par0(4,1)*educ3);%iniPT
den(:,1)=den(:,1)+exp(par0(6,1) +par0(7,1)*exper(:,1) + par0(8,1)*educ2 + par0(9,1)*educ3);%iniMJ
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3);%iniCJ
%
prob_FT=nan(size(panel_mob,1),size(panel_mob,2));
fract_FT=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_FT(i,1)=1./(den(i,1));
    if prob_FT(i,1)>rand_state(i,1) && isnan(prob_FT(i,1))==0
        fract_FT(i,1)=1;
    elseif isnan(prob_FT(i,1))==0
        fract_FT(i,1)=0;
    end
end
%
prob_PT=nan(size(panel_mob,1),size(panel_mob,2));
fract_PT=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_PT(i,1)=exp(par0(1,1) +par0(2,1)*exper(i,1) + par0(3,1)*educ2(i,1) + par0(4,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)>rand_state(i,1) && prob_FT(i,1)<rand_state(i,1) && isnan(prob_PT(i,1))==0
        fract_PT(i,1)=1;
    elseif isnan(prob_PT(i,1))==0
        fract_PT(i,1)=0;
    end
end
%
prob_MJ=nan(size(panel_mob,1),size(panel_mob,2));
fract_MJ=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_MJ(i,1)=exp(par0(6,1) +par0(7,1)*exper(i,1) + par0(8,1)*educ2(i,1) + par0(9,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)<rand_state(i,1) && isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=1;
    elseif isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=0;
    end
end
%
prob_CJ=nan(size(panel_mob,1),size(panel_mob,2));
fract_CJ=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_CJ(i,1)=exp(par0(11,1) +par0(12,1)*exper(i,1) + par0(13,1)*educ2(i,1) + par0(14,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_CJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)<rand_state(i,1)
        fract_CJ(i,1)=1;
    elseif isnan(prob_CJ(i,1))==0
        fract_CJ(i,1)=0;
    end
end
prob_NE=nan(size(panel_mob,1),size(panel_mob,2));
fract_NE=zeros(size(panel_mob,1),size(panel_mob,2));

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,j) + par0(18,1)*educ2 + par0(19,1)*educ3 +par0(20,1)*fract_FT(:,j-1) + par0(21,1)*fract_PT(:,j-1) + par0(22,1)*fract_MJ(:,j-1) + par0(23,1)*fract_NE(:,j-1) + par0(24,1)*fract_CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(26,1) +par0(27,1)*exper(:,j) + par0(28,1)*educ2 + par0(29,1)*educ3 +par0(30,1)*fract_FT(:,j-1) + par0(31,1)*fract_PT(:,j-1) + par0(32,1)*fract_MJ(:,j-1) + par0(33,1)*fract_NE(:,j-1) + par0(34,1)*fract_CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(36,1) +par0(37,1)*exper(:,j) + par0(38,1)*educ2 + par0(39,1)*educ3 +par0(40,1)*fract_FT(:,j-1) + par0(41,1)*fract_PT(:,j-1) + par0(42,1)*fract_MJ(:,j-1) + par0(43,1)*fract_NE(:,j-1) + par0(44,1)*fract_CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(46,1) +par0(47,1)*exper(:,j) + par0(48,1)*educ2 + par0(49,1)*educ3 +par0(50,1)*fract_FT(:,j-1) + par0(51,1)*fract_PT(:,j-1) + par0(52,1)*fract_MJ(:,j-1) + par0(53,1)*fract_NE(:,j-1) + par0(54,1)*fract_CJ(:,j-1));
%
for i=1:size(panel_mob,1)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_PT(i,j)=exp(par0(16,1) + par0(17,1)*exper(i,j) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1) + par0(20,1)*fract_FT(i,j-1) + par0(21,1)*fract_PT(i,j-1) + par0(22,1)*fract_MJ(i,j-1) + par0(23,1)*fract_NE(i,j-1) + par0(24,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_MJ(i,j)=exp(par0(26,1) + par0(27,1)*exper(i,j) + par0(28,1)*educ2(i,1) + par0(29,1)*educ3(i,1) + par0(30,1)*fract_FT(i,j-1) + par0(31,1)*fract_PT(i,j-1) + par0(32,1)*fract_MJ(i,j-1) + par0(33,1)*fract_NE(i,j-1) + par0(33,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_NE(i,j)=exp(par0(36,1) +par0(37,1)*exper(i,j) + par0(38,1)*educ2(i,1) + par0(39,1)*educ3(i,1) +par0(40,1)*fract_FT(i,j-1) + par0(41,1)*fract_PT(i,j-1) + par0(42,1)*fract_MJ(i,j-1) + par0(43,1)*fract_NE(i,j-1) + par0(44,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_CJ(i,j)=exp(par0(43,1) +par0(47,1)*exper(i,j) + par0(48,1)*educ2(i,1) + par0(49,1)*educ3(i,1) +par0(50,1)*fract_FT(i,j-1) + par0(51,1)*fract_PT(i,j-1) + par0(52,1)*fract_MJ(i,j-1) + par0(53,1)*fract_NE(i,j-1) + par0(54,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)+prob_CJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)<rand_state(i,j) && isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=1;
    elseif isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=0;
    end
end
end

%
randn('seed',654321)
panel_wage=nan(size(panel_mob,1),size(panel_mob,2));

mu=nan(size(panel_wage,1),size(panel_wage,2));
sig=nan(size(panel_wage,1),size(panel_wage,2));
tau1=nan(size(panel_wage,1),size(panel_wage,2));

for j=1:size(panel_wage,2)%no NE at first period
    if j==1
        mu(:,j)=par0(60) + par0(61)*educ2 + par0(62)*educ3 + par0(63)*exper(:,j)  + par0(64)*fract_PT(:,j) + par0(65)*fract_MJ(:,j) ...
        + par0(67)*fract_CJ(:,j);
        sig(:,j)=par0(69) + par0(70)*exper(:,j) + par0(71)*fract_PT(:,j) + par0(72)*fract_MJ(:,j) + par0(73)*fract_CJ(:,j);   
        tau1(:,j)=par0(75) + par0(76)*exper(:,j);  
    else
        mu(:,j)=par0(60) + par0(61)*educ2 + par0(62)*educ3 + par0(63)*exper(:,j)  + par0(64)*fract_PT(:,j) + par0(65)*fract_MJ(:,j) ...
        + par0(66)*fract_NE(:,j) + par0(67)*fract_CJ(:,j);
        sig(:,j)=par0(69) + par0(70)*exper(:,j) + par0(71)*fract_PT(:,j) + par0(72)*fract_MJ(:,j)  + -42000*fract_NE(:,j) ...
            + par0(73)*fract_CJ(:,j);   
        tau1(:,j)=par0(75) + par0(76)*exper(:,j) ...
                    + par0(78)*fract_FT(:,j).*fract_PT(:,j-1) + par0(79)*fract_FT(:,j).*fract_MJ(:,j-1) ...
                    + par0(80)*fract_FT(:,j).*fract_NE(:,j-1) + par0(81)*fract_FT(:,j).*fract_CJ(:,j-1) ...             
                    + par0(82)*fract_CJ(:,j).*fract_FT(:,j-1) + par0(83).*fract_CJ(:,j).*fract_PT(:,j-1) ...
                    + par0(84).*fract_CJ(:,j).*fract_MJ(:,j-1) + par0(85)*fract_CJ(:,j).*fract_NE(:,j-1);
    end
end
%
sig=exp(sig/2);
tau1=-1+2./(1+exp(tau1));

empstate=zeros(size(panel_wage,1),size(panel_wage,2));
for i=1:size(panel_wage,1)
    for j=1:size(panel_wage,2)
        if fract_FT(i,j)==1
            empstate(i,j)=1;
        elseif fract_PT(i,j)==1
            empstate(i,j)=2;
        elseif fract_MJ(i,j)==1
            empstate(i,j)=3;
        elseif fract_NE(i,j)==1
            empstate(i,j)=4;
        elseif fract_CJ(i,j)==1
            empstate(i,j)=5;
        end
    end
end

for i=1:size(panel_wage,1)
    panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
    while panel_wage(i,1)<0
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
    end
end
for i=1:size(panel_wage,1)
    for j=2:size(panel_wage,2)
        if isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1)%beginning of year
            mu_t=[mu(i,j) mu(i,j-1)];
            sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
            aux=mvnrnd(mu_t,sigma_t,1);
            ind=aux(1,1);
            while ind<0
                aux=mvnrnd(mu_t,sigma_t,1);
                ind=aux(1,1);
            end
            panel_wage(i,j)=aux(1,1);
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && empstate(i,j)~=empstate(i,j-1)
            mu_t=[mu(i,j) mu(i,j-1)];
            sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
            aux=mvnrnd(mu_t,sigma_t,1);
            ind=aux(1,1);
            while ind<0
                aux=mvnrnd(mu_t,sigma_t,1);
                ind=aux(1,1);
            end
            panel_wage(i,j)=aux(1,1);
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && empstate(i,j)==empstate(i,j-1)
            panel_wage(i,j)=panel_wage(i,j-1);
        end
    end
end

panel_wage_1_1=panel_wage;
panel_mob_1_1=empstate;
save('panel_wage_1_1.mat','panel_wage_1_1')
save('panel_mob_1_1.mat','panel_mob_1_1')
%% mobility class 1 wage class 2 
panel_mob=zeros(size(data_male.log_ave_wage,1),34*12);
panel_mob(fract_wcl==1,:)=NaN;
panel_mob(fract_mcl==2,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year
load('data_male.mat','data_male')

exper=zeros(size(data_male.log_ave_wage,1),34*12);
exper(:,1)=1.2;
for j=2:size(exper,2)
    exper(:,j)=exper(:,j-1)+0.1;
end
exper(isnan(aux(:,1))==1,:)=[];
yr=zeros(size(data_male.log_ave_wage,1),34*12);
yr(:,1)=19.99;
for j=12:12:((34-1)*12)
    yr(:,j)=19.99+0.01*j/12;
end
for j=2:size(yr,2)
    if yr(:,j)==0
        yr(:,j)=yr(:,j-1);
    end
end
yr(isnan(aux(:,1))==1,:)=[];
%
educ2=data_male.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_male.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
% FT=data_male.FT;
% FT(isnan(aux(:,1))==1,:)=[];
% PT=data_male.PT;
% PT(isnan(aux(:,1))==1,:)=[];
% MJ=data_male.MJ;
% MJ(isnan(aux(:,1))==1,:)=[];
% NE=data_male.NE;
% NE(isnan(aux(:,1))==1,:)=[];
% CJ=data_male.CJ;
% CJ(isnan(aux(:,1))==1,:)=[];
% empstate=data_male.empstate;
% empstate(isnan(aux(:,1))==1,:)=[];

%initial state:
rand_state=rand(size(panel_mob,1),size(panel_mob,2));
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(1,1) +par0(2,1)*exper(:,1) + par0(3,1)*educ2 + par0(4,1)*educ3);%iniPT
den(:,1)=den(:,1)+exp(par0(6,1) +par0(7,1)*exper(:,1) + par0(8,1)*educ2 + par0(9,1)*educ3);%iniMJ
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3);%iniCJ
%
prob_FT=nan(size(panel_mob,1),size(panel_mob,2));
fract_FT=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_FT(i,1)=1./(den(i,1));
    if prob_FT(i,1)>rand_state(i,1) && isnan(prob_FT(i,1))==0
        fract_FT(i,1)=1;
    elseif isnan(prob_FT(i,1))==0
        fract_FT(i,1)=0;
    end
end
%
prob_PT=nan(size(panel_mob,1),size(panel_mob,2));
fract_PT=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_PT(i,1)=exp(par0(1,1) +par0(2,1)*exper(i,1) + par0(3,1)*educ2(i,1) + par0(4,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)>rand_state(i,1) && prob_FT(i,1)<rand_state(i,1) && isnan(prob_PT(i,1))==0
        fract_PT(i,1)=1;
    elseif isnan(prob_PT(i,1))==0
        fract_PT(i,1)=0;
    end
end
%
prob_MJ=nan(size(panel_mob,1),size(panel_mob,2));
fract_MJ=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_MJ(i,1)=exp(par0(6,1) +par0(7,1)*exper(i,1) + par0(8,1)*educ2(i,1) + par0(9,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)<rand_state(i,1) && isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=1;
    elseif isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=0;
    end
end
%
prob_CJ=nan(size(panel_mob,1),size(panel_mob,2));
fract_CJ=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_CJ(i,1)=exp(par0(11,1) +par0(12,1)*exper(i,1) + par0(13,1)*educ2(i,1) + par0(14,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_CJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)<rand_state(i,1)
        fract_CJ(i,1)=1;
    elseif isnan(prob_CJ(i,1))==0
        fract_CJ(i,1)=0;
    end
end
prob_NE=nan(size(panel_mob,1),size(panel_mob,2));
fract_NE=zeros(size(panel_mob,1),size(panel_mob,2));

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,j) + par0(18,1)*educ2 + par0(19,1)*educ3 +par0(20,1)*fract_FT(:,j-1) + par0(21,1)*fract_PT(:,j-1) + par0(22,1)*fract_MJ(:,j-1) + par0(23,1)*fract_NE(:,j-1) + par0(24,1)*fract_CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(26,1) +par0(27,1)*exper(:,j) + par0(28,1)*educ2 + par0(29,1)*educ3 +par0(30,1)*fract_FT(:,j-1) + par0(31,1)*fract_PT(:,j-1) + par0(32,1)*fract_MJ(:,j-1) + par0(33,1)*fract_NE(:,j-1) + par0(34,1)*fract_CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(36,1) +par0(37,1)*exper(:,j) + par0(38,1)*educ2 + par0(39,1)*educ3 +par0(40,1)*fract_FT(:,j-1) + par0(41,1)*fract_PT(:,j-1) + par0(42,1)*fract_MJ(:,j-1) + par0(43,1)*fract_NE(:,j-1) + par0(44,1)*fract_CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(46,1) +par0(47,1)*exper(:,j) + par0(48,1)*educ2 + par0(49,1)*educ3 +par0(50,1)*fract_FT(:,j-1) + par0(51,1)*fract_PT(:,j-1) + par0(52,1)*fract_MJ(:,j-1) + par0(53,1)*fract_NE(:,j-1) + par0(54,1)*fract_CJ(:,j-1));
%
for i=1:size(panel_mob,1)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_PT(i,j)=exp(par0(16,1) +par0(17,1)*exper(i,j) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1) +par0(20,1)*fract_FT(i,j-1) + par0(21,1)*fract_PT(i,j-1) + par0(22,1)*fract_MJ(i,j-1) + par0(23,1)*fract_NE(i,j-1) + par0(24,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_MJ(i,j)=exp(par0(26,1) +par0(27,1)*exper(i,j) + par0(28,1)*educ2(i,1) + par0(29,1)*educ3(i,1) +par0(30,1)*fract_FT(i,j-1) + par0(31,1)*fract_PT(i,j-1) + par0(32,1)*fract_MJ(i,j-1) + par0(33,1)*fract_NE(i,j-1) + par0(34,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_NE(i,j)=exp(par0(36,1) +par0(37,1)*exper(i,j) + par0(38,1)*educ2(i,1) + par0(39,1)*educ3(i,1) +par0(40,1)*fract_FT(i,j-1) + par0(40,1)*fract_PT(i,j-1) + par0(42,1)*fract_MJ(i,j-1) + par0(43,1)*fract_NE(i,j-1) + par0(44,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_CJ(i,j)=exp(par0(46,1) +par0(47,1)*exper(i,j) + par0(48,1)*educ2(i,1) + par0(49,1)*educ3(i,1) +par0(50,1)*fract_FT(i,j-1) + par0(50,1)*fract_PT(i,j-1) + par0(52,1)*fract_MJ(i,j-1) + par0(53,1)*fract_NE(i,j-1) + par0(54,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)+prob_CJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)<rand_state(i,j) && isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=1;
    elseif isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=0;
    end
end
end

%
randn('seed',654321)
panel_wage=nan(size(panel_mob,1),size(panel_mob,2));

mu=nan(size(panel_wage,1),size(panel_wage,2));
sig=nan(size(panel_wage,1),size(panel_wage,2));
tau1=nan(size(panel_wage,1),size(panel_wage,2));

for j=1:size(panel_wage,2)%no NE at first period
    if j==1
        mu(:,j)=par0(60) + par0(61)*educ2 + par0(62)*educ3 + par0(63)*exper(:,j)  + par0(64)*fract_PT(:,j) + par0(65)*fract_MJ(:,j) ...
        + par0(67)*fract_CJ(:,j) + par0(68);
        sig(:,j)=par0(69) + par0(70)*exper(:,j) + par0(71)*fract_PT(:,j) + par0(72)*fract_MJ(:,j) + par0(73)*fract_CJ(:,j)+par0(74);   
        tau1(:,j)=par0(75) + par0(76)*exper(:,j)+par0(77);  
    else
        mu(:,j)=par0(60) + par0(61)*educ2 + par0(62)*educ3 + par0(63)*exper(:,j)  + par0(64)*fract_PT(:,j) + par0(65)*fract_MJ(:,j) ...
        + par0(66)*fract_NE(:,j) + par0(67)*fract_CJ(:,j) +par0(68);
        sig(:,j)=par0(69) + par0(70)*exper(:,j) + par0(71)*fract_PT(:,j) + par0(72)*fract_MJ(:,j)  + -42000*fract_NE(:,j) ...
            + par0(73)*fract_CJ(:,j) +par0(74);   
        tau1(:,j)=par0(75) + par0(76)*exper(:,j) + par0(77) ...
                    + par0(78)*fract_FT(:,j).*fract_PT(:,j-1) + par0(79)*fract_FT(:,j).*fract_MJ(:,j-1) ...
                    + par0(80)*fract_FT(:,j).*fract_NE(:,j-1) + par0(81)*fract_FT(:,j).*fract_CJ(:,j-1) ...             
                    + par0(82)*fract_CJ(:,j).*fract_FT(:,j-1) + par0(83).*fract_CJ(:,j).*fract_PT(:,j-1) ...
                    + par0(84).*fract_CJ(:,j).*fract_MJ(:,j-1) + par0(85)*fract_CJ(:,j).*fract_NE(:,j-1);
    end
end
%
sig=exp(sig/2);
tau1=-1+2./(1+exp(tau1));

empstate=zeros(size(panel_wage,1),size(panel_wage,2));
for i=1:size(panel_wage,1)
    for j=1:size(panel_wage,2)
        if fract_FT(i,j)==1
            empstate(i,j)=1;
        elseif fract_PT(i,j)==1
            empstate(i,j)=2;
        elseif fract_MJ(i,j)==1
            empstate(i,j)=3;
        elseif fract_NE(i,j)==1
            empstate(i,j)=4;
        elseif fract_CJ(i,j)==1
            empstate(i,j)=5;
        end
    end
end


for i=1:size(panel_wage,1)
    panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
    while panel_wage(i,1)<0
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
    end
end
for i=1:size(panel_wage,1)
    for j=2:size(panel_wage,2)
        if isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1)%beginning of year
            mu_t=[mu(i,j) mu(i,j-1)];
            sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
            aux=mvnrnd(mu_t,sigma_t,1);
            ind=aux(1,1);
            while ind<0
                aux=mvnrnd(mu_t,sigma_t,1);
                ind=aux(1,1);
            end
            panel_wage(i,j)=aux(1,1);
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && empstate(i,j)~=empstate(i,j-1)
            mu_t=[mu(i,j) mu(i,j-1)];
            sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
            aux=mvnrnd(mu_t,sigma_t,1);
            ind=aux(1,1);
            while ind<0
                aux=mvnrnd(mu_t,sigma_t,1);
                ind=aux(1,1);
            end
            panel_wage(i,j)=aux(1,1);
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && empstate(i,j)==empstate(i,j-1)
            panel_wage(i,j)=panel_wage(i,j-1);
        end
    end
end

panel_wage_1_2=panel_wage;
panel_mob_1_2=empstate;
save('panel_wage_1_2.mat','panel_wage_1_2')
save('panel_mob_1_2.mat','panel_mob_1_2')
%% mobility class 2 wage class 1 
panel_mob=zeros(size(data_male.log_ave_wage,1),34*12);
panel_mob(fract_wcl==2,:)=NaN;
panel_mob(fract_mcl==1,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year
load('data_male.mat','data_male')
exper=zeros(size(data_male.log_ave_wage,1),34*12);
exper(:,1)=1.2;
for j=2:size(exper,2)
    exper(:,j)=exper(:,j-1)+0.1;
end
exper(isnan(aux(:,1))==1,:)=[];
yr=zeros(size(data_male.log_ave_wage,1),34*12);
yr(:,1)=19.99;
for j=12:12:((34-1)*12)
    yr(:,j)=19.99+0.01*j/12;
end
for j=2:size(yr,2)
    if yr(:,j)==0
        yr(:,j)=yr(:,j-1);
    end
end
yr(isnan(aux(:,1))==1,:)=[];
%
educ2=data_male.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_male.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
% FT=data_male.FT;
% FT(isnan(aux(:,1))==1,:)=[];
% PT=data_male.PT;
% PT(isnan(aux(:,1))==1,:)=[];
% MJ=data_male.MJ;
% MJ(isnan(aux(:,1))==1,:)=[];
% NE=data_male.NE;
% NE(isnan(aux(:,1))==1,:)=[];
% CJ=data_male.CJ;
% CJ(isnan(aux(:,1))==1,:)=[];
% empstate=data_male.empstate;
% empstate(isnan(aux(:,1))==1,:)=[];

%initial state:
rand_state=rand(size(panel_mob,1),size(panel_mob,2));
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(1,1) +par0(2,1)*exper(:,1) + par0(3,1)*educ2 + par0(4,1)*educ3+par0(5,1));%iniPT
den(:,1)=den(:,1)+exp(par0(6,1) +par0(7,1)*exper(:,1) + par0(8,1)*educ2 + par0(9,1)*educ3+par0(10,1));%iniMJ
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3+par0(15,1));%iniCJ
%
prob_FT=nan(size(panel_mob,1),size(panel_mob,2));
fract_FT=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_FT(i,1)=1./(den(i,1));
    if prob_FT(i,1)>rand_state(i,1) && isnan(prob_FT(i,1))==0
        fract_FT(i,1)=1;
    elseif isnan(prob_FT(i,1))==0
        fract_FT(i,1)=0;
    end
end
%
prob_PT=nan(size(panel_mob,1),size(panel_mob,2));
fract_PT=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_PT(i,1)=exp(par0(1,1) +par0(2,1)*exper(i,1) + par0(3,1)*yr(i,1) + par0(4,1)*educ2(i,1) + par0(5,1)*educ3(i,1)+par0(6,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)>rand_state(i,1) && prob_FT(i,1)<rand_state(i,1) && isnan(prob_PT(i,1))==0
        fract_PT(i,1)=1;
    elseif isnan(prob_PT(i,1))==0
        fract_PT(i,1)=0;
    end
end
%
prob_MJ=nan(size(panel_mob,1),size(panel_mob,2));
fract_MJ=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_MJ(i,1)=exp(par0(7,1) +par0(8,1)*exper(i,1) + par0(9,1)*yr(i,1) + par0(10,1)*educ2(i,1) + par0(11,1)*educ3(i,1)+par0(12,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)<rand_state(i,1) && isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=1;
    elseif isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=0;
    end
end
%
prob_CJ=nan(size(panel_mob,1),size(panel_mob,2));
fract_CJ=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_CJ(i,1)=exp(par0(13,1) +par0(14,1)*exper(i,1) + par0(15,1)*yr(i,1) + par0(16,1)*educ2(i,1) + par0(17,1)*educ3(i,1)+par0(18,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_CJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)<rand_state(i,1)
        fract_CJ(i,1)=1;
    elseif isnan(prob_CJ(i,1))==0
        fract_CJ(i,1)=0;
    end
end
prob_NE=nan(size(panel_mob,1),size(panel_mob,2));
fract_NE=zeros(size(panel_mob,1),size(panel_mob,2));

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,j) + par0(18,1)*educ2 + par0(19,1)*educ3 +par0(20,1)*fract_FT(:,j-1) + par0(21,1)*fract_PT(:,j-1) + par0(22,1)*fract_MJ(:,j-1) + par0(23,1)*fract_NE(:,j-1) + par0(24,1)*fract_CJ(:,j-1) +par0(25,1));
den(:,1)=den(:,1)+exp(par0(26,1) +par0(27,1)*exper(:,j) + par0(28,1)*educ2 + par0(29,1)*educ3 +par0(30,1)*fract_FT(:,j-1) + par0(31,1)*fract_PT(:,j-1) + par0(32,1)*fract_MJ(:,j-1) + par0(33,1)*fract_NE(:,j-1) + par0(34,1)*fract_CJ(:,j-1) +par0(35,1));
den(:,1)=den(:,1)+exp(par0(36,1) +par0(37,1)*exper(:,j) + par0(38,1)*educ2 + par0(39,1)*educ3 +par0(40,1)*fract_FT(:,j-1) + par0(41,1)*fract_PT(:,j-1) + par0(42,1)*fract_MJ(:,j-1) + par0(43,1)*fract_NE(:,j-1) + par0(44,1)*fract_CJ(:,j-1) +par0(45,1));
den(:,1)=den(:,1)+exp(par0(46,1) +par0(47,1)*exper(:,j) + par0(48,1)*educ2 + par0(49,1)*educ3 +par0(50,1)*fract_FT(:,j-1) + par0(51,1)*fract_PT(:,j-1) + par0(52,1)*fract_MJ(:,j-1) + par0(53,1)*fract_NE(:,j-1) + par0(54,1)*fract_CJ(:,j-1) +par0(55,1));
%
for i=1:size(panel_mob,1)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_PT(i,j)=exp(par0(16,1) +par0(17,1)*exper(i,j) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1) +par0(20,1)*fract_FT(i,j-1) + par0(21,1)*fract_PT(i,j-1) + par0(22,1)*fract_MJ(i,j-1) + par0(23,1)*fract_NE(i,j-1) + par0(24,1)*fract_CJ(i,j-1)+par0(25,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_MJ(i,j)=exp(par0(26,1) +par0(27,1)*exper(i,j) + par0(28,1)*educ2(i,1) + par0(29,1)*educ3(i,1) +par0(30,1)*fract_FT(i,j-1) + par0(31,1)*fract_PT(i,j-1) + par0(32,1)*fract_MJ(i,j-1) + par0(33,1)*fract_NE(i,j-1) + par0(34,1)*fract_CJ(i,j-1)+par0(35,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_NE(i,j)=exp(par0(36,1) +par0(37,1)*exper(i,j) + par0(38,1)*educ2(i,1) + par0(39,1)*educ3(i,1) +par0(40,1)*fract_FT(i,j-1) + par0(41,1)*fract_PT(i,j-1) + par0(42,1)*fract_MJ(i,j-1) + par0(43,1)*fract_NE(i,j-1) + par0(44,1)*fract_CJ(i,j-1)+par0(45,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_CJ(i,j)=exp(par0(46,1) +par0(47,1)*exper(i,j) + par0(48,1)*educ2(i,1) + par0(49,1)*educ3(i,1) +par0(50,1)*fract_FT(i,j-1) + par0(51,1)*fract_PT(i,j-1) + par0(52,1)*fract_MJ(i,j-1) + par0(53,1)*fract_NE(i,j-1) + par0(54,1)*fract_CJ(i,j-1)+par0(55,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)+prob_CJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)<rand_state(i,j) && isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=1;
    elseif isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=0;
    end
end
end

%
randn('seed',654321)
panel_wage=nan(size(panel_mob,1),size(panel_mob,2));

mu=nan(size(panel_wage,1),size(panel_wage,2));
sig=nan(size(panel_wage,1),size(panel_wage,2));
tau1=nan(size(panel_wage,1),size(panel_wage,2));

for j=1:size(panel_wage,2)%no NE at first period
    if j==1
        mu(:,j)=par0(60) + par0(61)*educ2 + par0(62)*educ3 + par0(63)*exper(:,j)  + par0(64)*fract_PT(:,j) + par0(65)*fract_MJ(:,j) ...
        + par0(67)*fract_CJ(:,j);
        sig(:,j)=par0(69) + par0(70)*exper(:,j) + par0(71)*fract_PT(:,j) + par0(72)*fract_MJ(:,j) + par0(73)*fract_CJ(:,j);   
        tau1(:,j)=par0(75) + par0(76)*exper(:,j);  
    else
        mu(:,j)=par0(60) + par0(61)*educ2 + par0(62)*educ3 + par0(63)*exper(:,j)  + par0(64)*fract_PT(:,j) + par0(65)*fract_MJ(:,j) ...
        + par0(66)*fract_NE(:,j) + par0(67)*fract_CJ(:,j);
        sig(:,j)=par0(69) + par0(70)*exper(:,j) + par0(71)*fract_PT(:,j) + par0(72)*fract_MJ(:,j)  + -42000*fract_NE(:,j) ...
            + par0(73)*fract_CJ(:,j);   
        tau1(:,j)=par0(75) + par0(76)*exper(:,j) ...
                    + par0(78)*fract_FT(:,j).*fract_PT(:,j-1) + par0(79)*fract_FT(:,j).*fract_MJ(:,j-1) ...
                    + par0(80)*fract_FT(:,j).*fract_NE(:,j-1) + par0(81)*fract_FT(:,j).*fract_CJ(:,j-1) ...             
                    + par0(82)*fract_CJ(:,j).*fract_FT(:,j-1) + par0(83).*fract_CJ(:,j).*fract_PT(:,j-1) ...
                    + par0(84).*fract_CJ(:,j).*fract_MJ(:,j-1) + par0(85)*fract_CJ(:,j).*fract_NE(:,j-1);
    end
end
%
sig=exp(sig/2);
tau1=-1+2./(1+exp(tau1));

empstate=zeros(size(panel_wage,1),size(panel_wage,2));
for i=1:size(panel_wage,1)
    for j=1:size(panel_wage,2)
        if fract_FT(i,j)==1
            empstate(i,j)=1;
        elseif fract_PT(i,j)==1
            empstate(i,j)=2;
        elseif fract_MJ(i,j)==1
            empstate(i,j)=3;
        elseif fract_NE(i,j)==1
            empstate(i,j)=4;
        elseif fract_CJ(i,j)==1
            empstate(i,j)=5;
        end
    end
end


for i=1:size(panel_wage,1)
    panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
    while panel_wage(i,1)<0
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
    end
end
for i=1:size(panel_wage,1)
    for j=2:size(panel_wage,2)
        if isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1)%beginning of year
            mu_t=[mu(i,j) mu(i,j-1)];
            sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
            aux=mvnrnd(mu_t,sigma_t,1);
            ind=aux(1,1);
            while ind<0
                aux=mvnrnd(mu_t,sigma_t,1);
                ind=aux(1,1);
            end
            panel_wage(i,j)=aux(1,1);
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && empstate(i,j)~=empstate(i,j-1)
            mu_t=[mu(i,j) mu(i,j-1)];
            sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
            aux=mvnrnd(mu_t,sigma_t,1);
            ind=aux(1,1);
            while ind<0
                aux=mvnrnd(mu_t,sigma_t,1);
                ind=aux(1,1);
            end
            panel_wage(i,j)=aux(1,1);
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && empstate(i,j)==empstate(i,j-1)
            panel_wage(i,j)=panel_wage(i,j-1);
        end
    end
end

panel_wage_2_1=panel_wage;
panel_mob_2_1=empstate;
save('panel_wage_2_1.mat','panel_wage_2_1')
save('panel_mob_2_1.mat','panel_mob_2_1')
%% mobility class 2 wage class 2 
panel_mob=zeros(size(data_male.log_ave_wage,1),34*12);
panel_mob(fract_wcl==1,:)=NaN;
panel_mob(fract_mcl==1,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year
load('data_male.mat','data_male')
exper=zeros(size(data_male.log_ave_wage,1),34*12);
exper(:,1)=1.2;
for j=2:size(exper,2)
    exper(:,j)=exper(:,j-1)+0.1;
end
exper(isnan(aux(:,1))==1,:)=[];
yr=zeros(size(data_male.log_ave_wage,1),34*12);
yr(:,1)=19.99;
for j=12:12:((34-1)*12)
    yr(:,j)=19.99+0.01*j/12;
end
for j=2:size(yr,2)
    if yr(:,j)==0
        yr(:,j)=yr(:,j-1);
    end
end
yr(isnan(aux(:,1))==1,:)=[];
%
educ2=data_male.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_male.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
% FT=data_male.FT;
% FT(isnan(aux(:,1))==1,:)=[];
% PT=data_male.PT;
% PT(isnan(aux(:,1))==1,:)=[];
% MJ=data_male.MJ;
% MJ(isnan(aux(:,1))==1,:)=[];
% NE=data_male.NE;
% NE(isnan(aux(:,1))==1,:)=[];
% CJ=data_male.CJ;
% CJ(isnan(aux(:,1))==1,:)=[];
% empstate=data_male.empstate;
% empstate(isnan(aux(:,1))==1,:)=[];

%initial state:
rand_state=rand(size(panel_mob,1),size(panel_mob,2));
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(1,1) +par0(2,1)*exper(:,1) + par0(3,1)*educ2 + par0(4,1)*educ3+par0(5,1));%iniPT
den(:,1)=den(:,1)+exp(par0(6,1) +par0(7,1)*exper(:,1) + par0(8,1)*educ2 + par0(9,1)*educ3+par0(10,1));%iniMJ
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3+par0(15,1));%iniCJ
%
prob_FT=nan(size(panel_mob,1),size(panel_mob,2));
fract_FT=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_FT(i,1)=1./(den(i,1));
    if prob_FT(i,1)>rand_state(i,1) && isnan(prob_FT(i,1))==0
        fract_FT(i,1)=1;
    elseif isnan(prob_FT(i,1))==0
        fract_FT(i,1)=0;
    end
end
%
prob_PT=nan(size(panel_mob,1),size(panel_mob,2));
fract_PT=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_PT(i,1)=exp(par0(1,1) +par0(2,1)*exper(i,1) + par0(3,1)*yr(i,1) + par0(4,1)*educ2(i,1) + par0(5,1)*educ3(i,1)+par0(6,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)>rand_state(i,1) && prob_FT(i,1)<rand_state(i,1) && isnan(prob_PT(i,1))==0
        fract_PT(i,1)=1;
    elseif isnan(prob_PT(i,1))==0
        fract_PT(i,1)=0;
    end
end
%
prob_MJ=nan(size(panel_mob,1),size(panel_mob,2));
fract_MJ=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_MJ(i,1)=exp(par0(7,1) +par0(8,1)*exper(i,1) + par0(9,1)*yr(i,1) + par0(10,1)*educ2(i,1) + par0(11,1)*educ3(i,1)+par0(12,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)<rand_state(i,1) && isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=1;
    elseif isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=0;
    end
end
%
prob_CJ=nan(size(panel_mob,1),size(panel_mob,2));
fract_CJ=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_CJ(i,1)=exp(par0(13,1) +par0(14,1)*exper(i,1) + par0(15,1)*yr(i,1) + par0(16,1)*educ2(i,1) + par0(17,1)*educ3(i,1)+par0(18,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_CJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)<rand_state(i,1)
        fract_CJ(i,1)=1;
    elseif isnan(prob_CJ(i,1))==0
        fract_CJ(i,1)=0;
    end
end
prob_NE=nan(size(panel_mob,1),size(panel_mob,2));
fract_NE=zeros(size(panel_mob,1),size(panel_mob,2));

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,j) + par0(18,1)*educ2 + par0(19,1)*educ3 +par0(20,1)*fract_FT(:,j-1) + par0(21,1)*fract_PT(:,j-1) + par0(22,1)*fract_MJ(:,j-1) + par0(23,1)*fract_NE(:,j-1) + par0(24,1)*fract_CJ(:,j-1) +par0(25,1));
den(:,1)=den(:,1)+exp(par0(26,1) +par0(27,1)*exper(:,j) + par0(28,1)*educ2 + par0(29,1)*educ3 +par0(30,1)*fract_FT(:,j-1) + par0(31,1)*fract_PT(:,j-1) + par0(32,1)*fract_MJ(:,j-1) + par0(33,1)*fract_NE(:,j-1) + par0(34,1)*fract_CJ(:,j-1) +par0(35,1));
den(:,1)=den(:,1)+exp(par0(36,1) +par0(37,1)*exper(:,j) + par0(38,1)*educ2 + par0(39,1)*educ3 +par0(40,1)*fract_FT(:,j-1) + par0(41,1)*fract_PT(:,j-1) + par0(42,1)*fract_MJ(:,j-1) + par0(43,1)*fract_NE(:,j-1) + par0(44,1)*fract_CJ(:,j-1) +par0(45,1));
den(:,1)=den(:,1)+exp(par0(46,1) +par0(47,1)*exper(:,j) + par0(48,1)*educ2 + par0(49,1)*educ3 +par0(50,1)*fract_FT(:,j-1) + par0(51,1)*fract_PT(:,j-1) + par0(52,1)*fract_MJ(:,j-1) + par0(53,1)*fract_NE(:,j-1) + par0(54,1)*fract_CJ(:,j-1) +par0(55,1));
%
for i=1:size(panel_mob,1)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_PT(i,j)=exp(par0(16,1) +par0(17,1)*exper(i,j) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1) +par0(20,1)*fract_FT(i,j-1) + par0(21,1)*fract_PT(i,j-1) + par0(22,1)*fract_MJ(i,j-1) + par0(23,1)*fract_NE(i,j-1) + par0(24,1)*fract_CJ(i,j-1)+par0(25,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_MJ(i,j)=exp(par0(26,1) +par0(27,1)*exper(i,j) + par0(28,1)*educ2(i,1) + par0(29,1)*educ3(i,1) +par0(30,1)*fract_FT(i,j-1) + par0(31,1)*fract_PT(i,j-1) + par0(32,1)*fract_MJ(i,j-1) + par0(33,1)*fract_NE(i,j-1) + par0(34,1)*fract_CJ(i,j-1)+par0(35,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_NE(i,j)=exp(par0(36,1) +par0(37,1)*exper(i,j) + par0(38,1)*educ2(i,1) + par0(39,1)*educ3(i,1) +par0(40,1)*fract_FT(i,j-1) + par0(41,1)*fract_PT(i,j-1) + par0(42,1)*fract_MJ(i,j-1) + par0(43,1)*fract_NE(i,j-1) + par0(44,1)*fract_CJ(i,j-1)+par0(45,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_CJ(i,j)=exp(par0(46,1) +par0(47,1)*exper(i,j) + par0(48,1)*educ2(i,1) + par0(49,1)*educ3(i,1) +par0(50,1)*fract_FT(i,j-1) + par0(51,1)*fract_PT(i,j-1) + par0(52,1)*fract_MJ(i,j-1) + par0(53,1)*fract_NE(i,j-1) + par0(54,1)*fract_CJ(i,j-1)+par0(55,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)+prob_CJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)<rand_state(i,j) && isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=1;
    elseif isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=0;
    end
end
end

%
randn('seed',654321)
panel_wage=nan(size(panel_mob,1),size(panel_mob,2));

mu=nan(size(panel_wage,1),size(panel_wage,2));
sig=nan(size(panel_wage,1),size(panel_wage,2));
tau1=nan(size(panel_wage,1),size(panel_wage,2));
for j=1:size(panel_wage,2)%no NE at first period
    if j==1
        mu(:,j)=par0(60) + par0(61)*educ2 + par0(62)*educ3 + par0(63)*exper(:,j)  + par0(64)*fract_PT(:,j) + par0(65)*fract_MJ(:,j) ...
        + par0(67)*fract_CJ(:,j) + par0(68);
        sig(:,j)=par0(69) + par0(70)*exper(:,j) + par0(71)*fract_PT(:,j) + par0(72)*fract_MJ(:,j) + par0(73)*fract_CJ(:,j)+par0(74);   
        tau1(:,j)=par0(75) + par0(76)*exper(:,j)+par0(77);  
    else
        mu(:,j)=par0(60) + par0(61)*educ2 + par0(62)*educ3 + par0(63)*exper(:,j)  + par0(64)*fract_PT(:,j) + par0(65)*fract_MJ(:,j) ...
        + par0(66)*fract_NE(:,j) + par0(67)*fract_CJ(:,j) +par0(68);
        sig(:,j)=par0(69) + par0(70)*exper(:,j) + par0(71)*fract_PT(:,j) + par0(72)*fract_MJ(:,j)  + -42000*fract_NE(:,j) ...
            + par0(73)*fract_CJ(:,j) +par0(74);   
        tau1(:,j)=par0(75) + par0(76)*exper(:,j) + par0(77) ...
                    + par0(78)*fract_FT(:,j).*fract_PT(:,j-1) + par0(79)*fract_FT(:,j).*fract_MJ(:,j-1) ...
                    + par0(80)*fract_FT(:,j).*fract_NE(:,j-1) + par0(81)*fract_FT(:,j).*fract_CJ(:,j-1) ...             
                    + par0(82)*fract_CJ(:,j).*fract_FT(:,j-1) + par0(83).*fract_CJ(:,j).*fract_PT(:,j-1) ...
                    + par0(84).*fract_CJ(:,j).*fract_MJ(:,j-1) + par0(85)*fract_CJ(:,j).*fract_NE(:,j-1);
    end
end
%
sig=exp(sig/2);
tau1=-1+2./(1+exp(tau1));

empstate=zeros(size(panel_wage,1),size(panel_wage,2));
for i=1:size(panel_wage,1)
    for j=1:size(panel_wage,2)
        if fract_FT(i,j)==1
            empstate(i,j)=1;
        elseif fract_PT(i,j)==1
            empstate(i,j)=2;
        elseif fract_MJ(i,j)==1
            empstate(i,j)=3;
        elseif fract_NE(i,j)==1
            empstate(i,j)=4;
        elseif fract_CJ(i,j)==1
            empstate(i,j)=5;
        end
    end
end


for i=1:size(panel_wage,1)
    panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
    while panel_wage(i,1)<0
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
    end
end
for i=1:size(panel_wage,1)
    for j=2:size(panel_wage,2)
        if isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1)%beginning of year
            mu_t=[mu(i,j) mu(i,j-1)];
            sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
            aux=mvnrnd(mu_t,sigma_t,1);
            ind=aux(1,1);
            while ind<0
                aux=mvnrnd(mu_t,sigma_t,1);
                ind=aux(1,1);
            end
            panel_wage(i,j)=aux(1,1);
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && empstate(i,j)~=empstate(i,j-1)
            mu_t=[mu(i,j) mu(i,j-1)];
            sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
            aux=mvnrnd(mu_t,sigma_t,1);
            ind=aux(1,1);
            while ind<0
                aux=mvnrnd(mu_t,sigma_t,1);
                ind=aux(1,1);
            end
            panel_wage(i,j)=aux(1,1);
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && empstate(i,j)==empstate(i,j-1)
            panel_wage(i,j)=panel_wage(i,j-1);
        end
    end
end

panel_wage_2_2=panel_wage;
panel_mob_2_2=empstate;
save('panel_wage_2_2.mat','panel_wage_2_2')
save('panel_mob_2_2.mat','panel_mob_2_2')
%% LT Values Whole Sample:

clear
load('panel_wage_2_2.mat','panel_wage_2_2')
load('panel_wage_1_2.mat','panel_wage_1_2')
load('panel_wage_2_1.mat','panel_wage_2_1')
load('panel_wage_1_1.mat','panel_wage_1_1')

panel_wage_20052009=[panel_wage_1_1; panel_wage_2_1; panel_wage_1_2; panel_wage_2_2];

save('panel_wage_20052009.mat','panel_wage_20052009')

load('panel_mob_2_2.mat','panel_mob_2_2')
load('panel_mob_1_2.mat','panel_mob_1_2')
load('panel_mob_2_1.mat','panel_mob_2_1')
load('panel_mob_1_1.mat','panel_mob_1_1')

panel_mob_20052009=[panel_mob_1_1; panel_mob_2_1; panel_mob_1_2; panel_mob_2_2];

save('panel_mob_20052009.mat','panel_mob_20052009')

disp('Finished!')
beep