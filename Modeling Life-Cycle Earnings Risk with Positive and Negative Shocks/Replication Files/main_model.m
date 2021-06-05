clear
clear mex
close all
clc
%
tic
set(0,'DefaultFigureWindowStyle','docked')
%% Patameters and Initialization
H = 20000;%20000 in process approx
work = 32;
retire = 20;
life=work+retire;
r = 0.04;
R = 1+r; 
beta = 0.9725;
gamma=1.5;

na = 800;% grid of assets 
NPP = 4;% permanent heterogeneity individual-specific 
Nn=12; % negative states 
Np=12; % positive states 
nnodes=17; %number of grid points for transitory shock 
%
% load('estimates_simplified_2covar_noquad.mat','estimates_simplified_2covar_noquad')%pending to find a better minimum with theta=hip=0 estimated
load('estimates_simplified_2covar.mat','estimates_simplified_2covar')
load('data_simplified.mat','data_simplified')

rand('seed',8842554); 
randn('seed',5578462); 
lognrnd('seed',6247887); 

% load('paraopt_fmincon_one_sm.mat','paraopt_fmincon_one_sm')
mu_p = estimates_simplified_2covar.lambda_a_pos+(1:work)'*estimates_simplified_2covar.lambda_b_pos;
mu_n = estimates_simplified_2covar.lambda_a_neg+(1:work)'*estimates_simplified_2covar.lambda_b_neg;
sigma_n = estimates_simplified_2covar.gamma_a_per_n+(1:work)'*estimates_simplified_2covar.gamma_b_per_n;
sigma_p = estimates_simplified_2covar.gamma_a_per_p+(1:work)'*estimates_simplified_2covar.gamma_b_per_p;
sigma_pt = estimates_simplified_2covar.gamma_a_tr_p+(1:work)'*estimates_simplified_2covar.gamma_b_tr_p;
sigma_nt = estimates_simplified_2covar.gamma_a_tr_n+(1:work)'*estimates_simplified_2covar.gamma_b_tr_n;
mu_t = linspace(0,0,work)';
sigma_t = linspace(estimates_simplified_2covar.sigma_tra,estimates_simplified_2covar.sigma_tra,work)';
rho_p =estimates_simplified_2covar.rho_p;
rho_n =estimates_simplified_2covar.rho_n;
% trunc=3;
sigma_a = estimates_simplified_2covar.sigma_a;
%shock probabilities
prob_pp = estimates_simplified_2covar.d_one_pos+(estimates_simplified_2covar.d_two_pos)*(1:1:work)'+estimates_simplified_2covar.d_three_pos*((1:1:work).^2)';
prob_nn = estimates_simplified_2covar.d_one_neg+(estimates_simplified_2covar.d_two_neg)*(1:1:work)'+estimates_simplified_2covar.d_three_neg*((1:1:work).^2)';
%
mu_p(1)=estimates_simplified_2covar.mu_epini;
mu_n(1)=estimates_simplified_2covar.mu_enini;
sigma_pt(1)=estimates_simplified_2covar.gamma_epini;
sigma_nt(1)=estimates_simplified_2covar.gamma_enini;

%determenistic life component
aux1=csvread('determ_age.out');
aux2=csvread('determ_year_birth.out');
determ = [aux2(end);aux2(end)+aux1];
%permanent heterogeneity
[grid_perm,prob_perm] = Norm(NPP,0,sigma_a,'equi');

%permanent positive shocks
max_p = 1;
grid_p = linspace(0,max_p,Np)'; 
P_p = zeros(Np,Np,work);
for t = 1:work %all points reached over the life-cycle
    P_p(:,:,t) = trans_logn(mu_p(t,1),sigma_p(t,1),rho_p,grid_p,Np);
end
grid_p_rho = rho_p*grid_p;
%permanent negative shocks
max_n = 1;
grid_n = linspace(0,max_n,Nn)'; %min(grid_n)
P_n = zeros(Nn,Nn,work);
for t = 1:work
    P_n(:,:,t) = trans_logn(mu_n(t,1),sigma_n(t,1),rho_n,grid_n,Nn);
    P_n(:,:,t) = rot90(flip(P_n(:,:,t)))'; %turns matrix upside down
