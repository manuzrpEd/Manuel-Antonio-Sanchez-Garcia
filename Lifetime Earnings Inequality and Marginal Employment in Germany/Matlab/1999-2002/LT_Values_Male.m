cd 'C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Matlab\MonthlyIncome\1999-2002'
clc
clear
close all
clear mex
set(0,'DefaultFigureWindowStyle','docked')
disp('LT Values, Males, 1999-2002')
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
% %iniNE
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
par0(23,1)=phat_male(23,1);%mcl2
% %MJ
par0(24,1)=phat_male(24,1);
par0(25,1)=phat_male(25,1);
par0(26,1)=phat_male(26,1);
par0(27,1)=phat_male(27,1);
par0(28,1)=phat_male(28,1);%PT
par0(29,1)=phat_male(29,1);%MJ
par0(30,1)=phat_male(30,1);%NE
par0(31,1)=phat_male(31,1);%mcl2
% %NE
par0(32,1)=phat_male(32,1);
par0(33,1)=phat_male(33,1);
par0(34,1)=phat_male(34,1);
par0(35,1)=phat_male(35,1);
par0(36,1)=phat_male(36,1);%PT
par0(37,1)=phat_male(37,1);%MJ
par0(38,1)=phat_male(38,1);%NE
par0(39,1)=phat_male(39,1);%mcl2
% %mcl
par0(40,1)=phat_male(40,1);%cons
par0(41,1)=phat_male(41,1);%year_birth
par0(42,1)=phat_male(42,1);%ED2
par0(43,1)=phat_male(43,1);%ED3
% %mu
par0(44,1)=phat_male(44,1);%cons
par0(45,1)=phat_male(45,1);%ED2
par0(46,1)=phat_male(46,1);%ED3
par0(47,1)=phat_male(47,1);%lmexp
par0(48,1)=phat_male(48,1);%PT
par0(49,1)=phat_male(49,1);%MJ
par0(50,1)=phat_male(50,1);%NE
par0(51,1)=phat_male(51,1);%wcl
% %sigma
par0(52,1)=phat_male(52,1);%cons
par0(53,1)=phat_male(53,1);%lmexp
par0(54,1)=phat_male(54,1);%PT
par0(55,1)=phat_male(55,1);%MJ
par0(56,1)=phat_male(56,1);%NE Pending
par0(57,1)=phat_male(57,1);%wcl
% %tau1
par0(58:72,1)=phat_male(58:72,1);
%
% par0(58,1)=par0(58,1)+2.5;
% par0(60,1)=0;
% par0(61,1)=par0(61,1)-1.5;%PT FT
% par0(62,1)=par0(62,1)-0.5;%MJ FT
% par0(63,1)=par0(63,1)+1;%NE FT
% par0(64,1)=par0(64,1)-0.5;%FT PT
% par0(65,1)=par0(65,1)-0.1;%MJ PT
% par0(66,1)=3.5;%NE PT
% par0(67,1)=par0(67)-0.5;%FT MJ
% par0(68,1)=par0(68,1)-4;%PT MJ
% par0(69,1)=par0(69,1)-1;%NE MJ
% par0(70,1)=par0(70,1)-0.5;%FT NE
% par0(71,1)=par0(71,1)+0.5;%PT NE
% par0(72,1)=par0(72,1)-1;%MJ NE
%
% %wcl
par0(73,1)=phat_male(73,1);%cons
par0(74,1)=phat_male(74,1);%year_birth
par0(75,1)=phat_male(75,1);%ED2
par0(76,1)=phat_male(76,1);%ED3

%% Mobility and Wage Classes:

rand('seed',123456)
rand_samp_mob=rand(size(data_male.year_birth,1),1);
%sample
prob_mcl=zeros(size(data_male.year_birth,1),1);
fract_mcl=zeros(size(data_male.year_birth,1),1);
for i=1:size(data_male.year_birth,1)
    prob_mcl(i,1)=1./(1+exp(par0(40,1)+par0(41,1)*data_male.year_birth(i,1)+par0(42,1)*data_male.ED2(i,1)+par0(43,1)*data_male.ED3(i,1)));
    if prob_mcl(i,1)>rand_samp_mob(i,1)
        fract_mcl(i,1)=1;
    elseif prob_mcl(i,1)<rand_samp_mob(i,1)
        fract_mcl(i,1)=2;
    end
end

