%
cd 'C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Matlab\MonthlyIncome\1999-2002'
clc
clear
close all
clear mex
set(0,'DefaultFigureWindowStyle','docked')
disp('CS Fit, Females 1999-2002')
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
% %PT 
par0(16,1)=phat_female(16,1);%cons
par0(17,1)=phat_female(17,1);%lmexp
par0(18,1)=phat_female(18,1);%ed2
par0(19,1)=phat_female(19,1);%ed3
par0(20,1)=phat_female(20,1);%PT
par0(21,1)=phat_female(21,1);%MJ
par0(22,1)=phat_female(22,1);%NE
par0(23,1)=phat_female(23,1);%mcl2
% %MJ
par0(24,1)=phat_female(24,1);
par0(25,1)=phat_female(25,1);
par0(26,1)=phat_female(26,1);
par0(27,1)=phat_female(27,1);
par0(28,1)=phat_female(28,1);%PT
par0(29,1)=phat_female(29,1);%MJ
par0(30,1)=phat_female(30,1);%NE
par0(31,1)=phat_female(31,1);%mcl2
% %NE
par0(32,1)=phat_female(32,1);
par0(33,1)=phat_female(33,1);
par0(34,1)=phat_female(34,1);
par0(35,1)=phat_female(35,1);
par0(36,1)=phat_female(36,1);%PT
par0(37,1)=phat_female(37,1);%MJ
par0(38,1)=phat_female(38,1);%NE
par0(39,1)=phat_female(39,1);%mcl2
% %mcl
par0(40,1)=phat_female(40,1);%cons
par0(41,1)=phat_female(41,1);%year_birth
par0(42,1)=phat_female(42,1);%ED2
par0(43,1)=phat_female(43,1);%ED3
% %mu
par0(44,1)=phat_female(44,1);%cons
par0(45,1)=phat_female(45,1);%ED2
par0(46,1)=phat_female(46,1);%ED3
par0(47,1)=phat_female(47,1);%lmexp
par0(48,1)=phat_female(48,1);%PT
par0(49,1)=phat_female(49,1);%MJ
par0(50,1)=phat_female(50,1);%NE
par0(51,1)=phat_female(51,1);%wcl
% %sigma
par0(52,1)=phat_female(52,1);%cons
par0(53,1)=phat_female(53,1);%lmexp
par0(54,1)=phat_female(54,1);%PT
par0(55,1)=phat_female(55,1);%MJ
par0(56,1)=phat_female(56,1);%NE Pending
par0(57,1)=phat_female(57,1);%wcl
% %tau1
par0(58:72,1)=phat_female(58:72,1);
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
par0(73,1)=phat_female(73,1);%cons
par0(74,1)=phat_female(74,1);%year_birth
par0(75,1)=phat_female(75,1);%ED2
par0(76,1)=phat_female(76,1);%ED3
%
%
mu_cons=(par0(44,1));
mu_cons_PT=(par0(44,1)+par0(48,1));
mu_cons_MJ=(par0(44,1)+par0(49,1));
mu_cons_NE=(par0(44,1)+par0(50,1));
%
sd_cons=exp((par0(52,1))/2);
sd_cons_PT=exp((par0(52,1)+par0(54,1))/2);
sd_cons_MJ=exp((par0(52,1)+par0(55,1))/2);
sd_cons_NE=exp((par0(52,1)+par0(56,1))/2);
%
acr_cons=-1+2/(1+exp(par0(58)))
acr_cons_PT_FT=-1+2/(1+exp(par0(58)+par0(61)))
acr_cons_MJ_FT=-1+2/(1+exp(par0(58)+par0(62)))
acr_cons_NE_FT=-1+2/(1+exp(par0(58)+par0(63)))
acr_cons_FT_PT=-1+2/(1+exp(par0(58)+par0(64)))
acr_cons_MJ_PT=-1+2/(1+exp(par0(58)+par0(65)))
acr_cons_NE_PT=-1+2/(1+exp(par0(58)+par0(66)))
acr_cons_FT_MJ=-1+2/(1+exp(par0(58)+par0(67)))
acr_cons_PT_MJ=-1+2/(1+exp(par0(58)+par0(68)))
acr_cons_NE_MJ=-1+2/(1+exp(par0(58)+par0(69)))
acr_cons_FT_NE=-1+2/(1+exp(par0(58)+par0(70)))
acr_cons_PT_NE=-1+2/(1+exp(par0(58)+par0(71)))
acr_cons_MJ_NE=-1+2/(1+exp(par0(58)+par0(72)))
% acr_cosn_full_FT_kwone=-1+2/(1+exp(par0(58)+par0(59)*nanmean(data_female.lmexp(:))))
% acr_cosn_full_PT_kwone=-1+2/(1+exp(par0(58)+par0(59)*nanmean(data_female.lmexp(:))+par0(61)))
% acr_cosn_full_MJ_kwone=-1+2/(1+exp(par0(58)+par0(59)*nanmean(data_female.lmexp(:))+par0(62)))
% acr_cosn_full_NE_kwone=-1+2/(1+exp(par0(58)+par0(59)*nanmean(data_female.lmexp(:))+par0(63)))
% acr_cosn_full_FT_kwtwo=-1+2/(1+exp(par0(58)+par0(59)*nanmean(data_female.lmexp(:))+par0(60)))
% acr_cosn_full_PT_kwtwo=-1+2/(1+exp(par0(58)+par0(59)*nanmean(data_female.lmexp(:))+par0(60)+par0(61)))
% acr_cosn_full_MJ_kwtwo=-1+2/(1+exp(par0(58)+par0(59)*nanmean(data_female.lmexp(:))+par0(60)+par0(62)))
% acr_cosn_full_NE_kwtwo=-1+2/(1+exp(par0(58)+par0(59)*nanmean(data_female.lmexp(:))+par0(60)+par0(63)))
disp('Model Parameters : ')
['mu_param: ' num2str(mu_cons,'%4.2f') '&' num2str(mu_cons_PT,'%4.2f') '&' num2str(mu_cons_MJ,'%4.2f') '&' num2str(mu_cons_NE,'%4.2f')]
['sd_param: ' num2str(sd_cons,'%4.2f') '&' num2str(sd_cons_PT,'%4.2f') '&' num2str(sd_cons_MJ,'%4.2f') '&' num2str(sd_cons_NE,'%4.2f')]
['acr_param_cons_FT: ' num2str(acr_cons,'%4.2f') '&' num2str(acr_cons_PT_FT,'%4.2f') '&' num2str(acr_cons_MJ_FT,'%4.2f') '&' num2str(acr_cons_NE_FT,'%4.2f') ]
['acr_param_PT: ' num2str(acr_cons_FT_PT,'%4.2f') '&' num2str(acr_cons_MJ_PT,'%4.2f') '&' num2str(acr_cons_NE_PT,'%4.2f')  ]
['acr_param_MJ: ' num2str(acr_cons_FT_MJ,'%4.2f') num2str(acr_cons_PT_MJ,'%4.2f') '&' num2str(acr_cons_NE_MJ,'%4.2f') ]
['acr_param_NE: ' num2str(acr_cons_FT_NE,'%4.2f') '&' num2str(acr_cons_PT_NE,'%4.2f') '&' num2str(acr_cons_MJ_NE,'%4.2f')]