end
grid_n(:,1) = flip(-grid_n(:,1)); %for interpolation, easier to work with increasing grid
max_n = -max_n;
grid_n_rho = rho_n*grid_n;
% lower index on grid for interpolation
[~,yi] = histc(grid_p_rho,grid_p); %find lower bounds
yi(grid_p_rho<grid_p(1)) = 1;
yi(grid_p_rho>=grid_p(end)) = Np-1;
[~,zi] = histc(grid_n_rho,grid_n); %find lower bounds
zi(grid_n_rho<grid_n(1)) = 1;
zi(grid_n_rho>=grid_n(end)) = Nn-1;
%transitory shocks
[grid_tran,P_t,P_tn,P_tp] = get_transitory(nnodes,work,mu_t,sigma_t,mu_p,sigma_pt,mu_n,sigma_nt);
%social security income
ss = zeros(Np,Nn,NPP);
for i = 1:NPP
    aux = exp(grid_perm(i)+determ(:));
    aux(aux>72600) = 72600; %maximum earnings subject to ss
    for k = 1:Nn
        for j = 1:Np
            ss(j,k,i) = 0.5*mean(aux);
        end
    end
end
%working earnings
%gross wages
w_g = zeros(Np,Nn,nnodes,NPP,work);
for t =1:work
    for l = 1:NPP
        for k = 1:nnodes
            for j = 1:Nn
                for i = 1:Np                
                    w_g(i,j,k,l,t) = exp(grid_perm(l)+determ(t,1)+grid_p(i,1)+grid_n(j,1)+grid_tran(k,1));
                end
            end
        end
    end
end
%net wages
w = zeros(Np,Nn,nnodes,NPP,work);
for t =1:work
    for l =1:NPP
        for k = 1:nnodes
            for j = 1:Nn
                for i = 1:Np
                    ss_t = 0.0935*min(w_g(i,j,k,l,t),72600); %social security taxes
                    if w_g(i,j,k,l,t)<=8004
                        w(i,j,k,l,t) = w_g(i,j,k,l,t)-ss_t;
                    elseif w_g(i,j,k,l,t)>8004 && w_g(i,j,k,l,t)<=13469
                        w(i,j,k,l,t) = w_g(i,j,k,l,t)-ss_t-(w_g(i,j,k,l,t)-8004)*((w_g(i,j,k,l,t)-8004)*0.000009976+0.14);
                    elseif w_g(i,j,k,l,t)>13469 && w_g(i,j,k,l,t)<=52881
                        w(i,j,k,l,t) = w_g(i,j,k,l,t)-ss_t-(w_g(i,j,k,l,t)-13469)*((w_g(i,j,k,l,t)-13469)*0.0000022874+0.2397)-948.68;
                    elseif w_g(i,j,k,l,t)>52881 && w_g(i,j,k,l,t)<=250730
                        w(i,j,k,l,t) = w_g(i,j,k,l,t)-ss_t-w_g(i,j,k,l,t)*0.42+8261.29;
                    elseif w_g(i,j,k,l,t)>250730
                        w(i,j,k,l,t) = w_g(i,j,k,l,t)-ss_t-w_g(i,j,k,l,t)*0.45+15783.19;
                    end
                end
            end
        end
    end
end
%asset grid
% display('Here')
amin = zeros(NPP,life);
%asset grid today and tomorrow
amax = zeros(NPP,1);
for i = 1:NPP
    amax(i,1) = 7*exp(grid_perm(i)+determ(end));
end
agrid = zeros(na,NPP,life);
for t = 1:life
    for i = 1:NPP
        agrid(:,i,t) = linspace(amin(i,t),amax(i),na)';
    end