% wage classes
rand_samp_wage=rand(size(data_male.year_birth,1),1);
%
prob_wcl=zeros(size(data_male.year_birth,1),1);
fract_wcl=zeros(size(data_male.year_birth,1),1);
for i=1:size(data_male.year_birth,1)
    prob_wcl(i,1)=1./(1+exp(par0(73,1)+par0(74,1)*data_male.year_birth(i,1)+par0(75,1)*data_male.ED2(i,1)+par0(76,1)*data_male.ED3(i,1)));
    if prob_wcl(i,1)>rand_samp_wage(i,1)
        fract_wcl(i,1)=1;
    elseif prob_wcl(i,1)<rand_samp_wage(i,1)
        fract_wcl(i,1)=2;
    end
end

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
par_educ2=-0.0105566;
par_educ3=-0.0509783;
par_lFT=-0.1549711;
par_lPT=-0.1419257;
par_lMJ=-0.1599706;
par_lNE=-0.2252156;
par_lUB=0.6271981;
par_year_birth=0.0001519;
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
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3);%iniNE
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
den(:,1)=den(:,1)+exp(par0(16,1) + par0(17,1)*exper(:,j) + par0(18,1)*educ2 + par0(19,1)*educ3 + par0(20,1)*fract_PT(:,j-1) + par0(21,1)*fract_MJ(:,j-1) + par0(22,1)*fract_NE(:,j-1));
den(:,1)=den(:,1)+exp(par0(24,1) + par0(25,1)*exper(:,j) + par0(26,1)*educ2 + par0(27,1)*educ3 + par0(28,1)*fract_PT(:,j-1) + par0(29,1)*fract_MJ(:,j-1) + par0(30,1)*fract_NE(:,j-1));
den(:,1)=den(:,1)+exp(par0(32,1) + par0(33,1)*exper(:,j) + par0(34,1)*educ2 + par0(35,1)*educ3 + par0(36,1)*fract_PT(:,j-1) + par0(37,1)*fract_MJ(:,j-1) + par0(38,1)*fract_NE(:,j-1));
for i=1:size(panel_mob,1)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_PT(i,j)=exp(par0(16,1) + par0(17,1)*exper(i,j) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1) + par0(20,1)*fract_PT(i,j-1) + par0(21,1)*fract_MJ(i,j-1) + par0(22,1)*fract_NE(i,j-1) )./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_MJ(i,j)=exp(par0(24,1) + par0(25,1)*exper(i,j) + par0(26,1)*educ2(i,1) + par0(27,1)*educ3(i,1) + par0(28,1)*fract_PT(i,j-1) + par0(29,1)*fract_MJ(i,j-1) + par0(30,1)*fract_NE(i,j-1) )./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_NE(i,j)=exp(par0(32,1) +par0(33,1)*exper(i,j) + par0(34,1)*educ2(i,1) + par0(35,1)*educ3(i,1) + par0(36,1)*fract_PT(i,j-1) + par0(37,1)*fract_MJ(i,j-1) + par0(38,1)*fract_NE(i,j-1) )./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
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
            prob_UB(i,j)=(par_year_birth*data_male.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)).*fract_NE(i,j);
        else
            prob_UB(i,j)=(par_year_birth*data_male.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)...
            +par_lFT*fract_FT(i,j-1)+par_lPT*fract_PT(i,j-1)+par_lMJ*fract_MJ(i,j-1)+par_lNE*fract_NE(i,j-1)+par_lUB*fract_UB(i,j-1)).*fract_NE(i,j);
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
        mu(:,j)=par0(44) + par0(45)*educ2 + par0(46)*educ3 + par0(47)*exper(:,j)  + par0(48)*fract_PT(:,j) + par0(49)*fract_MJ(:,j) ...
        + par0(50)*fract_UB(:,j);
        sig(:,j)=par0(52) + par0(53)*exper(:,j) + par0(54)*fract_PT(:,j) + par0(55)*fract_MJ(:,j) + par0(56)*fract_UB(:,j);   
        tau1(:,j)=par0(58) + par0(59)*exper(:,j);
    else
        mu(:,j)=par0(44) + par0(45)*educ2 + par0(46)*educ3 + par0(47)*exper(:,j)  + par0(48)*fract_PT(:,j) + par0(49)*fract_MJ(:,j) ...
        + par0(50)*fract_UB(:,j) ;
        sig(:,j)=par0(52) + par0(53)*exper(:,j) + par0(54)*fract_PT(:,j) + par0(55)*fract_MJ(:,j)  ...
            + par0(56)*fract_UB(:,j);   
        tau1(:,j)=par0(58) + par0(59)*exper(:,j) ...
                    + par0(61)*fract_FT(:,j).*fract_PT(:,j-1) + par0(62)*fract_FT(:,j).*fract_MJ(:,j-1) ...
                    + par0(63)*fract_FT(:,j).*fract_UB(:,j-1) ...
                    + par0(64)*fract_PT(:,j).*fract_FT(:,j-1) + par0(65)*fract_PT(:,j).*fract_MJ(:,j-1) ...
                    + par0(66)*fract_PT(:,j).*fract_UB(:,j-1) ...
                    + par0(67)*fract_MJ(:,j).*fract_FT(:,j-1) + par0(68)*fract_MJ(:,j).*fract_PT(:,j-1) ...
                    + par0(69)*fract_MJ(:,j).*fract_UB(:,j-1) ...
                    + par0(70)*fract_UB(:,j).*fract_FT(:,j-1) + par0(71)*fract_UB(:,j).*fract_PT(:,j-1) ...
                    + par0(72)*fract_UB(:,j).*fract_MJ(:,j-1);
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
        end
    end
