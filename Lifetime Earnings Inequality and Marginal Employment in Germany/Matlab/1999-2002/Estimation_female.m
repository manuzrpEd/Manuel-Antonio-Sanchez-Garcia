%matlab -nodisplay -nojvm -nosplash -nodesktop -noFigureWindows -r "try; run('C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Matlab\estimation.m'); catch; end; quit"
cd 'C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Matlab\1999-2002'
clc
clear
close all
clear mex
%111518 converged

load('data_female.mat','data_female')

% load('phat_female_wage.mat','phat_female_wage')
% load('phat_female_mobil.mat','phat_female_mobil')
% par0=[phat_female_mobil; phat_female_wage];

% par0(70)=-2;%mu
% par0(62+10)=4.6;
% par0(62+15)=-0.1;
% par0(85:89)=0;
% par0(81)=-5.2;
% par0(62+10)=0.4;
% % par0(62+14)=-1000;
% par0(62+15)=2;
% par0(62+8)=-1;

% INITIAL PARAMETER VALUES from whole sample estimation!
% load('phat_female.mat','phat_female')%this is from the whole sample estimation! only loaded for the first estimation of 1999-2002
% % par0=phat_female;
% % col=73;
% par0=zeros(1,1);
% % %iniPT
% par0(1,1)=phat_female(1,1);%cons
% par0(2,1)=phat_female(2,1);%lmexp
% par0(3,1)=phat_female(4,1);%ed2
% par0(4,1)=phat_female(5,1);%ed3
% par0(5,1)=phat_female(6,1);%mcl2
% % %iniMJ
% par0(6,1)=phat_female(7,1);
% par0(7,1)=phat_female(8,1);
% par0(8,1)=phat_female(10,1);
% par0(9,1)=phat_female(11,1);
% par0(10,1)=phat_female(12,1);
% % %iniCJ
% par0(11,1)=phat_female(13,1);
% par0(12,1)=phat_female(14,1);
% par0(13,1)=phat_female(16,1);
% par0(14,1)=phat_female(17,1);
% par0(15,1)=phat_female(18,1);
% % %PT 
% par0(16,1)=phat_female(19,1);%cons
% par0(17,1)=phat_female(20,1);%lmexp
% par0(18,1)=phat_female(22,1);%ed2
% par0(19,1)=phat_female(23,1);%ed3
% par0(20,1)=phat_female(24,1);%PT
% par0(21,1)=phat_female(25,1);%MJ
% par0(22,1)=phat_female(26,1);%NE
% par0(23,1)=phat_female(27,1);%CJ
% par0(24,1)=phat_female(28,1);%mcl2
% % %MJ
% par0(25,1)=phat_female(29,1);
% par0(26,1)=phat_female(30,1);
% par0(27,1)=phat_female(32,1);
% par0(28,1)=phat_female(33,1);
% par0(29,1)=phat_female(34,1);%PT
% par0(30,1)=phat_female(35,1);%MJ
% par0(31,1)=phat_female(36,1);%NE
% par0(32,1)=phat_female(37,1);%CJ
% par0(33,1)=phat_female(38,1);%mcl2
% % %NE
% par0(34,1)=phat_female(39,1);
% par0(35,1)=phat_female(40,1);
% par0(36,1)=phat_female(42,1);
% par0(37,1)=phat_female(43,1);
% par0(38,1)=phat_female(44,1);%PT
% par0(39,1)=phat_female(45,1);%MJ
% par0(40,1)=phat_female(46,1);%NE
% par0(41,1)=phat_female(47,1);%CJ
% par0(42,1)=phat_female(48,1);%mcl2
% % %CJ
% par0(43,1)=phat_female(49,1);
% par0(44,1)=phat_female(50,1);
% par0(45,1)=phat_female(52,1);
% par0(46,1)=phat_female(53,1);
% par0(47,1)=phat_female(54,1);%PT
% par0(48,1)=phat_female(55,1);%MJ
% par0(49,1)=phat_female(56,1);%NE
% par0(50,1)=phat_female(57,1);%CJ
% par0(51,1)=phat_female(58,1);%mcl2
% % %mcl
% par0(52,1)=phat_female(59,1);%cons
% par0(53,1)=phat_female(60,1);%year_birth
% par0(54,1)=phat_female(61,1);%ED2
% par0(55,1)=phat_female(62,1);%ED3
% 
% % %mu
% par0(56,1)=phat_female(63,1);%cons
% par0(57,1)=phat_female(64,1);%ED2
% par0(58,1)=phat_female(65,1);%ED3
% par0(59,1)=phat_female(66,1);%lmexp
% par0(60,1)=phat_female(67,1);%PT
% par0(61,1)=phat_female(68,1);%MJ
% par0(62,1)=phat_female(69,1);%NE
% par0(63,1)=phat_female(70,1);%CJ
% par0(64,1)=phat_female(71,1);%wcl
% % %sigma
% par0(65,1)=phat_female(72,1);%cons
% par0(66,1)=phat_female(73,1);%lmexp
% par0(67,1)=phat_female(74,1);%PT
% par0(68,1)=phat_female(75,1);%MJ
% par0(69,1)=phat_female(76,1);%NE
% par0(70,1)=phat_female(77,1);%CJ
% par0(71,1)=phat_female(78,1);%wcl
% % %tau1
% par0(72:98,1)=phat_female(79:105,1);
% % %wcl
% par0(99,1)=phat_female(106,1);%cons
% par0(100,1)=phat_female(107,1);%year_birth
% par0(101,1)=phat_female(108,1);%ED2
% par0(102,1)=phat_female(109,1);%ED3

