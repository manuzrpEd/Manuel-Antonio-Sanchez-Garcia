cd 'C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Matlab\MonthlyIncome\2005-2009'
clc
clear
close all
clear mex
set(0,'DefaultFigureWindowStyle','docked')
disp('LT Values, Females, 2005-2009')
%
load('phat_female.mat','phat_female')
load('data_female.mat','data_female')
par0=zeros(1,1);
% %iniPT
par0(1,1)=phat_female(1,1);%cons
par0(2,1)=phat_female(2,1);%lmexp
par0(3,1)=phat_female(3,1);%ed2
par0(4,1)=phat_female(4,1);%ed3
par0(5,1)=phat_female(5,1);%mcl2
% %iniMJ
par0(6,1)=phat_female(6,1);
par0(7,1)=phat_female(7,1);
par0(8,1)=phat_female(8,1);
par0(9,1)=phat_female(9,1);
par0(10,1)=phat_female(10,1);
% %iniNE
par0(11,1)=phat_female(11,1);
par0(12,1)=phat_female(12,1);
par0(13,1)=phat_female(13,1);
par0(14,1)=phat_female(14,1);
par0(15,1)=phat_female(15,1);
% %iniCJ
par0(16,1)=phat_female(16,1);
par0(17,1)=phat_female(17,1);
par0(18,1)=phat_female(18,1);
par0(19,1)=phat_female(19,1);
par0(20,1)=phat_female(20,1);
% %PT 
par0(21,1)=phat_female(21,1);
par0(22,1)=phat_female(22,1);
par0(23,1)=phat_female(23,1);
par0(24,1)=phat_female(24,1);
par0(25,1)=phat_female(25,1);
par0(26,1)=phat_female(26,1);
par0(27,1)=phat_female(27,1);
par0(28,1)=phat_female(28,1);
par0(29,1)=phat_female(29,1);
% %MJ
par0(30,1)=phat_female(30,1);
par0(31,1)=phat_female(31,1);
par0(32,1)=phat_female(32,1);
par0(33,1)=phat_female(33,1);
par0(34,1)=phat_female(34,1);
par0(35,1)=phat_female(35,1);
par0(36,1)=phat_female(36,1);
par0(37,1)=phat_female(37,1);
par0(38,1)=phat_female(38,1);
% %NE
par0(39,1)=phat_female(39,1);
par0(40,1)=phat_female(40,1);
par0(41,1)=phat_female(41,1);
par0(42,1)=phat_female(42,1);
par0(43,1)=phat_female(43,1);
par0(44,1)=phat_female(44,1);
par0(45,1)=phat_female(45,1);
par0(46,1)=phat_female(46,1);
par0(47,1)=phat_female(47,1);
% %CJ
par0(48,1)=phat_female(48,1);
par0(49,1)=phat_female(49,1);
par0(50,1)=phat_female(50,1);
par0(51,1)=phat_female(51,1);
par0(52,1)=phat_female(52,1);
par0(53,1)=phat_female(53,1);
par0(54,1)=phat_female(54,1);
par0(55,1)=phat_female(55,1);
par0(56,1)=phat_female(56,1);
% %mcl
par0(57,1)=phat_female(57,1);%cons
par0(58,1)=phat_female(58,1);%year_birth
par0(59,1)=phat_female(59,1);%ED2
par0(60,1)=phat_female(60,1);%ED3
% %mu
par0(61,1)=phat_female(61,1);%cons
par0(62,1)=phat_female(62,1);%ED2
par0(63,1)=phat_female(63,1);%ED3
par0(64,1)=phat_female(64,1);%lmexp
par0(65,1)=phat_female(65,1);%PT
par0(66,1)=phat_female(66,1);%MJ
par0(67,1)=phat_female(67,1);%NE
par0(68,1)=phat_female(68,1);%CJ
par0(69,1)=phat_female(69,1);%wcl
% %sigma
par0(70,1)=phat_female(70,1);%cons
par0(71,1)=phat_female(71,1);%lmexp
par0(72,1)=phat_female(72,1);%PT
par0(73,1)=phat_female(73,1);%MJ
par0(74,1)=phat_female(74,1);%NE
par0(75,1)=phat_female(75,1);%CJ
par0(76,1)=phat_female(76,1);%wcl
% %tau1
par0(77,1)=phat_female(77,1);%constant
par0(78,1)=phat_female(78,1);%constant
par0(79,1)=phat_female(79,1);
par0(80,1)=phat_female(80,1);%PT FT
par0(81,1)=phat_female(81,1);%MJ FT
par0(82,1)=phat_female(82,1);%NE FT
par0(83,1)=phat_female(83,1);%CJ FT
par0(84,1)=phat_female(84,1);%FT PT
par0(85,1)=phat_female(85,1);%MJ PT
par0(86,1)=phat_female(86,1);%NE PT
par0(87,1)=phat_female(87,1);%CJ PT
par0(88,1)=phat_female(88,1);%FT MJ
par0(89,1)=phat_female(89,1);%PT MJ
par0(90,1)=phat_female(90,1);%NE MJ
par0(91,1)=phat_female(91,1);%CJ MJ
par0(92,1)=phat_female(92,1);%FT NE
par0(93,1)=phat_female(93,1);%PT NE
par0(94,1)=phat_female(94,1);%MJ NE
par0(95,1)=phat_female(95,1);%CJ NE
par0(96,1)=phat_female(96,1);%FT CJ
par0(97,1)=phat_female(97,1);%PT CJ
par0(98,1)=phat_female(98,1);%MJ CJ
par0(99,1)=phat_female(99,1);%NE CJ
% %wcl
par0(100,1)=phat_female(100,1);%cons
par0(101,1)=phat_female(101,1);%year_birth
par0(102,1)=phat_female(102,1);%ED2
par0(103,1)=phat_female(103,1);%ED3

%% Mobility and Wage Classes:

%probabilities of mobility classes:
rand('seed',123456)
rand_samp_mob=rand(size(data_female.year_birth,1),1);
%sample
prob_mcl=zeros(size(data_female.year_birth,1),1);
fract_mcl=zeros(size(data_female.year_birth,1),1);
for i=1:size(data_female.year_birth,1)
    prob_mcl(i,1)=1./(1+exp(par0(57,1)+par0(58,1)*data_female.year_birth(i,1)+par0(59,1)*data_female.ED2(i,1)+par0(60,1)*data_female.ED3(i,1)));
    if prob_mcl(i,1)>rand_samp_mob(i,1)
        fract_mcl(i,1)=1;
    elseif prob_mcl(i,1)<rand_samp_mob(i,1)
        fract_mcl(i,1)=2;
    end
end

% wage classes
rand_samp_wage=rand(size(data_female.year_birth,1),1);
%
prob_wcl=zeros(size(data_female.year_birth,1),1);
fract_wcl=zeros(size(data_female.year_birth,1),1);
for i=1:size(data_female.year_birth,1)
    prob_wcl(i,1)=1./(1+exp(par0(100,1)+par0(101,1)*data_female.year_birth(i,1)+par0(102,1)*data_female.ED2(i,1)+par0(103,1)*data_female.ED3(i,1)));
    if prob_wcl(i,1)>rand_samp_wage(i,1)
        fract_wcl(i,1)=1;
    elseif prob_wcl(i,1)<rand_samp_wage(i,1)
        fract_wcl(i,1)=2;
    end
end
%

%parameters probability UB:
%probit:
% par_educ2=-0.0107;
% par_educ3=-0.0563;
% par_lFT=-0.09085;
% par_lPT=-0.08176;
% par_lMJ=-0.0955;
% par_lNE=-0.15372;
% par_lUB=0.2816544;
% par_year_birth=-0.0000335;
%ols:
par_educ2=0.0179786;
par_educ3=-0.0091072;
par_lFT=-0.1663256;
par_lPT=-0.2211814;
par_lMJ=-0.2679543;
par_lNE=-0.2761296;
par_lCJ=0.0377471;
par_lUB=0.5998395;
par_year_birth=0.0001455;