end
%
shock=zeros(size(panel_wage,1),size(panel_wage,2));

for i=1:size(panel_wage,1)
    if fract_UB(i,1)==1
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<4 || panel_wage(i,1)>8
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    elseif model_empstate(i,1)~=4
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>10
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
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1); 
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
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1)
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))            
        end
    end
end
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

panel_wage_LT_1_1=panel_wage;
panel_mob_LT_1_1=panel_mob;
save('panel_wage_LT_1_1.mat','panel_wage_LT_1_1')
save('panel_mob_LT_1_1.mat','panel_mob_LT_1_1')
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
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3);%iniNE
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

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,j) + par0(18,1)*educ2 + par0(19,1)*educ3 + par0(20,1)*fract_PT(:,j-1) + par0(21,1)*fract_MJ(:,j-1) + par0(22,1)*fract_NE(:,j-1));
den(:,1)=den(:,1)+exp(par0(24,1) +par0(25,1)*exper(:,j) + par0(26,1)*educ2 + par0(27,1)*educ3 + par0(28,1)*fract_PT(:,j-1) + par0(29,1)*fract_MJ(:,j-1) + par0(30,1)*fract_NE(:,j-1));
den(:,1)=den(:,1)+exp(par0(32,1) +par0(33,1)*exper(:,j) + par0(34,1)*educ2 + par0(35,1)*educ3 + par0(36,1)*fract_PT(:,j-1) + par0(37,1)*fract_MJ(:,j-1) + par0(38,1)*fract_NE(:,j-1));
for i=1:size(panel_mob,1)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_PT(i,j)=exp(par0(16,1) +par0(17,1)*exper(i,j) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1) + par0(20,1)*fract_PT(i,j-1) + par0(21,1)*fract_MJ(i,j-1) + par0(22,1)*fract_NE(i,j-1) )./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_MJ(i,j)=exp(par0(24,1) +par0(25,1)*exper(i,j) + par0(26,1)*educ2(i,1) + par0(27,1)*educ3(i,1) + par0(28,1)*fract_PT(i,j-1) + par0(29,1)*fract_MJ(i,j-1) + par0(30,1)*fract_NE(i,j-1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_NE(i,j)=exp(par0(32,1) +par0(33,1)*exper(i,j) + par0(34,1)*educ2(i,1) + par0(35,1)*educ3(i,1) + par0(40,1)*fract_PT(i,j-1) + par0(37,1)*fract_MJ(i,j-1) + par0(38,1)*fract_NE(i,j-1) )./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
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
            prob_UB(i,j)=(par_year_birth*data_male.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)).*fract_NE(i,j);
        else
            prob_UB(i,j)=(par_year_birth*data_male.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)...
            +par_lFT*fract_FT(i,j-1)+par_lPT*fract_PT(i,j-1)+par_lMJ*fract_MJ(i,j-1)+par_lNE*fract_NE(i,j-1)+par_lUB*fract_UB(i,j-1)).*fract_NE(i,j);
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
        mu(:,j)=par0(44) + par0(45)*educ2 + par0(46)*educ3 + par0(47)*exper(:,j)  + par0(48)*fract_PT(:,j) + par0(49)*fract_MJ(:,j) ...
        + par0(50)*fract_UB(:,j) + par0(51);
        sig(:,j)=par0(52) + par0(53)*exper(:,j) + par0(54)*fract_PT(:,j) + par0(55)*fract_MJ(:,j) + par0(56)*fract_UB(:,j)+par0(57);   
        tau1(:,j)=par0(58) + par0(59)*exper(:,j)+par0(60);  
    else
        mu(:,j)=par0(44) + par0(45)*educ2 + par0(46)*educ3 + par0(47)*exper(:,j)  + par0(48)*fract_PT(:,j) + par0(49)*fract_MJ(:,j) ...
        + par0(50)*fract_UB(:,j) +par0(51);
        sig(:,j)=par0(52) + par0(53)*exper(:,j) + par0(54)*fract_PT(:,j) + par0(55)*fract_MJ(:,j)  ...
            + par0(56)*fract_UB(:,j) +par0(57);   
        tau1(:,j)=par0(58) + par0(59)*exper(:,j) + par0(60) ...
                    + par0(61)*fract_FT(:,j).*fract_PT(:,j-1) + par0(62)*fract_FT(:,j).*fract_MJ(:,j-1) ...
                    + par0(63)*fract_FT(:,j).*fract_UB(:,j-1) ...
                    + par0(64)*fract_PT(:,j).*fract_FT(:,j-1) + par0(65)*fract_PT(:,j).*fract_MJ(:,j-1) ...
                    + par0(66)*fract_PT(:,j).*fract_UB(:,j-1) ...
                    + par0(67)*fract_MJ(:,j).*fract_FT(:,j-1) + par0(68)*fract_MJ(:,j).*fract_PT(:,j-1) ...
                    + par0(69)*fract_MJ(:,j).*fract_UB(:,j-1) ...
                    + par0(70)*fract_UB(:,j).*fract_FT(:,j-1) + par0(71)*fract_UB(:,j).*fract_PT(:,j-1) ...
                    + par0(72)*fract_UB(:,j).*fract_MJ(:,j-1);
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
        end
    end
