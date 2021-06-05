%matlab -nodisplay -nojvm -nosplash -nodesktop -noFigureWindows -r "try; run('C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Matlab\estimation.m'); catch; end; quit"
cd 'C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Matlab'
clc
clear
close all
clear mex
%4.15179e+06 

% acquiredata_male;
% global col;
load('data_male.mat','data_male')

% INITIAL PARAMETER VALUES

load('phat_male_mobil.mat','phat_male_mobil')
% par0=phat_male_mobil;

load('phat_male.mat','phat_male')
% phat_male_mobil=phat_male(1:62);
phat_male_wage=phat_male(63:end);
par0=phat_male_mobil;

%
% par0(39)=0.15;
% par0(41)=0;%
% par0(29)=0.18;%1
% par0(49)=-0.2;%1

initial_mobil=obj_lmobil(par0,phat_male_wage,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,...
                    data_male.nmobcl,data_male.nwagcl,data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ...
                    ,data_male.lFT,data_male.lPT,data_male.lMJ,data_male.lNE,data_male.lCJ)
                
options_fminsearch = optimset('Display','iter','MaxFunEvals',5000,'MaxIter',5000,'TolFun',1,'TolX',1e-1);

phat_male_mobil=fminsearch(@(x) obj_lmobil(x,phat_male_wage,data_male.npeople,data_male.year_birth,data_male.year,data_male.ED2,data_male.ED3,...
                    data_male.nmobcl,data_male.nwagcl,data_male.lmexp,data_male.log_ave_wage,data_male.FT,data_male.PT,data_male.MJ,data_male.NE,data_male.CJ...
                    ,data_male.lFT,data_male.lPT,data_male.lMJ,data_male.lNE,data_male.lCJ),par0,options_fminsearch);

save('phat_male_mobil.mat','phat_male_mobil')