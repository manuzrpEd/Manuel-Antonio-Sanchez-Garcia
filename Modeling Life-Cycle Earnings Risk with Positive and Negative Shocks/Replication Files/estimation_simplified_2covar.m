close all
clear
clear mex
pack
clc
tic
load('estimates_simplified_2covar.mat','estimates_simplified_2covar')
load('data_simplified.mat','data_simplified')
data_simplified = rmfield(data_simplified,'cnacv');
data_simplified = rmfield(data_simplified,'cpacv');
data_simplified = rmfield(data_simplified,'gr_26');
data_simplified = rmfield(data_simplified,'gr_36');
data_simplified = rmfield(data_simplified,'gr_46');
data_simplified = rmfield(data_simplified,'sum_p');
data_simplified = rmfield(data_simplified,'sum_n');
data_simplified = rmfield(data_simplified,'unc_var');
data_simplified.M_ave_est=data_simplified.M_ave;
data_simplified.M_ave_est(6:end)=mean(data_simplified.M_ave(6:end));%
%
col = 31;
H=20000;
T=32;
para=zeros(29,1);
para(1)=estimates_simplified_2covar.rho_n;
para(2)=estimates_simplified_2covar.rho_p;
para(3)=estimates_simplified_2covar.sigma_b;
para(4)=estimates_simplified_2covar.d_one_neg; %c_px - NEGAtive
para(5)=estimates_simplified_2covar.d_two_neg; %b_px
para(6)=estimates_simplified_2covar.d_one_pos; %d_one_pos - POSITIVE MARGINAL
para(7)=estimates_simplified_2covar.d_two_pos; %d_two_pos
para(8)=estimates_simplified_2covar.gamma_a_tr_p;
para(9)=estimates_simplified_2covar.gamma_b_tr_p;%to be changed
para(10)=estimates_simplified_2covar.gamma_a_tr_n;
para(11)=estimates_simplified_2covar.gamma_b_tr_n;
para(12)=estimates_simplified_2covar.gamma_a_per_n;
para(13)=estimates_simplified_2covar.gamma_b_per_n;
para(14)=estimates_simplified_2covar.gamma_a_per_p;
para(15)=estimates_simplified_2covar.gamma_b_per_p;
para(16)=estimates_simplified_2covar.lambda_a_pos;
para(17)=estimates_simplified_2covar.lambda_b_pos;
para(18)=estimates_simplified_2covar.lambda_a_neg;
para(19)=estimates_simplified_2covar.lambda_b_neg;
para(20)=estimates_simplified_2covar.d_three_neg;
para(21)=estimates_simplified_2covar.d_three_pos;
para(22)=estimates_simplified_2covar.sigma_tra;
para(23)=estimates_simplified_2covar.sigma_a;
para(24)=estimates_simplified_2covar.gamma_epini;
para(25)=estimates_simplified_2covar.gamma_enini;
para(26)=estimates_simplified_2covar.mu_epini;
para(27)=estimates_simplified_2covar.mu_enini;
para(28)=estimates_simplified_2covar.theta_p;
para(29)=estimates_simplified_2covar.theta_n;
lb=zeros(29,1);
ub=zeros(29,1);
%
lb(1,1) = -1;
ub(1,1) = 1;
lb(2,1) = -1;
ub(2,1) = 1;
lb(3,1) = 0;
ub(3,1) = Inf;
lb(4,1) = 0;
ub(4,1) = 1;
lb(5,1) = -1;
ub(5,1) = 1;
lb(6,1) = 0;
ub(6,1) = 1;
lb(7,1) = -1;
ub(7,1) = 1;
lb(8,1) = 0;
ub(8,1) = Inf;
lb(9,1) = -Inf;
ub(9,1) = Inf;
lb(10,1) = 0;
ub(10,1) = Inf;
lb(11,1) = -Inf;
ub(11,1) = Inf;
lb(12,1) = 0;
ub(12,1) = Inf;
lb(13,1) = -Inf;
ub(13,1) = Inf;
lb(14,1) = 0;
ub(14,1) = Inf;
lb(15,1) = -Inf;
ub(15,1) = Inf;
lb(16,1) = -Inf;
ub(16,1) = Inf;
lb(17,1) = -Inf;
ub(17,1) = Inf;
lb(18,1) = -Inf;
ub(18,1) = Inf;
lb(19,1) = -Inf;
ub(19,1) = Inf;
lb(20,1) = -1;
ub(20,1) = 1;
lb(21,1) = -1;
ub(21,1) = 1;
lb(22,1) = 0;
ub(22,1) = Inf;
lb(23,1) = 0;
ub(23,1) = Inf;
lb(24,1) = 0;
ub(24,1) = Inf;
lb(25,1) = 0;
ub(25,1) = Inf;
lb(26,1) = -Inf;
ub(26,1) = Inf;
lb(27,1) = -Inf;
ub(27,1) = Inf;
lb(28,1) = -1;
ub(28,1) = 1;
lb(29,1) = -1;
ub(29,1) = 1;
rand('seed',256344);
randn('seed',66573);
randn_b = randn(H,1);
rand_shock_s = rand(H,T);
randn_a=randn(H,1);
%
before=loss_simplified_2covar(para,data_simplified,H,T,randn_b,rand_shock_s,col,randn_a)
%
%,'UseParallel', true
opts_pattern=psoptimset('Display','iter','CompleteSearch','on','CompletePoll','on','TolMesh',1e-06,'MaxFunEvals',1000000,'MaxIter',1e6,'InitialMeshSize',1);
%
optimum_simplified_2covar=patternsearch(@(x) loss_simplified_2covar(x,data_simplified,H,T,randn_b,rand_shock_s,col,randn_a),para,[],[],[],[],lb,ub,[],opts_pattern)
%delete(gcp)
after=loss_simplified_2covar(optimum_simplified_2covar,data_simplified,H,T,randn_b,rand_shock_s,col,randn_a)
save('optimum_simplified_2covar.mat','optimum_simplified_2covar')
%
toc