%
%% mobility class 1 wage class 1 
panel_mob=zeros(size(data_female.log_ave_wage,1),34*12);
panel_mob(fract_wcl==2,:)=NaN;
panel_mob(fract_mcl==2,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year
load('data_female.mat','data_female')
exper=zeros(size(data_female.log_ave_wage,1),34*12);
exper(:,1)=1.2;
for j=2:size(exper,2)
    exper(:,j)=exper(:,j-1)+0.1;
end
exper(isnan(aux(:,1))==1,:)=[];
yr=zeros(size(data_female.log_ave_wage,1),34*12);
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
educ2=data_female.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_female.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
% FT=data_female.FT;
% FT(isnan(aux(:,1))==1,:)=[];
% PT=data_female.PT;
% PT(isnan(aux(:,1))==1,:)=[];
% MJ=data_female.MJ;
% MJ(isnan(aux(:,1))==1,:)=[];
% NE=data_female.NE;
% NE(isnan(aux(:,1))==1,:)=[];
% CJ=data_female.CJ;
% CJ(isnan(aux(:,1))==1,:)=[];
% empstate=data_female.empstate;
% empstate(isnan(aux(:,1))==1,:)=[];

%initial state:
rand_state=rand(size(panel_mob,1),size(panel_mob,2));
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(1,1) +par0(2,1)*exper(:,1) + par0(3,1)*educ2 + par0(4,1)*educ3);%iniPT
den(:,1)=den(:,1)+exp(par0(6,1) +par0(7,1)*exper(:,1) + par0(8,1)*educ2 + par0(9,1)*educ3);%iniMJ
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3);%iniNE
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,1) + par0(18,1)*educ2 + par0(19,1)*educ3);%iniCJ
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
prob_NE=nan(size(panel_mob,1),size(panel_mob,2));
fract_NE=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_NE(i,1)=exp(par0(11,1) +par0(12,1)*exper(i,1) + par0(13,1)*educ2(i,1) + par0(14,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_NE(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)<rand_state(i,1)
        fract_NE(i,1)=1;
    elseif isnan(prob_NE(i,1))==0
        fract_NE(i,1)=0;
    end
end

prob_CJ=nan(size(panel_mob,1),size(panel_mob,2));
fract_CJ=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_CJ(i,1)=exp(par0(16,1) +par0(17,1)*exper(i,1) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_NE(i,1)+prob_CJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_NE(i,1)<rand_state(i,1)
        fract_CJ(i,1)=1;
    elseif isnan(prob_CJ(i,1))==0
        fract_CJ(i,1)=0;
    end
end

% probabilities of states:
% ave_prob_FT_ini=mean(prob_FT(:,1))
% ave_prob_PT_ini=mean(prob_PT(:,1))
% ave_prob_MJ_ini=mean(prob_MJ(:,1))
% ave_prob_NE_ini=mean(prob_NE(:,1))

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(21,1) + par0(22,1)*exper(:,j) + par0(23,1)*educ2 + par0(24,1)*educ3 + par0(25,1)*fract_PT(:,j-1) + par0(26,1)*fract_MJ(:,j-1) + par0(27,1)*fract_NE(:,j-1) + par0(28,1)*fract_CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(30,1) + par0(31,1)*exper(:,j) + par0(32,1)*educ2 + par0(33,1)*educ3 + par0(34,1)*fract_PT(:,j-1) + par0(35,1)*fract_MJ(:,j-1) + par0(36,1)*fract_NE(:,j-1) + par0(37,1)*fract_CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(39,1) + par0(40,1)*exper(:,j) + par0(41,1)*educ2 + par0(42,1)*educ3 + par0(43,1)*fract_PT(:,j-1) + par0(44,1)*fract_MJ(:,j-1) + par0(45,1)*fract_NE(:,j-1) + par0(46,1)*fract_CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(48,1) + par0(49,1)*exper(:,j) + par0(50,1)*educ2 + par0(51,1)*educ3 + par0(52,1)*fract_PT(:,j-1) + par0(53,1)*fract_MJ(:,j-1) + par0(54,1)*fract_NE(:,j-1) + par0(55,1)*fract_CJ(:,j-1));
for i=1:size(panel_mob,1)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_PT(i,j)=exp(par0(21,1) + par0(22,1)*exper(i,j) + par0(23,1)*educ2(i,1) + par0(24,1)*educ3(i,1) + par0(25,1)*fract_PT(i,j-1) + par0(26,1)*fract_MJ(i,j-1) + par0(27,1)*fract_NE(i,j-1) + par0(28,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_MJ(i,j)=exp(par0(30,1) + par0(31,1)*exper(i,j) + par0(32,1)*educ2(i,1) + par0(33,1)*educ3(i,1) + par0(34,1)*fract_PT(i,j-1) + par0(35,1)*fract_MJ(i,j-1) + par0(36,1)*fract_NE(i,j-1) + par0(37,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_NE(i,j)=exp(par0(39,1) + par0(40,1)*exper(i,j) + par0(41,1)*educ2(i,1) + par0(42,1)*educ3(i,1) + par0(43,1)*fract_PT(i,j-1) + par0(44,1)*fract_MJ(i,j-1) + par0(45,1)*fract_NE(i,j-1) + par0(46,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_CJ(i,j)=exp(par0(48,1) + par0(49,1)*exper(i,j) + par0(50,1)*educ2(i,1) + par0(51,1)*educ3(i,1) + par0(52,1)*fract_PT(i,j-1) + par0(53,1)*fract_MJ(i,j-1) + par0(54,1)*fract_NE(i,j-1) + par0(55,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)+prob_CJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)<rand_state(i,j) && isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=1;
    elseif isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=0;
    end
end
end

% probabilities of states:
% ave_prob_FT=mean(nanmean(prob_FT(:,2:end)))
% ave_prob_PT=mean(nanmean(prob_PT(:,2:end)))
% ave_prob_MJ=mean(nanmean(prob_MJ(:,2:end)))
% ave_prob_NE=mean(nanmean(prob_NE(:,2:end)))

% probabilities of UB:
rand_samp_UB=rand(size(panel_mob,1),size(panel_mob,2));
prob_UB=zeros(size(panel_mob,1),size(panel_mob,2));
fract_UB=zeros(size(panel_mob,1),size(panel_mob,2));
for i=1:size(panel_mob,1)
    for j=1:size(panel_mob,2)
        if j==1
            prob_UB(i,j)=(par_year_birth*data_female.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)).*fract_NE(i,j);
        else
            prob_UB(i,j)=(par_year_birth*data_female.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)...
            +par_lFT*fract_FT(i,j-1)+par_lPT*fract_PT(i,j-1)+par_lMJ*fract_MJ(i,j-1)+par_lNE*fract_NE(i,j-1)+par_lCJ*fract_CJ(i,j-1)+par_lUB*fract_UB(i,j-1)).*fract_NE(i,j);
        end
        if prob_UB(i,j)>rand_samp_UB(i,j)
            fract_UB(i,j)=1;
        elseif prob_UB(i,j)<rand_samp_UB(i,j)
            fract_UB(i,j)=0;
        end
    end
end

%
randn('seed',654321)
panel_wage=nan(size(panel_mob,1),size(panel_mob,2));

mu=nan(size(panel_wage,1),size(panel_wage,2));
sig=nan(size(panel_wage,1),size(panel_wage,2));
tau1=nan(size(panel_wage,1),size(panel_wage,2));

for j=1:size(panel_wage,2)%NE at first period
    if j==1
        mu(:,j)=par0(61) + par0(62)*educ2 + par0(63)*educ3 + par0(64)*exper(:,j)  + par0(65)*fract_PT(:,j) + par0(66)*fract_MJ(:,j) ...
        + par0(67)*fract_UB(:,j)+ par0(68)*fract_CJ(:,j);
        sig(:,j)=par0(70) + par0(71)*exper(:,j) + par0(72)*fract_PT(:,j) + par0(73)*fract_MJ(:,j) + par0(74)*fract_UB(:,j) + par0(75)*fract_CJ(:,j);   
        tau1(:,j)=par0(77) + par0(78)*exper(:,j);
    else
        mu(:,j)=par0(61) + par0(62)*educ2 + par0(63)*educ3 + par0(64)*exper(:,j)  + par0(65)*fract_PT(:,j) + par0(66)*fract_MJ(:,j) ...
        + par0(67)*fract_UB(:,j)+ par0(68)*fract_CJ(:,j);
        sig(:,j)=par0(70) + par0(71)*exper(:,j) + par0(72)*fract_PT(:,j) + par0(73)*fract_MJ(:,j) + par0(74)*fract_UB(:,j) + par0(75)*fract_CJ(:,j); 
        tau1(:,j)=par0(77) + par0(78)*exper(:,j) ...
                    + par0(80)*fract_FT(:,j).*fract_PT(:,j-1) + par0(81)*fract_FT(:,j).*fract_MJ(:,j-1) ...
                    + par0(82)*fract_FT(:,j).*fract_UB(:,j-1) + par0(83)*fract_FT(:,j).*fract_CJ(:,j-1)  ...
                    + par0(84)*fract_PT(:,j).*fract_FT(:,j-1) + par0(85)*fract_PT(:,j).*fract_MJ(:,j-1) ...
                    + par0(86)*fract_PT(:,j).*fract_UB(:,j-1) + par0(87)*fract_PT(:,j).*fract_CJ(:,j-1)  ...
                    + par0(88)*fract_MJ(:,j).*fract_FT(:,j-1) + par0(89)*fract_MJ(:,j).*fract_PT(:,j-1) ...
                    + par0(90)*fract_MJ(:,j).*fract_UB(:,j-1) + par0(91)*fract_MJ(:,j).*fract_CJ(:,j-1)  ...
                    + par0(92)*fract_UB(:,j).*fract_FT(:,j-1) + par0(93)*fract_UB(:,j).*fract_PT(:,j-1) ...
                    + par0(94)*fract_UB(:,j).*fract_MJ(:,j-1) + par0(95)*fract_UB(:,j).*fract_CJ(:,j-1)  ...
                    + par0(96)*fract_CJ(:,j).*fract_FT(:,j-1) + par0(97)*fract_CJ(:,j).*fract_PT(:,j-1) ...
                    + par0(98)*fract_CJ(:,j).*fract_MJ(:,j-1) + par0(99)*fract_CJ(:,j).*fract_UB(:,j-1);
    end
end
%
sig=exp(sig/2);
tau1=-1+2./(1+exp(tau1));

model_empstate=nan(size(panel_mob,1),size(panel_mob,2));
for i=1:size(panel_wage,1)
    for j=1:size(panel_wage,2)
        if fract_FT(i,j)==1
            model_empstate(i,j)=1;
        elseif fract_PT(i,j)==1
            model_empstate(i,j)=2;
        elseif fract_MJ(i,j)==1
            model_empstate(i,j)=3;
        elseif fract_NE(i,j)==1
            model_empstate(i,j)=4;
        elseif fract_CJ(i,j)==1
            model_empstate(i,j)=5;
        end
    end
end
%
shock=zeros(size(panel_wage,1),size(panel_wage,2));

for i=1:size(panel_wage,1)
    if fract_UB(i,1)==1
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>8
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    elseif model_empstate(i,1)~=4
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>9
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    end
end
for i=1:size(panel_wage,1)
    for j=2:size(panel_wage,2)
        %same state within year no NE
        if isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)==model_empstate(i,j-1) && model_empstate(i,j-1)~=4
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1);
            shock(i,j)=shock(i,j-1);
        %same state between NE
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)==model_empstate(i,j-1) && model_empstate(i,j-1)==4 && fract_UB(i,j)==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        %change of state within year not between NEs
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)~=model_empstate(i,j-1) && fract_NE(i,j)~=1 && fract_NE(i,j-1)~=1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %same state within year between UBs
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && fract_UB(i,j)==1 && fract_UB(i,j-1)==1
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1);
            shock(i,j)=shock(i,j-1);
        %coming from NE period and no UB to any empstate~=4 regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && model_empstate(i,j)~=4
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from UB to any empstate~=4 regardless year
        elseif fract_UB(i,j-1)==1 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && model_empstate(i,j)~=4
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from NE period and no UB to same regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1
            panel_wage(i,j)=panel_wage(i,j-1);%mu(i,j)+tau1(i,j)*shock(i,j-1); 
            shock(i,j)=shock(i,j-1);
        %coming from NE period and no UB to UB regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && fract_UB(i,j)==1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            while panel_wage(i,j)<5 || panel_wage(i,j)>8
                panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            end 
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from any empstate to UB regardless year
        elseif model_empstate(i,j-1)~=4 && isnan(mu(i,j))==0 && fract_UB(i,j)==1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from any empstate~=4 to NE and no UB regardless year
        elseif model_empstate(i,j-1)~=4 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        %coming from fract_UB==0 to NE and no UB regardless year
        elseif fract_UB(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_NE(i,j)==0 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))            
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_UB(i,j)==1 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))  
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_UB(i,j)==1 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))  
        end
    end