end
%
shock=zeros(size(panel_wage,1),size(panel_wage,2));

for i=1:size(panel_wage,1)
    if fract_UB(i,1)==1
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<4 || panel_wage(i,1)>8
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    elseif model_empstate(i,1)~=4
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>10
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
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1); 
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
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1)
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))            
        end
    end
end
%truncation
% for i=1:size(panel_wage,1)
%     for j=2:size(panel_wage,2)
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==1
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==3
%             while panel_wage(i,j)<5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==1 && fract_UB(i,j)==1
%             while panel_wage(i,j)<5 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==2
%             while panel_wage(i,j)<6 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==1
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==3
%             while panel_wage(i,j)<4 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==3 && fract_UB(i,j)==1
%             while panel_wage(i,j)<6 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==1
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
%             while panel_wage(i,j)<6 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==1
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
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
%     end
% end

panel_wage_LT_1_2=panel_wage;
panel_mob_LT_1_2=panel_mob;
save('panel_wage_LT_1_2.mat','panel_wage_LT_1_2')
save('panel_mob_LT_1_2.mat','panel_mob_LT_1_2')
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
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3+par0(15,1));%iniNE
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

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,j) + par0(18,1)*educ2 + par0(19,1)*educ3 + par0(20,1)*fract_PT(:,j-1) + par0(21,1)*fract_MJ(:,j-1) + par0(22,1)*fract_NE(:,j-1) +par0(23,1));
den(:,1)=den(:,1)+exp(par0(24,1) +par0(25,1)*exper(:,j) + par0(26,1)*educ2 + par0(27,1)*educ3 + par0(28,1)*fract_PT(:,j-1) + par0(29,1)*fract_MJ(:,j-1) + par0(30,1)*fract_NE(:,j-1) +par0(31,1));
den(:,1)=den(:,1)+exp(par0(32,1) +par0(33,1)*exper(:,j) + par0(34,1)*educ2 + par0(35,1)*educ3 + par0(36,1)*fract_PT(:,j-1) + par0(37,1)*fract_MJ(:,j-1) + par0(38,1)*fract_NE(:,j-1) +par0(39,1));
for i=1:size(panel_mob,1)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_PT(i,j)=exp(par0(16,1) +par0(17,1)*exper(i,j) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1) + par0(20,1)*fract_PT(i,j-1) + par0(21,1)*fract_MJ(i,j-1) + par0(22,1)*fract_NE(i,j-1) +par0(23,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_MJ(i,j)=exp(par0(24,1) +par0(25,1)*exper(i,j) + par0(26,1)*educ2(i,1) + par0(27,1)*educ3(i,1) + par0(28,1)*fract_PT(i,j-1) + par0(29,1)*fract_MJ(i,j-1) + par0(30,1)*fract_NE(i,j-1)+par0(31,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_NE(i,j)=exp(par0(32,1) +par0(33,1)*exper(i,j) + par0(34,1)*educ2(i,1) + par0(35,1)*educ3(i,1) + par0(36,1)*fract_PT(i,j-1) + par0(37,1)*fract_MJ(i,j-1) + par0(38,1)*fract_NE(i,j-1) +par0(39,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
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
            prob_UB(i,j)=(par_year_birth*data_male.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)).*fract_NE(i,j);
        else
            prob_UB(i,j)=(par_year_birth*data_male.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)...
            +par_lFT*fract_FT(i,j-1)+par_lPT*fract_PT(i,j-1)+par_lMJ*fract_MJ(i,j-1)+par_lNE*fract_NE(i,j-1)+par_lUB*fract_UB(i,j-1)).*fract_NE(i,j);
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
        mu(:,j)=par0(44) + par0(45)*educ2 + par0(46)*educ3 + par0(47)*exper(:,j)  + par0(48)*fract_PT(:,j) + par0(49)*fract_MJ(:,j) ...
         + par0(50)*fract_UB(:,j);
        sig(:,j)=par0(52) + par0(53)*exper(:,j) + par0(54)*fract_PT(:,j) + par0(55)*fract_MJ(:,j) + par0(56)*fract_UB(:,j);   
        tau1(:,j)=par0(58) + par0(59)*exper(:,j);  
    else
        mu(:,j)=par0(44) + par0(45)*educ2 + par0(46)*educ3 + par0(47)*exper(:,j)  + par0(48)*fract_PT(:,j) + par0(49)*fract_MJ(:,j) ...
        + par0(50)*fract_UB(:,j) ;
        sig(:,j)=par0(52) + par0(53)*exper(:,j) + par0(54)*fract_PT(:,j) + par0(55)*fract_MJ(:,j)  ...
            + par0(56)*fract_UB(:,j);   
        tau1(:,j)=par0(58) + par0(59)*exper(:,j) ...
                    + par0(61)*fract_FT(:,j).*fract_PT(:,j-1) + par0(62)*fract_FT(:,j).*fract_MJ(:,j-1) ...
                    + par0(63)*fract_FT(:,j).*fract_UB(:,j-1) ...
                    + par0(64)*fract_PT(:,j).*fract_FT(:,j-1) + par0(65)*fract_PT(:,j).*fract_MJ(:,j-1) ...
                    + par0(66)*fract_PT(:,j).*fract_UB(:,j-1) ...
                    + par0(67)*fract_MJ(:,j).*fract_FT(:,j-1) + par0(68)*fract_MJ(:,j).*fract_PT(:,j-1) ...
                    + par0(69)*fract_MJ(:,j).*fract_UB(:,j-1) ...
                    + par0(70)*fract_UB(:,j).*fract_FT(:,j-1) + par0(71)*fract_UB(:,j).*fract_PT(:,j-1) ...
                    + par0(72)*fract_UB(:,j).*fract_MJ(:,j-1);
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
        end
    end
end
%
shock=zeros(size(panel_wage,1),size(panel_wage,2));

for i=1:size(panel_wage,1)
    if fract_UB(i,1)==1
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<4 || panel_wage(i,1)>8
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    elseif model_empstate(i,1)~=4
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>10
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
%             mu_t=[mu(i,j) mu(i,j-1)];
%             sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
%             aux=mvnrnd(mu_t,sigma_t,1);
%             ind=aux;
%             while ind<0
%                 aux=mvnrnd(mu_t,sigma_t,1);
%                 ind=aux;
%             end
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
%             mu_t=[mu(i,j) mu(i,j-1)];
%             sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
%             aux=mvnrnd(mu_t,sigma_t,1);
%             ind=aux;
%             while ind<0
%                 aux=mvnrnd(mu_t,sigma_t,1);
%                 ind=aux;
%             end
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from NE period and no UB to same regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1); 
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
%             mu_t=[mu(i,j) mu(i,j-1)];
%             sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
%             aux=mvnrnd(mu_t,sigma_t,1);
%             ind=aux;
%             while ind<0
%                 aux=mvnrnd(mu_t,sigma_t,1);
%                 ind=aux;
%             end
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from any empstate~=4 to NE and no UB regardless year
        elseif model_empstate(i,j-1)~=4 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
%             while panel_wage(i,1)<0
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
%             end    
        %coming from fract_UB==0 to NE and no UB regardless year
        elseif fract_UB(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
%             while panel_wage(i,1)<0
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
%             end   
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1)
%             mu_t=[mu(i,j) mu(i,j-1)];
%             sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
%             aux=mvnrnd(mu_t,sigma_t,1);
%             ind=aux;
%             while ind<0
%                 aux=mvnrnd(mu_t,sigma_t,1);
%                 ind=aux;
%             end
%             panel_wage(i,j)=aux(1,1)+tau1(i,j)*(panel_wage(i,j-1)-mu(i,j-1));
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))            
        end
    end
