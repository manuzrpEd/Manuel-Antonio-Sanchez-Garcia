cd '\2005-2009'
clc
clear
close all
clear mex
set(0,'DefaultFigureWindowStyle','docked')
disp('Males, 2005-2009')
%
load('phat_male.mat','phat_male')
load('data_male.mat','data_male')

%% Parameter Values
disp('Parameter Values')
% col=73;
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
par0(24,1)=phat_male(24,1);%mcl2
% %MJ
par0(25,1)=phat_male(25,1);
par0(26,1)=phat_male(26,1);
par0(27,1)=phat_male(27,1);
par0(28,1)=phat_male(28,1);
par0(29,1)=phat_male(29,1);%PT
par0(30,1)=phat_male(30,1);%MJ
par0(31,1)=phat_male(31,1);%NE
par0(32,1)=phat_male(32,1);%CJ
par0(33,1)=phat_male(33,1);%mcl2
% %NE
par0(34,1)=phat_male(34,1);
par0(35,1)=phat_male(35,1);
par0(36,1)=phat_male(36,1);
par0(37,1)=phat_male(37,1);
par0(38,1)=phat_male(38,1);%PT
par0(39,1)=phat_male(39,1);%MJ
par0(40,1)=phat_male(40,1);%NE
par0(41,1)=phat_male(41,1);%CJ
par0(42,1)=phat_male(42,1);%mcl2
% %CJ
par0(43,1)=phat_male(43,1);
par0(44,1)=phat_male(44,1);
par0(45,1)=phat_male(45,1);
par0(46,1)=phat_male(46,1);
par0(47,1)=phat_male(47,1);%PT
par0(48,1)=phat_male(48,1);%MJ
par0(49,1)=phat_male(49,1);%NE
par0(50,1)=phat_male(50,1);%CJ
par0(51,1)=phat_male(51,1);%mcl2
% %mcl
par0(52,1)=phat_male(52,1);%cons
par0(53,1)=phat_male(53,1);%year_birth
par0(54,1)=phat_male(54,1);%ED2
par0(55,1)=phat_male(55,1);%ED3

% %mu
par0(56,1)=phat_male(56,1);%cons
par0(57,1)=phat_male(57,1);%ED2
par0(58,1)=phat_male(58,1);%ED3
par0(59,1)=phat_male(59,1);%lmexp
par0(60,1)=phat_male(60,1);%PT
par0(61,1)=phat_male(61,1);%MJ
par0(62,1)=phat_male(62,1);%NE
par0(63,1)=phat_male(63,1);%CJ
par0(64,1)=phat_male(64,1);%wcl
% %sigma
par0(65,1)=phat_male(65,1);%cons
par0(66,1)=phat_male(66,1);%lmexp
par0(67,1)=phat_male(67,1);%PT
par0(68,1)=phat_male(68,1);%MJ
par0(69,1)=phat_male(69,1);%NE
par0(70,1)=phat_male(70,1);%CJ
par0(71,1)=phat_male(71,1);%wcl
% %tau1
par0(72:98,1)=phat_male(72:98,1);
% %wcl
par0(99,1)=phat_male(99,1);%cons
par0(100,1)=phat_male(100,1);%year_birth
par0(101,1)=phat_male(101,1);%ED2
par0(102,1)=phat_male(102,1);%ED3
%
prob_ini_PT=par0(1:5)
prob_ini_MJ=par0(6:10)
prob_ini_CJ=par0(11:15)
prob_PT=par0(16:24)
prob_MJ=par0(25:33)
prob_NE=par0(34:42)
prob_CJ=par0(43:51)
mu=par0(56:64)
sigma=par0(65:71)
acv1=par0(72:98);
%need to re-estimate and simplify
acv1(1:3)
FT_to_PT=acv1(8)
FT_to_MJ=acv1(13)
FT_to_CJ=acv1(23)
%
PT_to_FT=acv1(4)
PT_to_MJ=acv1(14)
PT_to_CJ=acv1(24)
%
MJ_to_FT=acv1(5)
MJ_to_PT=acv1(10)
MJ_to_CJ=acv1(25)
%
CJ_to_FT=acv1(7)
CJ_to_PT=acv1(12)
CJ_to_MJ=acv1(17)
mcl=par0(52:55)
wcl=par0(99:102)
%
%% Probabilities of Mobility Classes
disp('Probabilities of Mobility Classes')
rand('seed',123456)
rand_samp_mob=rand(length(data_male.year_birth),1);
rand_samp_wage=rand(length(data_male.year_birth),1);
%sample
prob_mcl_1=zeros(length(data_male.year_birth),1);
fract_mcl=zeros(length(data_male.year_birth),1);
for i=1:length(data_male.year_birth)
    prob_mcl_1(i,1)=1./(1+exp(par0(52,1)+par0(53,1)*data_male.year_birth(i,1)+par0(54,1)*data_male.ED2(i,1)++par0(55,1)*data_male.ED3(i,1)));
    if prob_mcl_1(i,1)>rand_samp_mob(i,1)
        fract_mcl(i,1)=1;
    elseif prob_mcl_1(i,1)<rand_samp_mob(i,1)
        fract_mcl(i,1)=2;
    end