end
for i=1:size(panel_wage,1)
    for j=1:size(panel_wage,2)
        if fract_UB(i,j)==1 && isnan(panel_wage(i,j))==1
            break
        end
    end
end
%truncation
% for i=1:size(panel_wage,1)
%     for j=2:size(panel_wage,2)
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==1
%             while panel_wage(i,j)<5 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==5 && model_empstate(i,j)==5
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==3
%             while panel_wage(i,j)<6 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==5 && model_empstate(i,j)==3
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==1 && fract_UB(i,j)==1
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==5 && fract_UB(i,j)==1
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==2
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==5 && model_empstate(i,j)==2
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==1
%             while panel_wage(i,j)<5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==5
%             while panel_wage(i,j)<5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==3
%             while panel_wage(i,j)<5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==3 && fract_UB(i,j)==1
%             while panel_wage(i,j)<5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==1%
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==5
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==3
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && fract_UB(i,j)==1
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==2
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==1
%             while panel_wage(i,j)<4 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==5
%             while panel_wage(i,j)<4 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==3
%             while panel_wage(i,j)<5 || panel_wage(i,j)>7.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && fract_UB(i,j)==1
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==1
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==5
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%     end
% end
%
%https://uk.mathworks.com/help/stats/examples/simulating-dependent-random-variables-using-copulas.html
% for i=1:size(panel_wage,1)
%     for j=2:size(panel_wage,2)
%         if isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1)%beginning of year
%             mu_t=[mu(i,j) mu(i,j-1)];
%             sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
%             aux=mvnrnd(mu_t,sigma_t,1);
%             ind=aux(1,1);
%             while ind<0
%                 aux=mvnrnd(mu_t,sigma_t,1);
%                 ind=aux(1,1);
%             end
%             panel_wage(i,j)=aux(1,1);
%         elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)~=model_empstate(i,j-1)%change of state within year
%             mu_t=[mu(i,j) mu(i,j-1)];
%             sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
%             aux=mvnrnd(mu_t,sigma_t,1);
%             ind=aux(1,1);
%             while ind<0
%                 aux=mvnrnd(mu_t,sigma_t,1);
%                 ind=aux(1,1);
%             end
%             panel_wage(i,j)=aux(1,1);
%         elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)==model_empstate(i,j-1)%same state within year
%             panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1);
%         end
%     end
% end

% n = 1000;
% sigma = .5;
% rho = .7;
% SigmaDep = sigma.^2 .* [1 rho; rho 1]
% ZDep = mvnrnd([7 9], SigmaDep, n);
% XDep = exp(ZDep);
% plot(ZDep(:,2),ZDep(:,1),'.');
% axis equal;
% % axis([0 5 0 5]);
% xlabel('X2');
% ylabel('X1');

panel_wage_1_1=panel_wage;
panel_mob_1_1=panel_mob;