end
% display('Here')
ssL = repmat(reshape(ss,[1 Np Nn NPP]),[na 1 1 1]);
wL = repmat(reshape(w,[1 Np Nn nnodes NPP work]),[na 1 1 1 1]);
agridL = repmat(reshape(agrid,[na 1 1 NPP life]),[1 Np Nn 1 1]);
agridLL = repmat(reshape(agrid,[na 1 1 1 NPP life]),[1 Np Nn nnodes 1 1]);
aminL = repmat(reshape(amin,[1 1 1 NPP life]),[na Np Nn 1 1]);
aminLL = repmat(reshape(amin,[1 1 1 1 NPP life]),[na Np Nn nnodes 1 1]);%this matrix/command makes my PC slow
%
%% Value function and Model Solution
V_r = zeros(na,Np,Nn,NPP,retire);
c_r = zeros(na,Np,Nn,NPP,retire);
V_w = zeros(na,Np,Nn,nnodes,NPP,work);
c_w = zeros(na,Np,Nn,nnodes,NPP,work);
c_aux2 = zeros(na,Np,Nn,NPP);
%
%last period of life
c_r(:,:,:,:,end) = (1+r)*agridL(:,:,:,:,end)+ssL; %consume all income
V_r(:,:,:,:,end) = CARRA(c_r(:,:,:,:,end),gamma); %consume all income
%
t = 1;
% display('Here')
while t<retire
    B = rhs_r(c_r(:,:,:,:,retire-t+1),beta,R,gamma); %rhs of Euler equation
    c_aux = B.^(-1/gamma); %solve for the implied consum
    a = (c_aux-ssL+agridL(:,:,:,:,life-t+1))./R; %the asset position that is consistent with the asset choice
    binding_constraints = agridL(:,:,:,:,life-t) < repmat(a(1,:,:,:),[na 1 1 1]);
    for k = 1:NPP
        for j = 1:Nn
            for i=1:Np
                c_aux2(:,i,j,k)=interp1_l(a(:,i,j,k),c_aux(:,i,j,k),agrid(:,k,life-t));
            end
        end
    end
    AUX= ssL + agridL(:,:,:,:,life-t)*R - aminL(:,:,:,:,life-t);
    c_aux2(binding_constraints) = AUX(binding_constraints);
    c_r(:,:,:,:,retire-t) = c_aux2; 
    anext = R*agridL(:,:,:,:,life-t)+ssL-c_r(:,:,:,:,retire-t); %implied savings
    for k = 1:NPP
        for j = 1:Nn
            for i = 1:Np
                V_r(:,i,j,k,retire-t) = CARRA(c_r(:,i,j,k,retire-t),gamma)+beta*interp1_l(agrid(:,k,life-t+1),V_r(:,i,j,k,retire-t+1),anext(:,i,j,k));
            end
        end
    end
    t = t+1;
end

c_aux2 = zeros(na,Np,Nn,nnodes,NPP);
while t<(life)
    if t==retire
        B = rhs_r(c_r(:,:,:,:,1),beta,R,gamma); %compute rhs of euler equation 
        B = reshape(B,[na Np Nn 1 NPP]);
        B = repmat(B,[1 1 1 nnodes 1]); %last period, no expectations over transitory shocks
    else
        B = rhs(c_w(:,:,:,:,:,life-t+1),beta,R,gamma,na,nnodes,Np,Nn,NPP...
                    ,grid_p(:,1),grid_n(:,1),grid_p_rho(:,1),grid_n_rho(:,1)...
                    ,P_t(:,life-t+1),P_tp(:,life-t+1),P_tn(:,life-t+1),P_n(:,:,life-t+1),P_p(:,:,life-t+1),prob_pp(life-t+1,1),prob_nn(life-t+1,1));
    end
    c_aux = B.^(-1/gamma); %solve for the implied consum
    a = (c_aux-wL(:,:,:,:,:,life-t)+agridLL(:,:,:,:,:,life-t+1))./R; %the asset position that is consistent with the asset choice
    binding_constraints = agridLL(:,:,:,:,:,life-t) < repmat(a(1,:,:,:,:),[na 1 1 1 1]);%
    for l = 1:NPP
        for k = 1:nnodes
            for j = 1:Nn            
                for i=1:Np
                    c_aux2(:,i,j,k,l)=interp1_l(a(:,i,j,k,l),c_aux(:,i,j,k,l),agrid(:,l,life-t));
                end
            end
        end
    end
    AUX= wL(:,:,:,:,:,life-t) + agridLL(:,:,:,:,:,life-t)*R - aminLL(:,:,:,:,:,life-t);
    c_aux2(binding_constraints) = AUX(binding_constraints);
    c_w(:,:,:,:,:,life-t) = c_aux2; 
    anext = R*agridLL(:,:,:,:,:,life-t)+wL(:,:,:,:,:,life-t)-c_w(:,:,:,:,:,life-t); %implied savings
    if t==retire %certain transition
        for l = 1:NPP
            for k = 1:nnodes
                for j = 1:Nn                
                    for i = 1:Np
                        V_w(:,i,j,k,l,life-t) = CARRA(c_w(:,i,j,k,l,life-t),gamma)+beta*interp1_l(agrid(:,l,life-t+1),V_r(:,i,j,l,1),anext(:,i,j,k,l));
                    end
                end
            end
        end
    else
        V_w(:,:,:,:,:,life-t) = value_f(c_w(:,:,:,:,:,life-t),V_w(:,:,:,:,:,life-t+1),anext,gamma,beta,agrid(:,:,life-t+1),grid_p_rho,grid_n_rho...
            ,grid_p,grid_n,Np,Nn,na,nnodes,NPP,P_p(:,:,life-t),P_n(:,:,life-t),prob_pp(life-t,1),prob_nn(life-t,1)...
            ,P_t(:,life-t),P_tp(:,life-t),P_tn(:,life-t));
    end
    t = t+1;