end
fract_mcl_one_samp=sum(fract_mcl==1)/length(fract_mcl)
fract_mcl_two_samp=sum(fract_mcl==2)/length(fract_mcl)
% one sample:
samp_one=data_male.empstate;
samp_one(fract_mcl==2,:)=[];
%FT
aux_FT=data_male.FT;
aux_FT(fract_mcl==2,:)=[];
fract_mcl_one_FT=sum(aux_FT(:)==1)/sum(isnan(samp_one(:))~=1)
%PT
aux_PT=data_male.PT;
aux_PT(fract_mcl==2,:)=[];
fract_mcl_one_PT=sum(aux_PT(:)==1)/sum(isnan(samp_one(:))~=1)
%MJ
aux_MJ=data_male.MJ;
aux_MJ(fract_mcl==2,:)=[];
fract_mcl_one_MJ=sum(aux_MJ(:)==1)/sum(isnan(samp_one(:))~=1)
%NE
aux_NE=data_male.NE;
aux_NE(fract_mcl==2,:)=[];
fract_mcl_one_NE=sum(aux_NE(:)==1)/sum(isnan(samp_one(:))~=1)
%CJ
aux_CJ=data_male.CJ;
aux_CJ(fract_mcl==2,:)=[];
fract_mcl_one_CJ=sum(aux_CJ(:)==1)/sum(isnan(samp_one(:))~=1)
% two sample:
samp_two=data_male.empstate;
samp_two(fract_mcl==1,:)=[];
%FT
aux_FT=data_male.FT;
aux_FT(fract_mcl==1,:)=[];
fract_mcl_two_FT=sum(aux_FT(:)==1)/sum(isnan(samp_two(:))~=1)
%PT
aux_PT=data_male.PT;
aux_PT(fract_mcl==1,:)=[];
fract_mcl_two_PT=sum(aux_PT(:)==1)/sum(isnan(samp_two(:))~=1)
%MJ
aux_MJ=data_male.MJ;
aux_MJ(fract_mcl==1,:)=[];
fract_mcl_two_MJ=sum(aux_MJ(:)==1)/sum(isnan(samp_two(:))~=1)
%NE
aux_NE=data_male.NE;
aux_NE(fract_mcl==1,:)=[];
fract_mcl_two_NE=sum(aux_NE(:)==1)/sum(isnan(samp_two(:))~=1)
%CJ
aux_CJ=data_male.CJ;
aux_CJ(fract_mcl==1,:)=[];
fract_mcl_two_CJ=sum(aux_CJ(:)==1)/sum(isnan(samp_two(:))~=1)