save('panel_wage_1_1.mat','panel_wage_1_1')
save('panel_mob_1_1.mat','panel_mob_1_1')
%% mobility class 1 wage class 2 
panel_mob=zeros(size(data_female.log_ave_wage,1),34*12);
panel_mob(fract_wcl==1,:)=NaN;
panel_mob(fract_mcl==2,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year
load('data_female.mat','data_female')

exper=zeros(size(data_female.log_ave_wage,1),34*12);
exper(:,1)=1.2;
for j=2:size(exper,2)
    exper(:,j)=exper(:,j-1)+0.1;
end
exper(isnan(aux(:,1))==1,:)=[];
yr=zeros(size(data_female.log_ave_wage,1),34*12);
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
educ2=data_female.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_female.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
% FT=data_female.FT;
% FT(isnan(aux(:,1))==1,:)=[];
% PT=data_female.PT;
% PT(isnan(aux(:,1))==1,:)=[];
% MJ=data_female.MJ;
% MJ(isnan(aux(:,1))==1,:)=[];
% NE=data_female.NE;
% NE(isnan(aux(:,1))==1,:)=[];
% CJ=data_female.CJ;
% CJ(isnan(aux(:,1))==1,:)=[];
% empstate=data_female.empstate;
% empstate(isnan(aux(:,1))==1,:)=[];

%initial state:
rand_state=rand(size(panel_mob,1),size(panel_mob,2));
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(1,1) +par0(2,1)*exper(:,1) + par0(3,1)*educ2 + par0(4,1)*educ3);%iniPT
den(:,1)=den(:,1)+exp(par0(6,1) +par0(7,1)*exper(:,1) + par0(8,1)*educ2 + par0(9,1)*educ3);%iniMJ
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3);%iniNE
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,1) + par0(18,1)*educ2 + par0(19,1)*educ3);%iniCJ
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
prob_NE=nan(size(panel_mob,1),size(panel_mob,2));
fract_NE=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_NE(i,1)=exp(par0(11,1) +par0(12,1)*exper(i,1) + par0(13,1)*educ2(i,1) + par0(14,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_NE(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)<rand_state(i,1)
        fract_NE(i,1)=1;
    elseif isnan(prob_NE(i,1))==0
        fract_NE(i,1)=0;
    end
end


prob_CJ=nan(size(panel_mob,1),size(panel_mob,2));
fract_CJ=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_CJ(i,1)=exp(par0(16,1) +par0(17,1)*exper(i,1) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_NE(i,1)+prob_CJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_NE(i,1)<rand_state(i,1)
        fract_CJ(i,1)=1;
    elseif isnan(prob_CJ(i,1))==0
        fract_CJ(i,1)=0;
    end
end

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(21,1) + par0(22,1)*exper(:,j) + par0(23,1)*educ2 + par0(24,1)*educ3 + par0(25,1)*fract_PT(:,j-1) + par0(26,1)*fract_MJ(:,j-1) + par0(27,1)*fract_NE(:,j-1) + par0(28,1)*fract_CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(30,1) + par0(31,1)*exper(:,j) + par0(32,1)*educ2 + par0(33,1)*educ3 + par0(34,1)*fract_PT(:,j-1) + par0(35,1)*fract_MJ(:,j-1) + par0(36,1)*fract_NE(:,j-1) + par0(37,1)*fract_CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(39,1) + par0(40,1)*exper(:,j) + par0(41,1)*educ2 + par0(42,1)*educ3 + par0(43,1)*fract_PT(:,j-1) + par0(44,1)*fract_MJ(:,j-1) + par0(45,1)*fract_NE(:,j-1) + par0(46,1)*fract_CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(48,1) + par0(49,1)*exper(:,j) + par0(50,1)*educ2 + par0(51,1)*educ3 + par0(52,1)*fract_PT(:,j-1) + par0(53,1)*fract_MJ(:,j-1) + par0(54,1)*fract_NE(:,j-1) + par0(55,1)*fract_CJ(:,j-1));
for i=1:size(panel_mob,1)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_PT(i,j)=exp(par0(21,1) + par0(22,1)*exper(i,j) + par0(23,1)*educ2(i,1) + par0(24,1)*educ3(i,1) + par0(25,1)*fract_PT(i,j-1) + par0(26,1)*fract_MJ(i,j-1) + par0(27,1)*fract_NE(i,j-1) + par0(28,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_MJ(i,j)=exp(par0(30,1) + par0(31,1)*exper(i,j) + par0(32,1)*educ2(i,1) + par0(33,1)*educ3(i,1) + par0(34,1)*fract_PT(i,j-1) + par0(35,1)*fract_MJ(i,j-1) + par0(36,1)*fract_NE(i,j-1) + par0(37,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_NE(i,j)=exp(par0(39,1) + par0(40,1)*exper(i,j) + par0(41,1)*educ2(i,1) + par0(42,1)*educ3(i,1) + par0(43,1)*fract_PT(i,j-1) + par0(44,1)*fract_MJ(i,j-1) + par0(45,1)*fract_NE(i,j-1) + par0(46,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_CJ(i,j)=exp(par0(48,1) + par0(49,1)*exper(i,j) + par0(50,1)*educ2(i,1) + par0(51,1)*educ3(i,1) + par0(52,1)*fract_PT(i,j-1) + par0(53,1)*fract_MJ(i,j-1) + par0(54,1)*fract_NE(i,j-1) + par0(55,1)*fract_CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)+prob_CJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)<rand_state(i,j) && isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=1;
    elseif isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=0;
    end
end
end

% probabilities of UB:
rand_samp_UB=rand(size(panel_mob,1),size(panel_mob,2));
prob_UB=zeros(size(panel_mob,1),size(panel_mob,2));
fract_UB=zeros(size(panel_mob,1),size(panel_mob,2));
for i=1:size(panel_mob,1)
    for j=1:size(panel_mob,2)
        if j==1
            prob_UB(i,j)=(par_year_birth*data_female.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)).*fract_NE(i,j);
        else
            prob_UB(i,j)=(par_year_birth*data_female.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)...
            +par_lFT*fract_FT(i,j-1)+par_lPT*fract_PT(i,j-1)+par_lMJ*fract_MJ(i,j-1)+par_lNE*fract_NE(i,j-1)+par_lCJ*fract_CJ(i,j-1)+par_lUB*fract_UB(i,j-1)).*fract_NE(i,j);
        end
        if prob_UB(i,j)>rand_samp_UB(i,j)
            fract_UB(i,j)=1;
        elseif prob_UB(i,j)<rand_samp_UB(i,j)
            fract_UB(i,j)=0;
        end
    end
end

%
randn('seed',654321)
panel_wage=nan(size(panel_mob,1),size(panel_mob,2));

mu=nan(size(panel_wage,1),size(panel_wage,2));
sig=nan(size(panel_wage,1),size(panel_wage,2));
tau1=nan(size(panel_wage,1),size(panel_wage,2));

for j=1:size(panel_wage,2)%NE at first period
    if j==1
        mu(:,j)=par0(61) + par0(62)*educ2 + par0(63)*educ3 + par0(64)*exper(:,j)  + par0(65)*fract_PT(:,j) + par0(66)*fract_MJ(:,j) ...
        + par0(67)*fract_UB(:,j)+ par0(68)*fract_CJ(:,j) + par0(69);
        sig(:,j)=par0(70) + par0(71)*exper(:,j) + par0(72)*fract_PT(:,j) + par0(73)*fract_MJ(:,j) + par0(74)*fract_UB(:,j) + par0(75)*fract_CJ(:,j)+par0(76);   
        tau1(:,j)=par0(77) + par0(78)*exper(:,j)+par0(79);  
    else
        mu(:,j)=par0(61) + par0(62)*educ2 + par0(63)*educ3 + par0(64)*exper(:,j)  + par0(65)*fract_PT(:,j) + par0(66)*fract_MJ(:,j) ...
        + par0(67)*fract_UB(:,j)+ par0(68)*fract_CJ(:,j)+par0(69);
        sig(:,j)=par0(70) + par0(71)*exper(:,j) + par0(72)*fract_PT(:,j) + par0(73)*fract_MJ(:,j) + par0(74)*fract_UB(:,j) + par0(75)*fract_CJ(:,j)+par0(76);   
        tau1(:,j)=par0(77) + par0(78)*exper(:,j) + par0(79) ...
                    + par0(80)*fract_FT(:,j).*fract_PT(:,j-1) + par0(81)*fract_FT(:,j).*fract_MJ(:,j-1) ...
                    + par0(82)*fract_FT(:,j).*fract_UB(:,j-1) + par0(83)*fract_FT(:,j).*fract_CJ(:,j-1)  ...
                    + par0(84)*fract_PT(:,j).*fract_FT(:,j-1) + par0(85)*fract_PT(:,j).*fract_MJ(:,j-1) ...
                    + par0(86)*fract_PT(:,j).*fract_UB(:,j-1) + par0(87)*fract_PT(:,j).*fract_CJ(:,j-1)  ...
                    + par0(88)*fract_MJ(:,j).*fract_FT(:,j-1) + par0(89)*fract_MJ(:,j).*fract_PT(:,j-1) ...
                    + par0(90)*fract_MJ(:,j).*fract_UB(:,j-1) + par0(91)*fract_MJ(:,j).*fract_CJ(:,j-1)  ...
                    + par0(92)*fract_UB(:,j).*fract_FT(:,j-1) + par0(93)*fract_UB(:,j).*fract_PT(:,j-1) ...
                    + par0(94)*fract_UB(:,j).*fract_MJ(:,j-1) + par0(95)*fract_UB(:,j).*fract_CJ(:,j-1)  ...
                    + par0(96)*fract_CJ(:,j).*fract_FT(:,j-1) + par0(97)*fract_CJ(:,j).*fract_PT(:,j-1) ...
                    + par0(98)*fract_CJ(:,j).*fract_MJ(:,j-1) + par0(99)*fract_CJ(:,j).*fract_UB(:,j-1);
    end
end
%
sig=exp(sig/2);
tau1=-1+2./(1+exp(tau1));

model_empstate=nan(size(panel_mob,1),size(panel_mob,2));
for i=1:size(panel_wage,1)
    for j=1:size(panel_wage,2)
        if fract_FT(i,j)==1
            model_empstate(i,j)=1;
        elseif fract_PT(i,j)==1
            model_empstate(i,j)=2;
        elseif fract_MJ(i,j)==1
            model_empstate(i,j)=3;
        elseif fract_NE(i,j)==1
            model_empstate(i,j)=4;
        elseif fract_CJ(i,j)==1
            model_empstate(i,j)=5;
        end
    end
end
%
shock=zeros(size(panel_wage,1),size(panel_wage,2));

for i=1:size(panel_wage,1)
    if fract_UB(i,1)==1
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>8
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    elseif model_empstate(i,1)~=4
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>9
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    end
end
for i=1:size(panel_wage,1)
    for j=2:size(panel_wage,2)
        %same state within year no NE
        if isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)==model_empstate(i,j-1) && model_empstate(i,j-1)~=4
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1);
            shock(i,j)=shock(i,j-1);
        %same state between NE
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)==model_empstate(i,j-1) && model_empstate(i,j-1)==4 && fract_UB(i,j)==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        %change of state within year not between NEs
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)~=model_empstate(i,j-1) && fract_NE(i,j)~=1 && fract_NE(i,j-1)~=1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %same state within year between UBs
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && fract_UB(i,j)==1 && fract_UB(i,j-1)==1
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1);
            shock(i,j)=shock(i,j-1);
        %coming from NE period and no UB to any empstate~=4 regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && model_empstate(i,j)~=4
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from UB to any empstate~=4 regardless year
        elseif fract_UB(i,j-1)==1 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && model_empstate(i,j)~=4
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from NE period and no UB to same regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1
            panel_wage(i,j)=panel_wage(i,j-1);%mu(i,j)+tau1(i,j)*shock(i,j-1); 
            shock(i,j)=shock(i,j-1);
        %coming from NE period and no UB to UB regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && fract_UB(i,j)==1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            while panel_wage(i,j)<5 || panel_wage(i,j)>8
                panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            end 
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from any empstate to UB regardless year
        elseif model_empstate(i,j-1)~=4 && isnan(mu(i,j))==0 && fract_UB(i,j)==1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from any empstate~=4 to NE and no UB regardless year
        elseif model_empstate(i,j-1)~=4 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        %coming from fract_UB==0 to NE and no UB regardless year
        elseif fract_UB(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_NE(i,j)==0 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))            
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_UB(i,j)==1 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))  
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_UB(i,j)==1 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))  
        end
    end