end
%% Simulation from the Model Solution
[panel,qi,ri,si,transitory_shocks] = simulation(H,work,retire,determ,ss,R,c_r,c_w,agrid,amin,grid_p,grid_n,grid_tran,Np,Nn,na,nnodes...
                    ,mu_p,sigma_p,mu_n,sigma_n,rho_p,rho_n,grid_perm,prob_perm...
                    ,prob_pp,prob_nn,mu_t,sigma_t,sigma_pt,sigma_nt,NPP);
panel2 = zeros(H*life,7);
for h = 1:H
    transform = squeeze(panel(h,:,1:end));
    transform = transform';
    panel2(1+(h-1)*life:h*life,:) = transform;
end
panel = panel2;
clear panel2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
panel_insure = simulation_insurance(H,work,determ,R,c_w,agrid,amin,grid_p,grid_n,grid_tran,Np,Nn,na,nnodes...
                    ,mu_p,sigma_p,mu_n,sigma_n,rho_p,rho_n,grid_perm,prob_perm,prob_pp,prob_nn,mu_t,sigma_t,sigma_pt,sigma_nt);
%
panel2 = zeros(H*(work),14);
for h = 1:H
    transform = squeeze(panel_insure(h,:,1:end));
    transform = transform';
    panel2(1+(h-1)*(work):h*(work),:) = transform;
end
panel_insure = panel2;
clear panel2
% aux=panel_insure(:,7);
% aux(aux<0)=0;
% load baseline.mat;
baseline.panel_insure = panel_insure;
% save('baseline.mat','baseline')
clear panel_insure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Extra Info
%age
fcn = @(x){cumsum(x)};
panel(:,8) = 1;
panel(:,8) = accumarray_expand(panel(:,8),panel(:,1),fcn);
panel(:,9) = panel(:,6)./panel(:,5);

%wealth to income ratio
aux = panel(panel(:,8)<=work,9);
wealth.income_mean = mean(aux);
wealth.income_median = median(aux);
aux = sortrows(panel(:,[9 8]),2); %keep wealth/income and age
fcn = @(x)median(x);
wealth.age_income_median = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
%value function
panel = [panel zeros(length(panel),1)];
for i = 1:length(panel)
    panel(i,10) = u_uncertain(panel(i:i+life-panel(i,8),7),beta,gamma,panel(i,8),life);