% This is after the first minimization/iterations:
% INITIAL PARAMETER VALUES from whole sample estimation!
load('phat_female.mat','phat_female')%this is from the whole sample estimation! only loaded for the first estimation of 1999-2002
% par0=phat_female;
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
par0(24,1)=phat_female(24,1);%mcl2
% %MJ
par0(25,1)=phat_female(25,1);
par0(26,1)=phat_female(26,1);
par0(27,1)=phat_female(27,1);
par0(28,1)=phat_female(28,1);
par0(29,1)=phat_female(29,1);%PT
par0(30,1)=phat_female(30,1);%MJ
par0(31,1)=phat_female(31,1);%NE
par0(32,1)=phat_female(32,1);%CJ
par0(33,1)=phat_female(33,1);%mcl2
% %NE
par0(34,1)=phat_female(34,1);
par0(35,1)=phat_female(35,1);
par0(36,1)=phat_female(36,1);
par0(37,1)=phat_female(37,1);
par0(38,1)=phat_female(38,1);%PT
par0(39,1)=phat_female(39,1);%MJ
par0(40,1)=phat_female(40,1);%NE
par0(41,1)=phat_female(41,1);%CJ
par0(42,1)=phat_female(42,1);%mcl2
% %CJ
par0(43,1)=phat_female(43,1);
par0(44,1)=phat_female(44,1);
par0(45,1)=phat_female(45,1);
par0(46,1)=phat_female(46,1);
par0(47,1)=phat_female(47,1);%PT
par0(48,1)=phat_female(48,1);%MJ
par0(49,1)=phat_female(49,1);%NE
par0(50,1)=phat_female(50,1);%CJ
par0(51,1)=phat_female(51,1);%mcl2
% %mcl
par0(52,1)=phat_female(52,1);%cons
par0(53,1)=phat_female(53,1);%year_birth
par0(54,1)=phat_female(54,1);%ED2
par0(55,1)=phat_female(55,1);%ED3