end
for i=1:size(panel_wage,1)
    for j=1:size(panel_wage,2)
        if fract_UB(i,j)==1 && isnan(panel_wage(i,j))==1
            break
        end
    end
end
% %truncation
% for i=1:size(panel_wage,1)
%     for j=2:size(panel_wage,2)
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==1
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==5 && model_empstate(i,j)==5
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==3
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==5 && model_empstate(i,j)==3
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==1 && fract_UB(i,j)==1
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==5 && fract_UB(i,j)==1
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==2
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==5 && model_empstate(i,j)==2
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==1
%             while panel_wage(i,j)<4 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==5
%             while panel_wage(i,j)<4 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==3
%             while panel_wage(i,j)<4 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==3 && fract_UB(i,j)==1
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==1
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==5
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==3
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && fract_UB(i,j)==1
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==2
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==1
%             while panel_wage(i,j)<4 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==5
%             while panel_wage(i,j)<4 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==3
%             while panel_wage(i,j)<5 || panel_wage(i,j)>7.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && fract_UB(i,j)==1
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==1
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==5
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%     end
% end

panel_wage_1_2=panel_wage;
panel_mob_1_2=panel_mob;
save('panel_wage_1_2.mat','panel_wage_1_2')
save('panel_mob_1_2.mat','panel_mob_1_2')
%% mobility class 2 wage class 1
panel_mob=zeros(size(data_female.log_ave_wage,1),34*12);
panel_mob(fract_wcl==2,:)=NaN;
panel_mob(fract_mcl==1,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year
load('data_female.mat','data_female')

exper=zeros(size(data_female.log_ave_wage,1),34*12);
exper(:,1)=1.2;
for j=2:size(exper,2)
    exper(:,j)=exper(:,j-1)+0.1;
end
exper(isnan(aux(:,1))==1,:)=[];
yr=zeros(size(data_female.log_ave_wage,1),34*12);
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
educ2=data_female.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_female.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
% FT=data_female.FT;
% FT(isnan(aux(:,1))==1,:)=[];
% PT=data_female.PT;
% PT(isnan(aux(:,1))==1,:)=[];
% MJ=data_female.MJ;
% MJ(isnan(aux(:,1))==1,:)=[];
% NE=data_female.NE;
% NE(isnan(aux(:,1))==1,:)=[];
% CJ=data_female.CJ;
% CJ(isnan(aux(:,1))==1,:)=[];
% empstate=data_female.empstate;
% empstate(isnan(aux(:,1))==1,:)=[];

%initial state:
rand_state=rand(size(panel_mob,1),size(panel_mob,2));
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(1,1) +par0(2,1)*exper(:,1) + par0(3,1)*educ2 + par0(4,1)*educ3+par0(5,1));%iniPT
den(:,1)=den(:,1)+exp(par0(6,1) +par0(7,1)*exper(:,1) + par0(8,1)*educ2 + par0(9,1)*educ3+par0(10,1));%iniMJ
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3+par0(15,1));%iniNE
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,1) + par0(18,1)*educ2 + par0(19,1)*educ3+par0(20,1));%iniCJ
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
    prob_PT(i,1)=exp(par0(1,1) +par0(2,1)*exper(i,1) + par0(3,1)*educ2(i,1) + par0(4,1)*educ3(i,1)+par0(5,1))./(den(i,1));
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
    prob_MJ(i,1)=exp(par0(6,1) +par0(7,1)*exper(i,1) + par0(8,1)*educ2(i,1) + par0(9,1)*educ3(i,1)+par0(10,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)<rand_state(i,1) && isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=1;
    elseif isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=0;
    end
end
%
prob_NE=nan(size(panel_mob,1),size(panel_mob,2));
fract_NE=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_NE(i,1)=exp(par0(11,1) +par0(12,1)*exper(i,1) + par0(13,1)*educ2(i,1) + par0(14,1)*educ3(i,1)+par0(15,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_NE(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)<rand_state(i,1)
        fract_NE(i,1)=1;
    elseif isnan(prob_NE(i,1))==0
        fract_NE(i,1)=0;
    end
end

prob_CJ=nan(size(panel_mob,1),size(panel_mob,2));
fract_CJ=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_CJ(i,1)=exp(par0(16,1) +par0(17,1)*exper(i,1) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1)+par0(20,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_NE(i,1)+prob_CJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_NE(i,1)<rand_state(i,1)
        fract_CJ(i,1)=1;
    elseif isnan(prob_CJ(i,1))==0
        fract_CJ(i,1)=0;
    end
end

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(21,1) + par0(22,1)*exper(:,j) + par0(23,1)*educ2 + par0(24,1)*educ3 + par0(25,1)*fract_PT(:,j-1) + par0(26,1)*fract_MJ(:,j-1) + par0(27,1)*fract_NE(:,j-1) + par0(28,1)*fract_CJ(:,j-1)+par0(29,1));
den(:,1)=den(:,1)+exp(par0(30,1) + par0(31,1)*exper(:,j) + par0(32,1)*educ2 + par0(33,1)*educ3 + par0(34,1)*fract_PT(:,j-1) + par0(35,1)*fract_MJ(:,j-1) + par0(36,1)*fract_NE(:,j-1) + par0(37,1)*fract_CJ(:,j-1)+par0(38,1));
den(:,1)=den(:,1)+exp(par0(39,1) + par0(40,1)*exper(:,j) + par0(41,1)*educ2 + par0(42,1)*educ3 + par0(43,1)*fract_PT(:,j-1) + par0(44,1)*fract_MJ(:,j-1) + par0(45,1)*fract_NE(:,j-1) + par0(46,1)*fract_CJ(:,j-1)+par0(47,1));
den(:,1)=den(:,1)+exp(par0(48,1) + par0(49,1)*exper(:,j) + par0(50,1)*educ2 + par0(51,1)*educ3 + par0(52,1)*fract_PT(:,j-1) + par0(53,1)*fract_MJ(:,j-1) + par0(54,1)*fract_NE(:,j-1) + par0(55,1)*fract_CJ(:,j-1)+par0(56,1));
for i=1:size(panel_mob,1)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_PT(i,j)=exp(par0(21,1) + par0(22,1)*exper(i,j) + par0(23,1)*educ2(i,1) + par0(24,1)*educ3(i,1) + par0(25,1)*fract_PT(i,j-1) + par0(26,1)*fract_MJ(i,j-1) + par0(27,1)*fract_NE(i,j-1) + par0(28,1)*fract_CJ(i,j-1)+par0(29,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_MJ(i,j)=exp(par0(30,1) + par0(31,1)*exper(i,j) + par0(32,1)*educ2(i,1) + par0(33,1)*educ3(i,1) + par0(34,1)*fract_PT(i,j-1) + par0(35,1)*fract_MJ(i,j-1) + par0(36,1)*fract_NE(i,j-1) + par0(37,1)*fract_CJ(i,j-1)+par0(38,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_NE(i,j)=exp(par0(39,1) + par0(40,1)*exper(i,j) + par0(41,1)*educ2(i,1) + par0(42,1)*educ3(i,1) + par0(43,1)*fract_PT(i,j-1) + par0(44,1)*fract_MJ(i,j-1) + par0(45,1)*fract_NE(i,j-1) + par0(46,1)*fract_CJ(i,j-1)+par0(47,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_CJ(i,j)=exp(par0(48,1) + par0(49,1)*exper(i,j) + par0(50,1)*educ2(i,1) + par0(51,1)*educ3(i,1) + par0(52,1)*fract_PT(i,j-1) + par0(53,1)*fract_MJ(i,j-1) + par0(54,1)*fract_NE(i,j-1) + par0(55,1)*fract_CJ(i,j-1)+par0(56,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)+prob_CJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)<rand_state(i,j) && isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=1;
    elseif isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=0;
    end
end
end

% probabilities of UB:
rand_samp_UB=rand(size(panel_mob,1),size(panel_mob,2));
prob_UB=zeros(size(panel_mob,1),size(panel_mob,2));
fract_UB=zeros(size(panel_mob,1),size(panel_mob,2));
for i=1:size(panel_mob,1)
    for j=1:size(panel_mob,2)
        if j==1
            prob_UB(i,j)=(par_year_birth*data_female.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)).*fract_NE(i,j);
        else
            prob_UB(i,j)=(par_year_birth*data_female.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)...
            +par_lFT*fract_FT(i,j-1)+par_lPT*fract_PT(i,j-1)+par_lMJ*fract_MJ(i,j-1)+par_lNE*fract_NE(i,j-1)+par_lCJ*fract_CJ(i,j-1)+par_lUB*fract_UB(i,j-1)).*fract_NE(i,j);
        end
        if prob_UB(i,j)>rand_samp_UB(i,j)
            fract_UB(i,j)=1;
        elseif prob_UB(i,j)<rand_samp_UB(i,j)
            fract_UB(i,j)=0;
        end
    end
end

%
randn('seed',654321)
panel_wage=nan(size(panel_mob,1),size(panel_mob,2));

mu=nan(size(panel_wage,1),size(panel_wage,2));
sig=nan(size(panel_wage,1),size(panel_wage,2));
tau1=nan(size(panel_wage,1),size(panel_wage,2));

for j=1:size(panel_wage,2)%NE at first period
    if j==1
        mu(:,j)=par0(61) + par0(62)*educ2 + par0(63)*educ3 + par0(64)*exper(:,j)  + par0(65)*fract_PT(:,j) + par0(66)*fract_MJ(:,j) ...
        + par0(67)*fract_UB(:,j)+ par0(68)*fract_CJ(:,j);
        sig(:,j)=par0(70) + par0(71)*exper(:,j) + par0(72)*fract_PT(:,j) + par0(73)*fract_MJ(:,j) + par0(74)*fract_UB(:,j) + par0(75)*fract_CJ(:,j);  
        tau1(:,j)=par0(77) + par0(78)*exper(:,j);
    else
        mu(:,j)=par0(61) + par0(62)*educ2 + par0(63)*educ3 + par0(64)*exper(:,j)  + par0(65)*fract_PT(:,j) + par0(66)*fract_MJ(:,j) ...
        + par0(67)*fract_UB(:,j)+ par0(68)*fract_CJ(:,j);
        sig(:,j)=par0(70) + par0(71)*exper(:,j) + par0(72)*fract_PT(:,j) + par0(73)*fract_MJ(:,j) + par0(74)*fract_UB(:,j) + par0(75)*fract_CJ(:,j);   
        tau1(:,j)=par0(77) + par0(78)*exper(:,j) ...
                    + par0(80)*fract_FT(:,j).*fract_PT(:,j-1) + par0(81)*fract_FT(:,j).*fract_MJ(:,j-1) ...
                    + par0(82)*fract_FT(:,j).*fract_UB(:,j-1) + par0(83)*fract_FT(:,j).*fract_CJ(:,j-1)  ...
                    + par0(84)*fract_PT(:,j).*fract_FT(:,j-1) + par0(85)*fract_PT(:,j).*fract_MJ(:,j-1) ...
                    + par0(86)*fract_PT(:,j).*fract_UB(:,j-1) + par0(87)*fract_PT(:,j).*fract_CJ(:,j-1)  ...
                    + par0(88)*fract_MJ(:,j).*fract_FT(:,j-1) + par0(89)*fract_MJ(:,j).*fract_PT(:,j-1) ...
                    + par0(90)*fract_MJ(:,j).*fract_UB(:,j-1) + par0(91)*fract_MJ(:,j).*fract_CJ(:,j-1)  ...
                    + par0(92)*fract_UB(:,j).*fract_FT(:,j-1) + par0(93)*fract_UB(:,j).*fract_PT(:,j-1) ...
                    + par0(94)*fract_UB(:,j).*fract_MJ(:,j-1) + par0(95)*fract_UB(:,j).*fract_CJ(:,j-1)  ...
                    + par0(96)*fract_CJ(:,j).*fract_FT(:,j-1) + par0(97)*fract_CJ(:,j).*fract_PT(:,j-1) ...
                    + par0(98)*fract_CJ(:,j).*fract_MJ(:,j-1) + par0(99)*fract_CJ(:,j).*fract_UB(:,j-1);
    end
end
%
sig=exp(sig/2);
tau1=-1+2./(1+exp(tau1));


model_empstate=nan(size(panel_mob,1),size(panel_mob,2));
for i=1:size(panel_wage,1)
    for j=1:size(panel_wage,2)
        if fract_FT(i,j)==1
            model_empstate(i,j)=1;
        elseif fract_PT(i,j)==1
            model_empstate(i,j)=2;
        elseif fract_MJ(i,j)==1
            model_empstate(i,j)=3;
        elseif fract_NE(i,j)==1
            model_empstate(i,j)=4;
        elseif fract_CJ(i,j)==1
            model_empstate(i,j)=5;
        end
    end
end
%
shock=zeros(size(panel_wage,1),size(panel_wage,2));

for i=1:size(panel_wage,1)
    if fract_UB(i,1)==1
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>8
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    elseif model_empstate(i,1)~=4
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>9
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    end
end
for i=1:size(panel_wage,1)
    for j=2:size(panel_wage,2)
        %same state within year no NE
        if isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)==model_empstate(i,j-1) && model_empstate(i,j-1)~=4
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1);
            shock(i,j)=shock(i,j-1);
        %same state between NE
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)==model_empstate(i,j-1) && model_empstate(i,j-1)==4 && fract_UB(i,j)==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        %change of state within year not between NEs
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)~=model_empstate(i,j-1) && fract_NE(i,j)~=1 && fract_NE(i,j-1)~=1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %same state within year between UBs
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && fract_UB(i,j)==1 && fract_UB(i,j-1)==1
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1);
            shock(i,j)=shock(i,j-1);
        %coming from NE period and no UB to any empstate~=4 regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && model_empstate(i,j)~=4
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from UB to any empstate~=4 regardless year
        elseif fract_UB(i,j-1)==1 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && model_empstate(i,j)~=4
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from NE period and no UB to same regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1
            panel_wage(i,j)=panel_wage(i,j-1);%mu(i,j)+tau1(i,j)*shock(i,j-1); 
            shock(i,j)=shock(i,j-1);
        %coming from NE period and no UB to UB regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && fract_UB(i,j)==1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            while panel_wage(i,j)<5 || panel_wage(i,j)>8
                panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            end 
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from any empstate to UB regardless year
        elseif model_empstate(i,j-1)~=4 && isnan(mu(i,j))==0 && fract_UB(i,j)==1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from any empstate~=4 to NE and no UB regardless year
        elseif model_empstate(i,j-1)~=4 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        %coming from fract_UB==0 to NE and no UB regardless year
        elseif fract_UB(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_NE(i,j)==0 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))            
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_UB(i,j)==1 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))  
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_UB(i,j)==1 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))  
        end
    end