end
panel=real(panel);
%plot / compute median state pos, neg, trans
median_state=panel(panel(:,8)<=work,8);
qi = reshape(qi.',1,[]);
ri = reshape(ri.',1,[]); 
si = reshape(si.',1,[]);
qi=qi';
si=si';
ri=ri';
median_state=[median_state qi ri si];
%
%percentiles of states:
aux = panel(panel(:,8)<=work,:);
aux(:,11) = transitory_shocks(:);
aux = sortrows(aux,8); 
fcn = @(x)prctile(x,1);
prct.pos.p1 = accumarray_expand_s(aux(:,3),aux(:,8),fcn);
prct.neg.p1 = accumarray_expand_s(aux(:,4),aux(:,8),fcn);
prct.tra.p1 = accumarray_expand_s(aux(:,11),aux(:,8),fcn);
fcn = @(x)prctile(x,5);
prct.pos.p5 = accumarray_expand_s(aux(:,3),aux(:,8),fcn);
prct.neg.p5 = accumarray_expand_s(aux(:,4),aux(:,8),fcn);
prct.tra.p5 = accumarray_expand_s(aux(:,11),aux(:,8),fcn);
fcn = @(x)prctile(x,10);
prct.pos.p10 = accumarray_expand_s(aux(:,3),aux(:,8),fcn);
prct.neg.p10 = accumarray_expand_s(aux(:,4),aux(:,8),fcn);
prct.tra.p10 = accumarray_expand_s(aux(:,11),aux(:,8),fcn);
fcn = @(x)prctile(x,50);
prct.pos.p50 = accumarray_expand_s(aux(:,3),aux(:,8),fcn);
prct.neg.p50 = accumarray_expand_s(aux(:,4),aux(:,8),fcn);
prct.tra.p50 = accumarray_expand_s(aux(:,11),aux(:,8),fcn);
fcn = @(x)prctile(x,90);
prct.pos.p90 = accumarray_expand_s(aux(:,3),aux(:,8),fcn);
prct.neg.p90 = accumarray_expand_s(aux(:,4),aux(:,8),fcn);
prct.tra.p90 = accumarray_expand_s(aux(:,11),aux(:,8),fcn);
fcn = @(x)prctile(x,95);
prct.pos.p95 = accumarray_expand_s(aux(:,3),aux(:,8),fcn);
prct.neg.p95 = accumarray_expand_s(aux(:,4),aux(:,8),fcn);
prct.tra.p95 = accumarray_expand_s(aux(:,11),aux(:,8),fcn);
fcn = @(x)prctile(x,99);
prct.pos.p99 = accumarray_expand_s(aux(:,3),aux(:,8),fcn);
prct.neg.p99 = accumarray_expand_s(aux(:,4),aux(:,8),fcn);
prct.tra.p99 = accumarray_expand_s(aux(:,11),aux(:,8),fcn);

% p99_tran = accumarray_expand_s(aux(:,4),aux(:,1),fcn);
%% Social planner solution and welfare cost of incomplete markets
%per period income
aux = sortrows(panel(:,[5 8]),2); %keep income and age
aux(aux(:,2)<=work,1) = net_income(aux(aux(:,2)<=work,1));
fcn = @(x)mean(x);
SP.income = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux(:,1)=log(aux(:,1));
SP.log_income = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
%social planner solution
agrid_SP = linspace(0,7*SP.income(32),na)';
aux = sortrows(panel(:,[6 8]),2); %keep wealth and age
fcn = @(x)mean(x);
wealth.age_mean = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)var(x);
wealth.age_var_log = accumarray_expand_s(log(aux(:,1)+1),aux(:,2),fcn);%conflict?lower than Macro?
SP.C = rep_agent(life,agrid_SP,na,beta,R,gamma,0,SP.income,wealth.age_mean(1));
SP.log_C=log(SP.C);
%value function by age
%by age mean value function
aux = sortrows(panel(:,[10 8]),2); %keep value function and age
fcn = @(x)mean(x);
value_age = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
SP.V = zeros(life,1);
for t = 1:life
    SP.V(t,1) = u_uncertain(SP.C(t:end),beta,gamma,t,life); 
end
%consumption equivalenze
omega = (value_age(:,1)./SP.V).^(1/(1-gamma))-1;
% mean_omega=mean(omega)
%% Statistics
%mean consumption over the life-cycle
aux = sortrows(panel(:,[7 8]),2); %keep consumption and age
fcn = @(x)mean(x);
consumption_age = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
%var consumption over the life-cycle
fcn = @(x)var(x);
consumption_age_var = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
%var log consumption over the life-cycle
aux(:,1) = log(aux(:,1));
fcn = @(x)var(x);
log_consumption_age_var = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)mean(x);
log_consumption_age = accumarray_expand_s(aux(:,1),aux(:,2),fcn);

%wealth dist by age
aux = sortrows(panel(:,[6 8]),2); 
fcn = @(x)prctile(x,1);
wealth_age_p.p1 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,5);
wealth_age_p.p5 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,10);
wealth_age_p.p10 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,20);
wealth_age_p.p20 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,50);
wealth_age_p.p50 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,90);
wealth_age_p.p90 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,95);
wealth_age_p.p95 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,99);
wealth_age_p.p99 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);