end
%truncation
% for i=1:size(panel_wage,1)
%     for j=2:size(panel_wage,2)
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==1
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==3
%             while panel_wage(i,j)<5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==1 && fract_UB(i,j)==1
%             while panel_wage(i,j)<5 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==2
%             while panel_wage(i,j)<6 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==1
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==3
%             while panel_wage(i,j)<4 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==3 && fract_UB(i,j)==1
%             while panel_wage(i,j)<6 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==1
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
%             while panel_wage(i,j)<6 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==1
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
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
%     end
% end
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

panel_wage_LT_2_1=panel_wage;
panel_mob_LT_2_1=panel_mob;
save('panel_wage_LT_2_1.mat','panel_wage_LT_2_1')
save('panel_mob_LT_2_1.mat','panel_mob_LT_2_1')
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
den(:,1)=den(:,1)+exp(par0(11,1) +par0(12,1)*exper(:,1) + par0(13,1)*educ2 + par0(14,1)*educ3+par0(15,1));%iniNE
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

%subsequent states:
%
for j=2:size(panel_mob,2)
den=zeros(size(panel_mob,1),1);
den(:,1)=1;
den(:,1)=den(:,1)+exp(par0(16,1) +par0(17,1)*exper(:,j) + par0(18,1)*educ2 + par0(19,1)*educ3 + par0(20,1)*fract_PT(:,j-1) + par0(21,1)*fract_MJ(:,j-1) + par0(22,1)*fract_NE(:,j-1) +par0(23,1));
den(:,1)=den(:,1)+exp(par0(24,1) +par0(25,1)*exper(:,j) + par0(26,1)*educ2 + par0(27,1)*educ3 + par0(28,1)*fract_PT(:,j-1) + par0(29,1)*fract_MJ(:,j-1) + par0(30,1)*fract_NE(:,j-1) +par0(31,1));
den(:,1)=den(:,1)+exp(par0(32,1) +par0(33,1)*exper(:,j) + par0(34,1)*educ2 + par0(35,1)*educ3 + par0(36,1)*fract_PT(:,j-1) + par0(37,1)*fract_MJ(:,j-1) + par0(38,1)*fract_NE(:,j-1) +par0(39,1));
for i=1:size(panel_mob,1)
    prob_FT(i,j)=1./(den(i,1));
    if prob_FT(i,j)>rand_state(i,j) && isnan(prob_FT(i,j))==0
        fract_FT(i,j)=1;
    elseif isnan(prob_FT(i,j))==0
        fract_FT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_PT(i,j)=exp(par0(16,1) +par0(17,1)*exper(i,j) + par0(18,1)*educ2(i,1) + par0(19,1)*educ3(i,1) + par0(20,1)*fract_PT(i,j-1) + par0(21,1)*fract_MJ(i,j-1) + par0(22,1)*fract_NE(i,j-1) +par0(23,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)>rand_state(i,j) && prob_FT(i,j)<rand_state(i,j) && isnan(prob_PT(i,j))==0
        fract_PT(i,j)=1;
    elseif isnan(prob_PT(i,j))==0
        fract_PT(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_MJ(i,j)=exp(par0(24,1) +par0(25,1)*exper(i,j) + par0(26,1)*educ2(i,1) + par0(27,1)*educ3(i,1) + par0(28,1)*fract_PT(i,j-1) + par0(29,1)*fract_MJ(i,j-1) + par0(30,1)*fract_NE(i,j-1)+par0(31,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)<rand_state(i,j) && isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=1;
    elseif isnan(prob_MJ(i,j))==0
        fract_MJ(i,j)=0;
    end
end
for i=1:size(panel_mob,1)
    prob_NE(i,j)=exp(par0(32,1) +par0(33,1)*exper(i,j) + par0(34,1)*educ2(i,1) + par0(35,1)*educ3(i,1) + par0(36,1)*fract_PT(i,j-1) + par0(37,1)*fract_MJ(i,j-1) + par0(38,1)*fract_NE(i,j-1) +par0(39,1))./(den(i,1));
    if prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)+prob_NE(i,j)>rand_state(i,j) && prob_FT(i,j)+prob_PT(i,j)+prob_MJ(i,j)<rand_state(i,j) && isnan(prob_NE(i,j))==0
        fract_NE(i,j)=1;
    elseif isnan(prob_NE(i,j))==0
        fract_NE(i,j)=0;
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
            prob_UB(i,j)=(par_year_birth*data_male.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)).*fract_NE(i,j);
        else
            prob_UB(i,j)=(par_year_birth*data_male.year_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)...
            +par_lFT*fract_FT(i,j-1)+par_lPT*fract_PT(i,j-1)+par_lMJ*fract_MJ(i,j-1)+par_lNE*fract_NE(i,j-1)+par_lUB*fract_UB(i,j-1)).*fract_NE(i,j);
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
        mu(:,j)=par0(44) + par0(45)*educ2 + par0(46)*educ3 + par0(47)*exper(:,j)  + par0(48)*fract_PT(:,j) + par0(49)*fract_MJ(:,j) ...
        + par0(50)*fract_UB(:,j) + par0(51);
        sig(:,j)=par0(52) + par0(53)*exper(:,j) + par0(54)*fract_PT(:,j) + par0(55)*fract_MJ(:,j) + par0(56)*fract_UB(:,j)+par0(57);   
        tau1(:,j)=par0(58) + par0(59)*exper(:,j)+par0(60);  
    else
        mu(:,j)=par0(44) + par0(45)*educ2 + par0(46)*educ3 + par0(47)*exper(:,j)  + par0(48)*fract_PT(:,j) + par0(49)*fract_MJ(:,j) ...
        + par0(50)*fract_UB(:,j) +par0(51);
        sig(:,j)=par0(52) + par0(53)*exper(:,j) + par0(54)*fract_PT(:,j) + par0(55)*fract_MJ(:,j)  ...
            + par0(56)*fract_UB(:,j) +par0(57);   
        tau1(:,j)=par0(58) + par0(59)*exper(:,j) + par0(60) ...
                    + par0(61)*fract_FT(:,j).*fract_PT(:,j-1) + par0(62)*fract_FT(:,j).*fract_MJ(:,j-1) ...
                    + par0(63)*fract_FT(:,j).*fract_UB(:,j-1) ...
                    + par0(64)*fract_PT(:,j).*fract_FT(:,j-1) + par0(65)*fract_PT(:,j).*fract_MJ(:,j-1) ...
                    + par0(66)*fract_PT(:,j).*fract_UB(:,j-1) ...
                    + par0(67)*fract_MJ(:,j).*fract_FT(:,j-1) + par0(68)*fract_MJ(:,j).*fract_PT(:,j-1) ...
                    + par0(69)*fract_MJ(:,j).*fract_UB(:,j-1) ...
                    + par0(70)*fract_UB(:,j).*fract_FT(:,j-1) + par0(71)*fract_UB(:,j).*fract_PT(:,j-1) ...
                    + par0(72)*fract_UB(:,j).*fract_MJ(:,j-1);
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
        end
    end
