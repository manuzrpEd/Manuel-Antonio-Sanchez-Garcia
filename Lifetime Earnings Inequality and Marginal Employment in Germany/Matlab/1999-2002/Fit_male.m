%{
Males 1999-2002
Labour Market State Transitions - Sample Simulation

ans =

    'FT: 95 & 0 & 0 & 2 & 0'


ans =

    'PT: 4 & 88 & 0 & 5 & 0'


ans =

    'MJ: 6 & 1 & 80 & 10 & 0'


ans =

    'NE: 6 & 0 & 1 & 89 & 0'


ans =

    'CJ: 20 & 3 & 2 & 5 & 68'

Quintiles - Income Mobility, Sample Simulation

ans =

    'D1: 93 & 2 & 2 & 1 & 1'


ans =

    'D2: 2 & 93 & 2 & 2 & 1'


ans =

    'D3: 2 & 2 & 93 & 2 & 2'


ans =

    'D4: 1 & 2 & 2 & 93 & 1'


ans =

    'D5: 1 & 2 & 2 & 1 & 93'
    %}
%
cd '\1999-2002'
clc
clear
close all
clear mex
set(0,'DefaultFigureWindowStyle','docked')
disp('Males 1999-2002')
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
%

%probabilities of mobility classes:
rand('seed',123456)
rand_samp_mob=rand(length(data_male.year_birth),1);
%sample
prob_mcl_1=zeros(length(data_male.year_birth),1);
fract_mcl=zeros(length(data_male.year_birth),1);
for i=1:length(data_male.year_birth)
    prob_mcl_1(i,1)=1./(1+exp(par0(56,1)+par0(57,1)*data_male.year_birth(i,1)+par0(58,1)*data_male.ED2(i,1)+par0(59,1)*data_male.ED3(i,1)));
    if prob_mcl_1(i,1)>rand_samp_mob(i,1)
        fract_mcl(i,1)=1;
    elseif prob_mcl_1(i,1)<rand_samp_mob(i,1)
        fract_mcl(i,1)=2;
    end
end

% wage classes
rand_samp_wage=rand(length(data_male.year_birth),1);
%
prob_wcl=zeros(length(data_male.year_birth),1);
fract_wcl=zeros(length(data_male.year_birth),1);
for i=1:length(data_male.year_birth)
    prob_wcl(i,1)=1./(1+exp(par0(86,1)+par0(87,1)*data_male.year_birth(i,1)+par0(88,1)*data_male.ED2(i,1)+par0(89,1)*data_male.ED3(i,1)));
    if prob_wcl(i,1)>rand_samp_wage(i,1)
        fract_wcl(i,1)=1;
    elseif prob_wcl(i,1)<rand_samp_wage(i,1)
        fract_wcl(i,1)=2;
    end
end
%

%panel_mob simulations

%% mobility class 1 wage class 1 
panel_mob=zeros(size(data_male.log_ave_wage,1),size(data_male.log_ave_wage,2));
panel_mob(fract_wcl==2,:)=NaN;
panel_mob(fract_mcl==2,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year

exper=data_male.lmexp;
exper(isnan(aux(:,1))==1,:)=[];
yr=data_male.year;
yr(isnan(aux(:,1))==1,:)=[];
educ2=data_male.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_male.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
FT=data_male.FT;
FT(isnan(aux(:,1))==1,:)=[];
PT=data_male.PT;
PT(isnan(aux(:,1))==1,:)=[];
MJ=data_male.MJ;
MJ(isnan(aux(:,1))==1,:)=[];
NE=data_male.NE;
NE(isnan(aux(:,1))==1,:)=[];
CJ=data_male.CJ;
CJ(isnan(aux(:,1))==1,:)=[];
empstate=data_male.empstate;
empstate(isnan(aux(:,1))==1,:)=[];

%initial state:
rand_state=rand(length(panel_mob),size(panel_mob,2));
den=zeros(length(panel_mob),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(1,1) +par0(2,1)*exper(:,1) + par0(3,1)*educ2 + par0(4,1)*educ3);%iniPT
den(:,1)=den(:,1)+exp(par0(6,1) +par0(7,1)*exper(:,1) + par0(8,1)*educ2 + par0(9,1)*educ3);%iniMJ
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3);%iniCJ
%
prob_FT=nan(length(panel_mob),size(panel_mob,2));
fract_FT=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_FT(i,1)=1./(den(i,1));
    if prob_FT(i,1)>rand_state(i,1) && isnan(prob_FT(i,1))==0
        fract_FT(i,1)=1;
    elseif isnan(prob_FT(i,1))==0
        fract_FT(i,1)=0;
    end
