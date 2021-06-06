
cd '\1999-2002'
clc
clear
close all
clear mex
set(0,'DefaultFigureWindowStyle','docked')
disp('females, 1999-2002')
%
load('phat_female.mat','phat_female')
load('data_female.mat','data_female')

%% Parameter Values
disp('Parameter Values')
% col=73;
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
% %iniCJ
par0(11,1)=phat_female(11,1);
par0(12,1)=phat_female(12,1);
par0(13,1)=phat_female(13,1);
par0(14,1)=phat_female(14,1);
par0(15,1)=phat_female(15,1);
% %PT 
par0(16,1)=phat_female(16,1);%cons
par0(17,1)=phat_female(17,1);%lmexp
par0(18,1)=phat_female(18,1);%ed2
par0(19,1)=phat_female(19,1);%ed3
par0(20,1)=phat_female(20,1);%PT
par0(21,1)=phat_female(21,1);%MJ
par0(22,1)=phat_female(22,1);%NE
par0(23,1)=phat_female(23,1);%CJ
par0(24,1)=phat_female(24,1);%CJ
par0(25,1)=phat_female(25,1);%mcl2
% %MJ
par0(26,1)=phat_female(26,1);
par0(27,1)=phat_female(27,1);
par0(28,1)=phat_female(28,1);
par0(29,1)=phat_female(29,1);
par0(30,1)=phat_female(30,1);%PT
par0(31,1)=phat_female(31,1);%MJ
par0(32,1)=phat_female(32,1);%NE
par0(33,1)=phat_female(33,1);%CJ
par0(34,1)=phat_female(34,1);%CJ
par0(35,1)=phat_female(35,1);%mcl2
% %NE
par0(36,1)=phat_female(36,1);
par0(37,1)=phat_female(37,1);
par0(38,1)=phat_female(38,1);
par0(39,1)=phat_female(39,1);
par0(40,1)=phat_female(40,1);%PT
par0(41,1)=phat_female(41,1);%MJ
par0(42,1)=phat_female(42,1);%NE
par0(43,1)=phat_female(43,1);%CJ
par0(44,1)=phat_female(44,1);%CJ
par0(45,1)=phat_female(45,1);%mcl2
% %CJ
par0(46,1)=phat_female(46,1);
par0(47,1)=phat_female(47,1);
par0(48,1)=phat_female(48,1);
par0(49,1)=phat_female(49,1);
par0(50,1)=phat_female(50,1);%PT
par0(51,1)=phat_female(51,1);%MJ
par0(52,1)=phat_female(52,1);%NE
par0(53,1)=phat_female(53,1);%CJ
par0(54,1)=phat_female(54,1);%CJ
par0(55,1)=phat_female(55,1);%mcl2
% %mcl
par0(56,1)=phat_female(56,1);%cons
par0(57,1)=phat_female(57,1);%year_birth
par0(58,1)=phat_female(58,1);%ED2
par0(59,1)=phat_female(59,1);%ED3

% %mu
par0(60,1)=phat_female(60,1);%cons
par0(61,1)=phat_female(61,1);%ED2
par0(62,1)=phat_female(62,1);%ED3
par0(63,1)=phat_female(63,1);%lmexp
par0(64,1)=phat_female(64,1);%PT
par0(65,1)=phat_female(65,1);%MJ
par0(66,1)=phat_female(66,1);%NE
par0(67,1)=phat_female(67,1);%CJ
par0(68,1)=phat_female(68,1);%wcl
% %sigma
par0(69,1)=phat_female(69,1);%cons
par0(70,1)=phat_female(70,1);%lmexp
par0(71,1)=phat_female(71,1);%PT
par0(72,1)=phat_female(72,1);%MJ
par0(73,1)=phat_female(73,1);%CJ
par0(74,1)=phat_female(74,1);%wcl
% %tau1
par0(75:85,1)=phat_female(75:85,1);
% %wcl
par0(86,1)=phat_female(86,1);%cons
par0(87,1)=phat_female(87,1);%year_birth
par0(88,1)=phat_female(88,1);%ED2
par0(89,1)=phat_female(89,1);%ED3

