%matlab -nodisplay -nojvm -nosplash -nodesktop -noFigureWindows -r "try; run('\estimation.m'); catch; end; quit"
cd '\MonthlyIncome\2005-2009'
clc
clear
close all
clear mex
disp('Estimation Males 2005-2009')
%-2.41285e+06  Ok so far...
%-2.39833e+06 not weighting by individual employment length
%-2.52829e+06 convergence
%-2.42009e+06
%-2.40139e+06 simmulated annealing
%-3.11092e+06

load('data_male.mat','data_male')

% load('phat_male_wage.mat','phat_male_wage')
% load('phat_male_income.mat','phat_male_income')
% par0=[phat_male_income; phat_male_wage];

% INITIAL PARAMETER VALUES from whole sample estimation!
load('phat_male.mat','phat_male')%this is from the whole sample estimation! only loaded for the first estimation of 1999-2002
% % par0=phat_male;
par0=zeros(1,1);
% % iniPT
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
% %iniCJ
par0(16,1)=phat_male(16,1);
par0(17,1)=phat_male(17,1);
par0(18,1)=phat_male(18,1);
par0(19,1)=phat_male(19,1);
par0(20,1)=phat_male(20,1);
% %PT 
par0(21,1)=phat_male(21,1);%cons
par0(22,1)=phat_male(22,1);%lmexp
par0(23,1)=phat_male(23,1);%ed2
par0(24,1)=phat_male(24,1);%ed3
par0(25,1)=phat_male(25,1);%PT
par0(26,1)=phat_male(26,1);%MJ
par0(27,1)=phat_male(27,1);%NE
par0(28,1)=phat_male(28,1);%CJ
par0(29,1)=phat_male(29,1);%mcl2
% %MJ
par0(30,1)=phat_male(30,1);
par0(31,1)=phat_male(31,1);
par0(32,1)=phat_male(32,1);
par0(33,1)=phat_male(33,1);
par0(34,1)=phat_male(34,1);%PT
par0(35,1)=phat_male(35,1);%MJ
par0(36,1)=phat_male(36,1);%NE
par0(37,1)=phat_male(37,1);%CJ
par0(38,1)=phat_male(38,1);%mcl2
% %NE
par0(39,1)=phat_male(39,1);
par0(40,1)=phat_male(40,1);
par0(41,1)=phat_male(41,1);
par0(42,1)=phat_male(42,1);
par0(43,1)=phat_male(43,1);%PT
par0(44,1)=phat_male(44,1);%MJ
par0(45,1)=phat_male(45,1);%NE
par0(46,1)=phat_male(46,1);%CJ
par0(47,1)=phat_male(47,1);%mcl2
% %CJ
par0(48,1)=phat_male(48,1);
par0(49,1)=phat_male(49,1);
par0(50,1)=phat_male(50,1);
par0(51,1)=phat_male(51,1);
par0(52,1)=phat_male(52,1);%PT
par0(53,1)=phat_male(53,1);%MJ
par0(54,1)=phat_male(54,1);%NE
par0(55,1)=phat_male(55,1);%CJ
par0(56,1)=phat_male(56,1);%mcl2
% %mcl
par0(57,1)=phat_male(57,1);%cons
par0(58,1)=phat_male(58,1);%year_birth
par0(59,1)=phat_male(59,1);%ED2
par0(60,1)=phat_male(60,1);%ED3
% %mu
par0(61,1)=phat_male(61,1);%cons
par0(62,1)=phat_male(62,1);%ED2
par0(63,1)=phat_male(63,1);%ED3
par0(64,1)=phat_male(64,1);%lmexp
par0(65,1)=phat_male(65,1);%PT
par0(66,1)=phat_male(66,1);%MJ
par0(67,1)=phat_male(67,1);%NE
par0(68,1)=phat_male(68,1);%CJ
par0(69,1)=phat_male(69,1);%wcl
% %sigma
par0(70,1)=phat_male(70,1);%cons-1
par0(71,1)=phat_male(71,1);%lmexp0
par0(72,1)=phat_male(72,1);%PT0.3
par0(73,1)=phat_male(73,1);%MJ-0.2
par0(74,1)=phat_male(74,1);%NE-0.3
par0(75,1)=phat_male(75,1);%CJ-0.6
par0(76,1)=phat_male(76,1);%wcl0
% %tau1
% par0(58:72,1)=phat_male(58:72,1);
par0(77,1)=phat_male(77,1);%constant
par0(78,1)=phat_male(78,1);%age profile
par0(79,1)=phat_male(79,1);%wcl2
par0(80,1)=phat_male(80,1);%PT FT
par0(81,1)=phat_male(81,1);%MJ FT
par0(82,1)=phat_male(82,1);%NE FT
par0(83,1)=phat_male(83,1);%CJ FT
par0(84,1)=phat_male(84,1);%FT PT
par0(85,1)=phat_male(85,1);%MJ PT
par0(86,1)=phat_male(86,1);%NE PT
par0(87,1)=phat_male(87,1);%CJ PT
par0(88,1)=phat_male(88,1);%FT MJ
par0(89,1)=phat_male(89,1);%PT MJ
par0(90,1)=phat_male(90,1);%NE MJ
par0(91,1)=phat_male(91,1);%CJ MJ
par0(92,1)=phat_male(92,1);%FT NE
par0(93,1)=phat_male(93,1);%PT NE
par0(94,1)=phat_male(94,1);%MJ NE
par0(95,1)=phat_male(95,1);%CJ NE
par0(96,1)=phat_male(96,1);%FT CJ
par0(97,1)=phat_male(97,1);%PT CJ
par0(98,1)=phat_male(98,1);%MJ CJ
par0(99,1)=phat_male(99,1);%NE CJ
%
% par0(78:99,1)=0;
% %wcl
par0(100,1)=phat_male(100,1);%cons
par0(101,1)=phat_male(101,1);%year_birth
par0(102,1)=phat_male(102,1);%ED2
par0(103,1)=phat_male(103,1);%ED3
%
par_inc=par0(61:end,1);
% par_inc=par0(61:76,1);
% par_inc=[par_inc; par0(100:103,1)];

