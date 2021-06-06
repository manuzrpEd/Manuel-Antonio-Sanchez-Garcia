%matlab -nodisplay -nojvm -nosplash -nodesktop -noFigureWindows -r "try; run('C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Matlab\estimation.m'); catch; end; quit"

cd '\1999-2002'
clc
clear
close all
clear mex
disp('Estimation Males 1999-2002')
%-375627

load('data_male.mat','data_male')

% load('phat_male_wage.mat','phat_male_wage')
% load('phat_male_mobil.mat','phat_male_mobil')
% par0=[phat_male_mobil; phat_male_wage];

% INITIAL PARAMETER VALUES from whole sample estimation!
load('phat_male.mat','phat_male')%this is from the whole sample estimation! only loaded for the first estimation of 1999-2002
% % par0=phat_male;
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
par0(56,1)=phat_male(56,1);%NE
par0(57,1)=phat_male(57,1);%wcl
% %tau1
par0(58:63,1)=phat_male(58:63,1);
% par0(84)=0; what is this??s
% %wcl
par0(64,1)=phat_male(64,1);%cons
par0(65,1)=phat_male(65,1);%year_birth
par0(66,1)=phat_male(66,1);%ED2
par0(67,1)=phat_male(67,1);%ED3

par0_spec=[par0(49,1); par0(55,1)];

%
% tic
initial_loglik=loglik(par0_spec,par0,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
                    data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE...
                    ,data_male.lFT,data_male.lPT,data_male.lMJ,data_male.lNE)
% toc
% tic
% initial_loglik=loglik(par0,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
%                     data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ)
% toc
% LIKELIHOOD MAXIMIZATION
%------------------------
% options_fminunc = optimset('Display','iter','LargeScale','off','MaxIter',100,'MaxFunEval',20000,'TolX',1e-6,'TolFun',1e-4,'Algorithm','sqp');
%,'CompleteSearch','true','CompletePoll','on','TolMesh',1e-6
% options_pattern = optimoptions('patternsearch','Display','iter','MaxIter',1e6,'MaxFunEval',10000,'AccelerateMesh',true,'UseCompletePoll',true,'UseCompleteSearch',true,'UseParallel',true);
% options_ga = optimoptions('ga','Display','iter');
% options_simulannealbnd = optimoptions('simulannealbnd','Display','iter','InitialTemperature',0.1,'MaxFunctionEvaluations',500,'MaxTime',86000,'TolFun',1e-3,'MaxIterations',500);
options_fminsearch = optimset('Display','iter','MaxFunEvals',1000,'MaxIter',1000,'TolFun',1e-6,'TolX',1e-6);

%xx=fminunc(@loglikred,[0;0],options,par0);
% phat_male=[par0(1:71);xx;par0(88:101)];

% phat_male=fminunc(@(x) loglik(x,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
%                     data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ),par0,options_fminunc);
% phat_male=patternsearch(@(x) loglik(x,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
%                     data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ),par0,[],[],[],[],[],[],[],options_pattern);
% phat_male=ga(@(x) loglik(x,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
%                     data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ),length(par0),[],[],[],[],[],[],[],[],options_ga);
                
% phat_male=simulannealbnd(@(x) loglik(x,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
%                     data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ),par0,[],[],options_simulannealbnd);
phat_male=fminsearch(@(x) loglik(x,par0,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,data_male.nmobcl,data_male.nwagcl,...
                    data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE...
                    ,data_male.lFT,data_male.lPT,data_male.lMJ,data_male.lNE),par0_spec,options_fminsearch);
phat_male2=par0;
phat_male2(49)=phat_male(1);
phat_male2(55)=phat_male(1);

phat_male=phat_male2;

save('phat_male.mat','phat_male')

% phat_male_mobil=phat_male(1:55);
% phat_male_wage=phat_male(56:end);
% save('phat_male_mobil.mat','phat_male_mobil')
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
