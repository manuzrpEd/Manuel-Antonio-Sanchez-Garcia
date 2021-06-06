%matlab -nodisplay -nojvm -nosplash -nodesktop -noFigureWindows -r "try; run('\estimation.m'); catch; end; quit"
cd '\MonthlyIncome\2005-2009'
clc
clear
close all
clear mex
disp('Estimation Females 2005-2009')
%-2.99777e+06 

load('data_female.mat','data_female')

% load('phat_female_wage.mat','phat_female_wage')
% load('phat_female_income.mat','phat_female_income')
% par0=[phat_female_income; phat_female_wage];

% INITIAL PARAMETER VALUES from whole sample estimation!
% load('phat_male.mat','phat_male')%this is from the whole sample estimation! only loaded for the first estimation of 1999-2002
load('phat_female.mat','phat_female')%this is from the whole sample estimation! only loaded for the first estimation of 1999-2002
% par0=phat_male;
par0=zeros(1,1);
% % iniPT
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
par0(21,1)=phat_female(21,1);%cons
par0(22,1)=phat_female(22,1);%lmexp
par0(23,1)=phat_female(23,1);%ed2
par0(24,1)=phat_female(24,1);%ed3
par0(25,1)=phat_female(25,1);%PT
par0(26,1)=phat_female(26,1);%MJ
par0(27,1)=phat_female(27,1);%NE
par0(28,1)=phat_female(28,1);%CJ
par0(29,1)=phat_female(29,1);%mcl2
% %MJ
par0(30,1)=phat_female(30,1);
par0(31,1)=phat_female(31,1);
par0(32,1)=phat_female(32,1);
par0(33,1)=phat_female(33,1);
par0(34,1)=phat_female(34,1);%PT
par0(35,1)=phat_female(35,1);%MJ
par0(36,1)=phat_female(36,1);%NE
par0(37,1)=phat_female(37,1);%CJ
par0(38,1)=phat_female(38,1);%mcl2
% %NE
par0(39,1)=phat_female(39,1);
par0(40,1)=phat_female(40,1);
par0(41,1)=phat_female(41,1);
par0(42,1)=phat_female(42,1);
par0(43,1)=phat_female(43,1);%PT
par0(44,1)=phat_female(44,1);%MJ
par0(45,1)=phat_female(45,1);%NE
par0(46,1)=phat_female(46,1);%CJ
par0(47,1)=phat_female(47,1);%mcl2
% %CJ
par0(48,1)=phat_female(48,1);
par0(49,1)=phat_female(49,1);
par0(50,1)=phat_female(50,1);
par0(51,1)=phat_female(51,1);
par0(52,1)=phat_female(52,1);%PT
par0(53,1)=phat_female(53,1);%MJ
par0(54,1)=phat_female(54,1);%NE
par0(55,1)=phat_female(55,1);%CJ
par0(56,1)=phat_female(56,1);%mcl2
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
par0(70,1)=phat_female(70,1);%cons-1
par0(71,1)=phat_female(71,1);%lmexp0
par0(72,1)=phat_female(72,1);%PT0.3
par0(73,1)=phat_female(73,1);%MJ-0.2
par0(74,1)=phat_female(74,1);%NE-0.3
par0(75,1)=phat_female(75,1);%CJ-0.6
par0(76,1)=phat_female(76,1);%wcl0
% %tau1
% par0(58:72,1)=phat_female(58:72,1);
par0(77,1)=phat_female(77,1);%constant
par0(78,1)=phat_female(78,1);%age profile
par0(79,1)=phat_female(79,1);%wcl2
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
%
% par0(78:99,1)=0;
% %wcl
par0(100,1)=phat_female(100,1);%cons
par0(101,1)=phat_female(101,1);%year_birth
par0(102,1)=phat_female(102,1);%ED2
par0(103,1)=phat_female(103,1);%ED3
%
par_inc=par0(61:end,1);
% par_inc=par0(61:76,1);
% par_inc=[par_inc; par0(100:103,1)];

%
% tic
initial_loglik=loglik_income(par_inc,data_female.npeople,data_female.year_birth,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
                    data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ...
                    ,data_female.UB)

% initial_loglik=loglik_income(par_inc,par0,data_female.npeople,data_female.year_birth,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
%                     data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE...
%                     ,data_female.lFT,data_female.lPT,data_female.lMJ,data_female.lNE)
% toc
% tic
% initial_loglik=loglik(par0,data_female.npeople,data_female.year_birth,data_female.year,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
%                     data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ)
% toc
% LIKELIHOOD MAXIMIZATION
%------------------------
% options_fminunc = optimset('Display','iter','LargeScale','off','MaxIter',100,'MaxFunEval',20000,'TolX',1e-6,'TolFun',1e-4,'Algorithm','sqp');
%,'CompleteSearch','true','CompletePoll','on','TolMesh',1e-6
ub=zeros(size(par_inc,1),1);
ub(1:end,1)=Inf;
lb=zeros(size(par_inc,1),1);
lb(1:end,1)=-Inf;
% %
lb(4,1)=-0.5;%mean exp
ub(4,1)=0.5;
lb(11,1)=-0.5;%std exp
ub(11,1)=0.5;
lb(17,1)=-10;%constant acr1
ub(17,1)=-3;
lb(18,1)=-2;%age profile constant
ub(18,1)=+2;
lb(19:39,1)=-4;
ub(19:39,1)=5;
%type 2 unobserved
lb(40:43,1)=-2;
ub(40:43,1)=2;
%
% options_pattern = optimoptions('patternsearch','Display','iter','MaxIter',40000,'MaxFunEval',40000,'AccelerateMesh',true,'UseCompletePoll',true,'UseCompleteSearch',true);
% options_pattern = optimoptions('patternsearch','Display','iter','MaxIter',10,'MaxFunEval',10,'InitialMeshSize',1);%,'AccelerateMesh',true
% options_ga = optimoptions('ga','Display','iter');
% options_simulannealbnd = optimoptions('simulannealbnd','Display','iter','InitialTemperature',0.1,'MaxFunctionEvaluations',50000,'MaxTime',86000,'TolFun',1e-6,'MaxIterations',50000);
options_fminsearch = optimset('Display','iter','MaxFunEvals',1000,'MaxIter',1000,'TolFun',1e-6,'TolX',1e-6);