acr_cons=-1+2/(1+exp(par0(75)))
acr_cons_exp=-1+2/(1+exp(par0(75)+par0(76)))
acr_cons_unobserved=-1+2/(1+exp(par0(75)+par0(77)))
acr_cons_PTFT=-1+2/(1+exp(par0(75)+par0(78)))
acr_cons_MJFT=-1+2/(1+exp(par0(75)+par0(79)))
acr_cons_NEFT=-1+2/(1+exp(par0(75)+par0(80)))
acr_cons_CJFT=-1+2/(1+exp(par0(75)+par0(81)))
acr_cons_FTCJ=-1+2/(1+exp(par0(75)+par0(82)))
acr_cons_PTCJ=-1+2/(1+exp(par0(75)+par0(83)))
acr_cons_MJCJ=-1+2/(1+exp(par0(75)+par0(84)))
acr_cons_NECJ=-1+2/(1+exp(par0(75)+par0(85)))
%
prob_ini_PT=par0(1:5);
prob_ini_MJ=par0(6:10);
prob_ini_CJ=par0(11:15);
disp('Initial State')
['Constant: ' num2str(prob_ini_PT(1),'%4.2f') ' & ' num2str(prob_ini_MJ(1),'%4.2f') ' & ' num2str(prob_ini_CJ(1),'%4.2f')]
['Age: ' num2str(prob_ini_PT(2),'%4.2f') ' & ' num2str(prob_ini_MJ(2),'%4.2f') ' & ' num2str(prob_ini_CJ(2),'%4.2f')]
['High-School: ' num2str(prob_ini_PT(3),'%4.2f') ' & ' num2str(prob_ini_MJ(3),'%4.2f') ' & ' num2str(prob_ini_CJ(3),'%4.2f')]
['College: ' num2str(prob_ini_PT(4),'%4.2f') ' & ' num2str(prob_ini_MJ(4),'%4.2f') ' & ' num2str(prob_ini_CJ(4),'%4.2f')]
['k^s=2: ' num2str(prob_ini_PT(5),'%4.2f') ' & ' num2str(prob_ini_MJ(5),'%4.2f') ' & ' num2str(prob_ini_CJ(5),'%4.2f')]
%
prob_PT=par0(16:25);
prob_MJ=par0(26:35);
prob_NE=par0(36:45);
prob_CJ=par0(46:55);
disp('Subsequent States')
['Constant: ' num2str(prob_PT(1),'%4.2f') ' & ' num2str(prob_MJ(1),'%4.2f') ' & ' num2str(prob_NE(1),'%4.2f') ' & ' num2str(prob_CJ(1),'%4.2f')]
['Age: ' num2str(prob_PT(2),'%4.2f') ' & ' num2str(prob_MJ(2),'%4.2f') ' & ' num2str(prob_NE(2),'%4.2f') ' & ' num2str(prob_CJ(2),'%4.2f')]
['High-School: ' num2str(prob_PT(3),'%4.2f') ' & ' num2str(prob_MJ(3),'%4.2f') ' & ' num2str(prob_NE(3),'%4.2f') ' & ' num2str(prob_CJ(3),'%4.2f')]
['College: ' num2str(prob_PT(4),'%4.2f') ' & ' num2str(prob_MJ(4),'%4.2f') ' & ' num2str(prob_NE(4),'%4.2f') ' & ' num2str(prob_CJ(4),'%4.2f')]
['PT: ' num2str(prob_PT(5),'%4.2f') ' & ' num2str(prob_MJ(5),'%4.2f') ' & ' num2str(prob_NE(5),'%4.2f') ' & ' num2str(prob_CJ(5),'%4.2f')]
['PT: ' num2str(prob_PT(6),'%4.2f') ' & ' num2str(prob_MJ(6),'%4.2f') ' & ' num2str(prob_NE(6),'%4.2f') ' & ' num2str(prob_CJ(6),'%4.2f')]
['MJ: ' num2str(prob_PT(7),'%4.2f') ' & ' num2str(prob_MJ(7),'%4.2f') ' & ' num2str(prob_NE(7),'%4.2f') ' & ' num2str(prob_CJ(7),'%4.2f')]
['NE: ' num2str(prob_PT(8),'%4.2f') ' & ' num2str(prob_MJ(8),'%4.2f') ' & ' num2str(prob_NE(8),'%4.2f') ' & ' num2str(prob_CJ(8),'%4.2f')]
['CJ: ' num2str(prob_PT(9),'%4.2f') ' & ' num2str(prob_MJ(9),'%4.2f') ' & ' num2str(prob_NE(9),'%4.2f') ' & ' num2str(prob_CJ(9),'%4.2f')]
['k^s=2: ' num2str(prob_PT(10),'%4.2f') ' & ' num2str(prob_MJ(10),'%4.2f') ' & ' num2str(prob_NE(10),'%4.2f') ' & ' num2str(prob_CJ(10),'%4.2f')]
%
mcl=par0(56:59)
wcl=par0(86:89)
%
mu=par0(60:68)
sigma=par0(69:74)
acv1=par0(75:85);
%need to re-estimate and simplify
acv1(1:3)
%
PT_to_FT=acv1(4);
MJ_to_FT=acv1(5);
NE_to_FT=acv1(6);
CJ_to_FT=acv1(7);
%
FT_to_CJ=acv1(8);
PT_to_CJ=acv1(9);
MJ_to_CJ=acv1(10);
NE_to_CJ=acv1(11);
%
disp('Wage Distribution')
['Constant: ' num2str(mu(1),'%4.2f') ' & ' num2str(sigma(1),'%4.2f') ' & ' num2str(acv1(1),'%4.2f')]
['High-School: ' num2str(mu(2),'%4.2f') ' & ' '-' ' & ' '-']
['College: ' num2str(mu(3),'%4.2f') ' & ' '-' ' & ' '-']
['Age: ' num2str(mu(4),'%4.2f') ' & ' num2str(sigma(2),'%4.2f') ' & ' num2str(acv1(2),'%4.2f')]
['PT: ' num2str(mu(5),'%4.2f') ' & ' num2str(sigma(3),'%4.2f') ' & ' '-']
['MJ: ' num2str(mu(6),'%4.2f') ' & ' num2str(sigma(4),'%4.2f') ' & ' '-']
['NE: ' num2str(mu(7),'%4.2f') ' & ' '-' ' & ' '-']
['CJ: ' num2str(mu(8),'%4.2f') ' & ' num2str(sigma(5),'%4.2f') ' & ' '-']
['k^s=2: ' num2str(mu(1),'%4.2f') ' & ' num2str(sigma(6),'%4.2f') ' & ' num2str(acv1(3),'%4.2f')]
['PT_to_FT: ' '-' ' & ' '-' ' & ' num2str(acv1(4),'%4.2f')]
['MJ_to_FT: ' '-' ' & ' '-' ' & ' num2str(acv1(5),'%4.2f')]
['NE_to_FT: ' '-' ' & ' '-' ' & ' num2str(acv1(6),'%4.2f')]
['CJ_to_FT: ' '-' ' & ' '-' ' & ' num2str(acv1(7),'%4.2f')]
['FT_to_CJ: ' '-' ' & ' '-' ' & ' num2str(acv1(8),'%4.2f')]
['PT_to_CJ: ' '-' ' & ' '-' ' & ' num2str(acv1(9),'%4.2f')]
['MJ_to_CJ: ' '-' ' & ' '-' ' & ' num2str(acv1(10),'%4.2f')]
['NE_to_CJ: ' '-' ' & ' '-' ' & ' num2str(acv1(11),'%4.2f')]

%
disp('Unobserved Heterogeneity')
['Constant: ' num2str(mcl(1),'%4.2f') ' & ' num2str(wcl(1),'%4.2f')]
['Year of Birth: ' num2str(mcl(2),'%4.2f') ' & ' num2str(wcl(2),'%4.2f')]
['High-School: ' num2str(mcl(3),'%4.2f') ' & ' num2str(wcl(3),'%4.2f')]
['College: ' num2str(mcl(4),'%4.2f') ' & ' num2str(wcl(4),'%4.2f')]
%% Probabilities of Mobility Classes
disp('Probabilities of Mobility Classes')
rand('seed',123456)
rand_samp_mob=rand(length(data_female.year_birth),1);
rand_samp_wage=rand(length(data_female.year_birth),1);
%sample
prob_mcl_1=zeros(length(data_female.year_birth),1);
fract_mcl=zeros(length(data_female.year_birth),1);
for i=1:length(data_female.year_birth)
    prob_mcl_1(i,1)=1./(1+exp(par0(56,1)+par0(57,1)*data_female.year_birth(i,1)+par0(58,1)*data_female.ED2(i,1)++par0(59,1)*data_female.ED3(i,1)));
    if prob_mcl_1(i,1)>rand_samp_mob(i,1)
        fract_mcl(i,1)=1;
    elseif prob_mcl_1(i,1)<rand_samp_mob(i,1)
        fract_mcl(i,1)=2;
    end
end
fract_mcl_one_samp=sum(fract_mcl==1)/length(fract_mcl);
fract_mcl_two_samp=sum(fract_mcl==2)/length(fract_mcl);
% one sample:
samp_one=data_female.empstate;
samp_one(fract_mcl==2,:)=[];
%FT
aux_FT=data_female.FT;
aux_FT(fract_mcl==2,:)=[];
fract_mcl_one_FT=sum(aux_FT(:)==1)/sum(isnan(samp_one(:))~=1);
%PT
aux_PT=data_female.PT;
aux_PT(fract_mcl==2,:)=[];
fract_mcl_one_PT=sum(aux_PT(:)==1)/sum(isnan(samp_one(:))~=1);
%MJ
aux_MJ=data_female.MJ;
aux_MJ(fract_mcl==2,:)=[];
fract_mcl_one_MJ=sum(aux_MJ(:)==1)/sum(isnan(samp_one(:))~=1);
%NE
aux_NE=data_female.NE;
aux_NE(fract_mcl==2,:)=[];
fract_mcl_one_NE=sum(aux_NE(:)==1)/sum(isnan(samp_one(:))~=1);
%CJ
aux_CJ=data_female.CJ;
aux_CJ(fract_mcl==2,:)=[];
fract_mcl_one_CJ=sum(aux_CJ(:)==1)/sum(isnan(samp_one(:))~=1);
% two sample:
samp_two=data_female.empstate;
samp_two(fract_mcl==1,:)=[];
%FT
aux_FT=data_female.FT;
aux_FT(fract_mcl==1,:)=[];
fract_mcl_two_FT=sum(aux_FT(:)==1)/sum(isnan(samp_two(:))~=1);
%PT
aux_PT=data_female.PT;
aux_PT(fract_mcl==1,:)=[];
fract_mcl_two_PT=sum(aux_PT(:)==1)/sum(isnan(samp_two(:))~=1);
%MJ
aux_MJ=data_female.MJ;
aux_MJ(fract_mcl==1,:)=[];
fract_mcl_two_MJ=sum(aux_MJ(:)==1)/sum(isnan(samp_two(:))~=1);
%NE
aux_NE=data_female.NE;
aux_NE(fract_mcl==1,:)=[];
fract_mcl_two_NE=sum(aux_NE(:)==1)/sum(isnan(samp_two(:))~=1);
%CJ
aux_CJ=data_female.CJ;
aux_CJ(fract_mcl==1,:)=[];
fract_mcl_two_CJ=sum(aux_CJ(:)==1)/sum(isnan(samp_two(:))~=1);