%wealth gini by age
aux = sortrows(panel(:,[6 8]),2); 
fcn= @(x)ginicoeff(x);
baseline.wealth_age_gini=accumarray_expand_s(aux(:,1),aux(:,2),fcn);

%income gini by age
aux = sortrows(panel(:,[5 8]),2); 
fcn= @(x)ginicoeff(x);
baseline.income_age_gini=accumarray_expand_s(aux(:,1),aux(:,2),fcn);

%consumption gini by age
aux = sortrows(panel(:,[7 8]),2); 
fcn= @(x)ginicoeff(x);
baseline.consumption_age_gini=accumarray_expand_s(aux(:,1),aux(:,2),fcn);

%wealth dist along Lifetime
aux = sortrows(panel(:,[1 6 8]),1); 
aux(aux(:,3)>32,:)=[];
auxi=aux;
fcn = @(x)sum(x);
wealth_lt=accumarray_expand_s(aux(:,2),aux(:,1),fcn);
h=1:H;
h=h';
aux=[wealth_lt, h];
baseline.wealth_p.p1 = prctile(auxi(:,2),1);
baseline.wealth_p.p5 = prctile(auxi(:,2),5);
baseline.wealth_p.p10 = prctile(auxi(:,2),10);
baseline.wealth_p.p50 = prctile(auxi(:,2),50);
baseline.wealth_p.p90 = prctile(auxi(:,2),90);
baseline.wealth_p.p95 = prctile(auxi(:,2),95);
baseline.wealth_p.p99 = prctile(auxi(:,2),99);

wealth_cs_99_50=baseline.wealth_p.p99/baseline.wealth_p.p50
wealth_cs_95_50=baseline.wealth_p.p95/baseline.wealth_p.p50
wealth_cs_90_50=baseline.wealth_p.p90/baseline.wealth_p.p50

tot_lt_wealth=sum(aux(:,1));
tot_cs_wealth=sum(auxi(:,2));
tot_wealth_99_over_tot_economy_macro=sum(auxi(baseline.wealth_p.p99<auxi(:,2),2))/tot_cs_wealth
tot_wealth_50_over_tot_economy_macro=sum(auxi(baseline.wealth_p.p50>auxi(:,2),2))/tot_cs_wealth

gini_wealth_lt=ginicoeff(aux(:,1));
gini_wealth_cs_baseline=ginicoeff(auxi(:,2))

%variance of log residual earnings over life cycle
aux = sortrows(panel(:,[5 8]),2); %keep income and age
aux(:,1) = log(aux(:,1));
%age_dummy = dummyvar(aux(:,2));
%reg = ols(aux(:,1),[ones(length(aux(:,1)),1) age_dummy(:,2:end)]);
%aux(:,1) = reg.resid;
fcn = @(x)var(x);
var_earn_age = accumarray_expand_s(aux(:,1),aux(:,2),fcn);

%earnings dist
aux = sortrows(panel(:,[5 8]),2); 
fcn = @(x)prctile(x,1);
earn_age_p.p1 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,5);
earn_age_p.p5 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,10);
earn_age_p.p10 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,20);
earn_age_p.p20 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,50);
earn_age_p.p50 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,90);
earn_age_p.p90 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,95);
earn_age_p.p95 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,99);
earn_age_p.p99 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);

%earnings dist ON DATA average across birth cohorts
aux=csvread('perc_data.out');
data_simplified_earn_age_p.p1=aux(:,1);
data_simplified_earn_age_p.p5=aux(:,2);
data_simplified_earn_age_p.p10=aux(:,3);
data_simplified_earn_age_p.p20=aux(:,4);
data_simplified_earn_age_p.p50=aux(:,5);
data_simplified_earn_age_p.p90=aux(:,6);
data_simplified_earn_age_p.p95=aux(:,7);
data_simplified_earn_age_p.p99=aux(:,8);