%% Fraction of State Composition:
disp('Fraction of State Composition')
fract_FT=sum(data_male.FT==1)/sum(isnan(data_male.empstate)~=1)
fract_PT=sum(data_male.PT==1)/sum(isnan(data_male.empstate)~=1)
fract_MJ=sum(data_male.MJ==1)/sum(isnan(data_male.empstate)~=1)
fract_NE=sum(data_male.NE==1)/sum(isnan(data_male.empstate)~=1)
fract_CJ=sum(data_male.CJ==1)/sum(isnan(data_male.empstate)~=1)
% FT:
aux_FT=data_male.FT;
samp_one=data_male.empstate==1;
samp_one(fract_mcl==2,:)=[];
samp_two=data_male.empstate==1;
samp_two(fract_mcl==1,:)=[];
fract_mcl_FT_one=sum(samp_one(:)==1)/sum(aux_FT(:)==1)
fract_mcl_FT_two=sum(samp_two(:)==1)/sum(aux_FT(:)==1)
% PT:
aux_PT=data_male.PT;
samp_one=data_male.empstate==2;
samp_one(fract_mcl==2,:)=[];
samp_two=data_male.empstate==2;
samp_two(fract_mcl==1,:)=[];
fract_mcl_PT_one=sum(samp_one(:)==1)/sum(aux_PT(:)==1)
fract_mcl_PT_two=sum(samp_two(:)==1)/sum(aux_PT(:)==1)
% MJ:
aux_MJ=data_male.MJ;
samp_one=data_male.empstate==3;
samp_one(fract_mcl==2,:)=[];
samp_two=data_male.empstate==3;
samp_two(fract_mcl==1,:)=[];
fract_mcl_MJ_one=sum(samp_one(:)==1)/sum(aux_MJ(:)==1)
fract_mcl_MJ_two=sum(samp_two(:)==1)/sum(aux_MJ(:)==1)
% NE:
aux_NE=data_male.NE;
samp_one=data_male.empstate==4;
samp_one(fract_mcl==2,:)=[];
samp_two=data_male.empstate==4;
samp_two(fract_mcl==1,:)=[];
fract_mcl_NE_one=sum(samp_one(:)==1)/sum(aux_NE(:)==1)
fract_mcl_NE_two=sum(samp_two(:)==1)/sum(aux_NE(:)==1)
% CJ:
aux_CJ=data_male.CJ;
samp_one=data_male.empstate==5;
samp_one(fract_mcl==2,:)=[];
samp_two=data_male.empstate==5;
samp_two(fract_mcl==1,:)=[];
fract_mcl_CJ_one=sum(samp_one(:)==1)/sum(aux_CJ(:)==1)
fract_mcl_CJ_two=sum(samp_two(:)==1)/sum(aux_CJ(:)==1)

%% State Transition Data Observed Whole Sample
disp('State Transition Data Observed Whole Sample')
st_tr_pr=zeros(5,5);

ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==1 && data_male.lempstate(i,j)==1
            ind=ind+1;
        end
    end
end
aux=data_male.empstate(:,2:end);
st_tr_pr(1,1)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==2 && data_male.lempstate(i,j)==2
            ind=ind+1;
        end
    end
end
aux=data_male.empstate(:,2:end);
st_tr_pr(2,2)=ind/sum(aux(:)==2);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==3 && data_male.lempstate(i,j)==3
            ind=ind+1;
        end
    end
end
aux=data_male.empstate(:,2:end);
st_tr_pr(3,3)=ind/sum(aux(:)==3);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==4 && data_male.lempstate(i,j)==4
            ind=ind+1;
        end
    end
end
aux=data_male.empstate(:,2:end);
st_tr_pr(4,4)=ind/sum(aux(:)==4);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==5 && data_male.lempstate(i,j)==5
            ind=ind+1;
        end
    end
end
aux=data_male.empstate(:,2:end);
st_tr_pr(5,5)=ind/sum(aux(:)==5);

ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==1 && data_male.lempstate(i,j)==2
            ind=ind+1;
        end
    end
end
aux=data_male.empstate(:,2:end);
st_tr_pr(1,2)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==1 && data_male.lempstate(i,j)==3
            ind=ind+1;
        end
    end
end
aux=data_male.empstate(:,2:end);
st_tr_pr(1,3)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==1 && data_male.lempstate(i,j)==4
            ind=ind+1;
        end
    end