%
disp('State Composition')
['Sample: ' num2str(100*fract_mcl_one_samp,'%4.0f') ' & ' num2str(100*fract_mcl_two_samp,'%4.0f')]
['FT: ' num2str(100*fract_mcl_one_FT,'%4.0f') ' & ' num2str(100*fract_mcl_two_FT,'%4.0f')]
['PT: ' num2str(100*fract_mcl_one_PT,'%4.0f') ' & ' num2str(100*fract_mcl_two_PT,'%4.0f')]
['MJ: ' num2str(100*fract_mcl_one_MJ,'%4.0f') ' & ' num2str(100*fract_mcl_two_MJ,'%4.0f')]
['NE: ' num2str(100*fract_mcl_one_NE,'%4.0f') ' & ' num2str(100*fract_mcl_two_NE,'%4.0f')]
['CJ: ' num2str(100*fract_mcl_one_CJ,'%4.0f') ' & ' num2str(100*fract_mcl_two_CJ,'%4.0f')]
%% Fraction of State Composition:
disp('Fraction of State Composition')
fract_FT=sum(data_female.FT==1)/sum(isnan(data_female.empstate)~=1);
fract_PT=sum(data_female.PT==1)/sum(isnan(data_female.empstate)~=1);
fract_MJ=sum(data_female.MJ==1)/sum(isnan(data_female.empstate)~=1);
fract_NE=sum(data_female.NE==1)/sum(isnan(data_female.empstate)~=1);
fract_CJ=sum(data_female.CJ==1)/sum(isnan(data_female.empstate)~=1);
% FT:
aux_FT=data_female.FT;
samp_one=data_female.empstate==1;
samp_one(fract_mcl==2,:)=[];
samp_two=data_female.empstate==1;
samp_two(fract_mcl==1,:)=[];
fract_mcl_FT_one=sum(samp_one(:)==1)/sum(aux_FT(:)==1)
fract_mcl_FT_two=sum(samp_two(:)==1)/sum(aux_FT(:)==1)
% PT:
aux_PT=data_female.PT;
samp_one=data_female.empstate==2;
samp_one(fract_mcl==2,:)=[];
samp_two=data_female.empstate==2;
samp_two(fract_mcl==1,:)=[];
fract_mcl_PT_one=sum(samp_one(:)==1)/sum(aux_PT(:)==1)
fract_mcl_PT_two=sum(samp_two(:)==1)/sum(aux_PT(:)==1)
% MJ:
aux_MJ=data_female.MJ;
samp_one=data_female.empstate==3;
samp_one(fract_mcl==2,:)=[];
samp_two=data_female.empstate==3;
samp_two(fract_mcl==1,:)=[];
fract_mcl_MJ_one=sum(samp_one(:)==1)/sum(aux_MJ(:)==1)
fract_mcl_MJ_two=sum(samp_two(:)==1)/sum(aux_MJ(:)==1)
% NE:
aux_NE=data_female.NE;
samp_one=data_female.empstate==4;
samp_one(fract_mcl==2,:)=[];
samp_two=data_female.empstate==4;
samp_two(fract_mcl==1,:)=[];
fract_mcl_NE_one=sum(samp_one(:)==1)/sum(aux_NE(:)==1)
fract_mcl_NE_two=sum(samp_two(:)==1)/sum(aux_NE(:)==1)
% CJ:
aux_CJ=data_female.CJ;
samp_one=data_female.empstate==5;
samp_one(fract_mcl==2,:)=[];
samp_two=data_female.empstate==5;
samp_two(fract_mcl==1,:)=[];
fract_mcl_CJ_one=sum(samp_one(:)==1)/sum(aux_CJ(:)==1)
fract_mcl_CJ_two=sum(samp_two(:)==1)/sum(aux_CJ(:)==1)

%
disp('Class Composition')
['FT: ' num2str(100*fract_mcl_FT_one,'%4.0f') ' & ' num2str(100*fract_mcl_FT_two,'%4.0f') ' & ' num2str(100*fract_FT,'%4.0f')]
['PT: ' num2str(100*fract_mcl_PT_one,'%4.0f') ' & ' num2str(100*fract_mcl_PT_two,'%4.0f') ' & ' num2str(100*fract_PT,'%4.0f')]
['MJ: ' num2str(100*fract_mcl_MJ_one,'%4.0f') ' & ' num2str(100*fract_mcl_MJ_two,'%4.0f') ' & ' num2str(100*fract_MJ,'%4.0f')]
['NE: ' num2str(100*fract_mcl_NE_one,'%4.0f') ' & ' num2str(100*fract_mcl_NE_two,'%4.0f') ' & ' num2str(100*fract_NE,'%4.0f')]
['CJ: ' num2str(100*fract_mcl_CJ_one,'%4.0f') ' & ' num2str(100*fract_mcl_CJ_two,'%4.0f') ' & ' num2str(100*fract_CJ,'%4.0f')]

%% State Transition Data Observed Whole Sample
disp('State Transition Data Observed Whole Sample')
st_tr_pr=zeros(5,5);

ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==1 && data_female.lempstate(i,j)==1
            ind=ind+1;
        end
    end
end
aux=data_female.empstate(:,2:end);
st_tr_pr(1,1)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==2 && data_female.lempstate(i,j)==2
            ind=ind+1;
        end
    end
end
aux=data_female.empstate(:,2:end);
st_tr_pr(2,2)=ind/sum(aux(:)==2);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==3 && data_female.lempstate(i,j)==3
            ind=ind+1;
        end
    end
end
aux=data_female.empstate(:,2:end);
st_tr_pr(3,3)=ind/sum(aux(:)==3);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==4 && data_female.lempstate(i,j)==4
            ind=ind+1;
        end
    end
end
aux=data_female.empstate(:,2:end);
st_tr_pr(4,4)=ind/sum(aux(:)==4);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==5 && data_female.lempstate(i,j)==5
            ind=ind+1;
        end
    end
end
aux=data_female.empstate(:,2:end);
st_tr_pr(5,5)=ind/sum(aux(:)==5);

ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==1 && data_female.lempstate(i,j)==2
            ind=ind+1;
        end
    end