%
% tic
initial_loglik=loglik_income(par_inc,data_male.npeople,data_male.year_birth,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
                    data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ...
                    ,data_male.UB)

% initial_loglik=loglik_income(par_inc,par0,data_male.npeople,data_male.year_birth,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
%                     data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE...
%                     ,data_male.lFT,data_male.lPT,data_male.lMJ,data_male.lNE)
% toc
% tic
% initial_loglik=loglik(par0,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
%                     data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ)
% toc
% LIKELIHOOD MAXIMIZATION
%------------------------
% options_fminunc = optimset('Display','iter','LargeScale','off','MaxIter',100,'MaxFunEval',20000,'TolX',1e-6,'TolFun',1e-4,'Algorithm','sqp');
%,'CompleteSearch','true','CompletePoll','on','TolMesh',1e-6
% ub=zeros(size(par_inc,1),1);
% ub(1:end,1)=Inf;
% lb=zeros(size(par_inc,1),1);
% lb(1:end,1)=-Inf;
% %
% lb(4,1)=-0.5;%mean exp
% ub(4,1)=0.5;
% lb(11,1)=-0.5;%std exp
% ub(11,1)=0.5;
% lb(17,1)=-10;%constant acr1
% ub(17,1)=-3;
% lb(18,1)=-2;%age profile constant
% ub(18,1)=+2;
% lb(19:39,1)=-4;
% ub(19:39,1)=4;
% %type 2 unobserved
% lb(40:43,1)=-2;
% ub(40:43,1)=2;
%
% options_pattern = optimoptions('patternsearch','Display','iter','MaxIter',40000,'MaxFunEval',40000,'AccelerateMesh',true,'UseCompletePoll',true,'UseCompleteSearch',true);
% options_pattern = optimoptions('patternsearch','Display','iter','MaxIter',10,'MaxFunEval',10,'InitialMeshSize',1);%,'AccelerateMesh',true
% options_ga = optimoptions('ga','Display','iter');
% options_simulannealbnd = optimoptions('simulannealbnd','Display','iter','InitialTemperature',0.1,'MaxFunctionEvaluations',50000,'MaxTime',86000,'TolFun',1e-6,'MaxIterations',50000);
options_fminsearch = optimset('Display','iter','MaxFunEvals',80000,'MaxIter',80000,'TolFun',1e-6,'TolX',1e-6);