end
aux=data_male.empstate(:,2:end);
st_tr_pr(1,4)=ind/sum(aux(:)==1);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==1 && data_male.lempstate(i,j)==5
            ind=ind+1;
        end
    end
end
aux=data_male.empstate(:,2:end);
st_tr_pr(1,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==2 && data_male.lempstate(i,j)==3
            ind=ind+1;
        end
    end
end
st_tr_pr(2,3)=ind/sum(aux(:)==2);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==2 && data_male.lempstate(i,j)==4
            ind=ind+1;
        end
    end
end
st_tr_pr(2,4)=ind/sum(aux(:)==2);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==2 && data_male.lempstate(i,j)==5
            ind=ind+1;
        end
    end
end
st_tr_pr(2,5)=ind/sum(aux(:)==1);

ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==3 && data_male.lempstate(i,j)==4
            ind=ind+1;
        end
    end
end
st_tr_pr(3,4)=ind/sum(aux(:)==3);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==3 && data_male.lempstate(i,j)==5
            ind=ind+1;
        end
    end
end
st_tr_pr(3,5)=ind/sum(aux(:)==3);

ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==4 && data_male.lempstate(i,j)==5
            ind=ind+1;
        end
    end
end
st_tr_pr(4,5)=ind/sum(aux(:)==4);

ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==5 && data_male.lempstate(i,j)==4
            ind=ind+1;
        end
    end
end
st_tr_pr(5,4)=ind/sum(aux(:)==5);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==5 && data_male.lempstate(i,j)==3
            ind=ind+1;
        end
    end
end
st_tr_pr(5,3)=ind/sum(aux(:)==5);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==5 && data_male.lempstate(i,j)==2
            ind=ind+1;
        end
    end
end
st_tr_pr(5,2)=ind/sum(aux(:)==5);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==5 && data_male.lempstate(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(5,1)=ind/sum(aux(:)==5);

ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==4 && data_male.lempstate(i,j)==3
            ind=ind+1;
        end
    end
end
st_tr_pr(4,3)=ind/sum(aux(:)==4);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==4 && data_male.lempstate(i,j)==2
            ind=ind+1;
        end
    end
end
st_tr_pr(4,2)=ind/sum(aux(:)==4);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==4 && data_male.lempstate(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(4,1)=ind/sum(aux(:)==4);

ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==3 && data_male.lempstate(i,j)==2
            ind=ind+1;
        end
    end
end
st_tr_pr(3,2)=ind/sum(aux(:)==3);
ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==3 && data_male.lempstate(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(3,1)=ind/sum(aux(:)==3);

ind=0;
for i=1:length(data_male.year)
    for j=1:size(data_male.empstate,2)
        if data_male.empstate(i,j)==2 && data_male.lempstate(i,j)==1
            ind=ind+1;
        end
    end
end
st_tr_pr(2,1)=ind/sum(aux(:)==2);

st_tr_pr

%% State Transitions Observed Mobility Type 1
disp('State Transition Observed Mobility Type 1')
st_tr_pr=zeros(5,5);

states=data_male.empstate;
lstates=data_male.lempstate;
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

%% State Transition Observed Mobility Type 2
disp('State Transition Observed Mobility Type 2')
st_tr_pr=zeros(5,5);

states=data_male.empstate;% I think this should be the model and not the data
lstates=data_male.lempstate;
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

%% Composition of Heterogeneity
disp('Composition of Heterogeneity')
% wage classes
rand_samp_wage=rand(length(data_male.year_birth),1);
%
prob_wcl=zeros(length(data_male.year_birth),1);
fract_wcl=zeros(length(data_male.year_birth),1);
for i=1:length(data_male.year_birth)
    prob_wcl(i,1)=1./(1+exp(par0(99,1)+par0(100,1)*data_male.year_birth(i,1)+par0(101,1)*data_male.ED2(i,1)+par0(102,1)*data_male.ED3(i,1)));
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
exp=data_male.lmexp;
edu=data_male.educ;
exp(fract_mcl==2,:)=[];
edu(fract_mcl==2,:)=[];
fract_wcl(fract_mcl==2,:)=[];

mean_exp=nanmean(exp,2);
mean_exp_one=nanmean(mean_exp)

edu_second=edu==2;
mean_edu_second_one=nanmean(edu_second)

edu_third=edu==3;
mean_edu_third_one=nanmean(edu_third)

edu_first=1-edu_second-edu_third;
mean_edu_first_one=mean(edu_first)

wcl_one=fract_wcl==1;
mean_wcl_one_one=nanmean(wcl_one)

wcl_two=fract_wcl==2;
mean_wcl_two_one=nanmean(wcl_two)

clear exp
% wage classes
prob_wcl=zeros(length(data_male.year_birth),1);
fract_wcl=zeros(length(data_male.year_birth),1);
for i=1:length(data_male.year_birth)
    prob_wcl(i,1)=1./(1+exp(par0(99,1)+par0(100,1)*data_male.year_birth(i,1)+par0(101,1)*data_male.ED2(i,1)+par0(102,1)*data_male.ED3(i,1)));
    if prob_wcl(i,1)>rand_samp_wage(i,1)
        fract_wcl(i,1)=1;
    elseif prob_wcl(i,1)<rand_samp_wage(i,1)
        fract_wcl(i,1)=2;
    end
end

disp('a) Mobility Type 2')
% two
exp=data_male.lmexp;
edu=data_male.educ;
exp(fract_mcl==1,:)=[];
edu(fract_mcl==1,:)=[];
fract_wcl(fract_mcl==1,:)=[];

mean_exp=nanmean(exp,2);
mean_exp_two=nanmean(mean_exp)

edu_second=edu==2;
mean_edu_second_two=nanmean(edu_second)

edu_third=edu==3;
mean_edu_third_two=nanmean(edu_third)

edu_first=1-edu_second-edu_third;
mean_edu_first_two=mean(edu_first)

wcl_one=fract_wcl==1;
mean_wcl_one_two=nanmean(wcl_one)

wcl_two=fract_wcl==2;
mean_wcl_two_two=nanmean(wcl_two)

disp('b) Wage')
clear exp
% wage classes
prob_wcl=zeros(length(data_male.year_birth),1);
fract_wcl=zeros(length(data_male.year_birth),1);
for i=1:length(data_male.year_birth)
    prob_wcl(i,1)=1./(1+exp(par0(99,1)+par0(100,1)*data_male.year_birth(i,1)+par0(101,1)*data_male.ED2(i,1)+par0(102,1)*data_male.ED3(i,1)));
    if prob_wcl(i,1)>rand_samp_wage(i,1)
        fract_wcl(i,1)=1;
    elseif prob_wcl(i,1)<rand_samp_wage(i,1)
        fract_wcl(i,1)=2;
    end
end
%wage
clear exp
% mobility classes
prob_mcl=zeros(length(data_male.year_birth),1);
fract_mcl=zeros(length(data_male.year_birth),1);
for i=1:length(data_male.year_birth)
    prob_mcl(i,1)=1./(1+exp(par0(52,1)+par0(53,1)*data_male.year_birth(i,1)+par0(54,1)*data_male.ED2(i,1)+par0(55,1)*data_male.ED3(i,1)));
    if prob_mcl(i,1)>rand_samp_mob(i,1)
        fract_mcl(i,1)=1;
    elseif prob_mcl(i,1)<rand_samp_mob(i,1)
        fract_mcl(i,1)=2;
    end
end
disp('b) Wage Type 1')
% one
exp=data_male.lmexp;
edu=data_male.educ;
exp(fract_wcl==2,:)=[];
edu(fract_wcl==2,:)=[];
fract_mcl(fract_wcl==2,:)=[];

mean_exp=nanmean(exp,2);
mean_exp_one=nanmean(mean_exp)

edu_second=edu==2;
mean_edu_second_one=nanmean(edu_second)

edu_third=edu==3;
mean_edu_third_one=nanmean(edu_third)

edu_first=1-edu_second-edu_third;
mean_edu_first_one=mean(edu_first)

mcl_one=fract_mcl==1;
mean_mcl_one_one=nanmean(mcl_one)

mcl_two=fract_mcl==2;
mean_mcl_two_one=nanmean(mcl_two)

clear exp
% mobility classes
prob_mcl=zeros(length(data_male.year_birth),1);
fract_mcl=zeros(length(data_male.year_birth),1);
for i=1:length(data_male.year_birth)
    prob_mcl(i,1)=1./(1+exp(par0(52,1)+par0(53,1)*data_male.year_birth(i,1)+par0(54,1)*data_male.ED2(i,1)+par0(55,1)*data_male.ED3(i,1)));
    if prob_mcl(i,1)>rand_samp_mob(i,1)
        fract_mcl(i,1)=1;
    elseif prob_mcl(i,1)<rand_samp_mob(i,1)
        fract_mcl(i,1)=2;
    end
end
disp('b) Wage Type 2')
% two
exp=data_male.lmexp;
edu=data_male.educ;
exp(fract_wcl==1,:)=[];
edu(fract_wcl==1,:)=[];
fract_mcl(fract_wcl==1,:)=[];

mean_exp=nanmean(exp,2);
mean_exp_two=nanmean(mean_exp)

edu_second=edu==2;
mean_edu_second_two=nanmean(edu_second)

edu_third=edu==3;
mean_edu_third_two=nanmean(edu_third)

edu_first=1-edu_second-edu_third;
mean_edu_first_two=mean(edu_first)

mcl_one=fract_mcl==1;
mean_mcl_one_two=nanmean(mcl_one)

mcl_two=fract_mcl==2;
mean_mcl_two_two=nanmean(mcl_two)

clear exp
%%
disp('Probabilities of Wage Classes')
% wage classes
prob_wcl=zeros(length(data_male.year_birth),1);
fract_wcl=zeros(length(data_male.year_birth),1);
for i=1:length(data_male.year_birth)
    prob_wcl(i,1)=1./(1+exp(par0(99,1)+par0(100,1)*data_male.year_birth(i,1)+par0(101,1)*data_male.ED2(i,1)+par0(102,1)*data_male.ED3(i,1)));
    if prob_wcl(i,1)>rand_samp_wage(i,1)
        fract_wcl(i,1)=1;
    elseif prob_wcl(i,1)<rand_samp_wage(i,1)
        fract_wcl(i,1)=2;
    end
end
fract_wcl_one_samp=sum(fract_wcl==1)/length(fract_wcl)
fract_wcl_two_samp=sum(fract_wcl==2)/length(fract_wcl)

%%
disp('Mean and Bottom/Top Income by Wage Class')
%Mean and Bottom/Top Income by Wage Class

% keep wcl==1

panel=fract_wcl==1;

wages=data_male.log_ave_wage;
exp=data_male.lmexp;
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

wages=data_male.log_ave_wage;
exp=data_male.lmexp;
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
print('pred_wage_class_incomeprofiles_males20052009','-dpng')

disp('Quintiles - Income Mobility')
%Quintiles - Income Mobility

disp('Quintiles - Income Mobility, Whole Sample')
%whole sample
wages=data_male.log_ave_wage;
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

matrix=matrix.*100

disp('Quintiles - Income Mobility, Wage Class 1')
%wage class 1

panel=fract_wcl==1;

wages=data_male.log_ave_wage;
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

matrix=matrix.*100

disp('Quintiles - Income Mobility, Wage Class 2')
%wage class 2

panel=fract_wcl==2;

wages=data_male.log_ave_wage;
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

matrix=matrix.*100

%%
disp('First order autocovariance')
% First order autocovariance 

% keep wcl==1

panel=fract_wcl==1;

wages=data_male.log_ave_wage;
exp=data_male.lmexp;
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

wages=data_male.log_ave_wage;
exp=data_male.lmexp;
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
print('pred_wage_class_acvprofiles_males20052009','-dpng')

%