%probabilities of mobility classes:
rand('seed',123456)
rand_samp_mob=rand(size(data_female.year_birth,1),1);
%sample
prob_mcl=zeros(size(data_female.year_birth,1),1);
fract_mcl=zeros(size(data_female.year_birth,1),1);
for i=1:size(data_female.year_birth,1)
    prob_mcl(i,1)=1./(1+exp(par0(40,1)+par0(41,1)*data_female.year_birth(i,1)+par0(42,1)*data_female.ED2(i,1)+par0(43,1)*data_female.ED3(i,1)));
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
    prob_wcl(i,1)=1./(1+exp(par0(73,1)+par0(74,1)*data_female.year_birth(i,1)+par0(75,1)*data_female.ED2(i,1)+par0(76,1)*data_female.ED3(i,1)));
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
par_educ2=-0.0105566;
par_educ3=-0.0509783;
par_lFT=-0.1549711;
par_lPT=-0.1419257;
par_lMJ=-0.1599706;
par_lNE=-0.2252156;
par_lUB=0.6271981;
par_year_birth=0.0001519;


%panel_mob simulations

%% mobility class 1 wage class 1 
panel_mob=zeros(size(data_female.log_ave_wage,1),size(data_female.log_ave_wage,2));
panel_mob(fract_wcl==2,:)=NaN;
panel_mob(fract_mcl==2,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year

exper=data_female.lmexp;
exper(isnan(aux(:,1))==1,:)=[];
yr=data_female.year;
yr(isnan(aux(:,1))==1,:)=[];
yr_birth=data_female.year_birth;
yr_birth(isnan(aux(:,1))==1,:)=[];
educ2=data_female.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_female.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
FT=data_female.FT;
FT(isnan(aux(:,1))==1,:)=[];
PT=data_female.PT;
PT(isnan(aux(:,1))==1,:)=[];
MJ=data_female.MJ;
MJ(isnan(aux(:,1))==1,:)=[];
NE=data_female.NE;
NE(isnan(aux(:,1))==1,:)=[];
empstate=data_female.empstate;
empstate(isnan(aux(:,1))==1,:)=[];
%
% UB=data_female.UB;
% observ=NE;
% int=NE==1;
% int2=UB==0;
% int3=int.*int2;
% % int=UB==0.*NE==1;
% observ(int3==1)=NaN;
% NE=observ;
% %

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
            prob_UB(i,j)=(par_year_birth*yr_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)).*fract_NE(i,j);
        else
            prob_UB(i,j)=(par_year_birth*yr_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)...
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