%xx=fminunc(@loglikred,[0;0],options,par0);
% phat_male=[par0(1:71);xx;par0(88:101)];

% phat_male=fminunc(@(x) loglik(x,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
%                     data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ),par0,options_fminunc);
% phat_male=patternsearch(@(x) loglik(x,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
%                     data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ),par0,[],[],[],[],[],[],[],options_pattern);
% phat_male=ga(@(x) loglik(x,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
%                     data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ),length(par0),[],[],[],[],[],[],[],[],options_ga);
                
% phat_male_income=simulannealbnd(@(x) loglik_income(x,data_male.npeople,data_male.year_birth,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
%                     data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE...
%                     ,data_male.CJ,data_male.UB),par_inc,[],[],options_simulannealbnd);
phat_male_income=fminsearch(@(x) loglik_income(x,data_male.npeople,data_male.year_birth,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
                    data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE...
                    ,data_male.CJ,data_male.UB),par_inc,options_fminsearch);
% phat_male_income=patternsearch(@(x) loglik_income(x,par0,data_male.npeople,data_male.year_birth,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
%                     data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ...
%                     ,data_male.UB),par_inc,[],[],[],[],lb,ub,[],options_pattern);
phat_male=par0;
phat_male(61:end,1)=phat_male_income(1:end,1);
% phat_male(61:76,1)=phat_male_income(1:16,1);
% phat_male(100:end,1)=phat_male_income(17:end,1);
save('phat_male.mat','phat_male')

% phat_male_income=phat_male(1:55);
% phat_male_wage=phat_male(56:end);
% save('phat_male_income.mat','phat_male_income')
% save('phat_male_wage.mat','phat_male_wage')

% phat_male=par0;
%{
% COMPUTATION OF STANDARD ERRORS
%-------------------------------
global NPEOPLE  PID;
lplus=zeros(length(phat_male),NPEOPLE);
l=loglikvec(phat_male).';
disp('-> COMPUTING SCORES FOR COVARIANCE MATRIX...');
for i=1:length(phat_male);
	dx=zeros(size(phat_male));
	dx(i)=1e-6;%only change in parameter i!!
	lplus(i,:)=loglikvec(phat_male+dx).';
    clear dx;
end;
score=(lplus-repmat(l,length(phat_male),1))/1e-6;
info=score*score.';
sdhat=sqrt(diag(inv(info)));

pariniu=[phat_male(1:7),sdhat(1:7),phat_male(1:7)./sdhat(1:7)].'
parinipub=[phat_male(8:14),sdhat(8:14),phat_male(8:14)./sdhat(8:14)].'
parunemp=[phat_male(15:23),sdhat(15:23),phat_male(15:23)./sdhat(15:23)].'
parpub=[phat_male(24:32),sdhat(24:32),phat_male(24:32)./sdhat(24:32)].'
parmu=[phat_male(33:52),sdhat(33:52),phat_male(33:52)./sdhat(33:52)].'
parsigma=[phat_male(53:59),sdhat(53:59),phat_male(53:59)./sdhat(53:59)].'
partau1=[phat_male(60:65),sdhat(60:65),phat_male(60:65)./sdhat(60:65),phat_male(66:71),sdhat(66:71),phat_male(66:71)./sdhat(66:71)].'
partau2=[phat_male(72),sdhat(72),phat_male(72)./sdhat(72),phat_male(73),sdhat(73),phat_male(73)./sdhat(73)].'
parwcl=[phat_male(74:79),sdhat(74:79),phat_male(74:79)./sdhat(74:79)].'
parmcl=[phat_male(80:87),sdhat(80:87),phat_male(80:87)./sdhat(80:87)].'

% GENERATE EM WEIGHTS
%--------------------
weights=EMweights(phat_male);

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