% %mu
par0(56,1)=phat_female(56,1);%cons
par0(57,1)=phat_female(57,1);%ED2
par0(58,1)=phat_female(58,1);%ED3
par0(59,1)=phat_female(59,1);%lmexp
par0(60,1)=phat_female(60,1);%PT
par0(61,1)=phat_female(61,1);%MJ
par0(62,1)=phat_female(62,1);%NE
par0(63,1)=phat_female(63,1);%CJ
par0(64,1)=phat_female(64,1);%wcl
% %sigma
par0(65,1)=phat_female(65,1);%cons
par0(66,1)=phat_female(66,1);%lmexp
par0(67,1)=phat_female(67,1);%PT
par0(68,1)=phat_female(68,1);%MJ
par0(69,1)=phat_female(69,1);%NE
par0(70,1)=phat_female(70,1);%CJ
par0(71,1)=phat_female(71,1);%wcl
% %tau1
par0(72:98,1)=phat_female(72:98,1);
% %wcl
par0(99,1)=phat_female(99,1);%cons
par0(100,1)=phat_female(100,1);%year_birth
par0(101,1)=phat_female(101,1);%ED2
par0(102,1)=phat_female(102,1);%ED3

%
% tic
initial_loglik=loglik(par0,data_female.npeople,data_female.year_birth,data_female.year,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
                    data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ...
                    ,data_female.lFT,data_female.lPT,data_female.lMJ,data_female.lNE,data_female.lCJ)
% toc
% tic
% initial_loglik=loglik(par0,data_female.npeople,data_female.year_birth,data_female.year,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
%                     data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ)
% toc
% LIKELIHOOD MAXIMIZATION
%------------------------
% options_fminunc = optimset('Display','iter','LargeScale','off','MaxIter',100,'MaxFunEval',20000,'TolX',1e-6,'TolFun',1e-4,'Algorithm','sqp');
%,'CompleteSearch','true','CompletePoll','on','TolMesh',1e-6
% options_pattern = optimoptions('patternsearch','Display','iter','MaxIter',1e6,'MaxFunEval',10000,'AccelerateMesh',true,'UseCompletePoll',true,'UseCompleteSearch',true,'UseParallel',true);
% options_ga = optimoptions('ga','Display','iter');
% options_simulannealbnd = optimoptions('simulannealbnd','Display','iter','InitialTemperature',0.1,'MaxFunctionEvaluations',500,'MaxTime',86000,'TolFun',1e-3,'MaxIterations',500);
options_fminsearch = optimset('Display','iter','MaxFunEvals',20000,'MaxIter',20000,'TolFun',1e-6,'TolX',1e-6);

%xx=fminunc(@loglikred,[0;0],options,par0);
% phat_female=[par0(1:71);xx;par0(88:101)];

% phat_female=fminunc(@(x) loglik(x,data_female.npeople,data_female.year_birth,data_female.year,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
%                     data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ),par0,options_fminunc);
% phat_female=patternsearch(@(x) loglik(x,data_female.npeople,data_female.year_birth,data_female.year,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
%                     data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ),par0,[],[],[],[],[],[],[],options_pattern);
% phat_female=ga(@(x) loglik(x,data_female.npeople,data_female.year_birth,data_female.year,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
%                     data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ),length(par0),[],[],[],[],[],[],[],[],options_ga);
                
% phat_female=simulannealbnd(@(x) loglik(x,data_female.npeople,data_female.year_birth,data_female.year,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
%                     data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ),par0,[],[],options_simulannealbnd);
phat_female=fminsearch(@(x) loglik(x,data_female.npeople,data_female.year_birth,data_female.year,data_female.ED2,data_female.ED3,data_female.nmobcl,data_female.nwagcl,...
                    data_female.lmexp,data_female.log_ave_wage,data_female.FT,data_female.PT,data_female.MJ,data_female.NE,data_female.CJ...
                    ,data_female.lFT,data_female.lPT,data_female.lMJ,data_female.lNE,data_female.lCJ),par0,options_fminsearch);

save('phat_female.mat','phat_female')

phat_female_mobil=phat_female(1:55);
phat_female_wage=phat_female(56:end);
save('phat_female_mobil.mat','phat_female_mobil')
save('phat_female_wage.mat','phat_female_wage')

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