st_tr_pr_1_1=zeros(4,4);

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_1(1,1)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_1(2,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_1(3,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_1(4,4)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_1(1,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_1(1,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_1(1,4)=ind/sum(sum(aux(:,2:end)==1));


ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_1(2,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_1(2,4)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_1(3,4)=ind/sum(sum(aux(:,2:end)==1));
%

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_1(4,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_1(4,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_1(4,1)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_1(3,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_1(3,1)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_1(2,1)=ind/sum(sum(aux(:,2:end)==1));

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

%quintiles - income mobility

%whole sample
wages=panel_wage_1_1;
decile=nan(size(wages,1),size(wages,2));

decile_20=prctile(wages(:),20);
decile_40=prctile(wages(:),40);
decile_60=prctile(wages(:),60);
decile_80=prctile(wages(:),80);

for i=1:size(wages,1)
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

matrix_1_1=zeros(4,4);

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_1(1,1)=counting/den;
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_1(2,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_1(3,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_1(4,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_1(5,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_1(2,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_1(3,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_1(4,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_1(5,1)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_1(3,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_1(4,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_1(5,2)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_1(4,3)=counting/den;
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_1(5,3)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_1(5,4)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_1(1,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_1(1,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_1(1,4)=counting/den;
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_1(1,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_1(2,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_1(2,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_1(2,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_1(3,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_1(3,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
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
fract_UB_1_1=fract_UB;
save('fract_FT_1_1.mat','fract_FT_1_1')
save('fract_PT_1_1.mat','fract_PT_1_1')
save('fract_MJ_1_1.mat','fract_MJ_1_1')
save('fract_NE_1_1.mat','fract_NE_1_1')
save('fract_UB_1_1.mat','fract_UB_1_1')
save('panel_wage_1_1.mat','panel_wage_1_1')

%% mobility class 1 wage class 2 
panel_mob=zeros(size(data_female.log_ave_wage,1),size(data_female.log_ave_wage,2));
panel_mob(fract_wcl==1,:)=NaN;
panel_mob(fract_mcl==2,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year

exper=data_female.lmexp;
exper(isnan(aux(:,1))==1,:)=[];
yr=data_female.year;
yr(isnan(aux(:,1))==1,:)=[];
yr_birth=data_female.year_birth;
yr_birth(isnan(aux(:,1))==1,:)=[];
educ2=data_female.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_female.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
FT=data_female.FT;
FT(isnan(aux(:,1))==1,:)=[];
PT=data_female.PT;
PT(isnan(aux(:,1))==1,:)=[];
MJ=data_female.MJ;
MJ(isnan(aux(:,1))==1,:)=[];
NE=data_female.NE;
NE(isnan(aux(:,1))==1,:)=[];
empstate=data_female.empstate;
empstate(isnan(aux(:,1))==1,:)=[];

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
            prob_UB(i,j)=(par_year_birth*yr_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)).*fract_NE(i,j);
        else
            prob_UB(i,j)=(par_year_birth*yr_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)...
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

panel_wage_1_2=panel_wage;
panel_mob_1_2=panel_mob;

st_tr_pr_1_2=zeros(4,4);

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_2(1,1)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_2(2,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_2(3,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_2(4,4)=ind/sum(sum(aux(:,2:end)==1));
%

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_2(1,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_2(1,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_2(1,4)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_2(2,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_2(2,4)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_1_2(3,4)=ind/sum(sum(aux(:,2:end)==1));
%
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_1_2(4,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_2(4,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_2(4,1)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_1_2(3,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_2(3,1)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_1_2(2,1)=ind/sum(sum(aux(:,2:end)==1));

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

%quintiles - income mobility

%whole sample
wages=panel_wage_1_2;
decile=nan(size(wages,1),size(wages,2));

decile_20=prctile(wages(:),20);
decile_40=prctile(wages(:),40);
decile_60=prctile(wages(:),60);
decile_80=prctile(wages(:),80);

for i=1:size(wages,1)
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

matrix_1_2=zeros(4,4);

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_2(1,1)=counting/den;
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_2(2,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_2(3,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_2(4,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_2(5,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_2(2,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_2(3,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_2(4,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_2(5,1)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_2(3,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_2(4,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_2(5,2)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_1_2(4,3)=counting/den;
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_2(5,3)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_1_2(5,4)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_2(1,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_2(1,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_2(1,4)=counting/den;
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_1_2(1,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_2(2,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_2(2,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_1_2(2,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_2(3,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_1_2(3,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
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
fract_UB_1_2=fract_UB;
save('fract_FT_1_2.mat','fract_FT_1_2')
save('fract_PT_1_2.mat','fract_PT_1_2')
save('fract_MJ_1_2.mat','fract_MJ_1_2')
save('fract_NE_1_2.mat','fract_NE_1_2')
save('fract_UB_1_2.mat','fract_UB_1_2')
save('panel_wage_1_2.mat','panel_wage_1_2')

%% mobility class 2 wage class 1 
panel_mob=zeros(size(data_female.log_ave_wage,1),size(data_female.log_ave_wage,2));
panel_mob(fract_wcl==2,:)=NaN;
panel_mob(fract_mcl==1,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year

exper=data_female.lmexp;
exper(isnan(aux(:,1))==1,:)=[];
yr=data_female.year;
yr(isnan(aux(:,1))==1,:)=[];
yr_birth=data_female.year_birth;
yr_birth(isnan(aux(:,1))==1,:)=[];
educ2=data_female.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_female.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
FT=data_female.FT;
FT(isnan(aux(:,1))==1,:)=[];
PT=data_female.PT;
PT(isnan(aux(:,1))==1,:)=[];
MJ=data_female.MJ;
MJ(isnan(aux(:,1))==1,:)=[];
NE=data_female.NE;
NE(isnan(aux(:,1))==1,:)=[];
empstate=data_female.empstate;
empstate(isnan(aux(:,1))==1,:)=[];

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
            prob_UB(i,j)=(par_year_birth*yr_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)).*fract_NE(i,j);
        else
            prob_UB(i,j)=(par_year_birth*yr_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)...
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

panel_wage_2_1=panel_wage;
panel_mob_2_1=panel_mob;

st_tr_pr_2_1=zeros(4,4);

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_1(1,1)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_1(2,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_1(3,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_1(4,4)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_1(1,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_1(1,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_1(1,4)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_1(2,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_1(2,4)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_1(3,4)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_1(4,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_1(4,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_1(4,1)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_1(3,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_1(3,1)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_1(2,1)=ind/sum(sum(aux(:,2:end)==1));

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

%quintiles - income mobility

%whole sample
wages=panel_wage_2_1;
decile=nan(size(wages,1),size(wages,2));

decile_20=prctile(wages(:),20);
decile_40=prctile(wages(:),40);
decile_60=prctile(wages(:),60);
decile_80=prctile(wages(:),80);

for i=1:size(wages,1)
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

matrix_2_1=zeros(4,4);

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_1(1,1)=counting/den;
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_1(2,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_1(3,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_1(4,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_1(5,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_1(2,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_1(3,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_1(4,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_1(5,1)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_1(3,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_1(4,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_1(5,2)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_1(4,3)=counting/den;
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_1(5,3)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_1(5,4)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_1(1,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_1(1,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_1(1,4)=counting/den;
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_1(1,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_1(2,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_1(2,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_1(2,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_1(3,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_1(3,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
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
fract_UB_2_1=fract_UB;
save('fract_FT_2_1.mat','fract_FT_2_1')
save('fract_PT_2_1.mat','fract_PT_2_1')
save('fract_MJ_2_1.mat','fract_MJ_2_1')
save('fract_NE_2_1.mat','fract_NE_2_1')
save('fract_UB_2_1.mat','fract_UB_2_1')
save('panel_wage_2_1.mat','panel_wage_2_1')

%% mobility class 2 wage class 2 
panel_mob=zeros(size(data_female.log_ave_wage,1),size(data_female.log_ave_wage,2));
panel_mob(fract_wcl==1,:)=NaN;
panel_mob(fract_mcl==1,:)=NaN;
aux=panel_mob;
panel_mob(isnan(aux(:,1))==1,:)=[];
%unvarying characteristics: ED2 ED3 year_birth year

exper=data_female.lmexp;
exper(isnan(aux(:,1))==1,:)=[];
yr=data_female.year;
yr(isnan(aux(:,1))==1,:)=[];
yr_birth=data_female.year_birth;
yr_birth(isnan(aux(:,1))==1,:)=[];
educ2=data_female.ED2;
educ2(isnan(aux(:,1))==1,:)=[];
educ3=data_female.ED3;
educ3(isnan(aux(:,1))==1,:)=[];
FT=data_female.FT;
FT(isnan(aux(:,1))==1,:)=[];
PT=data_female.PT;
PT(isnan(aux(:,1))==1,:)=[];
MJ=data_female.MJ;
MJ(isnan(aux(:,1))==1,:)=[];
NE=data_female.NE;
NE(isnan(aux(:,1))==1,:)=[];
empstate=data_female.empstate;
empstate(isnan(aux(:,1))==1,:)=[];

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
            prob_UB(i,j)=(par_year_birth*yr_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)).*fract_NE(i,j);
        else
            prob_UB(i,j)=(par_year_birth*yr_birth(i,1)+par_educ2*educ2(i,1)+par_educ2*educ3(i,1)...
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

panel_wage_2_2=panel_wage;
panel_mob_2_2=panel_mob;

st_tr_pr_2_2=zeros(4,4);

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_2(1,1)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_2(2,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_2(3,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_2(4,4)=ind/sum(sum(aux(:,2:end)==1));


ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_2(1,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_2(1,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_2(1,4)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_2(2,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_2(2,4)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr_2_2(3,4)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr_2_2(4,3)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_2(4,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_2(4,1)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr_2_2(3,2)=ind/sum(sum(aux(:,2:end)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_2(3,1)=ind/sum(sum(aux(:,2:end)==1));

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr_2_2(2,1)=ind/sum(sum(aux(:,2:end)==1));

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

%quintiles - income mobility

%whole sample
wages=panel_wage_2_2;
decile=nan(size(wages,1),size(wages,2));

decile_20=prctile(wages(:),20);
decile_40=prctile(wages(:),40);
decile_60=prctile(wages(:),60);
decile_80=prctile(wages(:),80);

for i=1:size(wages,1)
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

matrix_2_2=zeros(4,4);

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_2(1,1)=counting/den;
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_2(2,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_2(3,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_2(4,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_2(5,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_2(2,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_2(3,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_2(4,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_2(5,1)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_2(3,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_2(4,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_2(5,2)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix_2_2(4,3)=counting/den;
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_2(5,3)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix_2_2(5,4)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_2(1,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_2(1,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_2(1,4)=counting/den;
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix_2_2(1,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_2(2,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_2(2,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix_2_2(2,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_2(3,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix_2_2(3,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
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
fract_UB_2_2=fract_UB;
save('fract_FT_2_2.mat','fract_FT_2_2')
save('fract_PT_2_2.mat','fract_PT_2_2')
save('fract_MJ_2_2.mat','fract_MJ_2_2')
save('fract_NE_2_2.mat','fract_NE_2_2')
save('fract_UB_2_2.mat','fract_UB_2_2')
save('panel_wage_2_2.mat','panel_wage_2_2')

%% Whole Sample:

clear
load('fract_FT_2_2.mat','fract_FT_2_2')
load('fract_PT_2_2.mat','fract_PT_2_2')
load('fract_MJ_2_2.mat','fract_MJ_2_2')
load('fract_NE_2_2.mat','fract_NE_2_2')
load('panel_wage_2_2.mat','panel_wage_2_2')
load('fract_FT_1_2.mat','fract_FT_1_2')
load('fract_PT_1_2.mat','fract_PT_1_2')
load('fract_MJ_1_2.mat','fract_MJ_1_2')
load('fract_NE_1_2.mat','fract_NE_1_2')
load('panel_wage_1_2.mat','panel_wage_1_2')
load('fract_FT_2_1.mat','fract_FT_2_1')
load('fract_PT_2_1.mat','fract_PT_2_1')
load('fract_MJ_2_1.mat','fract_MJ_2_1')
load('fract_NE_2_1.mat','fract_NE_2_1')
load('panel_wage_2_1.mat','panel_wage_2_1')
load('fract_FT_1_1.mat','fract_FT_1_1')
load('fract_PT_1_1.mat','fract_PT_1_1')
load('fract_MJ_1_1.mat','fract_MJ_1_1')
load('fract_NE_1_1.mat','fract_NE_1_1')
load('panel_wage_1_1.mat','panel_wage_1_1')
load('fract_UB_1_1.mat','fract_UB_1_1')
load('fract_UB_1_2.mat','fract_UB_1_2')
load('fract_UB_2_1.mat','fract_UB_2_1')
load('fract_UB_2_2.mat','fract_UB_2_2')

%State Mobility:

fract_FT=[fract_FT_1_1;fract_FT_1_2;fract_FT_2_1;fract_FT_2_2];
fract_PT=[fract_PT_1_1;fract_PT_1_2;fract_PT_2_1;fract_PT_2_2];
fract_MJ=[fract_MJ_1_1;fract_MJ_1_2;fract_MJ_2_1;fract_MJ_2_2];
fract_NE=[fract_NE_1_1;fract_NE_1_2;fract_NE_2_1;fract_NE_2_2];
fract_UB=[fract_UB_1_1;fract_UB_1_2;fract_UB_2_1;fract_UB_2_2];

%Initial State %s
perc_FT=nanmean(fract_FT(:,1));
perc_PT=nanmean(fract_PT(:,1));
perc_MJ=nanmean(fract_MJ(:,1));
perc_NE=nanmean(fract_NE(:,1));
disp('Labour Market Initial State %s - Sample Simulation')
['Initial States'' %: ' num2str(100*perc_FT,'%4.0f') '&' num2str(100*perc_PT,'%4.0f') '&' num2str(100*perc_MJ,'%4.0f') '&' num2str(100*perc_NE,'%4.0f')]
%State %s
perc_FT=nanmean(fract_FT(:));
perc_PT=nanmean(fract_PT(:));
perc_MJ=nanmean(fract_MJ(:));
perc_NE=nanmean(fract_NE(:));
disp('Labour Market State''s - Sample Simulation')
['Subsequent States'' %: ' num2str(100*perc_FT,'%4.0f') '&' num2str(100*perc_PT,'%4.0f') '&' num2str(100*perc_MJ,'%4.0f') '&' num2str(100*perc_NE,'%4.0f')]


st_tr_pr=zeros(4,4);
yr=fract_FT;
%NE current state
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_NE(i,j-1)==1%column here is the current state
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr(1,4)=ind/sum(sum(aux(:,1:end-1)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr(2,4)=ind/sum(sum(aux(:,1:end-1)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr(3,4)=ind/sum(sum(aux(:,1:end-1)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_NE(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_NE)==1;
st_tr_pr(4,4)=ind/sum(sum(aux(:,1:end-1)==1));

%MJ Current State

ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr(1,3)=ind/sum(sum(aux(:,1:end-1)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr(2,3)=ind/sum(sum(aux(:,1:end-1)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr(3,3)=ind/sum(sum(aux(:,1:end-1)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_MJ)==1;
st_tr_pr(4,3)=ind/sum(sum(aux(:,1:end-1)==1));

%PT current state
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr(1,2)=ind/sum(sum(aux(:,1:end-1)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr(2,2)=ind/sum(sum(aux(:,1:end-1)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr(3,2)=ind/sum(sum(aux(:,1:end-1)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_PT)==1;
st_tr_pr(4,2)=ind/sum(sum(aux(:,1:end-1)==1));

%FT current state
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_FT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr(1,1)=ind/sum(sum(aux(:,1:end-1)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_PT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr(2,1)=ind/sum(sum(aux(:,1:end-1)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_MJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr(3,1)=ind/sum(sum(aux(:,1:end-1)==1));
ind=0;
for i=1:size(fract_FT,1)
    for j=2:size(fract_FT,2)
        if fract_NE(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end
aux=(fract_FT)==1;
st_tr_pr(4,1)=ind/sum(sum(aux(:,1:end-1)==1));





st_tr_pr=st_tr_pr';

disp('Labour Market State Transitions - Sample Simulation')
['FT: ' num2str(100*st_tr_pr(1,1),'%4.0f') '&' num2str(100*st_tr_pr(1,2),'%4.0f') '&' num2str(100*st_tr_pr(1,3),'%4.0f') '&' num2str(100*st_tr_pr(1,4),'%4.0f')]
['PT: ' num2str(100*st_tr_pr(2,1),'%4.0f') '&' num2str(100*st_tr_pr(2,2),'%4.0f') '&' num2str(100*st_tr_pr(2,3),'%4.0f') '&' num2str(100*st_tr_pr(2,4),'%4.0f')]
['MJ: ' num2str(100*st_tr_pr(3,1),'%4.0f') '&' num2str(100*st_tr_pr(3,2),'%4.0f') '&' num2str(100*st_tr_pr(3,3),'%4.0f') '&' num2str(100*st_tr_pr(3,4),'%4.0f')]
['NE: ' num2str(100*st_tr_pr(4,1),'%4.0f') '&' num2str(100*st_tr_pr(4,2),'%4.0f') '&' num2str(100*st_tr_pr(4,3),'%4.0f') '&' num2str(100*st_tr_pr(4,4),'%4.0f')]

%Income Mobility:

wages=[panel_wage_1_1;panel_wage_1_2;panel_wage_2_1;panel_wage_2_2];
decile=nan(size(wages,1),size(wages,2));

decile_20=prctile(wages(:),20);
decile_40=prctile(wages(:),40);
decile_60=prctile(wages(:),60);
decile_80=prctile(wages(:),80);

for i=1:size(wages,1)
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

matrix=zeros(4,4);

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix(1,1)=counting/den;
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix(2,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix(3,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix(4,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix(5,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix(2,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix(3,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix(4,1)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==1 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix(5,1)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix(3,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix(4,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix(5,2)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==4
            counting=counting+1;
        end
    end
end
matrix(4,3)=counting/den;
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix(5,3)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==5
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==5
            counting=counting+1;
        end
    end
end
matrix(5,4)=counting/den;

den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==2 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix(1,2)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix(1,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==1
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix(1,4)=counting/den;
%
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==1
            counting=counting+1;
        end
    end
end
matrix(1,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==3 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix(2,3)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix(2,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==2
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==2
            counting=counting+1;
        end
    end
end
matrix(2,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==4 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix(3,4)=counting/den;
%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==3
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j)==5 && decile(i,j-1)==3
            counting=counting+1;
        end
    end
end
matrix(3,5)=counting/den;

%
den=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if decile(i,j-1)==4
            den=den+1;
        end
    end
end
counting=0;
for i=1:size(wages,1)
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

disp('Wage Moments - Sample Simulation')
average=nanmean(wages(:));
std_dev=nanvar(wages(:));
std_dev=sqrt(std_dev);
%
wages_FT=nan(size(wages,1),size(wages,2));
for i=1:size(wages,1)
    for j=1:size(wages,2)
        if fract_FT(i,j)==1
            wages_FT(i,j)=wages(i,j);
        end
    end
end
average_FT=nanmean(wages_FT(:));
std_dev_FT=nanvar(wages_FT(:));
std_dev_FT=sqrt(std_dev_FT);
%
wages_PT=nan(size(wages,1),size(wages,2));
for i=1:size(wages,1)
    for j=1:size(wages,2)
        if fract_PT(i,j)==1
            wages_PT(i,j)=wages(i,j);
        end
    end
end
average_PT=nanmean(wages_PT(:));
std_dev_PT=nanvar(wages_PT(:));
std_dev_PT=sqrt(std_dev_PT);
%
wages_MJ=nan(size(wages,1),size(wages,2));
for i=1:size(wages,1)
    for j=1:size(wages,2)
        if fract_MJ(i,j)==1
            wages_MJ(i,j)=wages(i,j);
        end
    end
end
average_MJ=nanmean(wages_MJ(:));
std_dev_MJ=nanvar(wages_MJ(:));
std_dev_MJ=sqrt(std_dev_MJ);
%
wages_NE=nan(size(wages,1),size(wages,2));
for i=1:size(wages,1)
    for j=1:size(wages,2)
        if fract_UB(i,j)==1
            wages_NE(i,j)=wages(i,j);
        end
    end
end
average_NE=nanmean(wages_NE(:));
std_dev_NE=nanvar(wages_NE(:));
std_dev_NE=sqrt(std_dev_NE);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_FT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_FT_FT=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_FT(i,j)==1 && fract_FT(i,j-1)==1
            wages_FT_FT(q,1)=wages(i,j-1);
            wages_FT_FT(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_FT_FT=corrcoef(wages_FT_FT);


%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_FT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_PT_FT=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_FT(i,j)==1 && fract_PT(i,j-1)==1
            wages_PT_FT(q,1)=wages(i,j-1);
            wages_PT_FT(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_PT_FT=corrcoef(wages_PT_FT);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_FT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_MJ_FT=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_FT(i,j)==1 && fract_MJ(i,j-1)==1
            wages_MJ_FT(q,1)=wages(i,j-1);
            wages_MJ_FT(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_MJ_FT=corrcoef(wages_MJ_FT);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_FT(i,j)==1 && fract_UB(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_NE_FT=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_FT(i,j)==1 && fract_UB(i,j-1)==1
            wages_NE_FT(q,1)=wages(i,j-1);
            wages_NE_FT(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_NE_FT=corrcoef(wages_NE_FT);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_PT(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_PT_PT=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_PT(i,j)==1 && fract_PT(i,j-1)==1
            wages_PT_PT(q,1)=wages(i,j-1);
            wages_PT_PT(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_PT_PT=corrcoef(wages_PT_PT);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_PT(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_FT_PT=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_PT(i,j)==1 && fract_FT(i,j-1)==1
            wages_FT_PT(q,1)=wages(i,j-1);
            wages_FT_PT(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_FT_PT=corrcoef(wages_FT_PT);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_PT(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_MJ_PT=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_PT(i,j)==1 && fract_MJ(i,j-1)==1
            wages_MJ_PT(q,1)=wages(i,j-1);
            wages_MJ_PT(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_MJ_PT=corrcoef(wages_MJ_PT);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_PT(i,j)==1 && fract_UB(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_NE_PT=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_PT(i,j)==1 && fract_UB(i,j-1)==1
            wages_NE_PT(q,1)=wages(i,j-1);
            wages_NE_PT(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_NE_PT=corrcoef(wages_NE_PT);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_MJ(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_MJ_MJ=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_MJ(i,j)==1 && fract_MJ(i,j-1)==1
            wages_MJ_MJ(q,1)=wages(i,j-1);
            wages_MJ_MJ(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_MJ_MJ=corrcoef(wages_MJ_MJ);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_MJ(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_FT_MJ=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_MJ(i,j)==1 && fract_FT(i,j-1)==1
            wages_FT_MJ(q,1)=wages(i,j-1);
            wages_FT_MJ(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_FT_MJ=corrcoef(wages_FT_MJ);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_MJ(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_PT_MJ=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_MJ(i,j)==1 && fract_PT(i,j-1)==1
            wages_PT_MJ(q,1)=wages(i,j-1);
            wages_PT_MJ(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_PT_MJ=corrcoef(wages_PT_MJ);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_MJ(i,j)==1 && fract_UB(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_NE_MJ=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_MJ(i,j)==1 && fract_UB(i,j-1)==1
            wages_NE_MJ(q,1)=wages(i,j-1);
            wages_NE_MJ(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_NE_MJ=corrcoef(wages_NE_MJ);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_UB(i,j)==1 && fract_UB(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_NE_NE=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_UB(i,j)==1 && fract_UB(i,j-1)==1
            wages_NE_NE(q,1)=wages(i,j-1);
            wages_NE_NE(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_NE_NE=corrcoef(wages_NE_NE);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_UB(i,j)==1 && fract_FT(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_FT_NE=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_UB(i,j)==1 && fract_FT(i,j-1)==1
            wages_FT_NE(q,1)=wages(i,j-1);
            wages_FT_NE(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_FT_NE=corrcoef(wages_FT_NE);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_UB(i,j)==1 && fract_PT(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_PT_NE=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_UB(i,j)==1 && fract_PT(i,j-1)==1
            wages_PT_NE(q,1)=wages(i,j-1);
            wages_PT_NE(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_PT_NE=corrcoef(wages_PT_NE);

%
ind=0;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_UB(i,j)==1 && fract_MJ(i,j-1)==1
            ind=ind+1;
        end
    end
end

wages_MJ_NE=nan(ind,2);
q=1;
for i=1:size(wages,1)
    for j=2:size(wages,2)
        if fract_UB(i,j)==1 && fract_MJ(i,j-1)==1
            wages_MJ_NE(q,1)=wages(i,j-1);
            wages_MJ_NE(q,2)=wages(i,j);
            q=q+1;
        end
    end
end
corr_MJ_NE=corrcoef(wages_MJ_NE);

['Mean: ' num2str(average,'%4.2f') '&' num2str(average_FT,'%4.2f') '&' num2str(average_PT,'%4.2f') '&' num2str(average_MJ,'%4.2f') '&' num2str(average_NE,'%4.2f')]
['Std. Dev.: ' num2str(std_dev,'%4.2f') '&' num2str(std_dev_FT,'%4.2f') '&' num2str(std_dev_PT,'%4.2f') '&' num2str(std_dev_MJ,'%4.2f') '&' num2str(std_dev_NE,'%4.2f')]
['ACR_FT: ' num2str(corr_FT_FT(1,2),'%4.2f') '&' num2str(corr_PT_FT(1,2),'%4.2f') '&' num2str(corr_MJ_FT(1,2),'%4.2f') '&' num2str(corr_NE_FT(1,2),'%4.2f') ]
['ACR_PT: ' num2str(corr_FT_PT(1,2),'%4.2f') '&' num2str(corr_PT_PT(1,2),'%4.2f') '&' num2str(corr_MJ_PT(1,2),'%4.2f') '&' num2str(corr_NE_PT(1,2),'%4.2f') ]
['ACR_MJ: ' num2str(corr_FT_MJ(1,2),'%4.2f') '&' num2str(corr_PT_MJ(1,2),'%4.2f') '&' num2str(corr_MJ_MJ(1,2),'%4.2f') '&' num2str(corr_NE_MJ(1,2),'%4.2f') ]
['ACR_NE: ' num2str(corr_FT_NE(1,2),'%4.2f') '&' num2str(corr_PT_NE(1,2),'%4.2f') '&' num2str(corr_MJ_NE(1,2),'%4.2f') '&' num2str(corr_NE_NE(1,2),'%4.2f')]
%% CS distribution

model_empstate=nan(size(wages,1),size(wages,2));
for i=1:size(wages,1)
    for j=1:size(wages,2)
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
empstate_19992002_female=model_empstate;
save('empstate_19992002_female.mat','empstate_19992002_female')
wages_19992002_female=wages;
save('wages_19992002_female.mat','wages_19992002_female')

load('data_female.mat','data_female')
x = 2:0.5:12;

A=data_female.log_ave_wage;
int=data_female.NE==1;
int2=data_female.UB==0;
int3=int.*int2;
% int=UB==0.*NE==1;
A(int3==1)=NaN;
A=(A(~isnan(A)));
B=wages;
B=(B(~isnan(B)));

data_log_ave_wage = fitdist(A,'Normal');
simul_log_ave_wage = fitdist(B,'Normal');

figure
hold on
plot(x,pdf(data_log_ave_wage,x))
hold on
plot(x,pdf(simul_log_ave_wage,x))
title('1999-2002')
xlabel('Log Ave Wage')
hold off
legend('Data','Model')
print('dist_19992002_Female','-dpng')

%
data_wage_FT=nan(size(data_female.log_ave_wage,1),size(data_female.log_ave_wage,2));
for i=1:size(data_female.log_ave_wage,1)
    for j=1:size(data_female.log_ave_wage,2)
        if data_female.empstate(i,j)==1
            data_wage_FT(i,j)=data_female.log_ave_wage(i,j);
        end
    end
end
data_wage_PT=nan(size(data_female.log_ave_wage,1),size(data_female.log_ave_wage,2));
for i=1:size(data_female.log_ave_wage,1)
    for j=1:size(data_female.log_ave_wage,2)
        if data_female.empstate(i,j)==2
            data_wage_PT(i,j)=data_female.log_ave_wage(i,j);
        end
    end
end
data_wage_MJ=nan(size(data_female.log_ave_wage,1),size(data_female.log_ave_wage,2));
for i=1:size(data_female.log_ave_wage,1)
    for j=1:size(data_female.log_ave_wage,2)
        if data_female.empstate(i,j)==3
            data_wage_MJ(i,j)=data_female.log_ave_wage(i,j);
        end
    end
end
data_wage_NE=nan(size(data_female.log_ave_wage,1),size(data_female.log_ave_wage,2));
for i=1:size(data_female.log_ave_wage,1)
    for j=1:size(data_female.log_ave_wage,2)
        if data_female.empstate(i,j)==4 && data_female.UB(i,j)==1
            data_wage_NE(i,j)=data_female.log_ave_wage(i,j);
        end
    end
end
%
simul_wage_FT=nan(size(data_female.log_ave_wage,1),size(data_female.log_ave_wage,2));
for i=1:size(data_female.log_ave_wage,1)
    for j=1:size(data_female.log_ave_wage,2)
        if fract_FT(i,j)==1
            simul_wage_FT(i,j)=wages(i,j);
        end
    end
end
simul_wage_PT=nan(size(data_female.log_ave_wage,1),size(data_female.log_ave_wage,2));
for i=1:size(data_female.log_ave_wage,1)
    for j=1:size(data_female.log_ave_wage,2)
        if fract_PT(i,j)==1
            simul_wage_PT(i,j)=wages(i,j);
        end
    end
end
simul_wage_MJ=nan(size(data_female.log_ave_wage,1),size(data_female.log_ave_wage,2));
for i=1:size(data_female.log_ave_wage,1)
    for j=1:size(data_female.log_ave_wage,2)
        if fract_MJ(i,j)==1
            simul_wage_MJ(i,j)=wages(i,j);
        end
    end
end
simul_wage_NE=nan(size(data_female.log_ave_wage,1),size(data_female.log_ave_wage,2));
for i=1:size(data_female.log_ave_wage,1)
    for j=1:size(data_female.log_ave_wage,2)
        if fract_UB(i,j)==1
            simul_wage_NE(i,j)=wages(i,j);
        end
    end
end
%FT
A=data_wage_FT;
A=(A(~isnan(A)));
B=simul_wage_FT;
B=(B(~isnan(B)));

data_log_ave_wage = fitdist(A,'Normal');
simul_log_ave_wage = fitdist(B,'Normal');

figure
hold on
plot(x,pdf(data_log_ave_wage,x))
hold on
plot(x,pdf(simul_log_ave_wage,x))
title('1999-2002 Wage Distribution, FT')
xlabel('Log Ave Wage')
hold off
legend('Data','Model')
print('dist_19992002_FT_Female','-dpng')
%PT
A=data_wage_PT;
A=(A(~isnan(A)));
B=simul_wage_PT;
B=(B(~isnan(B)));

data_log_ave_wage = fitdist(A,'Normal');
simul_log_ave_wage = fitdist(B,'Normal');

figure
hold on
plot(x,pdf(data_log_ave_wage,x))
hold on
plot(x,pdf(simul_log_ave_wage,x))
title('1999-2002 Wage Distribution, PT')
xlabel('Log Ave Wage')
hold off
legend('Data','Model')
print('dist_19992002_PT_Female','-dpng')
%MJ
A=data_wage_MJ;
A=(A(~isnan(A)));
B=simul_wage_MJ;
B=(B(~isnan(B)));

data_log_ave_wage = fitdist(A,'Normal');
simul_log_ave_wage = fitdist(B,'Normal');

figure
hold on
plot(x,pdf(data_log_ave_wage,x))
hold on
plot(x,pdf(simul_log_ave_wage,x))
title('1999-2002 Wage Distribution, MJ')
xlabel('Log Ave Wage')
hold off
legend('Data','Model')
print('dist_19992002_MJ_Female','-dpng')
%NE
A=data_wage_NE;
A=(A(~isnan(A)));
B=simul_wage_NE;
B=(B(~isnan(B)));

data_log_ave_wage = fitdist(A,'Normal');
simul_log_ave_wage = fitdist(B,'Normal');

figure
hold on
plot(x,pdf(data_log_ave_wage,x))
hold on
plot(x,pdf(simul_log_ave_wage,x))
title('1999-2002 Wage Distribution, UB')
xlabel('Log Ave Wage')
hold off
legend('Data','Model')
print('dist_19992002_NE_Female','-dpng')

%To FT
%Scatter FT_FT
figure
hold on
scatter(wages_FT_FT(:,1),wages_FT_FT(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('FT to FT','Linear Fit')
print('ACR_19992002_FT_FT_Female','-dpng')

%Scatter PT_FT
figure
hold on
scatter(wages_PT_FT(:,1),wages_PT_FT(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('PT to FT','Linear Fit')
print('ACR_19992002_PT_FT_Female','-dpng')

%Scatter MJ_FT
figure
hold on
scatter(wages_MJ_FT(:,1),wages_MJ_FT(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('MJ to FT','Linear Fit')
print('ACR_19992002_MJ_FT_Female','-dpng')

%Scatter NE_FT
figure
hold on
scatter(wages_NE_FT(:,1),wages_NE_FT(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('NE to FT','Linear Fit')
print('ACR_19992002_NE_FT_Female','-dpng')

%To PT
%Scatter FT_PT
figure
hold on
scatter(wages_FT_PT(:,1),wages_FT_PT(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('FT to PT','Linear Fit')
print('ACR_19992002_FT_PT_Female','-dpng')

%Scatter PT_PT
figure
hold on
scatter(wages_PT_PT(:,1),wages_PT_PT(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('PT to PT','Linear Fit')
print('ACR_19992002_PT_PT_Female','-dpng')

%Scatter MJ_PT
figure
hold on
scatter(wages_MJ_PT(:,1),wages_MJ_PT(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('MJ to PT')
print('ACR_19992002_MJ_PT_Female','-dpng')

%Scatter NE_PT
figure
hold on
scatter(wages_NE_PT(:,1),wages_NE_PT(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('NE to PT','Linear Fit')
print('ACR_19992002_NE_PT_Female','-dpng')

%To MJ
%Scatter FT_MJ
figure
hold on
scatter(wages_FT_MJ(:,1),wages_FT_MJ(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('FT to MJ')
print('ACR_19992002_FT_MJ_Female','-dpng')

%Scatter PT_FT
figure
hold on
scatter(wages_PT_MJ(:,1),wages_PT_MJ(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('PT to MJ','Linear Fit')
print('ACR_19992002_PT_MJ_Female','-dpng')

%Scatter MJ_MJ
figure
hold on
scatter(wages_MJ_MJ(:,1),wages_MJ_MJ(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('MJ to MJ')
print('ACR_19992002_MJ_MJ_Female','-dpng')

%Scatter NE_MJ
figure
hold on
scatter(wages_NE_MJ(:,1),wages_NE_MJ(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('NE to MJ','Linear Fit')
print('ACR_19992002_NE_MJ_Female','-dpng')

%To NE
%Scatter FT_NE
figure
hold on
scatter(wages_FT_NE(:,1),wages_FT_NE(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('FT to NE','Linear Fit')
print('ACR_19992002_FT_NE_Female','-dpng')

%Scatter PT_NE
figure
hold on
scatter(wages_PT_NE(:,1),wages_PT_NE(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('PT to NE','Linear Fit')
print('ACR_19992002_PT_NE_Female','-dpng')

%Scatter MJ_NE
figure
hold on
scatter(wages_MJ_NE(:,1),wages_MJ_NE(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('MJ to NE','Linear Fit')
print('ACR_19992002_MJ_NE_Female','-dpng')

%Scatter NE_NE
figure
hold on
scatter(wages_NE_NE(:,1),wages_NE_NE(:,2))
title('1999-2002')
axis([3 12 3 12]);
hold off
h = lsline;
set(h(1),'color','r','LineWidth',2)
legend('NE to NE','Linear Fit')
print('ACR_19992002_NE_NE_Female','-dpng')

%%
beep on
disp('Finished!')