end
%

shock=zeros(size(panel_wage,1),size(panel_wage,2));

for i=1:size(panel_wage,1)
    if fract_UB(i,1)==1
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<4 || panel_wage(i,1)>8
            panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        end
        shock(i,1)=panel_wage(i,1)-mu(i,1);
    elseif model_empstate(i,1)~=4
        panel_wage(i,1)=mu(i,1)+sig(i,1)*randn(1,1);
        while panel_wage(i,1)<5 || panel_wage(i,1)>10
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
%             mu_t=[mu(i,j) mu(i,j-1)];
%             sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
%             aux=mvnrnd(mu_t,sigma_t,1);
%             ind=aux;
%             while ind<0
%                 aux=mvnrnd(mu_t,sigma_t,1);
%                 ind=aux;
%             end
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
%             mu_t=[mu(i,j) mu(i,j-1)];
%             sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
%             aux=mvnrnd(mu_t,sigma_t,1);
%             ind=aux;
%             while ind<0
%                 aux=mvnrnd(mu_t,sigma_t,1);
%                 ind=aux;
%             end
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from NE period and no UB to same regardless year
        elseif fract_UB(i,j-1)==0 && fract_NE(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1); 
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
%             mu_t=[mu(i,j) mu(i,j-1)];
%             sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
%             aux=mvnrnd(mu_t,sigma_t,1);
%             ind=aux;
%             while ind<0
%                 aux=mvnrnd(mu_t,sigma_t,1);
%                 ind=aux;
%             end
            panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));%/(mu(i,j)+sig(i,j)*randn(1,1))
            shock(i,j)=panel_wage(i,j)-mu(i,j);
        %coming from any empstate~=4 to NE and no UB regardless year
        elseif model_empstate(i,j-1)~=4 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