end
% for i=1:size(panel_wage,1)
%     for j=1:size(panel_wage,2)
%         if fract_UB(i,j)==1 && isnan(panel_wage(i,j))==1
%             break
%         end
%     end
% end
%truncation
for i=1:size(panel_wage,1)
    if fract_UB(i,1)==1
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>8
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    elseif model_empstate(i,1)~=4
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>9
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    end
end
for i=1:size(panel_wage,1)
    for j=2:size(panel_wage,2)
        %same state within year no NE
        if isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)==model_empstate(i,j-1) && model_empstate(i,j-1)~=4
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1);
            shock(i,j)=shock(i,j-1);
        %same state between NE
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)==model_empstate(i,j-1) && model_empstate(i,j-1)==4 && fract_UB(i,j)==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        %change of state within year not between NEs
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)~=model_empstate(i,j-1) && fract_NE(i,j)~=1 && fract_NE(i,j-1)~=1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %same state within year between UBs
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && fract_UB(i,j)==1 && fract_UB(i,j-1)==1
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1);
            shock(i,j)=shock(i,j-1);
        %coming from NE period and no UB to any empstate~=4 regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && model_empstate(i,j)~=4
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from UB to any empstate~=4 regardless year
        elseif fract_UB(i,j-1)==1 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && model_empstate(i,j)~=4
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from NE period and no UB to same regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1
            panel_wage(i,j)=panel_wage(i,j-1);%mu(i,j)+tau1(i,j)*shock(i,j-1); 
            shock(i,j)=shock(i,j-1);
        %coming from NE period and no UB to UB regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && fract_UB(i,j)==1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            while panel_wage(i,j)<5 || panel_wage(i,j)>8
                panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            end 
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from any empstate to UB regardless year
        elseif model_empstate(i,j-1)~=4 && isnan(mu(i,j))==0 && fract_UB(i,j)==1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from any empstate~=4 to NE and no UB regardless year
        elseif model_empstate(i,j-1)~=4 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        %coming from fract_UB==0 to NE and no UB regardless year
        elseif fract_UB(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_NE(i,j)==0 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))            
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_UB(i,j)==1 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))  
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_UB(i,j)==1 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))  
        end
    end