%consumption dist
aux = sortrows(panel(:,[7 8]),2); %keep consumption and age
fcn = @(x)prctile(x,1);
consumption_age_p.p1 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel(:,[7 8]),2); %keep consumption and age
fcn = @(x)prctile(x,5);
consumption_age_p.p5 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel(:,[7 8]),2); %keep consumption and age
fcn = @(x)prctile(x,10);
consumption_age_p.p10 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel(:,[7 8]),2); %keep consumption and age
fcn = @(x)prctile(x,20);
consumption_age_p.p20 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel(:,[7 8]),2); %keep consumption and age
fcn = @(x)prctile(x,50);
consumption_age_p.p50 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel(:,[7 8]),2); %keep consumption and age
fcn = @(x)prctile(x,90);
consumption_age_p.p90 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel(:,[7 8]),2); %keep consumption and age
fcn = @(x)prctile(x,95);
consumption_age_p.p95 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel(:,[7 8]),2); %keep consumption and age
fcn = @(x)prctile(x,99);
consumption_age_p.p99 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
%
%% save parameters from full model
baseline.beta = beta;
baseline.panel=panel;
baseline.SP.income = SP.income;
baseline.SP.log_income = SP.log_income;
baseline.SP.C = SP.C;
baseline.SP.log_C = SP.log_C;
baseline.omega = omega;
baseline.var_earn_age = var_earn_age;
baseline.meanC_age = consumption_age;
baseline.log_meanC_age = log_consumption_age;
baseline.log_var_meanC_age = log_consumption_age_var;
baseline.consumption_age_p = consumption_age_p;
baseline.earn_age_p = earn_age_p;
baseline.wealth_age_p = wealth_age_p;
%baseline.panel_insure = panel_insure;
baseline.data_simplified_earn_age_p = data_simplified_earn_age_p;
save('baseline.mat','baseline')
save('wealth.mat','wealth')
%% Figures

%Var of Log Consumption by Age
diff_lc_log_consumption=log_consumption_age_var(32,1)-log_consumption_age_var(2,1)
figure
plot(log_consumption_age_var)
axis tight
set(gca,'XTick',[1 12 22 32 42 52] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55 65 75] ); %This is what it's going to appear in those places.
xlabel('Years','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Variance of Log Consumption','fontsize',24,'FontWeight','bold')
ylim([0 0.2])
print('SM_VarLogCon','-dpng')
%Var of Log Income by Age
aux=csvread('coh_coeff_extrapolated.out');
mean_coh_coeff=mean(aux)
var_earn_age_1=var_earn_age(1)
figure
plot(var_earn_age)
axis tight
set(gca,'XTick',[1 12 22 32 42 52] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55 65 75] ); %This is what it's going to appear in those places.
xlabel('Years','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Variance of Log Income','fontsize',24,'FontWeight','bold')
ylim([0 0.7])
print('SM_VarLogInc','-dpng')
%
figure
plot(consumption_age)
axis tight
set(gca,'XTick',[1 12 22 32 42 52] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55 65 75] ); %This is what it's going to appear in those places.
xlabel('Years','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('E[Cons]','fontsize',24,'FontWeight','bold')
%ylim([0 0.7])
print('SM_Cons','-dpng')
%
% Wealth/Income Ratio
wealth_income_median_24=wealth.age_income_median(1)
wealth_income_median_55=wealth.age_income_median(32)
figure
plot(wealth.age_income_median)
axis tight
set(gca,'XTick',[1 12 22 32 42 52] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55 65 75] ); %This is what it's going to appear in those places.
xlabel('Years','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Wealth / Income','fontsize',24,'FontWeight','bold')
print('SM_WealthIncomeMed_life','-dpng')
%
figure
plot(wealth.age_income_median(1:32),'LineWidth',2.5)
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Years','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Wealth / Income','fontsize',24,'FontWeight','bold')
print('SM_WealthIncomeMed','-dpng')
%

disp('Finished!')
beep on
toc