%xx=fminunc(@loglikred,[0;0],options,par0);
% phat_female=[par0(1:71);xx;par0(88:101)];

% phat_female=fminunc(@(x) loglik(x,data_female.npeople,data_female.year_birth,data_female.year,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
%                     data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ),par0,options_fminunc);
% phat_female=patternsearch(@(x) loglik(x,data_female.npeople,data_female.year_birth,data_female.year,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
%                     data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ),par0,[],[],[],[],[],[],[],options_pattern);
% phat_female=ga(@(x) loglik(x,data_female.npeople,data_female.year_birth,data_female.year,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
%                     data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ),length(par0),[],[],[],[],[],[],[],[],options_ga);
                
% phat_female_income=simulannealbnd(@(x) loglik_income(x,par0,data_female.npeople,data_female.year_birth,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
%                     data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE...
%                     ,data_female.CJ,data_female.UB),par_inc,[],[],options_simulannealbnd);
phat_female_income=fminsearch(@(x) loglik_income(x,data_female.npeople,data_female.year_birth,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
                    data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE...
                    ,data_female.CJ,data_female.UB),par_inc,options_fminsearch);
% phat_female_income=patternsearch(@(x) loglik_income(x,data_female.npeople,data_female.year_birth,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
%                     data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ...
%                     ,data_female.UB),par_inc,[],[],[],[],lb,ub,[],options_pattern);
phat_female=par0;
phat_female(61:end,1)=phat_female_income(1:end,1);
% phat_female(61:76,1)=phat_female_income(1:16,1);
% phat_female(100:end,1)=phat_female_income(17:end,1);
save('phat_female.mat','phat_female')

% phat_female_income=phat_female(1:55);
% phat_female_wage=phat_female(56:end);
% save('phat_female_income.mat','phat_female_income')
% save('phat_female_wage.mat','phat_female_wage')

% phat_female=par0;
%{
% COMPUTATION OF STANDARD ERRORS
%-------------------------------
global NPEOPLE  PID;
lplus=zeros(length(phat_female),NPEOPLE);
l=loglikvec(phat_female).';
disp('-> COMPUTING SCORES FOR COVARIANCE MATRIX...');
for i=1:length(phat_female);
	dx=zeros(size(phat_female));
	dx(i)=1e-6;%only change in parameter i!!
	lplus(i,:)=loglikvec(phat_female+dx).';
    clear dx;
end;
score=(lplus-repmat(l,length(phat_female),1))/1e-6;
info=score*score.';
sdhat=sqrt(diag(inv(info)));

pariniu=[phat_female(1:7),sdhat(1:7),phat_female(1:7)./sdhat(1:7)].'
parinipub=[phat_female(8:14),sdhat(8:14),phat_female(8:14)./sdhat(8:14)].'
parunemp=[phat_female(15:23),sdhat(15:23),phat_female(15:23)./sdhat(15:23)].'
parpub=[phat_female(24:32),sdhat(24:32),phat_female(24:32)./sdhat(24:32)].'
parmu=[phat_female(33:52),sdhat(33:52),phat_female(33:52)./sdhat(33:52)].'
parsigma=[phat_female(53:59),sdhat(53:59),phat_female(53:59)./sdhat(53:59)].'
partau1=[phat_female(60:65),sdhat(60:65),phat_female(60:65)./sdhat(60:65),phat_female(66:71),sdhat(66:71),phat_female(66:71)./sdhat(66:71)].'
partau2=[phat_female(72),sdhat(72),phat_female(72)./sdhat(72),phat_female(73),sdhat(73),phat_female(73)./sdhat(73)].'
parwcl=[phat_female(74:79),sdhat(74:79),phat_female(74:79)./sdhat(74:79)].'
parmcl=[phat_female(80:87),sdhat(80:87),phat_female(80:87)./sdhat(80:87)].'

% GENERATE EM WEIGHTS
%--------------------
weights=EMweights(phat_female);

denomw=sum(sum(weights,3),2);
w11=squeeze(weights(:,1,1))./denomw;
w12=squeeze(weights(:,1,2))./denomw;
w13=squeeze(weights(:,1,3))./denomw;
w21=squeeze(weights(:,2,1))./denomw;
w22=squeeze(weights(:,2,2))./denomw;
w23=squeeze(weights(:,2,3))./denomw;

outputlist=[PID w11 w12 w13 w21 w22 w23];
save MLoutput.raw outputlist -ASCII;
%}
beep on
disp('Finished!')