%             while panel_wage(i,1)<0
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
%             end    
        %coming from fract_UB==0 to NE and no UB regardless year
        elseif fract_UB(i,j-1)==1 && fract_UB(i,j)==0 && fract_NE(i,j)==1 && isnan(mu(i,j))==0
            panel_wage(i,j)=NaN;
            shock(i,j)=0;
%             while panel_wage(i,1)<0
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1);
%             end   
        %beginning of year and no previous conditions:
        elseif isnan(mu(i,j))==0 && yr(i,j)~=yr(i,j-1)
%             mu_t=[mu(i,j) mu(i,j-1)];
%             sigma_t=[sig(i,j).^2 tau1(i,j).*sig(i,j).*sig(i,j-1); tau1(i,j).*sig(i,j).*sig(i,j-1) sig(i,j-1).^2];
%             aux=mvnrnd(mu_t,sigma_t,1);
%             ind=aux;
%             while ind<0
%                 aux=mvnrnd(mu_t,sigma_t,1);
%                 ind=aux;
%             end
%             panel_wage(i,j)=aux(1,1)+tau1(i,j)*(panel_wage(i,j-1)-mu(i,j-1));
            shock(i,j)=sig(i,j)*randn(1,1);
            panel_wage(i,j)=mu(i,j)+tau1(i,j)*shock(i,j-1)+shock(i,j);%/(mu(i,j)+sig(i,j)*randn(1,1))            
        end
    end