end
aux=data_female.empstate(:,2:end);
st_tr_pr(1,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==1 && data_female.lempstate(i,j)==3
            ind=ind+1;
        end
    end
end
aux=data_female.empstate(:,2:end);
st_tr_pr(1,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==1 && data_female.lempstate(i,j)==4
            ind=ind+1;
        end
    end
end
aux=data_female.empstate(:,2:end);
st_tr_pr(1,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==1 && data_female.lempstate(i,j)==5
            ind=ind+1;
        end
    end
end
aux=data_female.empstate(:,2:end);
st_tr_pr(1,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==2 && data_female.lempstate(i,j)==3
            ind=ind+1;
        end
    end
end
st_tr_pr(2,3)=ind/sum(aux(:)==2);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==2 && data_female.lempstate(i,j)==4
            ind=ind+1;
        end
    end
end
st_tr_pr(2,4)=ind/sum(aux(:)==2);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==2 && data_female.lempstate(i,j)==5
            ind=ind+1;
        end
    end
end
st_tr_pr(2,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==3 && data_female.lempstate(i,j)==4
            ind=ind+1;
        end
    end
end
st_tr_pr(3,4)=ind/sum(aux(:)==3);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==3 && data_female.lempstate(i,j)==5
            ind=ind+1;
        end
    end
end
st_tr_pr(3,5)=ind/sum(aux(:)==3);

ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==4 && data_female.lempstate(i,j)==5
            ind=ind+1;
        end
    end
end
st_tr_pr(4,5)=ind/sum(aux(:)==4);

ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==5 && data_female.lempstate(i,j)==4
            ind=ind+1;
        end
    end
end
st_tr_pr(5,4)=ind/sum(aux(:)==5);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==5 && data_female.lempstate(i,j)==3
            ind=ind+1;
        end
    end
end
st_tr_pr(5,3)=ind/sum(aux(:)==5);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==5 && data_female.lempstate(i,j)==2
            ind=ind+1;
        end
    end
end
st_tr_pr(5,2)=ind/sum(aux(:)==5);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==5 && data_female.lempstate(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(5,1)=ind/sum(aux(:)==5);

ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==4 && data_female.lempstate(i,j)==3
            ind=ind+1;
        end
    end
end
st_tr_pr(4,3)=ind/sum(aux(:)==4);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==4 && data_female.lempstate(i,j)==2
            ind=ind+1;
        end
    end
end
st_tr_pr(4,2)=ind/sum(aux(:)==4);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==4 && data_female.lempstate(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(4,1)=ind/sum(aux(:)==4);

ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==3 && data_female.lempstate(i,j)==2
            ind=ind+1;
        end
    end
end
st_tr_pr(3,2)=ind/sum(aux(:)==3);
ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==3 && data_female.lempstate(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(3,1)=ind/sum(aux(:)==3);

ind=0;
for i=1:length(data_female.year)
    for j=1:size(data_female.empstate,2)
        if data_female.empstate(i,j)==2 && data_female.lempstate(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(2,1)=ind/sum(aux(:)==2);

st_tr_pr

%
disp('Labour Market State Transitions')
['FT: ' num2str(100*st_tr_pr(1,1),'%4.0f') ' & ' num2str(100*st_tr_pr(1,2),'%4.0f') ' & ' num2str(100*st_tr_pr(1,3),'%4.0f') ' & ' num2str(100*st_tr_pr(1,4),'%4.0f') ' & ' num2str(100*st_tr_pr(1,5),'%4.0f')]
['PT: ' num2str(100*st_tr_pr(2,1),'%4.0f') ' & ' num2str(100*st_tr_pr(2,2),'%4.0f') ' & ' num2str(100*st_tr_pr(2,3),'%4.0f') ' & ' num2str(100*st_tr_pr(2,4),'%4.0f') ' & ' num2str(100*st_tr_pr(2,5),'%4.0f')]
['MJ: ' num2str(100*st_tr_pr(3,1),'%4.0f') ' & ' num2str(100*st_tr_pr(3,2),'%4.0f') ' & ' num2str(100*st_tr_pr(3,3),'%4.0f') ' & ' num2str(100*st_tr_pr(3,4),'%4.0f') ' & ' num2str(100*st_tr_pr(3,5),'%4.0f')]
['NE: ' num2str(100*st_tr_pr(4,1),'%4.0f') ' & ' num2str(100*st_tr_pr(4,2),'%4.0f') ' & ' num2str(100*st_tr_pr(4,3),'%4.0f') ' & ' num2str(100*st_tr_pr(4,4),'%4.0f') ' & ' num2str(100*st_tr_pr(4,5),'%4.0f')]
['CJ: ' num2str(100*st_tr_pr(5,1),'%4.0f') ' & ' num2str(100*st_tr_pr(5,2),'%4.0f') ' & ' num2str(100*st_tr_pr(5,3),'%4.0f') ' & ' num2str(100*st_tr_pr(5,4),'%4.0f') ' & ' num2str(100*st_tr_pr(5,5),'%4.0f')]
%% State Transitions Observed Mobility Type 1
disp('State Transition Observed Mobility Type 1')
st_tr_pr=zeros(5,5);

states=data_female.empstate;
lstates=data_female.lempstate;
states(fract_mcl==2,:)=[];
lstates(fract_mcl==2,:)=[];

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==1 && lstates(i,j)==1
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(1,1)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==2 && lstates(i,j)==2
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(2,2)=ind/sum(aux(:)==2);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==3 && lstates(i,j)==3
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(3,3)=ind/sum(aux(:)==3);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==4 && lstates(i,j)==4
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(4,4)=ind/sum(aux(:)==4);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==5 && lstates(i,j)==5
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(5,5)=ind/sum(aux(:)==5);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==1 && lstates(i,j)==2
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(1,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==1 && lstates(i,j)==3
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(1,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==1 && lstates(i,j)==4
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(1,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==1 && lstates(i,j)==5
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(1,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==2 && lstates(i,j)==3
            ind=ind+1;
        end
    end
end
st_tr_pr(2,3)=ind/sum(aux(:)==2);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==2 && lstates(i,j)==4
            ind=ind+1;
        end
    end
end
st_tr_pr(2,4)=ind/sum(aux(:)==2);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==2 && lstates(i,j)==5
            ind=ind+1;
        end
    end
end
st_tr_pr(2,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==3 && lstates(i,j)==4
            ind=ind+1;
        end
    end
end
st_tr_pr(3,4)=ind/sum(aux(:)==3);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==3 && lstates(i,j)==5
            ind=ind+1;
        end
    end
end
st_tr_pr(3,5)=ind/sum(aux(:)==3);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==4 && lstates(i,j)==5
            ind=ind+1;
        end
    end
end
st_tr_pr(4,5)=ind/sum(aux(:)==4);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==5 && lstates(i,j)==4
            ind=ind+1;
        end
    end
end
st_tr_pr(5,4)=ind/sum(aux(:)==5);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==5 && lstates(i,j)==3
            ind=ind+1;
        end
    end
end
st_tr_pr(5,3)=ind/sum(aux(:)==5);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==5 && lstates(i,j)==2
            ind=ind+1;
        end
    end
end
st_tr_pr(5,2)=ind/sum(aux(:)==5);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==5 && lstates(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(5,1)=ind/sum(aux(:)==5);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==4 && lstates(i,j)==3
            ind=ind+1;
        end
    end
end
st_tr_pr(4,3)=ind/sum(aux(:)==4);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==4 && lstates(i,j)==2
            ind=ind+1;
        end
    end
end
st_tr_pr(4,2)=ind/sum(aux(:)==4);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==4 && lstates(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(4,1)=ind/sum(aux(:)==4);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==3 && lstates(i,j)==2
            ind=ind+1;
        end
    end
end
st_tr_pr(3,2)=ind/sum(aux(:)==3);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==3 && lstates(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(3,1)=ind/sum(aux(:)==3);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==2 && lstates(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(2,1)=ind/sum(aux(:)==2);

st_tr_pr_one=st_tr_pr

%
disp('Labour Market State Transitions - Mob. Type1')
['FT: ' num2str(100*st_tr_pr(1,1),'%4.0f') ' & ' num2str(100*st_tr_pr(1,2),'%4.0f') ' & ' num2str(100*st_tr_pr(1,3),'%4.0f') ' & ' num2str(100*st_tr_pr(1,4),'%4.0f') ' & ' num2str(100*st_tr_pr(1,5),'%4.0f')]
['PT: ' num2str(100*st_tr_pr(2,1),'%4.0f') ' & ' num2str(100*st_tr_pr(2,2),'%4.0f') ' & ' num2str(100*st_tr_pr(2,3),'%4.0f') ' & ' num2str(100*st_tr_pr(2,4),'%4.0f') ' & ' num2str(100*st_tr_pr(2,5),'%4.0f')]
['MJ: ' num2str(100*st_tr_pr(3,1),'%4.0f') ' & ' num2str(100*st_tr_pr(3,2),'%4.0f') ' & ' num2str(100*st_tr_pr(3,3),'%4.0f') ' & ' num2str(100*st_tr_pr(3,4),'%4.0f') ' & ' num2str(100*st_tr_pr(3,5),'%4.0f')]
['NE: ' num2str(100*st_tr_pr(4,1),'%4.0f') ' & ' num2str(100*st_tr_pr(4,2),'%4.0f') ' & ' num2str(100*st_tr_pr(4,3),'%4.0f') ' & ' num2str(100*st_tr_pr(4,4),'%4.0f') ' & ' num2str(100*st_tr_pr(4,5),'%4.0f')]
['CJ: ' num2str(100*st_tr_pr(5,1),'%4.0f') ' & ' num2str(100*st_tr_pr(5,2),'%4.0f') ' & ' num2str(100*st_tr_pr(5,3),'%4.0f') ' & ' num2str(100*st_tr_pr(5,4),'%4.0f') ' & ' num2str(100*st_tr_pr(5,5),'%4.0f')]
%% State Transition Observed Mobility Type 2
disp('State Transition Observed Mobility Type 2')
st_tr_pr=zeros(5,5);

states=data_female.empstate;% I think this should be the model and not the data
lstates=data_female.lempstate;
states(fract_mcl==1,:)=[];
lstates(fract_mcl==1,:)=[];

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==1 && lstates(i,j)==1
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(1,1)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==2 && lstates(i,j)==2
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(2,2)=ind/sum(aux(:)==2);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==3 && lstates(i,j)==3
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(3,3)=ind/sum(aux(:)==3);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==4 && lstates(i,j)==4
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(4,4)=ind/sum(aux(:)==4);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==5 && lstates(i,j)==5
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(5,5)=ind/sum(aux(:)==5);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==1 && lstates(i,j)==2
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(1,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==1 && lstates(i,j)==3
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(1,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==1 && lstates(i,j)==4
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(1,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==1 && lstates(i,j)==5
            ind=ind+1;
        end
    end
end
aux=states(:,2:end);
st_tr_pr(1,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==2 && lstates(i,j)==3
            ind=ind+1;
        end
    end
end
st_tr_pr(2,3)=ind/sum(aux(:)==2);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==2 && lstates(i,j)==4
            ind=ind+1;
        end
    end
end
st_tr_pr(2,4)=ind/sum(aux(:)==2);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==2 && lstates(i,j)==5
            ind=ind+1;
        end
    end
end
st_tr_pr(2,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==3 && lstates(i,j)==4
            ind=ind+1;
        end
    end
end
st_tr_pr(3,4)=ind/sum(aux(:)==3);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==3 && lstates(i,j)==5
            ind=ind+1;
        end
    end
end
st_tr_pr(3,5)=ind/sum(aux(:)==3);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==4 && lstates(i,j)==5
            ind=ind+1;
        end
    end
end
st_tr_pr(4,5)=ind/sum(aux(:)==4);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==5 && lstates(i,j)==4
            ind=ind+1;
        end
    end
end
st_tr_pr(5,4)=ind/sum(aux(:)==5);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==5 && lstates(i,j)==3
            ind=ind+1;
        end
    end
end
st_tr_pr(5,3)=ind/sum(aux(:)==5);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==5 && lstates(i,j)==2
            ind=ind+1;
        end
    end
end
st_tr_pr(5,2)=ind/sum(aux(:)==5);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==5 && lstates(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(5,1)=ind/sum(aux(:)==5);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==4 && lstates(i,j)==3
            ind=ind+1;
        end
    end
end
st_tr_pr(4,3)=ind/sum(aux(:)==4);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==4 && lstates(i,j)==2
            ind=ind+1;
        end
    end
end
st_tr_pr(4,2)=ind/sum(aux(:)==4);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==4 && lstates(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(4,1)=ind/sum(aux(:)==4);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==3 && lstates(i,j)==2
            ind=ind+1;
        end
    end
end
st_tr_pr(3,2)=ind/sum(aux(:)==3);
ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==3 && lstates(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(3,1)=ind/sum(aux(:)==3);

ind=0;
for i=1:length(states)
    for j=1:size(states,2)
        if states(i,j)==2 && lstates(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(2,1)=ind/sum(aux(:)==2);

st_tr_pr_two=st_tr_pr

%
disp('Labour Market State Transitions - Mob. Type2')
['FT: ' num2str(100*st_tr_pr(1,1),'%4.0f') ' & ' num2str(100*st_tr_pr(1,2),'%4.0f') ' & ' num2str(100*st_tr_pr(1,3),'%4.0f') ' & ' num2str(100*st_tr_pr(1,4),'%4.0f') ' & ' num2str(100*st_tr_pr(1,5),'%4.0f')]
['PT: ' num2str(100*st_tr_pr(2,1),'%4.0f') ' & ' num2str(100*st_tr_pr(2,2),'%4.0f') ' & ' num2str(100*st_tr_pr(2,3),'%4.0f') ' & ' num2str(100*st_tr_pr(2,4),'%4.0f') ' & ' num2str(100*st_tr_pr(2,5),'%4.0f')]
['MJ: ' num2str(100*st_tr_pr(3,1),'%4.0f') ' & ' num2str(100*st_tr_pr(3,2),'%4.0f') ' & ' num2str(100*st_tr_pr(3,3),'%4.0f') ' & ' num2str(100*st_tr_pr(3,4),'%4.0f') ' & ' num2str(100*st_tr_pr(3,5),'%4.0f')]
['NE: ' num2str(100*st_tr_pr(4,1),'%4.0f') ' & ' num2str(100*st_tr_pr(4,2),'%4.0f') ' & ' num2str(100*st_tr_pr(4,3),'%4.0f') ' & ' num2str(100*st_tr_pr(4,4),'%4.0f') ' & ' num2str(100*st_tr_pr(4,5),'%4.0f')]
['CJ: ' num2str(100*st_tr_pr(5,1),'%4.0f') ' & ' num2str(100*st_tr_pr(5,2),'%4.0f') ' & ' num2str(100*st_tr_pr(5,3),'%4.0f') ' & ' num2str(100*st_tr_pr(5,4),'%4.0f') ' & ' num2str(100*st_tr_pr(5,5),'%4.0f')]
%% Composition of Heterogeneity
disp('Composition of Heterogeneity')
% wage classes
rand_samp_wage=rand(length(data_female.year_birth),1);
%
prob_wcl=zeros(length(data_female.year_birth),1);
fract_wcl=zeros(length(data_female.year_birth),1);
for i=1:length(data_female.year_birth)
    prob_wcl(i,1)=1./(1+exp(par0(86,1)+par0(87,1)*data_female.year_birth(i,1)+par0(88,1)*data_female.ED2(i,1)+par0(89,1)*data_female.ED3(i,1)));
    if prob_wcl(i,1)>rand_samp_wage(i,1)
        fract_wcl(i,1)=1;
    elseif prob_wcl(i,1)<rand_samp_wage(i,1)
        fract_wcl(i,1)=2;
    end
end
disp('a) Mobility')
%mobility
disp('a) Mobility Type 1')
% one
exp=data_female.lmexp;
edu=data_female.educ;
exp(fract_mcl==2,:)=[];
edu(fract_mcl==2,:)=[];
fract_wcl(fract_mcl==2,:)=[];

mean_exp=nanmean(exp,2);
mean_exp_one=nanmean(mean_exp);

edu_second=edu==2;
mean_edu_second_one=nanmean(edu_second);

edu_third=edu==3;
mean_edu_third_one=nanmean(edu_third);

edu_first=1-edu_second-edu_third;
mean_edu_first_one=mean(edu_first);

wcl_one=fract_wcl==1;
mean_wcl_one_one=nanmean(wcl_one);

wcl_two=fract_wcl==2;
mean_wcl_one_two=nanmean(wcl_two);

%
disp('Comp. of Unobserved Heterogeneity - Mob. Type 1')
['k^s=1: ' num2str(100*mean_edu_third_one,'%4.0f') ' & ' num2str(100*mean_edu_second_one,'%4.0f') ' & ' num2str(100*mean_edu_first_one,'%4.0f') ' & ' num2str(mean_exp_one,'%4.0f') ' & ' num2str(100*mean_wcl_one_one,'%4.0f') ' & ' num2str(100*mean_wcl_one_two,'%4.0f')]


clear exp
% wage classes
prob_wcl=zeros(length(data_female.year_birth),1);
fract_wcl=zeros(length(data_female.year_birth),1);
for i=1:length(data_female.year_birth)
    prob_wcl(i,1)=1./(1+exp(par0(86,1)+par0(87,1)*data_female.year_birth(i,1)+par0(88,1)*data_female.ED2(i,1)+par0(89,1)*data_female.ED3(i,1)));
    if prob_wcl(i,1)>rand_samp_wage(i,1)
        fract_wcl(i,1)=1;
    elseif prob_wcl(i,1)<rand_samp_wage(i,1)
        fract_wcl(i,1)=2;
    end
end

disp('a) Mobility Type 2')
% two
exp=data_female.lmexp;
edu=data_female.educ;
exp(fract_mcl==1,:)=[];
edu(fract_mcl==1,:)=[];
fract_wcl(fract_mcl==1,:)=[];

mean_exp=nanmean(exp,2);
mean_exp_two=nanmean(mean_exp);

edu_second=edu==2;
mean_edu_second_two=nanmean(edu_second);

edu_third=edu==3;
mean_edu_third_two=nanmean(edu_third);

edu_first=1-edu_second-edu_third;
mean_edu_first_two=mean(edu_first);

wcl_one=fract_wcl==1;
mean_wcl_two_one=nanmean(wcl_one);

wcl_two=fract_wcl==2;
mean_wcl_two_two=nanmean(wcl_two);

disp('Comp. of Unobserved Heterogeneity - Mob. Type 2')
['k^s=2: ' num2str(100*mean_edu_third_two,'%4.0f') ' & ' num2str(100*mean_edu_second_two,'%4.0f') ' & ' num2str(100*mean_edu_first_two,'%4.0f') ' & ' num2str(mean_exp_two,'%4.0f') ' & ' num2str(100*mean_wcl_two_one,'%4.0f') ' & ' num2str(100*mean_wcl_two_two,'%4.0f')]


disp('b) Wage')
clear exp
% wage classes
prob_wcl=zeros(length(data_female.year_birth),1);
fract_wcl=zeros(length(data_female.year_birth),1);
for i=1:length(data_female.year_birth)
    prob_wcl(i,1)=1./(1+exp(par0(86,1)+par0(87,1)*data_female.year_birth(i,1)+par0(88,1)*data_female.ED2(i,1)+par0(89,1)*data_female.ED3(i,1)));
    if prob_wcl(i,1)>rand_samp_wage(i,1)
        fract_wcl(i,1)=1;
    elseif prob_wcl(i,1)<rand_samp_wage(i,1)
        fract_wcl(i,1)=2;
    end
end
%wage
clear exp
% mobility classes
prob_mcl=zeros(length(data_female.year_birth),1);
fract_mcl=zeros(length(data_female.year_birth),1);
for i=1:length(data_female.year_birth)
    prob_mcl(i,1)=1./(1+exp(par0(56,1)+par0(57,1)*data_female.year_birth(i,1)+par0(58,1)*data_female.ED2(i,1)+par0(59,1)*data_female.ED3(i,1)));
    if prob_mcl(i,1)>rand_samp_mob(i,1)
        fract_mcl(i,1)=1;
    elseif prob_mcl(i,1)<rand_samp_mob(i,1)
        fract_mcl(i,1)=2;
    end
end
disp('b) Wage Type 1')
% one
exp=data_female.lmexp;
edu=data_female.educ;
exp(fract_wcl==2,:)=[];
edu(fract_wcl==2,:)=[];
fract_mcl(fract_wcl==2,:)=[];

mean_exp=nanmean(exp,2);
mean_exp_one=nanmean(mean_exp);

edu_second=edu==2;
mean_edu_second_one=nanmean(edu_second);

edu_third=edu==3;
mean_edu_third_one=nanmean(edu_third);

edu_first=1-edu_second-edu_third;
mean_edu_first_one=mean(edu_first);

mcl_one=fract_mcl==1;
mean_mcl_one_one=nanmean(mcl_one);

mcl_two=fract_mcl==2;
mean_mcl_one_two=nanmean(mcl_two);

disp('Comp. of Unobserved Heterogeneity - Wage Type 1')
['k^w=1: ' num2str(100*mean_edu_third_one,'%4.0f') ' & ' num2str(100*mean_edu_second_one,'%4.0f') ' & ' num2str(100*mean_edu_first_one,'%4.0f') ' & ' num2str(mean_exp_one,'%4.0f') ' & ' num2str(100*mean_wcl_one_one,'%4.0f') ' & ' num2str(100*mean_wcl_one_two,'%4.0f')]


clear exp
% mobility classes
prob_mcl=zeros(length(data_female.year_birth),1);
fract_mcl=zeros(length(data_female.year_birth),1);
for i=1:length(data_female.year_birth)
    prob_mcl(i,1)=1./(1+exp(par0(56,1)+par0(57,1)*data_female.year_birth(i,1)+par0(58,1)*data_female.ED2(i,1)+par0(59,1)*data_female.ED3(i,1)));
    if prob_mcl(i,1)>rand_samp_mob(i,1)
        fract_mcl(i,1)=1;
    elseif prob_mcl(i,1)<rand_samp_mob(i,1)
        fract_mcl(i,1)=2;
    end
end
disp('b) Wage Type 2')
% two
exp=data_female.lmexp;
edu=data_female.educ;
exp(fract_wcl==1,:)=[];
edu(fract_wcl==1,:)=[];
fract_mcl(fract_wcl==1,:)=[];

mean_exp=nanmean(exp,2);
mean_exp_two=nanmean(mean_exp);

edu_second=edu==2;
mean_edu_second_two=nanmean(edu_second);

edu_third=edu==3;
mean_edu_third_two=nanmean(edu_third);

edu_first=1-edu_second-edu_third;
mean_edu_first_two=mean(edu_first);

mcl_one=fract_mcl==1;
mean_mcl_two_one=nanmean(mcl_one);

mcl_two=fract_mcl==2;
mean_mcl_two_two=nanmean(mcl_two);

disp('Comp. of Unobserved Heterogeneity - Wage Type 2')
['k^w=2: ' num2str(100*mean_edu_third_two,'%4.0f') ' & ' num2str(100*mean_edu_second_two,'%4.0f') ' & ' num2str(100*mean_edu_first_two,'%4.0f') ' & ' num2str(mean_exp_two,'%4.0f') ' & ' num2str(100*mean_wcl_two_one,'%4.0f') ' & ' num2str(100*mean_wcl_two_two,'%4.0f')]


clear exp
%%
disp('Probabilities of Wage Classes')
% wage classes
prob_wcl=zeros(length(data_female.year_birth),1);
fract_wcl=zeros(length(data_female.year_birth),1);
for i=1:length(data_female.year_birth)
    prob_wcl(i,1)=1./(1+exp(par0(86,1)+par0(87,1)*data_female.year_birth(i,1)+par0(88,1)*data_female.ED2(i,1)+par0(89,1)*data_female.ED3(i,1)));
    if prob_wcl(i,1)>rand_samp_wage(i,1)
        fract_wcl(i,1)=1;
    elseif prob_wcl(i,1)<rand_samp_wage(i,1)
        fract_wcl(i,1)=2;
    end
end
fract_wcl_one_samp=sum(fract_wcl==1)/length(fract_wcl)
fract_wcl_two_samp=sum(fract_wcl==2)/length(fract_wcl)
disp('Wage Classes')
['k^w=2: ' num2str(100*fract_wcl_one_samp,'%4.0f') ' & ' num2str(100*fract_wcl_two_samp,'%4.0f')]

%%
disp('Mean and Bottom/Top Income by Wage Class')
%Mean and Bottom/Top Income by Wage Class

% keep wcl==1

panel=fract_wcl==1;

wages=data_female.log_ave_wage;
exp=data_female.lmexp;
wages(panel==1,:)=[];
exp(panel==1,:)=[];
exp=round(exp,1);
max_exp=max(exp(:));
min_exp=min(exp(:));


col=min_exp:0.1:max_exp;
col=round(col,1);
exper=nan(length(exp),length(col'));
wages_panel=nan(length(exp),length(col'));

for i=1:length(exp)
    exper(i,:)=col;
    for j=1:length(col')
        if ismember(exper(i,j),exp(i,:))==0
            exper(i,j)=NaN;
        end
    end
end

for i=1:length(wages_panel)
    q=1;
    for j=1:length(col')
        if isnan(exper(i,j))==0
            wages_panel(i,j)=wages(i,q);
            q=q+1;
        end            
    end
end

ave_wages_panel_wcl_one=nanmean(wages_panel);
prc_85_one=prctile(wages_panel,85);
prc_15_one=prctile(wages_panel,15);

% keep wcl==2

panel=fract_wcl==2;

wages=data_female.log_ave_wage;
exp=data_female.lmexp;
wages(panel==1,:)=[];
exp(panel==1,:)=[];
exp=round(exp,1);
max_exp=max(exp(:));
min_exp=min(exp(:));


col=min_exp:0.1:max_exp;
col=round(col,1);
exper=nan(length(exp),length(col'));
wages_panel=nan(length(exp),length(col'));

for i=1:length(exp)
    exper(i,:)=col;
    for j=1:length(col')
        if ismember(exper(i,j),exp(i,:))==0
            exper(i,j)=NaN;
        end
    end
end

for i=1:length(wages_panel)
    q=1;
    for j=1:length(col')
        if isnan(exper(i,j))==0
            wages_panel(i,j)=wages(i,q);
            q=q+1;
        end            
    end
end

ave_wages_panel_wcl_two=nanmean(wages_panel);
prc_85_two=prctile(wages_panel,85);
prc_15_two=prctile(wages_panel,15);

% average income by wage class

figure
plot(min_exp*10:0.1*10:max_exp*10,prc_85_one,'LineWidth',2.5,'Color','black')
hold on
plot(min_exp*10:0.1*10:max_exp*10,prc_85_two,'LineWidth',2.5,'Color','black','LineStyle','--')
hold on
plot(min_exp*10:0.1*10:max_exp*10,ave_wages_panel_wcl_one,'LineWidth',2.5,'Color','black')
hold on
plot(min_exp*10:0.1*10:max_exp*10,ave_wages_panel_wcl_two,'LineWidth',2.5,'Color','black','LineStyle','--')
hold on
plot(min_exp*10:0.1*10:max_exp*10,prc_15_one,'LineWidth',2.5,'Color','black')
hold on
plot(min_exp*10:0.1*10:max_exp*10,prc_15_two,'LineWidth',2.5,'Color','black','LineStyle','--')
hold off
grid on
axis tight
legend('k^w = 1','k^w = 2','Location','Northwest')
xlabel('Experience (Months)','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
y=ylabel('Log ave wage','fontsize',24,'FontWeight','bold');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([1 6])
print('pred_wage_class_incomeprofiles_females19992002','-dpng')

disp('Quintiles - Income Mobility')
%Quintiles - Income Mobility

disp('Quintiles - Income Mobility, Whole Sample')
%whole sample
wages=data_female.log_ave_wage;
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

disp('Quintiles - Income Mobility, Sample')
['D1: ' num2str(matrix(1,1),'%4.0f') ' & ' num2str(matrix(1,2),'%4.0f') ' & ' num2str(matrix(1,3),'%4.0f') ' & ' num2str(matrix(1,4),'%4.0f') ' & ' num2str(matrix(1,5),'%4.0f')]
['D2: ' num2str(matrix(2,1),'%4.0f') ' & ' num2str(matrix(2,2),'%4.0f') ' & ' num2str(matrix(2,3),'%4.0f') ' & ' num2str(matrix(2,4),'%4.0f') ' & ' num2str(matrix(2,5),'%4.0f')]
['D3: ' num2str(matrix(3,1),'%4.0f') ' & ' num2str(matrix(3,2),'%4.0f') ' & ' num2str(matrix(3,3),'%4.0f') ' & ' num2str(matrix(3,4),'%4.0f') ' & ' num2str(matrix(3,5),'%4.0f')]
['D4: ' num2str(matrix(4,1),'%4.0f') ' & ' num2str(matrix(4,2),'%4.0f') ' & ' num2str(matrix(4,3),'%4.0f') ' & ' num2str(matrix(4,4),'%4.0f') ' & ' num2str(matrix(4,5),'%4.0f')]
['D5: ' num2str(matrix(5,1),'%4.0f') ' & ' num2str(matrix(5,2),'%4.0f') ' & ' num2str(matrix(5,3),'%4.0f') ' & ' num2str(matrix(5,4),'%4.0f') ' & ' num2str(matrix(5,5),'%4.0f')]


disp('Quintiles - Income Mobility, Wage Class 1')
%wage class 1

panel=fract_wcl==1;

wages=data_female.log_ave_wage;
wages(panel==1,:)=[];

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

disp('Quintiles - Income Mobility, Wage Class 1')
['D1: ' num2str(matrix(1,1),'%4.0f') ' & ' num2str(matrix(1,2),'%4.0f') ' & ' num2str(matrix(1,3),'%4.0f') ' & ' num2str(matrix(1,4),'%4.0f') ' & ' num2str(matrix(1,5),'%4.0f')]
['D2: ' num2str(matrix(2,1),'%4.0f') ' & ' num2str(matrix(2,2),'%4.0f') ' & ' num2str(matrix(2,3),'%4.0f') ' & ' num2str(matrix(2,4),'%4.0f') ' & ' num2str(matrix(2,5),'%4.0f')]
['D3: ' num2str(matrix(3,1),'%4.0f') ' & ' num2str(matrix(3,2),'%4.0f') ' & ' num2str(matrix(3,3),'%4.0f') ' & ' num2str(matrix(3,4),'%4.0f') ' & ' num2str(matrix(3,5),'%4.0f')]
['D4: ' num2str(matrix(4,1),'%4.0f') ' & ' num2str(matrix(4,2),'%4.0f') ' & ' num2str(matrix(4,3),'%4.0f') ' & ' num2str(matrix(4,4),'%4.0f') ' & ' num2str(matrix(4,5),'%4.0f')]
['D5: ' num2str(matrix(5,1),'%4.0f') ' & ' num2str(matrix(5,2),'%4.0f') ' & ' num2str(matrix(5,3),'%4.0f') ' & ' num2str(matrix(5,4),'%4.0f') ' & ' num2str(matrix(5,5),'%4.0f')]


disp('Quintiles - Income Mobility, Wage Class 2')
%wage class 2

panel=fract_wcl==2;

wages=data_female.log_ave_wage;
wages(panel==1,:)=[];

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

disp('Quintiles - Income Mobility, Wage Class 2')
['D1: ' num2str(matrix(1,1),'%4.0f') ' & ' num2str(matrix(1,2),'%4.0f') ' & ' num2str(matrix(1,3),'%4.0f') ' & ' num2str(matrix(1,4),'%4.0f') ' & ' num2str(matrix(1,5),'%4.0f')]
['D2: ' num2str(matrix(2,1),'%4.0f') ' & ' num2str(matrix(2,2),'%4.0f') ' & ' num2str(matrix(2,3),'%4.0f') ' & ' num2str(matrix(2,4),'%4.0f') ' & ' num2str(matrix(2,5),'%4.0f')]
['D3: ' num2str(matrix(3,1),'%4.0f') ' & ' num2str(matrix(3,2),'%4.0f') ' & ' num2str(matrix(3,3),'%4.0f') ' & ' num2str(matrix(3,4),'%4.0f') ' & ' num2str(matrix(3,5),'%4.0f')]
['D4: ' num2str(matrix(4,1),'%4.0f') ' & ' num2str(matrix(4,2),'%4.0f') ' & ' num2str(matrix(4,3),'%4.0f') ' & ' num2str(matrix(4,4),'%4.0f') ' & ' num2str(matrix(4,5),'%4.0f')]
['D5: ' num2str(matrix(5,1),'%4.0f') ' & ' num2str(matrix(5,2),'%4.0f') ' & ' num2str(matrix(5,3),'%4.0f') ' & ' num2str(matrix(5,4),'%4.0f') ' & ' num2str(matrix(5,5),'%4.0f')]


%%
disp('First order autocovariance')
% First order autocovariance 

% keep wcl==1

panel=fract_wcl==1;

wages=data_female.log_ave_wage;
exp=data_female.lmexp;
wages(panel==1,:)=[];
exp(panel==1,:)=[];
exp=round(exp,1);
max_exp=max(exp(:));
min_exp=min(exp(:));


col=min_exp:0.1:max_exp;
col=round(col,1);
exper=nan(length(exp),length(col'));
wages_panel=nan(length(exp),length(col'));

for i=1:length(exp)
    exper(i,:)=col;
    for j=1:length(col')
        if ismember(exper(i,j),exp(i,:))==0
            exper(i,j)=NaN;
        end
    end
end

for i=1:length(wages_panel)
    q=1;
    for j=1:length(col')
        if isnan(exper(i,j))==0
            wages_panel(i,j)=wages(i,q);
            q=q+1;
        end            
    end
end

var_one=nanvar(wages_panel);
correl_one=zeros(1,size(wages_panel,2)-1);
covar_one=zeros(1,size(wages_panel,2)-1);
for i=2:size(wages_panel,2)
    X=[wages_panel(:,i) wages_panel(:,i-1)];
    aux=nancov(X);
    covar_one(1,i)=aux(1,2);
    correl_one(1,i)=covar_one(1,i)/var_one(1,i);
end

% keep wcl==2

panel=fract_wcl==2;

wages=data_female.log_ave_wage;
exp=data_female.lmexp;
wages(panel==1,:)=[];
exp(panel==1,:)=[];
exp=round(exp,1);
max_exp=max(exp(:));
min_exp=min(exp(:));


col=min_exp:0.1:max_exp;
col=round(col,1);
exper=nan(length(exp),length(col'));
wages_panel=nan(length(exp),length(col'));

for i=1:length(exp)
    exper(i,:)=col;
    for j=1:length(col')
        if ismember(exper(i,j),exp(i,:))==0
            exper(i,j)=NaN;
        end
    end
end

for i=1:length(wages_panel)
    q=1;
    for j=1:length(col')
        if isnan(exper(i,j))==0
            wages_panel(i,j)=wages(i,q);
            q=q+1;
        end            
    end
end

var_two=nanvar(wages_panel);
correl_two=zeros(1,size(wages_panel,2)-1);
covar_two=zeros(1,size(wages_panel,2)-1);
for i=2:size(wages_panel,2)
    X=[wages_panel(:,i) wages_panel(:,i-1)];
    aux=nancov(X);
    covar_two(1,i)=aux(1,2);
    correl_two(1,i)=covar_two(1,i)/var_two(1,i);
end

% average income by wage class

min_exp=min_exp+0.1;
figure
plot(min_exp*10:0.1*10:max_exp*10,correl_one(1,2:end),'LineWidth',2.5,'Color','black')
hold on
plot(min_exp*10:0.1*10:max_exp*10,correl_two(1,2:end),'LineWidth',2.5,'Color','black','LineStyle','--')
hold off
grid on
axis tight
legend('k^w = 1','k^w = 2','Location','Southeast')
xlabel('Experience (Months)','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
y=ylabel('Auto-correlation','fontsize',24,'FontWeight','bold');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([0.6 1])
print('pred_wage_class_acvprofiles_females19992002','-dpng')

%
display('Finished')