end
%
prob_PT=nan(length(panel_mob),size(panel_mob,2));
fract_PT=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_PT(i,1)=exp(par0(1,1) +par0(2,1)*exper(i,1) + par0(3,1)*educ2(i,1) + par0(4,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)>rand_state(i,1) && prob_FT(i,1)<rand_state(i,1) && isnan(prob_PT(i,1))==0
        fract_PT(i,1)=1;
    elseif isnan(prob_PT(i,1))==0
        fract_PT(i,1)=0;
    end
end
%
prob_MJ=nan(length(panel_mob),size(panel_mob,2));
fract_MJ=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_MJ(i,1)=exp(par0(6,1) +par0(7,1)*exper(i,1) + par0(8,1)*educ2(i,1) + par0(9,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)<rand_state(i,1) && isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=1;
    elseif isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=0;
    end
end
%
prob_CJ=nan(length(panel_mob),size(panel_mob,2));
fract_CJ=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_CJ(i,1)=exp(par0(11,1) +par0(12,1)*exper(i,1) + par0(13,1)*educ2(i,1) + par0(14,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_CJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)<rand_state(i,1)
        fract_CJ(i,1)=1;
    elseif isnan(prob_CJ(i,1))==0
        fract_CJ(i,1)=0;
    end
end
prob_NE=nan(length(panel_mob),size(panel_mob,2));
fract_NE=zeros(length(panel_mob),size(panel_mob,2));

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(length(panel_mob),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,j) + par0(18,1)*educ2 + par0(19,1)*educ3 +par0(20,1)*FT(:,j-1) + par0(21,1)*PT(:,j-1) + par0(22,1)*MJ(:,j-1) + par0(23,1)*NE(:,j-1) + par0(24,1)*CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(26,1) +par0(27,1)*exper(:,j) + par0(28,1)*educ2 + par0(29,1)*educ3 +par0(30,1)*FT(:,j-1) + par0(31,1)*PT(:,j-1) + par0(32,1)*MJ(:,j-1) + par0(33,1)*NE(:,j-1) + par0(34,1)*CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(36,1) +par0(37,1)*exper(:,j) + par0(38,1)*educ2 + par0(39,1)*educ3 +par0(40,1)*FT(:,j-1) + par0(41,1)*PT(:,j-1) + par0(42,1)*MJ(:,j-1) + par0(43,1)*NE(:,j-1) + par0(44,1)*CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(46,1) +par0(47,1)*exper(:,j) + par0(48,1)*educ2 + par0(49,1)*educ3 +par0(50,1)*FT(:,j-1) + par0(51,1)*PT(:,j-1) + par0(52,1)*MJ(:,j-1) + par0(53,1)*NE(:,j-1) + par0(54,1)*CJ(:,j-1));
%
for i=1:length(panel_mob)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_PT(i,j)=exp(par0(16,1) + par0(17,1)*exper(i,j) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1) + par0(20,1)*FT(i,j-1) + par0(21,1)*PT(i,j-1) + par0(22,1)*MJ(i,j-1) + par0(23,1)*NE(i,j-1) + par0(24,1)*CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_MJ(i,j)=exp(par0(26,1) + par0(27,1)*exper(i,j) + par0(28,1)*educ2(i,1) + par0(29,1)*educ3(i,1) + par0(30,1)*FT(i,j-1) + par0(31,1)*PT(i,j-1) + par0(32,1)*MJ(i,j-1) + par0(33,1)*NE(i,j-1) + par0(33,1)*CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_NE(i,j)=exp(par0(36,1) +par0(37,1)*exper(i,j) + par0(38,1)*educ2(i,1) + par0(39,1)*educ3(i,1) +par0(40,1)*FT(i,j-1) + par0(41,1)*PT(i,j-1) + par0(42,1)*MJ(i,j-1) + par0(43,1)*NE(i,j-1) + par0(44,1)*CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_CJ(i,j)=exp(par0(43,1) +par0(47,1)*exper(i,j) + par0(48,1)*educ2(i,1) + par0(49,1)*educ3(i,1) +par0(50,1)*FT(i,j-1) + par0(51,1)*PT(i,j-1) + par0(52,1)*MJ(i,j-1) + par0(53,1)*NE(i,j-1) + par0(54,1)*CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)+prob_CJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)<rand_state(i,j) && isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=1;
    elseif isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=0;
    end
end
end

%
randn('seed',654321)
panel_wage=nan(length(panel_mob),size(panel_mob,2));

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
panel_mob_1_1=panel_mob;

st_tr_pr_1_1=zeros(5,5);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_1(1,1)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_1(2,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_1(3,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_1(4,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_1_1(5,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_1(1,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_1(1,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_1(1,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_1_1(1,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_1(2,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_1(2,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_1_1(2,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_1(3,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_1_1(3,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_1_1(4,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_1(5,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_1(5,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_1(5,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_1(5,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_1(4,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_1(4,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_1(4,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_1(3,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_1(3,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_1(2,1)=ind/sum(aux(:)==1);

st_tr_pr_1_1;

FT_wages_1_1=panel_wage_1_1.*(fract_FT==1);
FT_wages_1_1=FT_wages_1_1(:);
FT_wages_1_1(FT_wages_1_1==0)=[];
PT_wages_1_1=panel_wage_1_1.*(fract_PT==1);
PT_wages_1_1=PT_wages_1_1(:);
PT_wages_1_1(PT_wages_1_1==0)=[];
MJ_wages_1_1=panel_wage_1_1.*(fract_MJ==1);
MJ_wages_1_1=MJ_wages_1_1(:);
MJ_wages_1_1(MJ_wages_1_1==0)=[];
NE_wages_1_1=panel_wage_1_1.*(fract_NE==1);
NE_wages_1_1=NE_wages_1_1(:);
NE_wages_1_1(NE_wages_1_1==0)=[];
CJ_wages_1_1=panel_wage_1_1.*(fract_CJ==1);
CJ_wages_1_1=CJ_wages_1_1(:);
CJ_wages_1_1(CJ_wages_1_1==0)=[];

%quintiles - income mobility

%whole sample
wages=panel_wage_1_1;
decile=nan(length(wages),size(wages,2));

decile_20=prctile(wages(:),20);
decile_40=prctile(wages(:),40);
decile_60=prctile(wages(:),60);
decile_80=prctile(wages(:),80);

for i=1:length(wages)
    for j=1: size(wages,2)
        if isnan(wages(i,j))~=1 && wages(i,j)<decile_20
            decile(i,j)=1;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_20 && wages(i,j)<decile_40
            decile(i,j)=2;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_40 && wages(i,j)<decile_60
            decile(i,j)=3;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_60 && wages(i,j)<decile_80
            decile(i,j)=4;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_80
            decile(i,j)=5;
        end
    end
end

matrix_1_1=zeros(5,5);

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_1(1,1)=counting/den;
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_1(2,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_1(3,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_1(4,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_1(5,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_1(2,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_1(3,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_1(4,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_1(5,1)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_1(3,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_1(4,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_1(5,2)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_1(4,3)=counting/den;
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_1(5,3)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_1(5,4)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_1(1,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_1(1,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_1(1,4)=counting/den;
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_1(1,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_1(2,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_1(2,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_1(2,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_1(3,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_1(3,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_1(4,5)=counting/den;

matrix_1_1=matrix_1_1.*100;

fract_FT_1_1=fract_FT;
fract_PT_1_1=fract_PT;
fract_MJ_1_1=fract_MJ;
fract_NE_1_1=fract_NE;
fract_CJ_1_1=fract_CJ;
save('fract_FT_1_1.mat','fract_FT_1_1')
save('fract_PT_1_1.mat','fract_PT_1_1')
save('fract_MJ_1_1.mat','fract_MJ_1_1')
save('fract_NE_1_1.mat','fract_NE_1_1')
save('fract_CJ_1_1.mat','fract_CJ_1_1')
save('panel_wage_1_1.mat','panel_wage_1_1')

%% mobility class 1 wage class 2 
panel_mob=zeros(length(data_male.log_ave_wage),size(data_male.log_ave_wage,2));
panel_mob(fract_wcl==1,:)=NaN;
panel_mob(fract_mcl==2,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year

exper=data_male.lmexp;
exper(isnan(aux(:,1))==1,:)=[];
yr=data_male.year;
yr(isnan(aux(:,1))==1,:)=[];
educ2=data_male.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_male.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
FT=data_male.FT;
FT(isnan(aux(:,1))==1,:)=[];
PT=data_male.PT;
PT(isnan(aux(:,1))==1,:)=[];
MJ=data_male.MJ;
MJ(isnan(aux(:,1))==1,:)=[];
NE=data_male.NE;
NE(isnan(aux(:,1))==1,:)=[];
CJ=data_male.CJ;
CJ(isnan(aux(:,1))==1,:)=[];
empstate=data_male.empstate;
empstate(isnan(aux(:,1))==1,:)=[];

%initial state:
rand_state=rand(length(panel_mob),size(panel_mob,2));
den=zeros(length(panel_mob),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(1,1) +par0(2,1)*exper(:,1) + par0(3,1)*educ2 + par0(4,1)*educ3);%iniPT
den(:,1)=den(:,1)+exp(par0(6,1) +par0(7,1)*exper(:,1) + par0(8,1)*educ2 + par0(9,1)*educ3);%iniMJ
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3);%iniCJ
%
prob_FT=nan(length(panel_mob),size(panel_mob,2));
fract_FT=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_FT(i,1)=1./(den(i,1));
    if prob_FT(i,1)>rand_state(i,1) && isnan(prob_FT(i,1))==0
        fract_FT(i,1)=1;
    elseif isnan(prob_FT(i,1))==0
        fract_FT(i,1)=0;
    end
end
%
prob_PT=nan(length(panel_mob),size(panel_mob,2));
fract_PT=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_PT(i,1)=exp(par0(1,1) +par0(2,1)*exper(i,1) + par0(3,1)*educ2(i,1) + par0(4,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)>rand_state(i,1) && prob_FT(i,1)<rand_state(i,1) && isnan(prob_PT(i,1))==0
        fract_PT(i,1)=1;
    elseif isnan(prob_PT(i,1))==0
        fract_PT(i,1)=0;
    end
end
%
prob_MJ=nan(length(panel_mob),size(panel_mob,2));
fract_MJ=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_MJ(i,1)=exp(par0(6,1) +par0(7,1)*exper(i,1) + par0(8,1)*educ2(i,1) + par0(9,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)<rand_state(i,1) && isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=1;
    elseif isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=0;
    end
end
%
prob_CJ=nan(length(panel_mob),size(panel_mob,2));
fract_CJ=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_CJ(i,1)=exp(par0(11,1) +par0(12,1)*exper(i,1) + par0(13,1)*educ2(i,1) + par0(14,1)*educ3(i,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_CJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)<rand_state(i,1)
        fract_CJ(i,1)=1;
    elseif isnan(prob_CJ(i,1))==0
        fract_CJ(i,1)=0;
    end
end
prob_NE=nan(length(panel_mob),size(panel_mob,2));
fract_NE=zeros(length(panel_mob),size(panel_mob,2));

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(length(panel_mob),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,j) + par0(18,1)*educ2 + par0(19,1)*educ3 +par0(20,1)*FT(:,j-1) + par0(21,1)*PT(:,j-1) + par0(22,1)*MJ(:,j-1) + par0(23,1)*NE(:,j-1) + par0(24,1)*CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(26,1) +par0(27,1)*exper(:,j) + par0(28,1)*educ2 + par0(29,1)*educ3 +par0(30,1)*FT(:,j-1) + par0(31,1)*PT(:,j-1) + par0(32,1)*MJ(:,j-1) + par0(33,1)*NE(:,j-1) + par0(34,1)*CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(36,1) +par0(37,1)*exper(:,j) + par0(38,1)*educ2 + par0(39,1)*educ3 +par0(40,1)*FT(:,j-1) + par0(41,1)*PT(:,j-1) + par0(42,1)*MJ(:,j-1) + par0(43,1)*NE(:,j-1) + par0(44,1)*CJ(:,j-1));
den(:,1)=den(:,1)+exp(par0(46,1) +par0(47,1)*exper(:,j) + par0(48,1)*educ2 + par0(49,1)*educ3 +par0(50,1)*FT(:,j-1) + par0(51,1)*PT(:,j-1) + par0(52,1)*MJ(:,j-1) + par0(53,1)*NE(:,j-1) + par0(54,1)*CJ(:,j-1));
%
for i=1:length(panel_mob)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_PT(i,j)=exp(par0(16,1) +par0(17,1)*exper(i,j) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1) +par0(20,1)*FT(i,j-1) + par0(21,1)*PT(i,j-1) + par0(22,1)*MJ(i,j-1) + par0(23,1)*NE(i,j-1) + par0(24,1)*CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_MJ(i,j)=exp(par0(26,1) +par0(27,1)*exper(i,j) + par0(28,1)*educ2(i,1) + par0(29,1)*educ3(i,1) +par0(30,1)*FT(i,j-1) + par0(31,1)*PT(i,j-1) + par0(32,1)*MJ(i,j-1) + par0(33,1)*NE(i,j-1) + par0(34,1)*CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_NE(i,j)=exp(par0(36,1) +par0(37,1)*exper(i,j) + par0(38,1)*educ2(i,1) + par0(39,1)*educ3(i,1) +par0(40,1)*FT(i,j-1) + par0(40,1)*PT(i,j-1) + par0(42,1)*MJ(i,j-1) + par0(43,1)*NE(i,j-1) + par0(44,1)*CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_CJ(i,j)=exp(par0(46,1) +par0(47,1)*exper(i,j) + par0(48,1)*educ2(i,1) + par0(49,1)*educ3(i,1) +par0(50,1)*FT(i,j-1) + par0(50,1)*PT(i,j-1) + par0(52,1)*MJ(i,j-1) + par0(53,1)*NE(i,j-1) + par0(54,1)*CJ(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)+prob_CJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)<rand_state(i,j) && isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=1;
    elseif isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=0;
    end
end
end

%
randn('seed',654321)
panel_wage=nan(length(panel_mob),size(panel_mob,2));

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
panel_mob_1_2=panel_mob;

st_tr_pr_1_2=zeros(5,5);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_2(1,1)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_2(2,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_2(3,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_2(4,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_1_2(5,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_2(1,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_2(1,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_2(1,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_1_2(1,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_2(2,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_2(2,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_1_2(2,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_2(3,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_1_2(3,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_1_2(4,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_2(5,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_2(5,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_2(5,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_2(5,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_2(4,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_2(4,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_2(4,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_2(3,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_2(3,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_2(2,1)=ind/sum(aux(:)==1);

st_tr_pr_1_2;

FT_wages_1_2=panel_wage_1_2.*(fract_FT==1);
FT_wages_1_2=FT_wages_1_2(:);
FT_wages_1_2(FT_wages_1_2==0)=[];
PT_wages_1_2=panel_wage_1_2.*(fract_PT==1);
PT_wages_1_2=PT_wages_1_2(:);
PT_wages_1_2(PT_wages_1_2==0)=[];
MJ_wages_1_2=panel_wage_1_2.*(fract_MJ==1);
MJ_wages_1_2=MJ_wages_1_2(:);
MJ_wages_1_2(MJ_wages_1_2==0)=[];
NE_wages_1_2=panel_wage_1_2.*(fract_NE==1);
NE_wages_1_2=NE_wages_1_2(:);
NE_wages_1_2(NE_wages_1_2==0)=[];
CJ_wages_1_2=panel_wage_1_2.*(fract_CJ==1);
CJ_wages_1_2=CJ_wages_1_2(:);
CJ_wages_1_2(CJ_wages_1_2==0)=[];

%quintiles - income mobility

%whole sample
wages=panel_wage_1_2;
decile=nan(length(wages),size(wages,2));

decile_20=prctile(wages(:),20);
decile_40=prctile(wages(:),40);
decile_60=prctile(wages(:),60);
decile_80=prctile(wages(:),80);

for i=1:length(wages)
    for j=1: size(wages,2)
        if isnan(wages(i,j))~=1 && wages(i,j)<decile_20
            decile(i,j)=1;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_20 && wages(i,j)<decile_40
            decile(i,j)=2;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_40 && wages(i,j)<decile_60
            decile(i,j)=3;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_60 && wages(i,j)<decile_80
            decile(i,j)=4;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_80
            decile(i,j)=5;
        end
    end
end

matrix_1_2=zeros(5,5);

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_2(1,1)=counting/den;
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_2(2,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_2(3,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_2(4,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_2(5,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_2(2,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_2(3,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_2(4,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_2(5,1)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_2(3,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_2(4,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_2(5,2)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_2(4,3)=counting/den;
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_2(5,3)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_2(5,4)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_2(1,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_2(1,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_2(1,4)=counting/den;
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_2(1,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_2(2,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_2(2,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_2(2,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_2(3,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_2(3,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_2(4,5)=counting/den;

matrix_1_2=matrix_1_2.*100;

fract_FT_1_2=fract_FT;
fract_PT_1_2=fract_PT;
fract_MJ_1_2=fract_MJ;
fract_NE_1_2=fract_NE;
fract_CJ_1_2=fract_CJ;
save('fract_FT_1_2.mat','fract_FT_1_2')
save('fract_PT_1_2.mat','fract_PT_1_2')
save('fract_MJ_1_2.mat','fract_MJ_1_2')
save('fract_NE_1_2.mat','fract_NE_1_2')
save('fract_CJ_1_2.mat','fract_CJ_1_2')
save('panel_wage_1_2.mat','panel_wage_1_2')

%% mobility class 2 wage class 1 
panel_mob=zeros(length(data_male.log_ave_wage),size(data_male.log_ave_wage,2));
panel_mob(fract_wcl==2,:)=NaN;
panel_mob(fract_mcl==1,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year

exper=data_male.lmexp;
exper(isnan(aux(:,1))==1,:)=[];
yr=data_male.year;
yr(isnan(aux(:,1))==1,:)=[];
educ2=data_male.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_male.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
FT=data_male.FT;
FT(isnan(aux(:,1))==1,:)=[];
PT=data_male.PT;
PT(isnan(aux(:,1))==1,:)=[];
MJ=data_male.MJ;
MJ(isnan(aux(:,1))==1,:)=[];
NE=data_male.NE;
NE(isnan(aux(:,1))==1,:)=[];
CJ=data_male.CJ;
CJ(isnan(aux(:,1))==1,:)=[];
empstate=data_male.empstate;
empstate(isnan(aux(:,1))==1,:)=[];

%initial state:
rand_state=rand(length(panel_mob),size(panel_mob,2));
den=zeros(length(panel_mob),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(1,1) +par0(2,1)*exper(:,1) + par0(3,1)*educ2 + par0(4,1)*educ3+par0(5,1));%iniPT
den(:,1)=den(:,1)+exp(par0(6,1) +par0(7,1)*exper(:,1) + par0(8,1)*educ2 + par0(9,1)*educ3+par0(10,1));%iniMJ
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3+par0(15,1));%iniCJ
%
prob_FT=nan(length(panel_mob),size(panel_mob,2));
fract_FT=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_FT(i,1)=1./(den(i,1));
    if prob_FT(i,1)>rand_state(i,1) && isnan(prob_FT(i,1))==0
        fract_FT(i,1)=1;
    elseif isnan(prob_FT(i,1))==0
        fract_FT(i,1)=0;
    end
end
%
prob_PT=nan(length(panel_mob),size(panel_mob,2));
fract_PT=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_PT(i,1)=exp(par0(1,1) +par0(2,1)*exper(i,1) + par0(3,1)*yr(i,1) + par0(4,1)*educ2(i,1) + par0(5,1)*educ3(i,1)+par0(6,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)>rand_state(i,1) && prob_FT(i,1)<rand_state(i,1) && isnan(prob_PT(i,1))==0
        fract_PT(i,1)=1;
    elseif isnan(prob_PT(i,1))==0
        fract_PT(i,1)=0;
    end
end
%
prob_MJ=nan(length(panel_mob),size(panel_mob,2));
fract_MJ=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_MJ(i,1)=exp(par0(7,1) +par0(8,1)*exper(i,1) + par0(9,1)*yr(i,1) + par0(10,1)*educ2(i,1) + par0(11,1)*educ3(i,1)+par0(12,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)<rand_state(i,1) && isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=1;
    elseif isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=0;
    end
end
%
prob_CJ=nan(length(panel_mob),size(panel_mob,2));
fract_CJ=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_CJ(i,1)=exp(par0(13,1) +par0(14,1)*exper(i,1) + par0(15,1)*yr(i,1) + par0(16,1)*educ2(i,1) + par0(17,1)*educ3(i,1)+par0(18,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_CJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)<rand_state(i,1)
        fract_CJ(i,1)=1;
    elseif isnan(prob_CJ(i,1))==0
        fract_CJ(i,1)=0;
    end
end
prob_NE=nan(length(panel_mob),size(panel_mob,2));
fract_NE=zeros(length(panel_mob),size(panel_mob,2));

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(length(panel_mob),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,j) + par0(18,1)*educ2 + par0(19,1)*educ3 +par0(20,1)*FT(:,j-1) + par0(21,1)*PT(:,j-1) + par0(22,1)*MJ(:,j-1) + par0(23,1)*NE(:,j-1) + par0(24,1)*CJ(:,j-1) +par0(25,1));
den(:,1)=den(:,1)+exp(par0(26,1) +par0(27,1)*exper(:,j) + par0(28,1)*educ2 + par0(29,1)*educ3 +par0(30,1)*FT(:,j-1) + par0(31,1)*PT(:,j-1) + par0(32,1)*MJ(:,j-1) + par0(33,1)*NE(:,j-1) + par0(34,1)*CJ(:,j-1) +par0(35,1));
den(:,1)=den(:,1)+exp(par0(36,1) +par0(37,1)*exper(:,j) + par0(38,1)*educ2 + par0(39,1)*educ3 +par0(40,1)*FT(:,j-1) + par0(41,1)*PT(:,j-1) + par0(42,1)*MJ(:,j-1) + par0(43,1)*NE(:,j-1) + par0(44,1)*CJ(:,j-1) +par0(45,1));
den(:,1)=den(:,1)+exp(par0(46,1) +par0(47,1)*exper(:,j) + par0(48,1)*educ2 + par0(49,1)*educ3 +par0(50,1)*FT(:,j-1) + par0(51,1)*PT(:,j-1) + par0(52,1)*MJ(:,j-1) + par0(53,1)*NE(:,j-1) + par0(54,1)*CJ(:,j-1) +par0(55,1));
%
for i=1:length(panel_mob)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_PT(i,j)=exp(par0(16,1) +par0(17,1)*exper(i,j) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1) +par0(20,1)*FT(i,j-1) + par0(21,1)*PT(i,j-1) + par0(22,1)*MJ(i,j-1) + par0(23,1)*NE(i,j-1) + par0(24,1)*CJ(i,j-1)+par0(25,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_MJ(i,j)=exp(par0(26,1) +par0(27,1)*exper(i,j) + par0(28,1)*educ2(i,1) + par0(29,1)*educ3(i,1) +par0(30,1)*FT(i,j-1) + par0(31,1)*PT(i,j-1) + par0(32,1)*MJ(i,j-1) + par0(33,1)*NE(i,j-1) + par0(34,1)*CJ(i,j-1)+par0(35,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_NE(i,j)=exp(par0(36,1) +par0(37,1)*exper(i,j) + par0(38,1)*educ2(i,1) + par0(39,1)*educ3(i,1) +par0(40,1)*FT(i,j-1) + par0(41,1)*PT(i,j-1) + par0(42,1)*MJ(i,j-1) + par0(43,1)*NE(i,j-1) + par0(44,1)*CJ(i,j-1)+par0(45,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_CJ(i,j)=exp(par0(46,1) +par0(47,1)*exper(i,j) + par0(48,1)*educ2(i,1) + par0(49,1)*educ3(i,1) +par0(50,1)*FT(i,j-1) + par0(51,1)*PT(i,j-1) + par0(52,1)*MJ(i,j-1) + par0(53,1)*NE(i,j-1) + par0(54,1)*CJ(i,j-1)+par0(55,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)+prob_CJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)<rand_state(i,j) && isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=1;
    elseif isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=0;
    end
end
end

%
randn('seed',654321)
panel_wage=nan(length(panel_mob),size(panel_mob,2));

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
panel_mob_2_1=panel_mob;

st_tr_pr_2_1=zeros(5,5);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_1(1,1)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_1(2,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_1(3,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_1(4,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_2_1(5,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_1(1,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_1(1,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_1(1,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_2_1(1,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_1(2,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_1(2,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_2_1(2,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_1(3,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_2_1(3,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_2_1(4,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_1(5,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_1(5,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_1(5,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_1(5,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_1(4,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_1(4,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_1(4,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_1(3,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_1(3,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_1(2,1)=ind/sum(aux(:)==1);

st_tr_pr_2_1;

FT_wages_2_1=panel_wage_2_1.*(fract_FT==1);
FT_wages_2_1=FT_wages_2_1(:);
FT_wages_2_1(FT_wages_2_1==0)=[];
PT_wages_2_1=panel_wage_2_1.*(fract_PT==1);
PT_wages_2_1=PT_wages_2_1(:);
PT_wages_2_1(PT_wages_2_1==0)=[];
MJ_wages_2_1=panel_wage_2_1.*(fract_MJ==1);
MJ_wages_2_1=MJ_wages_2_1(:);
MJ_wages_2_1(MJ_wages_2_1==0)=[];
NE_wages_2_1=panel_wage_2_1.*(fract_NE==1);
NE_wages_2_1=NE_wages_2_1(:);
NE_wages_2_1(NE_wages_2_1==0)=[];
CJ_wages_2_1=panel_wage_2_1.*(fract_CJ==1);
CJ_wages_2_1=CJ_wages_2_1(:);
CJ_wages_2_1(CJ_wages_2_1==0)=[];

%quintiles - income mobility

%whole sample
wages=panel_wage_2_1;
decile=nan(length(wages),size(wages,2));

decile_20=prctile(wages(:),20);
decile_40=prctile(wages(:),40);
decile_60=prctile(wages(:),60);
decile_80=prctile(wages(:),80);

for i=1:length(wages)
    for j=1: size(wages,2)
        if isnan(wages(i,j))~=1 && wages(i,j)<decile_20
            decile(i,j)=1;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_20 && wages(i,j)<decile_40
            decile(i,j)=2;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_40 && wages(i,j)<decile_60
            decile(i,j)=3;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_60 && wages(i,j)<decile_80
            decile(i,j)=4;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_80
            decile(i,j)=5;
        end
    end
end

matrix_2_1=zeros(5,5);

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_1(1,1)=counting/den;
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_1(2,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_1(3,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_1(4,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_1(5,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_1(2,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_1(3,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_1(4,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_1(5,1)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_1(3,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_1(4,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_1(5,2)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_1(4,3)=counting/den;
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_1(5,3)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_1(5,4)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_1(1,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_1(1,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_1(1,4)=counting/den;
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_1(1,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_1(2,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_1(2,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_1(2,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_1(3,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_1(3,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_1(4,5)=counting/den;

matrix_2_1=matrix_2_1.*100;

fract_FT_2_1=fract_FT;
fract_PT_2_1=fract_PT;
fract_MJ_2_1=fract_MJ;
fract_NE_2_1=fract_NE;
fract_CJ_2_1=fract_CJ;
save('fract_FT_2_1.mat','fract_FT_2_1')
save('fract_PT_2_1.mat','fract_PT_2_1')
save('fract_MJ_2_1.mat','fract_MJ_2_1')
save('fract_NE_2_1.mat','fract_NE_2_1')
save('fract_CJ_2_1.mat','fract_CJ_2_1')
save('panel_wage_2_1.mat','panel_wage_2_1')

%% mobility class 2 wage class 2 
panel_mob=zeros(length(data_male.log_ave_wage),size(data_male.log_ave_wage,2));
panel_mob(fract_wcl==1,:)=NaN;
panel_mob(fract_mcl==1,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year

exper=data_male.lmexp;
exper(isnan(aux(:,1))==1,:)=[];
yr=data_male.year;
yr(isnan(aux(:,1))==1,:)=[];
educ2=data_male.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_male.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
FT=data_male.FT;
FT(isnan(aux(:,1))==1,:)=[];
PT=data_male.PT;
PT(isnan(aux(:,1))==1,:)=[];
MJ=data_male.MJ;
MJ(isnan(aux(:,1))==1,:)=[];
NE=data_male.NE;
NE(isnan(aux(:,1))==1,:)=[];
CJ=data_male.CJ;
CJ(isnan(aux(:,1))==1,:)=[];
empstate=data_male.empstate;
empstate(isnan(aux(:,1))==1,:)=[];

%initial state:
rand_state=rand(length(panel_mob),size(panel_mob,2));
den=zeros(length(panel_mob),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(1,1) +par0(2,1)*exper(:,1) + par0(3,1)*educ2 + par0(4,1)*educ3+par0(5,1));%iniPT
den(:,1)=den(:,1)+exp(par0(6,1) +par0(7,1)*exper(:,1) + par0(8,1)*educ2 + par0(9,1)*educ3+par0(10,1));%iniMJ
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3+par0(15,1));%iniCJ
%
prob_FT=nan(length(panel_mob),size(panel_mob,2));
fract_FT=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_FT(i,1)=1./(den(i,1));
    if prob_FT(i,1)>rand_state(i,1) && isnan(prob_FT(i,1))==0
        fract_FT(i,1)=1;
    elseif isnan(prob_FT(i,1))==0
        fract_FT(i,1)=0;
    end
end
%
prob_PT=nan(length(panel_mob),size(panel_mob,2));
fract_PT=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_PT(i,1)=exp(par0(1,1) +par0(2,1)*exper(i,1) + par0(3,1)*yr(i,1) + par0(4,1)*educ2(i,1) + par0(5,1)*educ3(i,1)+par0(6,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)>rand_state(i,1) && prob_FT(i,1)<rand_state(i,1) && isnan(prob_PT(i,1))==0
        fract_PT(i,1)=1;
    elseif isnan(prob_PT(i,1))==0
        fract_PT(i,1)=0;
    end
end
%
prob_MJ=nan(length(panel_mob),size(panel_mob,2));
fract_MJ=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_MJ(i,1)=exp(par0(7,1) +par0(8,1)*exper(i,1) + par0(9,1)*yr(i,1) + par0(10,1)*educ2(i,1) + par0(11,1)*educ3(i,1)+par0(12,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)<rand_state(i,1) && isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=1;
    elseif isnan(prob_MJ(i,1))==0
        fract_MJ(i,1)=0;
    end
end
%
prob_CJ=nan(length(panel_mob),size(panel_mob,2));
fract_CJ=nan(length(panel_mob),size(panel_mob,2));
%
for i=1:length(panel_mob)
    prob_CJ(i,1)=exp(par0(13,1) +par0(14,1)*exper(i,1) + par0(15,1)*yr(i,1) + par0(16,1)*educ2(i,1) + par0(17,1)*educ3(i,1)+par0(18,1))./(den(i,1));
    if prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)+prob_CJ(i,1)>rand_state(i,1) && prob_FT(i,1)+prob_PT(i,1)+prob_MJ(i,1)<rand_state(i,1)
        fract_CJ(i,1)=1;
    elseif isnan(prob_CJ(i,1))==0
        fract_CJ(i,1)=0;
    end
end
prob_NE=nan(length(panel_mob),size(panel_mob,2));
fract_NE=zeros(length(panel_mob),size(panel_mob,2));

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(length(panel_mob),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,j) + par0(18,1)*educ2 + par0(19,1)*educ3 +par0(20,1)*FT(:,j-1) + par0(21,1)*PT(:,j-1) + par0(22,1)*MJ(:,j-1) + par0(23,1)*NE(:,j-1) + par0(24,1)*CJ(:,j-1) +par0(25,1));
den(:,1)=den(:,1)+exp(par0(26,1) +par0(27,1)*exper(:,j) + par0(28,1)*educ2 + par0(29,1)*educ3 +par0(30,1)*FT(:,j-1) + par0(31,1)*PT(:,j-1) + par0(32,1)*MJ(:,j-1) + par0(33,1)*NE(:,j-1) + par0(34,1)*CJ(:,j-1) +par0(35,1));
den(:,1)=den(:,1)+exp(par0(36,1) +par0(37,1)*exper(:,j) + par0(38,1)*educ2 + par0(39,1)*educ3 +par0(40,1)*FT(:,j-1) + par0(41,1)*PT(:,j-1) + par0(42,1)*MJ(:,j-1) + par0(43,1)*NE(:,j-1) + par0(44,1)*CJ(:,j-1) +par0(45,1));
den(:,1)=den(:,1)+exp(par0(46,1) +par0(47,1)*exper(:,j) + par0(48,1)*educ2 + par0(49,1)*educ3 +par0(50,1)*FT(:,j-1) + par0(51,1)*PT(:,j-1) + par0(52,1)*MJ(:,j-1) + par0(53,1)*NE(:,j-1) + par0(54,1)*CJ(:,j-1) +par0(55,1));
%
for i=1:length(panel_mob)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_PT(i,j)=exp(par0(16,1) +par0(17,1)*exper(i,j) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1) +par0(20,1)*FT(i,j-1) + par0(21,1)*PT(i,j-1) + par0(22,1)*MJ(i,j-1) + par0(23,1)*NE(i,j-1) + par0(24,1)*CJ(i,j-1)+par0(25,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_MJ(i,j)=exp(par0(26,1) +par0(27,1)*exper(i,j) + par0(28,1)*educ2(i,1) + par0(29,1)*educ3(i,1) +par0(30,1)*FT(i,j-1) + par0(31,1)*PT(i,j-1) + par0(32,1)*MJ(i,j-1) + par0(33,1)*NE(i,j-1) + par0(34,1)*CJ(i,j-1)+par0(35,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_NE(i,j)=exp(par0(36,1) +par0(37,1)*exper(i,j) + par0(38,1)*educ2(i,1) + par0(39,1)*educ3(i,1) +par0(40,1)*FT(i,j-1) + par0(41,1)*PT(i,j-1) + par0(42,1)*MJ(i,j-1) + par0(43,1)*NE(i,j-1) + par0(44,1)*CJ(i,j-1)+par0(45,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
    end
end
for i=1:length(panel_mob)
    prob_CJ(i,j)=exp(par0(46,1) +par0(47,1)*exper(i,j) + par0(48,1)*educ2(i,1) + par0(49,1)*educ3(i,1) +par0(50,1)*FT(i,j-1) + par0(51,1)*PT(i,j-1) + par0(52,1)*MJ(i,j-1) + par0(53,1)*NE(i,j-1) + par0(54,1)*CJ(i,j-1)+par0(55,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)+prob_CJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)<rand_state(i,j) && isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=1;
    elseif isnan(prob_CJ(i,j))==0
        fract_CJ(i,j)=0;
    end
end
end

%
randn('seed',654321)
panel_wage=nan(length(panel_mob),size(panel_mob,2));

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
panel_mob_2_2=panel_mob;

st_tr_pr_2_2=zeros(5,5);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_2(1,1)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_2(2,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_2(3,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_2(4,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_2_2(5,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_2(1,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_2(1,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_2(1,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_2_2(1,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_2(2,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_2(2,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_2_2(2,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_2(3,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_2_2(3,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr_2_2(4,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_2(5,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_2(5,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_2(5,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_2(5,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_2(4,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_2(4,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_2(4,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_2(3,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_2(3,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_2(2,1)=ind/sum(aux(:)==1);

st_tr_pr_2_2;

FT_wages_2_2=panel_wage_2_2.*(fract_FT==1);
FT_wages_2_2=FT_wages_2_2(:);
FT_wages_2_2(FT_wages_2_2==0)=[];
PT_wages_2_2=panel_wage_2_2.*(fract_PT==1);
PT_wages_2_2=PT_wages_2_2(:);
PT_wages_2_2(PT_wages_2_2==0)=[];
MJ_wages_2_2=panel_wage_2_2.*(fract_MJ==1);
MJ_wages_2_2=MJ_wages_2_2(:);
MJ_wages_2_2(MJ_wages_2_2==0)=[];
NE_wages_2_2=panel_wage_2_2.*(fract_NE==1);
NE_wages_2_2=NE_wages_2_2(:);
NE_wages_2_2(NE_wages_2_2==0)=[];
CJ_wages_2_2=panel_wage_2_2.*(fract_CJ==1);
CJ_wages_2_2=CJ_wages_2_2(:);
CJ_wages_2_2(CJ_wages_2_2==0)=[];

%quintiles - income mobility

%whole sample
wages=panel_wage_2_2;
decile=nan(length(wages),size(wages,2));

decile_20=prctile(wages(:),20);
decile_40=prctile(wages(:),40);
decile_60=prctile(wages(:),60);
decile_80=prctile(wages(:),80);

for i=1:length(wages)
    for j=1: size(wages,2)
        if isnan(wages(i,j))~=1 && wages(i,j)<decile_20
            decile(i,j)=1;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_20 && wages(i,j)<decile_40
            decile(i,j)=2;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_40 && wages(i,j)<decile_60
            decile(i,j)=3;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_60 && wages(i,j)<decile_80
            decile(i,j)=4;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_80
            decile(i,j)=5;
        end
    end
end

matrix_2_2=zeros(5,5);

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_2(1,1)=counting/den;
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_2(2,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_2(3,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_2(4,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_2(5,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_2(2,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_2(3,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_2(4,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_2(5,1)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_2(3,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_2(4,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_2(5,2)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_2(4,3)=counting/den;
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_2(5,3)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_2(5,4)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_2(1,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_2(1,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_2(1,4)=counting/den;
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_2(1,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_2(2,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_2(2,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_2(2,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_2(3,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_2(3,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_2(4,5)=counting/den;

matrix_2_2=matrix_2_2.*100;

fract_FT_2_2=fract_FT;
fract_PT_2_2=fract_PT;
fract_MJ_2_2=fract_MJ;
fract_NE_2_2=fract_NE;
fract_CJ_2_2=fract_CJ;
save('fract_FT_2_2.mat','fract_FT_2_2')
save('fract_PT_2_2.mat','fract_PT_2_2')
save('fract_MJ_2_2.mat','fract_MJ_2_2')
save('fract_NE_2_2.mat','fract_NE_2_2')
save('fract_CJ_2_2.mat','fract_CJ_2_2')
save('panel_wage_2_2.mat','panel_wage_2_2')

%% Whole Sample:

clear
load('fract_FT_2_2.mat','fract_FT_2_2')
load('fract_PT_2_2.mat','fract_PT_2_2')
load('fract_MJ_2_2.mat','fract_MJ_2_2')
load('fract_NE_2_2.mat','fract_NE_2_2')
load('fract_CJ_2_2.mat','fract_CJ_2_2')
load('panel_wage_2_2.mat','panel_wage_2_2')
load('fract_FT_1_2.mat','fract_FT_1_2')
load('fract_PT_1_2.mat','fract_PT_1_2')
load('fract_MJ_1_2.mat','fract_MJ_1_2')
load('fract_NE_1_2.mat','fract_NE_1_2')
load('fract_CJ_1_2.mat','fract_CJ_1_2')
load('panel_wage_1_2.mat','panel_wage_1_2')
load('fract_FT_2_1.mat','fract_FT_2_1')
load('fract_PT_2_1.mat','fract_PT_2_1')
load('fract_MJ_2_1.mat','fract_MJ_2_1')
load('fract_NE_2_1.mat','fract_NE_2_1')
load('fract_CJ_2_1.mat','fract_CJ_2_1')
load('panel_wage_2_1.mat','panel_wage_2_1')
load('fract_FT_1_1.mat','fract_FT_1_1')
load('fract_PT_1_1.mat','fract_PT_1_1')
load('fract_MJ_1_1.mat','fract_MJ_1_1')
load('fract_NE_1_1.mat','fract_NE_1_1')
load('fract_CJ_1_1.mat','fract_CJ_1_1')
load('panel_wage_1_1.mat','panel_wage_1_1')
%State Mobility:

fract_FT=[fract_FT_1_1;fract_FT_1_2;fract_FT_2_1;fract_FT_2_2];
fract_PT=[fract_PT_1_1;fract_PT_1_2;fract_PT_2_1;fract_PT_2_2];
fract_MJ=[fract_MJ_1_1;fract_MJ_1_2;fract_MJ_2_1;fract_MJ_2_2];
fract_NE=[fract_NE_1_1;fract_NE_1_2;fract_NE_2_1;fract_NE_2_2];
fract_CJ=[fract_CJ_1_1;fract_CJ_1_2;fract_CJ_2_1;fract_CJ_2_2];

st_tr_pr=zeros(5,5);
yr=fract_FT;
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr(1,1)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr(2,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr(3,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr(4,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr(5,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr(1,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr(1,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr(1,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr(1,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr(2,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr(2,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr(2,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr(3,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr(3,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_CJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_CJ)==1;
st_tr_pr(4,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr(5,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_p(5,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr(5,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_CJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr(5,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr(4,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr(4,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr(4,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr(3,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr(3,1)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(yr)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr(2,1)=ind/sum(aux(:)==1);

st_tr_pr=st_tr_pr';

disp('Labour Market State Transitions - Sample Simulation')
['FT: ' num2str(100*st_tr_pr(1,1),'%4.0f') '&' num2str(100*st_tr_pr(1,2),'%4.0f') '&' num2str(100*st_tr_pr(1,3),'%4.0f') '&' num2str(100*st_tr_pr(1,4),'%4.0f') '&' num2str(100*st_tr_pr(1,5),'%4.0f')]
['PT: ' num2str(100*st_tr_pr(2,1),'%4.0f') '&' num2str(100*st_tr_pr(2,2),'%4.0f') '&' num2str(100*st_tr_pr(2,3),'%4.0f') '&' num2str(100*st_tr_pr(2,4),'%4.0f') '&' num2str(100*st_tr_pr(2,5),'%4.0f')]
['MJ: ' num2str(100*st_tr_pr(3,1),'%4.0f') '&' num2str(100*st_tr_pr(3,2),'%4.0f') '&' num2str(100*st_tr_pr(3,3),'%4.0f') '&' num2str(100*st_tr_pr(3,4),'%4.0f') '&' num2str(100*st_tr_pr(3,5),'%4.0f')]
['NE: ' num2str(100*st_tr_pr(4,1),'%4.0f') '&' num2str(100*st_tr_pr(4,2),'%4.0f') '&' num2str(100*st_tr_pr(4,3),'%4.0f') '&' num2str(100*st_tr_pr(4,4),'%4.0f') '&' num2str(100*st_tr_pr(4,5),'%4.0f')]
['CJ: ' num2str(100*st_tr_pr(5,1),'%4.0f') '&' num2str(100*st_tr_pr(5,2),'%4.0f') '&' num2str(100*st_tr_pr(5,3),'%4.0f') '&' num2str(100*st_tr_pr(5,4),'%4.0f') '&' num2str(100*st_tr_pr(5,5),'%4.0f')]


%Income Mobility:

wages=[panel_wage_1_1;panel_wage_1_2;panel_wage_2_1;panel_wage_2_2];
decile=nan(length(wages),size(wages,2));

decile_20=prctile(wages(:),20);
decile_40=prctile(wages(:),40);
decile_60=prctile(wages(:),60);
decile_80=prctile(wages(:),80);

for i=1:length(wages)
    for j=1: size(wages,2)
        if isnan(wages(i,j))~=1 && wages(i,j)<decile_20
            decile(i,j)=1;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_20 && wages(i,j)<decile_40
            decile(i,j)=2;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_40 && wages(i,j)<decile_60
            decile(i,j)=3;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_60 && wages(i,j)<decile_80
            decile(i,j)=4;
        elseif isnan(wages(i,j))~=1 && wages(i,j)>decile_80
            decile(i,j)=5;
        end
    end
end

matrix=zeros(5,5);

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix(1,1)=counting/den;
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix(2,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix(3,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix(4,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix(5,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix(2,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix(3,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix(4,1)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix(5,1)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix(3,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix(4,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix(5,2)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix(4,3)=counting/den;
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix(5,3)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix(5,4)=counting/den;

den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix(1,2)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix(1,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix(1,4)=counting/den;
%
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix(1,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix(2,3)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix(2,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix(2,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix(3,4)=counting/den;
%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix(3,5)=counting/den;

%
den=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:length(wages)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix(4,5)=counting/den;

matrix=matrix.*100;
disp('Quintiles - Income Mobility, Sample Simulation')
['D1: ' num2str(matrix(1,1),'%4.0f') '&' num2str(matrix(1,2),'%4.0f') '&' num2str(matrix(1,3),'%4.0f') '&' num2str(matrix(1,4),'%4.0f') '&' num2str(matrix(1,5),'%4.0f')]
['D2: ' num2str(matrix(2,1),'%4.0f') '&' num2str(matrix(2,2),'%4.0f') '&' num2str(matrix(2,3),'%4.0f') '&' num2str(matrix(2,4),'%4.0f') '&' num2str(matrix(2,5),'%4.0f')]
['D3: ' num2str(matrix(3,1),'%4.0f') '&' num2str(matrix(3,2),'%4.0f') '&' num2str(matrix(3,3),'%4.0f') '&' num2str(matrix(3,4),'%4.0f') '&' num2str(matrix(3,5),'%4.0f')]
['D4: ' num2str(matrix(4,1),'%4.0f') '&' num2str(matrix(4,2),'%4.0f') '&' num2str(matrix(4,3),'%4.0f') '&' num2str(matrix(4,4),'%4.0f') '&' num2str(matrix(4,5),'%4.0f')]
['D5: ' num2str(matrix(5,1),'%4.0f') '&' num2str(matrix(5,2),'%4.0f') '&' num2str(matrix(5,3),'%4.0f') '&' num2str(matrix(5,4),'%4.0f') '&' num2str(matrix(5,5),'%4.0f')]

%% Statistics:

% %Mobility Wage
% %0.11
% %0.2
% % Fit to Job Mobility
% disp('Fit to Job Mobility')
% st_tr_pr=prob_mcl_one*prob_wcl_one*st_tr_pr_1_1+prob_mcl_one*prob_wcl_two*st_tr_pr_1_2...
%     +prob_mcl_two*prob_wcl_one*st_tr_pr_2_1+prob_mcl_two*prob_wcl_two*st_tr_pr_2_2;
% st_tr_pr'
% 
% % Fit to Income Mobility
% disp('Fit to Income Mobility')
% matrix=prob_mcl_one*prob_wcl_one*matrix_1_1+prob_mcl_one*prob_wcl_two*matrix_1_2...
%     +prob_mcl_two*prob_wcl_one*matrix_2_1+prob_mcl_two*prob_wcl_two*matrix_2_2;
% matrix


% Income Densities

%Predicted
% FT_wages=[FT_wages_1_1; FT_wages_2_1; FT_wages_1_2; FT_wages_2_2];
% PT_wages=[PT_wages_1_1; PT_wages_2_1; PT_wages_1_2; PT_wages_2_2];
% MJ_wages=[MJ_wages_1_1; MJ_wages_2_1; MJ_wages_1_2; MJ_wages_2_2];
% NE_wages=[NE_wages_1_1; NE_wages_2_1; NE_wages_1_2; NE_wages_2_2];
% CJ_wages=[CJ_wages_1_1; CJ_wages_2_1; CJ_wages_1_2; CJ_wages_2_2];
% 
% %Observed
% obs_FT_wages=data_male.log_ave_wage;
% obs_FT_wages=obs_FT_wages.*(data_male.empstate==1);
% obs_FT_wages=obs_FT_wages(:);
% obs_FT_wages(obs_FT_wages==0)=[];
% obs_PT_wages=data_male.log_ave_wage;
% obs_PT_wages=obs_PT_wages.*(data_male.empstate==2);
% obs_PT_wages=obs_PT_wages(:);
% obs_PT_wages(obs_PT_wages==0)=[];
% obs_MJ_wages=data_male.log_ave_wage;
% obs_MJ_wages=obs_MJ_wages.*(data_male.empstate==3);
% obs_MJ_wages=obs_MJ_wages(:);
% obs_MJ_wages(obs_MJ_wages==0)=[];
% obs_NE_wages=data_male.log_ave_wage;
% obs_NE_wages=obs_NE_wages.*(data_male.empstate==4);
% obs_NE_wages=obs_NE_wages(:);
% obs_NE_wages(obs_NE_wages==0)=[];
% obs_CJ_wages=data_male.log_ave_wage;
% obs_CJ_wages=obs_CJ_wages.*(data_male.empstate==5);
% obs_CJ_wages=obs_CJ_wages(:);
% obs_CJ_wages(obs_CJ_wages==0)=[];
% 
% 
% [fFT,xiFT] = ksdensity(FT_wages); 
% [obs_fFT,obs_xiFT] = ksdensity(obs_FT_wages); 
% figure
% plot(xiFT,fFT,'LineWidth',2,'LineStyle','--');
% hold on
% plot(obs_xiFT,obs_fFT,'LineWidth',2);
% hold off
% grid on
% axis tight
% legend('Predicted','Observed','Location','Northeast')
% xlabel('Log Ave Wage','fontsize',24,'FontWeight','bold')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 24)
% print('kernel_FT_males','-dpng')
% 
% [fPT,xiPT] = ksdensity(PT_wages); 
% [obs_fPT,obs_xiPT] = ksdensity(obs_PT_wages); 
% figure
% plot(xiPT,fPT,'LineWidth',2,'LineStyle','--');
% hold on
% plot(obs_xiPT,obs_fPT,'LineWidth',2);
% hold off
% grid on
% axis tight
% legend('Predicted','Observed','Location','Northeast')
% xlabel('Log Ave Wage','fontsize',24,'FontWeight','bold')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 24)
% print('kernel_PT_males','-dpng')
% 
% [fMJ,xiMJ] = ksdensity(MJ_wages); 
% [obs_fMJ,obs_xiMJ] = ksdensity(obs_MJ_wages); 
% figure
% plot(xiMJ,fMJ,'LineWidth',2,'LineStyle','--');
% hold on
% plot(obs_xiMJ,obs_fMJ,'LineWidth',2);
% hold off
% grid on
% axis tight
% legend('Predicted','Observed','Location','Northeast')
% xlabel('Log Ave Wage','fontsize',24,'FontWeight','bold')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 24)
% print('kernel_MJ_males','-dpng')
% 
% [fNE,xiNE] = ksdensity(NE_wages); 
% [obs_fNE,obs_xiNE] = ksdensity(obs_NE_wages); 
% figure
% plot(xiNE,fNE,'LineWidth',2,'LineStyle','--');
% hold on
% plot(obs_xiNE,obs_fNE,'LineWidth',2);
% hold off
% grid on
% axis tight
% legend('Predicted','Observed','Location','Northeast')
% xlabel('Log Ave Wage','fontsize',24,'FontWeight','bold')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 24)
% print('kernel_NE_males','-dpng')
% 
% [fCJ,xiCJ] = ksdensity(CJ_wages); 
% [obs_fCJ,obs_xiCJ] = ksdensity(obs_CJ_wages); 
% figure
% plot(xiCJ,fCJ,'LineWidth',2,'LineStyle','--');
% hold on
% plot(obs_xiCJ,obs_fCJ,'LineWidth',2);
% hold off
% grid on
% axis tight
% legend('Predicted','Observed','Location','Northeast')
% xlabel('Log Ave Wage','fontsize',24,'FontWeight','bold')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 24)
% print('kernel_CJ_males','-dpng')