end
%truncation
% for i=1:size(panel_wage,1)
%     for j=2:size(panel_wage,2)
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==1
%             while panel_wage(i,j)<4.5 || panel_wage(i,j)>11
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==3
%             while panel_wage(i,j)<5 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end  
%         if model_empstate(i,j-1)==1 && fract_UB(i,j)==1
%             while panel_wage(i,j)<5 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==1 && model_empstate(i,j)==2
%             while panel_wage(i,j)<6 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==1
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end 
%         if model_empstate(i,j-1)==3 && model_empstate(i,j)==3
%             while panel_wage(i,j)<4 || panel_wage(i,j)>8.5
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==3 && fract_UB(i,j)==1
%             while panel_wage(i,j)<6 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if fract_UB(i,j-1)==1 && model_empstate(i,j)==1
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
%             while panel_wage(i,j)<6 || panel_wage(i,j)>8
%                 panel_wage(i,j)=mu(i,j)+sig(i,j)*randn(1,1)+tau1(i,j)*(shock(i,j-1));
%             end
%         end
%         if model_empstate(i,j-1)==2 && model_empstate(i,j)==1
%             while panel_wage(i,j)<6 || panel_wage(i,j)>9
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
%     end
% end

panel_wage_LT_2_2=panel_wage;
panel_mob_LT_2_2=panel_mob;
save('panel_wage_LT_2_2.mat','panel_wage_LT_2_2')
save('panel_mob_LT_2_2.mat','panel_mob_LT_2_2')
%% LT Values Whole Sample:

clear
load('panel_wage_LT_2_2.mat','panel_wage_LT_2_2')
load('panel_wage_LT_1_2.mat','panel_wage_LT_1_2')
load('panel_wage_LT_2_1.mat','panel_wage_LT_2_1')
load('panel_wage_LT_1_1.mat','panel_wage_LT_1_1')

panel_wage_LT_19992002_male=[panel_wage_LT_1_1; panel_wage_LT_2_1; panel_wage_LT_1_2; panel_wage_LT_2_2];

save('panel_wage_LT_19992002_male.mat','panel_wage_LT_19992002_male')

load('panel_mob_LT_2_2.mat','panel_mob_LT_2_2')
load('panel_mob_LT_1_2.mat','panel_mob_LT_1_2')
load('panel_mob_LT_2_1.mat','panel_mob_LT_2_1')
load('panel_mob_LT_1_1.mat','panel_mob_LT_1_1')

panel_mob_LT_19992002_male=[panel_mob_LT_1_1; panel_mob_LT_2_1; panel_mob_LT_1_2; panel_mob_LT_2_2];

save('panel_mob_LT_19992002_male.mat','panel_mob_LT_19992002_male')

disp('Finished!')
beep