end
%
% new=zeros(size(panel_wage,1),size(panel_wage,2));
% for i=1:size(new,1)
%     for j=1:size(new,2)
%         if fract_UB(i,j)==1 && isnan(panel_wage(i,j))==1
%             new(i,j)=1;
%         end
%     end
% end
%

panel_wage_2_1=panel_wage;
panel_mob_2_1=panel_mob;
save('panel_wage_2_1.mat','panel_wage_2_1')
save('panel_mob_2_1.mat','panel_mob_2_1')
%% mobility class 2 wage class 2 
panel_mob=zeros(size(data_female.log_ave_wage,1),34*12);
panel_mob(fract_wcl==1,:)=NaN;
panel_mob(fract_mcl==1,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year
load('data_female.mat','data_female')
exper=zeros(size(data_female.log_ave_wage,1),34*12);
exper(:,1)=1.2;
for j=2:size(exper,2)
    exper(:,j)=exper(:,j-1)+0.1;
end
exper(isnan(aux(:,1))==1,:)=[];
yr=zeros(size(data_female.log_ave_wage,1),34*12);
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
educ2=data_female.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_female.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
% FT=data_female.FT;
% FT(isnan(aux(:,1))==1,:)=[];
% PT=data_female.PT;
% PT(isnan(aux(:,1))==1,:)=[];
% MJ=data_female.MJ;
% MJ(isnan(aux(:,1))==1,:)=[];
% NE=data_female.NE;
% NE(isnan(aux(:,1))==1,:)=[];
% CJ=data_female.CJ;
% CJ(isnan(aux(:,1))==1,:)=[];
% empstate=data_female.empstate;
% empstate(isnan(aux(:,1))==1,:)=[];

%initial state:
rand_state=rand(size(panel_mob,1),size(panel_mob,2));
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(1,1) +par0(2,1)*exper(:,1) + par0(3,1)*educ2 + par0(4,1)*educ3+par0(5,1));%iniPT
den(:,1)=den(:,1)+exp(par0(6,1) +par0(7,1)*exper(:,1) + par0(8,1)*educ2 + par0(9,1)*educ3+par0(10,1));%iniMJ
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3+par0(15,1));%iniNE
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,1) + par0(18,1)*educ2 + par0(19,1)*educ3+par0(20,1));%iniCJ
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
    prob_PT(i,1)=exp(par0(1,1) +par0(2,1)*exper(i,1) + par0(3,1)*educ2(i,1) + par0(4,1)*educ3(i,1)+par0(5,1))./(den(i,1));
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
    prob_MJ(i,1)=exp(par0(6,1) +par0(7,1)*exper(i,1) + par0(8,1)*educ2(i,1) + par0(9,1)*educ3(i,1)+par0(10,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)<rand_state(i,1) && isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=1;
    elseif isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=0;
    end
end
%
prob_NE=nan(size(panel_mob,1),size(panel_mob,2));
fract_NE=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_NE(i,1)=exp(par0(11,1) +par0(12,1)*exper(i,1) + par0(13,1)*educ2(i,1) + par0(14,1)*educ3(i,1)+par0(15,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_NE(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)<rand_state(i,1)
        fract_NE(i,1)=1;
    elseif isnan(prob_NE(i,1))==0
        fract_NE(i,1)=0;
    end
end
prob_CJ=nan(size(panel_mob,1),size(panel_mob,2));
fract_CJ=nan(size(panel_mob,1),size(panel_mob,2));
%
for i=1:size(panel_mob,1)
    prob_CJ(i,1)=exp(par0(16,1) +par0(17,1)*exper(i,1) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1)+par0(20,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_NE(i,1)+prob_CJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_NE(i,1)<rand_state(i,1)
        fract_CJ(i,1)=1;
    elseif isnan(prob_CJ(i,1))==0
        fract_CJ(i,1)=0;
    end
end

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(21,1) + par0(22,1)*exper(:,j) + par0(23,1)*educ2 + par0(24,1)*educ3 + par0(25,1)*fract_PT(:,j-1) + par0(26,1)*fract_MJ(:,j-1) + par0(27,1)*fract_NE(:,j-1) + par0(28,1)*fract_CJ(:,j-1)+par0(29,1));
den(:,1)=den(:,1)+exp(par0(30,1) + par0(31,1)*exper(:,j) + par0(32,1)*educ2 + par0(33,1)*educ3 + par0(34,1)*fract_PT(:,j-1) + par0(35,1)*fract_MJ(:,j-1) + par0(36,1)*fract_NE(:,j-1) + par0(37,1)*fract_CJ(:,j-1)+par0(38,1));
den(:,1)=den(:,1)+exp(par0(39,1) + par0(40,1)*exper(:,j) + par0(41,1)*educ2 + par0(42,1)*educ3 + par0(43,1)*fract_PT(:,j-1) + par0(44,1)*fract_MJ(:,j-1) + par0(45,1)*fract_NE(:,j-1) + par0(46,1)*fract_CJ(:,j-1)+par0(47,1));
den(:,1)=den(:,1)+exp(par0(48,1) + par0(49,1)*exper(:,j) + par0(50,1)*educ2 + par0(51,1)*educ3 + par0(52,1)*fract_PT(:,j-1) + par0(53,1)*fract_MJ(:,j-1) + par0(54,1)*fract_NE(:,j-1) + par0(55,1)*fract_CJ(:,j-1)+par0(56,1));
for i=1:size(panel_mob,1)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_PT(i,j)=exp(par0(21,1) + par0(22,1)*exper(i,j) + par0(23,1)*educ2(i,1) + par0(24,1)*educ3(i,1) + par0(25,1)*fract_PT(i,j-1) + par0(26,1)*fract_MJ(i,j-1) + par0(27,1)*fract_NE(i,j-1) + par0(28,1)*fract_CJ(i,j-1)+par0(29,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_MJ(i,j)=exp(par0(30,1) + par0(31,1)*exper(i,j) + par0(32,1)*educ2(i,1) + par0(33,1)*educ3(i,1) + par0(34,1)*fract_PT(i,j-1) + par0(35,1)*fract_MJ(i,j-1) + par0(36,1)*fract_NE(i,j-1) + par0(37,1)*fract_CJ(i,j-1)+par0(38,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_NE(i,j)=exp(par0(39,1) + par0(40,1)*exper(i,j) + par0(41,1)*educ2(i,1) + par0(42,1)*educ3(i,1) + par0(43,1)*fract_PT(i,j-1) + par0(44,1)*fract_MJ(i,j-1) + par0(45,1)*fract_NE(i,j-1) + par0(46,1)*fract_CJ(i,j-1)+par0(47,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_CJ(i,j)=exp(par0(48,1) + par0(49,1)*exper(i,j) + par0(50,1)*educ2(i,1) + par0(51,1)*educ3(i,1) + par0(52,1)*fract_PT(i,j-1) + par0(53,1)*fract_MJ(i,j-1) + par0(54,1)*fract_NE(i,j-1) + par0(55,1)*fract_CJ(i,j-1)+par0(56,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)+prob_CJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)<rand_state(i,j) && isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=1;
    elseif isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=0;
    end
end
end

% probabilities of UB:
rand_samp_UB=rand(size(panel_mob,1),size(panel_mob,2));
prob_UB=zeros(size(panel_mob,1),size(panel_mob,2));
fract_UB=zeros(size(panel_mob,1),size(panel_mob,2));
for i=1:size(panel_mob,1)
    for j=1:size(panel_mob,2)
        if j==1
            prob_UB(i,j)=(par_year_birth*data_female.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)).*fract_NE(i,j);
        else
            prob_UB(i,j)=(par_year_birth*data_female.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)...
            +par_lFT*fract_FT(i,j-1)+par_lPT*fract_PT(i,j-1)+par_lMJ*fract_MJ(i,j-1)+par_lNE*fract_NE(i,j-1)+par_lCJ*fract_CJ(i,j-1)+par_lUB*fract_UB(i,j-1)).*fract_NE(i,j);
        end
        if prob_UB(i,j)>rand_samp_UB(i,j)
            fract_UB(i,j)=1;
        elseif prob_UB(i,j)<rand_samp_UB(i,j)
            fract_UB(i,j)=0;
        end
    end
end

%
randn('seed',654321)
panel_wage=nan(size(panel_mob,1),size(panel_mob,2));

mu=nan(size(panel_wage,1),size(panel_wage,2));
sig=nan(size(panel_wage,1),size(panel_wage,2));
tau1=nan(size(panel_wage,1),size(panel_wage,2));
for j=1:size(panel_wage,2)%NE at first period
    if j==1
        mu(:,j)=par0(61) + par0(62)*educ2 + par0(63)*educ3 + par0(64)*exper(:,j)  + par0(65)*fract_PT(:,j) + par0(66)*fract_MJ(:,j) ...
        + par0(67)*fract_UB(:,j)+ par0(68)*fract_CJ(:,j)+ par0(69);
        sig(:,j)=par0(70) + par0(71)*exper(:,j) + par0(72)*fract_PT(:,j) + par0(73)*fract_MJ(:,j) + par0(74)*fract_UB(:,j) + par0(75)*fract_CJ(:,j)+par0(76);   
        tau1(:,j)=par0(77) + par0(78)*exper(:,j)+par0(79);  
    else
        mu(:,j)=par0(61) + par0(62)*educ2 + par0(63)*educ3 + par0(64)*exper(:,j)  + par0(65)*fract_PT(:,j) + par0(66)*fract_MJ(:,j) ...
        + par0(67)*fract_UB(:,j)+ par0(68)*fract_CJ(:,j) +par0(69);
        sig(:,j)=par0(70) + par0(71)*exper(:,j) + par0(72)*fract_PT(:,j) + par0(73)*fract_MJ(:,j) + par0(74)*fract_UB(:,j) + par0(75)*fract_CJ(:,j)+par0(76);   
        tau1(:,j)=par0(77) + par0(78)*exper(:,j) + par0(79) ...
                    + par0(80)*fract_FT(:,j).*fract_PT(:,j-1) + par0(81)*fract_FT(:,j).*fract_MJ(:,j-1) ...
                    + par0(82)*fract_FT(:,j).*fract_UB(:,j-1) + par0(83)*fract_FT(:,j).*fract_CJ(:,j-1)  ...
                    + par0(84)*fract_PT(:,j).*fract_FT(:,j-1) + par0(85)*fract_PT(:,j).*fract_MJ(:,j-1) ...
                    + par0(86)*fract_PT(:,j).*fract_UB(:,j-1) + par0(87)*fract_PT(:,j).*fract_CJ(:,j-1)  ...
                    + par0(88)*fract_MJ(:,j).*fract_FT(:,j-1) + par0(89)*fract_MJ(:,j).*fract_PT(:,j-1) ...
                    + par0(90)*fract_MJ(:,j).*fract_UB(:,j-1) + par0(91)*fract_MJ(:,j).*fract_CJ(:,j-1)  ...
                    + par0(92)*fract_UB(:,j).*fract_FT(:,j-1) + par0(93)*fract_UB(:,j).*fract_PT(:,j-1) ...
                    + par0(94)*fract_UB(:,j).*fract_MJ(:,j-1) + par0(95)*fract_UB(:,j).*fract_CJ(:,j-1)  ...
                    + par0(96)*fract_CJ(:,j).*fract_FT(:,j-1) + par0(97)*fract_CJ(:,j).*fract_PT(:,j-1) ...
                    + par0(98)*fract_CJ(:,j).*fract_MJ(:,j-1) + par0(99)*fract_CJ(:,j).*fract_UB(:,j-1);
    end
end
%
sig=exp(sig/2);
tau1=-1+2./(1+exp(tau1));

model_empstate=nan(size(panel_mob,1),size(panel_mob,2));
for i=1:size(panel_wage,1)
    for j=1:size(panel_wage,2)
        if fract_FT(i,j)==1
            model_empstate(i,j)=1;
        elseif fract_PT(i,j)==1
            model_empstate(i,j)=2;
        elseif fract_MJ(i,j)==1
            model_empstate(i,j)=3;
        elseif fract_NE(i,j)==1
            model_empstate(i,j)=4;
        elseif fract_CJ(i,j)==1
            model_empstate(i,j)=5;
        end
    end
end
%

shock=zeros(size(panel_wage,1),size(panel_wage,2));

for i=1:size(panel_wage,1)
    if fract_UB(i,1)==1
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>8
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    elseif model_empstate(i,1)~=4
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>9
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    end
end
for i=1:size(panel_wage,1)
    for j=2:size(panel_wage,2)
        %same state within year no NE
        if isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)==model_empstate(i,j-1) && model_empstate(i,j-1)~=4
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1);
            shock(i,j)=shock(i,j-1);
        %same state between NE
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)==model_empstate(i,j-1) && model_empstate(i,j-1)==4 && fract_UB(i,j)==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        %change of state within year not between NEs
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && model_empstate(i,j)~=model_empstate(i,j-1) && fract_NE(i,j)~=1 && fract_NE(i,j-1)~=1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %same state within year between UBs
        elseif isnan(mu(i,j))==0 && yr(i,j)==yr(i,j-1) && fract_UB(i,j)==1 && fract_UB(i,j-1)==1
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1);
            shock(i,j)=shock(i,j-1);
        %coming from NE period and no UB to any empstate~=4 regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && model_empstate(i,j)~=4
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from UB to any empstate~=4 regardless year
        elseif fract_UB(i,j-1)==1 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && model_empstate(i,j)~=4
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from NE period and no UB to same regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1
            panel_wage(i,j)=panel_wage(i,j-1);%mu(i,j)+tau1(i,j)*shock(i,j-1); 
            shock(i,j)=shock(i,j-1);
        %coming from NE period and no UB to UB regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && isnan(mu(i,j))==0 && fract_UB(i,j)==1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            while panel_wage(i,j)<5 || panel_wage(i,j)>8
                panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
            end 
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from any empstate to UB regardless year
        elseif model_empstate(i,j-1)~=4 && isnan(mu(i,j))==0 && fract_UB(i,j)==1
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from any empstate~=4 to NE and no UB regardless year
        elseif model_empstate(i,j-1)~=4 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        %coming from fract_UB==0 to NE and no UB regardless year
        elseif fract_UB(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_NE(i,j)==0 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))            
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_UB(i,j)==1 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))  
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1) && fract_UB(i,j)==1 
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))  
        end
    end
end
for i=1:size(panel_wage,1)
    for j=1:size(panel_wage,2)
        if fract_UB(i,j)==1 && isnan(panel_wage(i,j))==1
            break
        end
    end
end
% %truncation
% for i=1:size(panel_wage,1)
%     for j=2:size(panel_wage,2)
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==1
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==5 && model_empstate(i,j)==5
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==3
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==5 && model_empstate(i,j)==3
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==1 && fract_UB(i,j)==1
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==5 && fract_UB(i,j)==1
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==2
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==5 && model_empstate(i,j)==2
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==1
%             while panel_wage(i,j)<4 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==5
%             while panel_wage(i,j)<4 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==3
%             while panel_wage(i,j)<4 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==3 && fract_UB(i,j)==1
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==1
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==5
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>9.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==3
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && fract_UB(i,j)==1
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==2
%             while panel_wage(i,j)<4 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==1
%             while panel_wage(i,j)<4 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==5
%             while panel_wage(i,j)<4 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==3
%             while panel_wage(i,j)<5 || panel_wage(i,j)>7.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && fract_UB(i,j)==1
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==1
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==5
%             while panel_wage(i,j)<5.5 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%     end
% end

panel_wage_2_2=panel_wage;
panel_mob_2_2=panel_mob;
save('panel_wage_2_2.mat','panel_wage_2_2')
save('panel_mob_2_2.mat','panel_mob_2_2')
%% LT Values Whole Sample:

clear
load('panel_wage_2_2.mat','panel_wage_2_2')
load('panel_wage_1_2.mat','panel_wage_1_2')
load('panel_wage_2_1.mat','panel_wage_2_1')
load('panel_wage_1_1.mat','panel_wage_1_1')

panel_wage_LT_20052009_female=[panel_wage_1_1; panel_wage_2_1; panel_wage_1_2; panel_wage_2_2];

save('panel_wage_LT_20052009_female.mat','panel_wage_LT_20052009_female')

load('panel_mob_2_2.mat','panel_mob_2_2')
load('panel_mob_1_2.mat','panel_mob_1_2')
load('panel_mob_2_1.mat','panel_mob_2_1')
load('panel_mob_1_1.mat','panel_mob_1_1')

panel_mob_LT_20052009_female=[panel_mob_1_1; panel_mob_2_1; panel_mob_1_2; panel_mob_2_2];

save('panel_mob_LT_20052009_female.mat','panel_mob_LT_20052009_female')

disp('Finished!')
beep