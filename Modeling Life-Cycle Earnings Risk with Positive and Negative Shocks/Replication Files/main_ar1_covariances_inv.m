clear all
close all
clc
tic
set(0,'DefaultFigureWindowStyle','docked')
% AR1 Macro process for earnings using covariance moments
%% Parameterization
load('paraopt_ar1_macro_agevar_covlevel_inv_10ACV.mat','paraopt_ar1_macro_agevar_covlevel_inv_10ACV')
load('baseline.mat','baseline')
load('ar1.mat','ar1')
rand('seed',8842554); 
randn('seed',5578462); 
lognrnd('seed',6247887); 

mean_income_base = baseline.SP.income;
H= 20000;
work = 32;
retire = 20;
life=work+retire;
r = 0.04;
R = 1+r;
beta = 0.9785;
gamma=1.5;
Nt = 15;
NPP = 8;
Np = 20;
na = 1000;

%deterministic life component
aux1=csvread('determ_age.out');
aux2=csvread('determ_year_birth.out');
determ = [aux2(end);aux2(end)+aux1];

%% Macro Covar Solution

%permanent heterogeneity
sigma_a = sqrt(paraopt_ar1_macro_agevar_covlevel_inv_10ACV(2));%to match initial inequality of full model
[grid_perm,prob_perm] = Norm(NPP,0,sigma_a,'equi');
[grid_perm_ss,~] = Norm(NPP,0,sigma_a,'equi');

%stochastic permanent component
rho = paraopt_ar1_macro_agevar_covlevel_inv_10ACV(1);%good result-0.01?
sigma_p = sqrt(paraopt_ar1_macro_agevar_covlevel_inv_10ACV(4))';% %0.1;
grid_pers = linspace(-1,1,Np)';
prob_pers = zeros(Np,Np,work);
for t = 1:work %all points reached over the life-cycle
    prob_pers(:,:,t) = pers_prob(grid_pers,0,sigma_p(1,1),rho,Np);
end

%transitory shock
sigma_t=zeros(work,1);
sigma_t(1:work,1) = sqrt(paraopt_ar1_macro_agevar_covlevel_inv_10ACV(3))';
sigma_t(1)=sqrt(paraopt_ar1_macro_agevar_covlevel_inv_10ACV(5));
[grid_tran,prob_tran] = get_persistent_trans_inv(Nt,work,sigma_t);
% [grid_tran,prob_tran] = Norm(Nt,0,sigma_t,'equi');

load('mean_learn_age_macro_covar_inv_beta.mat','mean_learn_age_macro_covar_inv_beta')
% mean_learn_age_macro_covar_inv_beta=mean_learn_age_macro_covar_beta;
mean_learn_age = mean_learn_age_macro_covar_inv_beta(1:32);

%wage income
w_g = zeros(Np,Nt,NPP,work);
for t = 1:work
    for k = 1:NPP
        for j = 1:Nt
            for i = 1:Np            
                w_g(i,j,k,t) = exp(grid_perm(k)+determ(t)+grid_pers(i,1)+grid_tran(j,1));%possibly I have to use determ here
            end
        end
    end
end

%social security income
ss = zeros(Np,NPP);
for i = 1:NPP
    aux = exp(grid_perm_ss(i)+determ(:));
    aux(aux>72600) = 72600; %maximum earnings subject to ss
    for j = 1:Np
        ss(j,i) = 0.5*mean(aux);
    end
end

%net wages
w = zeros(Np,Nt,NPP,work);
for t =1:work
    for l =1:NPP
        for k = 1:Nt
            for i = 1:Np            
                ss_t = 0.0935*min(w_g(i,k,l,t),72600); %social security taxes
                if w_g(i,k,l,t)<=8004
                    w(i,k,l,t) = w_g(i,k,l,t)-ss_t;
                elseif w_g(i,k,l,t)>8004 && w_g(i,k,l,t)<=13469
                    w(i,k,l,t) = w_g(i,k,l,t)-ss_t-(w_g(i,k,l,t)-8004)*((w_g(i,k,l,t)-8004)*0.000009976+0.14);
                elseif w_g(i,k,l,t)>13469 && w_g(i,k,l,t)<=52881
                    w(i,k,l,t) = w_g(i,k,l,t)-ss_t-(w_g(i,k,l,t)-13469)*((w_g(i,k,l,t)-13469)*0.0000022874+0.2397)-948.68;
                elseif w_g(i,k,l,t)>52881 && w_g(i,k,l,t)<=250730
                    w(i,k,l,t) = w_g(i,k,l,t)-ss_t-w_g(i,k,l,t)*0.42+8261.29;
                elseif w_g(i,k,l,t)>250730
                    w(i,k,l,t) = w_g(i,k,l,t)-ss_t-w_g(i,k,l,t)*0.45+15783.19;
                end
            end
        end
    end
end

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

agridL = repmat(reshape(agrid,[na 1 NPP life]),[1 Np 1 1]);
agridLL = repmat(reshape(agrid,[na 1 1 NPP life]),[1 Np Nt 1 1]);
ssL = repmat(reshape(ss,[1 Np NPP]),[na 1 1]);
wL = repmat(reshape(w,[1 Np Nt NPP work]),[na 1 1 1]);
aminL = repmat(reshape(amin,[1 1 NPP life]),[na Np 1 1]);
aminLL = repmat(reshape(amin,[1 1 1 NPP life]),[na Np Nt 1 1]);

% Value function
V_r = zeros(na,Np,NPP,retire);
c_r = zeros(na,Np,NPP,retire);
V_w = zeros(na,Np,Nt,NPP,work);
c_w = zeros(na,Np,Nt,NPP,work);
c_aux2 = zeros(na,Np,NPP);

%last period
c_r(:,:,:,end) = (1+r)*agridL(:,:,:,end)+ssL; %consume all income
V_r(:,:,:,end) = CARRA(c_r(:,:,:,end),gamma); %consume all income
        
t = 1;
while t<retire %retirement period
    B = rhs_r(c_r(:,:,:,retire-t+1),beta,R,gamma); %compute rhs of euler equation
    c_aux = B.^(-1/gamma); %solve for the implied consum
    a = (c_aux-ssL+agridL(:,:,:,life-t+1))./R; %the asset position that is consistent with the asset choice
    binding_constraints = agridL(:,:,:,life-t) < repmat(a(1,:,:),[na 1 1]);
    for k = 1:NPP
        for i=1:Np        
            c_aux2(:,i,k)=interp1_l(a(:,i,k),c_aux(:,i,k),agrid(:,k,life-t));
        end
    end
    AUX= ssL + agridL(:,:,:,life-t)*R - aminL(:,:,:,life-t+1);
    c_aux2(binding_constraints) = AUX(binding_constraints);
    c_r(:,:,:,retire-t) = c_aux2;
    anext = R*agridL(:,:,:,life-t)+ssL-c_r(:,:,:,retire-t); %implied savings
    for k = 1:NPP
        for i = 1:Np
            V_r(:,i,k,retire-t) = CARRA(c_r(:,i,k,retire-t),gamma)+beta*interp1_l(agrid(:,k,life-t+1),V_r(:,i,k,retire-t+1),anext(:,i,k));
        end
    end
    t = t+1;
end

c_aux2 = zeros(na,Np,Nt,NPP);

%working period
while t<life
    if t==retire
        B = rhs_r(c_r(:,:,:,1),beta,R,gamma); %compute rhs of euler equation 
        B = reshape(B,[na Np 1 NPP]);
        B = repmat(B,[1 1 Nt 1]); %last period, no expectations over transitory shocks
    else
        B = rhsar1(c_w(:,:,:,:,life-t+1),beta,R,gamma,na,Nt,Np,NPP,prob_pers(:,:,life-t+1),prob_tran(:,life-t+1));
    end
    c_aux = B.^(-1/gamma); %solve for the implied consum
    a = (c_aux-wL(:,:,:,:,life-t)+agridLL(:,:,:,:,life-t+1))./R; %the asset position that is consistent with the asset choice
    binding_constraints = agridLL(:,:,:,:,life-t) < repmat(a(1,:,:,:),[na 1 1 1]);%
    for l = 1:NPP
        for k = 1:Nt
            for i=1:Np  
                c_aux2(:,i,k,l)=interp1_l(a(:,i,k,l),c_aux(:,i,k,l),agrid(:,l,life-t));
            end
        end
    end
    AUX= wL(:,:,:,:,life-t) + agridLL(:,:,:,:,life-t)*R - aminLL(:,:,:,:,life-t+1);
    c_aux2(binding_constraints) = AUX(binding_constraints);
    c_w(:,:,:,:,life-t) = c_aux2;
    anext = R*agridLL(:,:,:,:,life-t)+wL(:,:,:,:,life-t)-c_w(:,:,:,:,life-t); %implied savings
    if t==retire %certain transition
        for l = 1:NPP
            for k = 1:Nt
                for i = 1:Np                
                    V_w(:,i,k,l,life-t) = CARRA(c_w(:,i,k,l,life-t),gamma)+beta*interp1_l(agrid(:,l,life-t+1),V_r(:,i,l,1),anext(:,i,k,l));
                end
            end
        end
    else
        V_w(:,:,:,:,life-t) = value_far1(c_w(:,:,:,:,life-t),V_w(:,:,:,:,life-t+1),anext,gamma,beta,agrid(:,:,life-t+1)...
            ,Np,na,Nt,NPP,prob_pers(:,:,life-t),prob_tran(:,life-t));
    end
    t = t+1;
end
% Simulation
rand('seed',8842554); 
randn('seed',5578462); 
lognrnd('seed',6247887);     
shock_p = zeros(H,work);%permanent productivity shocks
for t = 1:work
    shock_p(:,t) = 0+sigma_p(1,1)*randn(H,1);
end
shock_t = zeros(H,work);%permanent productivity shocks
for t = 1:work
    shock_t(:,t) = 0+sigma_t(t,1)*randn(H,1);
end

shock_perm = rand(H,1); %permanent productivity
% simulation
ar1.macro_covar_inv.shocks_pe=zeros(H,work);
ar1.macro_covar_inv.shocks_tr=zeros(H,work);
%initilization
panel_macro = zeros(H,6,life); %ID,perm prod,persistent prod,income,asset,consumption
panel_macro(:,1,1) = 1:H; %individual ID

prob_perm = cumsum(prob_perm);
for i =1:H %permanent productivity
    panel_macro(i,2,1) = sum(shock_perm(i,1)>prob_perm)+1;
end


for i = 1:H
    panel_macro(i,3,1) = 0; %persistent component
end


transitory = zeros(H,1);
%simulation
for t = 1:work
    %productivity shocks
    if t == 1
        for i = 1:H
            panel_macro(i,3,t) = rho*panel_macro(i,3,1)+shock_p(i,t); %productivity transition
            transitory(i,1) = shock_t(i,t);
        end
        panel_macro(:,5,1) = 0.71*exp(grid_perm(panel_macro(:,2,1))+mean_learn_age(t,1)+panel_macro(:,3,t)+transitory); %zero assets // initial wealth
    else
        for i = 1:H
            panel_macro(i,3,t) = rho*panel_macro(i,3,t-1)+shock_p(i,t); %productivity transition
            transitory(i,1) = shock_t(i,t);
        end
    end
    panel_macro(:,4,t) = exp(grid_perm(panel_macro(:,2,1))+mean_learn_age(t,1)+panel_macro(:,3,t)+transitory); %period earnings
    ar1.macro_covar_inv.shocks_pe(:,t)=shock_p(:,t);
    ar1.macro_covar_inv.shocks_tr(:,t)=shock_t(:,t);
    %net wages
    w_n = zeros(H,1);
    for i = 1:H  
        ss_t = 0.0935*min(panel_macro(i,4,t),72600); %social security taxes
        if panel_macro(i,4,t)<=8004
            w_n(i,1) = panel_macro(i,4,t)-ss_t;
        elseif panel_macro(i,4,t)>8004 && panel_macro(i,4,t)<=13469
            w_n(i,1) = panel_macro(i,4,t)-ss_t-(panel_macro(i,4,t)-8004)*((panel_macro(i,4,t)-8004)*0.000009976+0.14);
        elseif panel_macro(i,4,t)>13469 && panel_macro(i,4,t)<=52881
            w_n(i,1) = panel_macro(i,4,t)-ss_t-(panel_macro(i,4,t)-13469)*((panel_macro(i,4,t)-13469)*0.0000022874+0.2397)-948.68;
        elseif panel_macro(i,4,t)>52881 && panel_macro(i,4,t)<=250730
            w_n(i,1) = panel_macro(i,4,t)-ss_t-panel_macro(i,4,t)*0.42+8261.29;
        elseif panel_macro(i,4,t)>250730
            w_n(i,1) = panel_macro(i,4,t)-ss_t-panel_macro(i,4,t)*0.45+15783.19;
        end   
    end
    
    %find grid positions for interpolation
    [~,xi] = histc(panel_macro(:,3,t),grid_pers); %find lower bounds persistent component
    xi(panel_macro(:,3,t)<grid_pers(1)) = 1;
    xi(panel_macro(:,3,t)>=grid_pers(end)) = Np-1;
    [~,yi] = histc(transitory,grid_tran); %find lower bounds transitory
    yi(transitory<grid_tran(1)) = 1;
    yi(transitory>=grid_tran(end)) = Nt-1;
    for i = 1:H
        
        %lower bound asset grid
        wi = max(1,min(sum(panel_macro(i,5,t)>agrid(:,panel_macro(i,2,t),t)),na-1));%find lower bounds assets
        
        aux = R*panel_macro(i,5,t)+w_n(i,1)-amin(panel_macro(i,2,t),t);
        panel_macro(i,6,t) = min(interp3_l(agrid(:,panel_macro(i,2,t),t),grid_pers,grid_tran,c_w(:,:,:,panel_macro(i,2,t),t)...
            ,panel_macro(i,5,t),panel_macro(i,3,t),transitory(i),wi,xi(i),yi(i)),aux); %consumption
        
        %assets next period
        panel_macro(i,5,t+1) = R*panel_macro(i,5,t)+w_n(i,1)-panel_macro(i,6,t);

    end
    panel_macro(:,1,t+1) = 1:H; %individual ID
    panel_macro(:,2,t+1) = panel_macro(:,2,t); %permanent productivity
end

%retirement
for t = work+1:life-1
    %productivity transitions
    panel_macro(:,2,t) = panel_macro(:,2,t-1);
    panel_macro(:,3,t) = panel_macro(:,3,t-1);
    
    %find grid positions for interpolation
    [~,yi] = histc(panel_macro(:,3,t),grid_pers); %find lower bounds permanent
    yi(panel_macro(:,3,t)<grid_pers(1)) = 1;
    yi(panel_macro(:,3,t)>=grid_pers(end)) = Np-1;
    
    for i = 1:H
        %income
        panel_macro(i,4,t) = interp1_l(grid_pers,ss(:,panel_macro(i,2,t)),panel_macro(i,3,t));
        
        xi = max(1,min(sum(panel_macro(i,5,t)>agrid(:,panel_macro(i,2,t),t)),na-1));%find lower bounds assets
        
        aux = R*panel_macro(i,5,t)+panel_macro(i,4,t)-amin(panel_macro(i,2,t),t);
        panel_macro(i,6,t) = min(interp2_l(agrid(:,panel_macro(i,2,t),t),grid_pers,c_r(:,:,panel_macro(i,2,t),t-work)...
                                ,panel_macro(i,5,t),panel_macro(i,3,t),xi,yi(i)),aux); %consumption       
        
        
        panel_macro(i,5,t+1) = R*panel_macro(i,5,t)+panel_macro(i,4,t)-panel_macro(i,6,t);    
        
    end
    panel_macro(:,1,t+1) = 1:H; %individual ID
end

%last period
panel_macro(:,2,end) = panel_macro(:,2,end-1);
panel_macro(:,3,end) = panel_macro(:,3,end-1);

for i = 1:H
    panel_macro(i,4,end) = interp1_l(grid_pers,ss(:,panel_macro(i,2,t)),panel_macro(i,3,end));
    panel_macro(i,6,end) = R*panel_macro(i,5,end)+panel_macro(i,4,end); %consumption
end

    panel_macro2 = zeros(H*life,6);
    for h = 1:H
        transform = squeeze(panel_macro(h,:,1:end));
        transform = transform';
        panel_macro2(1+(h-1)*life:h*life,:) = transform;
    end
    panel_macro = panel_macro2;
    clear panel_macro2
    
    % statistics from simulation
    
    %age
    fcn = @(x){cumsum(x)};
    panel_macro(:,7) = 1;
    panel_macro(:,7) = accumarray_expand(panel_macro(:,7),panel_macro(:,1),fcn);
    
    %wealth to income ratio
    panel_macro(:,8) = panel_macro(:,5)./panel_macro(:,4);
    aux = panel_macro(panel_macro(:,7)<=work,8);
    wealth.income_mean = mean(aux);
    wealth.income_median = median(aux);
    aux = sortrows(panel_macro(:,[8 7]),2); %keep wealth/income and age
    fcn = @(x)median(x);
    ar1.macro_covar_inv.wealth.age_income_median = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
% Wealth/Income Ratio
wealth_income_median_24=ar1.macro_covar_inv.wealth.age_income_median(1)
wealth_income_median_55=ar1.macro_covar_inv.wealth.age_income_median(32)
figure
plot(ar1.macro_covar_inv.wealth.age_income_median)
axis tight
set(gca,'XTick',[1 11 21 31 41 52] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55 65 75] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Wealth / Income','fontsize',24,'FontWeight','bold')
print('ar1_WealthIncomeMed_macro','-dpng')

    %mean and median wealth holdings over the life-cycle
    aux = sortrows(panel_macro(:,[5 7]),2); %keep wealth and age
    fcn = @(x)mean(x);
    wealth.age_mean = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
    fcn = @(x)var(x);
    wealth.age_var_log = accumarray_expand_s(log(aux(:,1)+1),aux(:,2),fcn);
    fcn = @(x)median(x);
    wealth.age_median = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
    
    %mean earnings over lc
    aux = sortrows(panel_macro(:,[4 7]),2); %keep income and age
    aux(aux(:,2)<=work,1) = net_income(aux(aux(:,2)<=work,1));
    fcn = @(x)mean(x);
    earn_mean = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
    
    crit = max(abs(earn_mean(1:32)-mean_income_base(1:32)))
    
earn_mean(1:32)-mean_income_base(1:32)
mean_learn_age_macro_covar_inv_beta = mean_learn_age;
save('mean_learn_age_macro_covar_inv_beta.mat','mean_learn_age_macro_covar_inv_beta');
% moments

%mean consumption over the life-cycle
aux = sortrows(panel_macro(:,[6 7]),2); %keep wealth and age
fcn = @(x)mean(x);
consumption_age_macro = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
%var
fcn = @(x)var(x);
consumption_age_var_macro = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
%var log
aux(:,1) = log(aux(:,1));
fcn = @(x)mean(x);
log_consumption_age_macro = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)var(x);
log_consumption_age_var_macro = accumarray_expand_s(aux(:,1),aux(:,2),fcn);

%wealth dist
aux = sortrows(panel_macro(:,[5 7]),2); 
fcn = @(x)prctile(x,10);
wealth_age_p.p10 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel_macro(:,[5 7]),2); 
fcn = @(x)prctile(x,20);
wealth_age_p.p20 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel_macro(:,[5 7]),2); 
fcn = @(x)prctile(x,50);
wealth_age_p.p50 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel_macro(:,[5 7]),2); 
fcn = @(x)prctile(x,90);
wealth_age_p.p90 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel_macro(:,[5 7]),2); 
fcn = @(x)prctile(x,99);
wealth_age_p.p99 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);

%wealth gini by age
aux = sortrows(panel_macro(:,[5 7]),2); 
fcn= @(x)ginicoeff(x);
ar1.macro_covar_inv.wealth_age_gini=accumarray_expand_s(aux(:,1),aux(:,2),fcn);

%income gini by age
aux = sortrows(panel_macro(:,[4 7]),2); 
fcn= @(x)ginicoeff(x);
ar1.macro_covar_inv.income_age_gini=accumarray_expand_s(aux(:,1),aux(:,2),fcn);

%consumption gini by age
aux = sortrows(panel_macro(:,[6 7]),2); 
fcn= @(x)ginicoeff(x);
ar1.macro_covar_inv.consumption_age_gini=accumarray_expand_s(aux(:,1),aux(:,2),fcn);


%variance of log residual earnings over life cycle
aux = sortrows(panel_macro(:,[4 7]),2); %keep income and age
aux(:,1) = log(aux(:,1));
% age_dummy = dummyvar(aux(:,2));
% reg = ols(aux(:,1),[ones(length(aux(:,1)),1) age_dummy(:,2:end)]);
% aux(:,1) = reg.resid;
fcn = @(x)var(x);
var_earn_age = accumarray_expand_s(aux(:,1),aux(:,2),fcn);

aux = sortrows(panel_macro(:,[4 7]),2);
fcn = @(x)prctile(x,1);
earn_age_p.p1 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,5);
earn_age_p.p5 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
% aux = sortrows(panel_macro(:,[4 7]),2); 
fcn = @(x)prctile(x,10);
earn_age_p.p10 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
fcn = @(x)prctile(x,20);
earn_age_p.p20 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
% aux = sortrows(panel_macro(:,[4 7]),2); 
fcn = @(x)prctile(x,50);
earn_age_p.p50 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
% aux = sortrows(panel_macro(:,[4 7]),2); 
fcn = @(x)prctile(x,90);
earn_age_p.p90 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
% aux = sortrows(panel_macro(:,[4 7]),2); 
fcn = @(x)prctile(x,95);
earn_age_p.p95 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
% aux = sortrows(panel_macro(:,[4 7]),2); 
fcn = @(x)prctile(x,99);
earn_age_p.p99 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);

aux = sortrows(panel_macro(:,[6 7]),2); %keep consumption and age
fcn = @(x)prctile(x,1);
consumption_age_p.p1 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel_macro(:,[6 7]),2); %keep consumption and age
fcn = @(x)prctile(x,5);
consumption_age_p.p5 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel_macro(:,[6 7]),2); %keep consumption and age
fcn = @(x)prctile(x,10);
consumption_age_p.p10 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel_macro(:,[6 7]),2); %keep consumption and age
fcn = @(x)prctile(x,20);
consumption_age_p.p20 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel_macro(:,[6 7]),2); %keep consumption and age
fcn = @(x)prctile(x,50);
consumption_age_p.p50 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel_macro(:,[6 7]),2); %keep consumption and age
fcn = @(x)prctile(x,90);
consumption_age_p.p90 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel_macro(:,[6 7]),2); %keep consumption and age
fcn = @(x)prctile(x,95);
consumption_age_p.p95 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(panel_macro(:,[6 7]),2); %keep consumption and age
fcn = @(x)prctile(x,99);
consumption_age_p.p99 = accumarray_expand_s(aux(:,1),aux(:,2),fcn);


%value function
panel_macro = [panel_macro zeros(length(panel_macro),1)];
for i = 1:length(panel_macro)
    panel_macro(i,9) = u_uncertain(panel_macro(i:i+life-panel_macro(i,7),6),beta,gamma,panel_macro(i,7),life);
end
%by age mean value function
aux = sortrows(panel_macro(:,[9 7]),2); %keep wealth and age
fcn = @(x)mean(x);
value_age = accumarray_expand_s(aux(:,1),aux(:,2),fcn);

% Social planner solution and welfare cost of incomplete markets
%per period income
aux = sortrows(panel_macro(:,[4 7]),2); %keep income and age
aux(aux(:,2)<=work,1) = net_income(aux(aux(:,2)<=work,1));
fcn = @(x)mean(x);
SP.income = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
%social planner solution
agrid_SP = linspace(0,7*SP.income(32),na)';
SP.Car1 = rep_agent(life,agrid_SP,na,beta,R,gamma,0,SP.income,wealth.age_mean(1));
%value function by age
SP.V = zeros(life,1);
for t = 1:life
    SP.V(t,1) = u_uncertain(SP.Car1(t:end),beta,gamma,t,life); 
end
%consumption equivalenze
omega_macro = (value_age(:,1)./SP.V).^(1/(1-gamma))-1;

ar1.macro_covar_inv.panel_macro = panel_macro;
ar1.macro_covar_inv.omega = omega_macro;
ar1.macro_covar_inv.SP.C = SP.Car1;
ar1.macro_covar_inv.SP.income = SP.income;
ar1.macro_covar_inv.var_earn_age = var_earn_age;
ar1.macro_covar_inv.meanC_age = consumption_age_macro;
ar1.macro_covar_inv.log_meanC_age = log_consumption_age_macro;
ar1.macro_covar_inv.log_var_meanC_age = log_consumption_age_var_macro;
ar1.macro_covar_inv.consumption_age_p = consumption_age_p;
ar1.macro_covar_inv.earn_age_p = earn_age_p;
ar1.macro_covar_inv.wealth_age_p = wealth_age_p;
ar1.macro_covar_inv.beta = beta;
ar1.macro_covar_inv.wealth.age_mean = wealth.age_mean;
ar1.macro_covar_inv.wealth.age_var_log = wealth.age_var_log;
save('ar1.mat','ar1');

%wealth dist along Lifetime
aux = sortrows(ar1.macro_covar_inv.panel_macro(:,[1 5 7]),1); 
aux(aux(:,3)>32,:)=[];
auxi=aux;
fcn = @(x)sum(x);
wealth_lt=accumarray_expand_s(aux(:,2),aux(:,1),fcn);
h=1:H;
h=h';
aux=[wealth_lt, h];
wealth_p.p1 = prctile(auxi(:,2),1);
wealth_p.p5 = prctile(auxi(:,2),5);
wealth_p.p10 = prctile(auxi(:,2),10);
wealth_p.p50 = prctile(auxi(:,2),50);
wealth_p.p90 = prctile(auxi(:,2),90);
wealth_p.p95 = prctile(auxi(:,2),95);
wealth_p.p99 = prctile(auxi(:,2),99);

wealth_cs_99_50=wealth_p.p99/wealth_p.p50
wealth_cs_95_50=wealth_p.p95/wealth_p.p50
wealth_cs_90_50=wealth_p.p90/wealth_p.p50

tot_lt_wealth=sum(aux(:,1));
tot_cs_wealth=sum(auxi(:,2));
tot_wealth_99_over_tot_economy_macro=sum(auxi(wealth_p.p99<auxi(:,2),2))/tot_cs_wealth%0.0540
tot_wealth_50_over_tot_economy_macro=sum(auxi(wealth_p.p50>auxi(:,2),2))/tot_cs_wealth

gini_wealth_lt_macro=ginicoeff(aux(:,1));
gini_wealth_cs_macro=ginicoeff(auxi(:,2))

diff_lc_log_consumption_macro=log_consumption_age_var_macro(32,1)-log_consumption_age_var_macro(2,1)

welfare_cost_macro=omega_macro(1,1)
%% Figures
% income comparison
figure
plot(baseline.SP.income(1:31),'LineWidth',2.5)
% hold on
% plot(ar1.macro.SP.income(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.SP.income(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','east');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('SP E[earnings]','fontsize',24)
print('beta_FullMacCov_inv_SP_Inc','-dpng')
% log income dispersion comparison
figure
plot(baseline.var_earn_age(1:31),'LineWidth',2.5)
% hold on
% plot(ar1.macro.var_earn_age(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.var_earn_age(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Southeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('$Var [v_{i,h}]$','fontsize',24,'interpreter','latex')
ylim([0 0.3])
print('beta_FullMacCov_inv_Var_Inc','-dpng')
% caca
% SP consumption comparison
figure
plot(baseline.SP.C(1:31),'LineWidth',2.5)
% hold on
% plot(ar1.macro.SP.C(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.SP.C(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','North');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('SP E[Consumption]','fontsize',24)
print('beta_FullMacCov_inv_SP_Cons','-dpng')
%omega - welfare costs
figure
plot(baseline.omega(1:31),'LineWidth',2.5)
% hold on
% plot(ar1.macro.omega(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.omega(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','East');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Welfare Cost','fontsize',24)
print('beta_FullMacCov_inv_omega','-dpng')
%
% average log consumption comparison
figure
plot((baseline.meanC_age(1:32)),'LineWidth',2.5)
% hold on
% plot((ar1.macro.meanC_age(1:32)),'LineWidth',2.5)
hold on
plot((ar1.macro_covar_inv.meanC_age(1:32)),'LineWidth',2.5)
% hold on
% plot((baseline.SP.C(1:32)),'LineWidth',2.5)
hold off
grid on
h=legend('AVRM','AIRM','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('E[Consumption]','fontsize',24)
print('beta_FullMacCov_inv_Cons','-dpng')
% log consumption dispersion comparison
figure
plot(baseline.log_var_meanC_age(1:31),'LineWidth',2.5)
% hold on
% plot(ar1.macro.log_var_meanC_age(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.log_var_meanC_age(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Var[log Consumption]','fontsize',24)
ylim([0 0.1])
print('beta_FullMacCov_inv_Var_Cons','-dpng')
%
figure
plot(baseline.consumption_age_p.p50(1:31)./baseline.consumption_age_p.p10(1:31),'LineWidth',2.5)
% hold on
% plot(ar1.macro.consumption_age_p.p50(1:31)./ar1.macro.consumption_age_p.p10(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.consumption_age_p.p50(1:31)./ar1.macro_covar_inv.consumption_age_p.p10(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Ratio','fontsize',24)
ylim([1 3])
print('beta_FullMacCov_inv_P5010Cons','-dpng')

figure
plot(baseline.consumption_age_p.p10(1:31)./baseline.consumption_age_p.p5(1:31),'LineWidth',2.5)
% hold on
% plot(ar1.macro.consumption_age_p.p10(1:31)./ar1.macro.consumption_age_p.p5(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.consumption_age_p.p10(1:31)./ar1.macro_covar_inv.consumption_age_p.p5(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('P_{10}/P_{05}  Consumption','fontsize',24)
ylim([1 3])
print('beta_FullMacCov_inv_P1005Cons','-dpng')

figure
plot(baseline.consumption_age_p.p10(1:31)./baseline.consumption_age_p.p1(1:31),'LineWidth',2.5)
% hold on
% plot(ar1.macro.consumption_age_p.p10(1:31)./ar1.macro.consumption_age_p.p1(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.consumption_age_p.p10(1:31)./ar1.macro_covar_inv.consumption_age_p.p1(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('P_{10}/P_{01}  Consumption','fontsize',24)
ylim([1 3])
print('beta_FullMacCov_inv_P1001Cons','-dpng')

figure
plot(baseline.consumption_age_p.p90(1:31)./baseline.consumption_age_p.p50(1:31),'LineWidth',2.5)
% hold on
% plot(ar1.macro.consumption_age_p.p90(1:31)./ar1.macro.consumption_age_p.p50(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.consumption_age_p.p90(1:31)./ar1.macro_covar_inv.consumption_age_p.p50(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Ratio','fontsize',24)
ylim([1 3])
print('beta_FullMacCov_inv_P9050Cons','-dpng')

figure
plot(baseline.consumption_age_p.p95(1:31)./baseline.consumption_age_p.p50(1:31),'LineWidth',2.5)
% hold on
% plot(ar1.macro.consumption_age_p.p95(1:31)./ar1.macro.consumption_age_p.p50(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.consumption_age_p.p95(1:31)./ar1.macro_covar_inv.consumption_age_p.p50(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Ratio','fontsize',24)
ylim([1 3])
print('beta_FullMacCov_inv_P9550Cons','-dpng')

figure
plot(baseline.consumption_age_p.p99(1:31)./baseline.consumption_age_p.p50(1:31),'LineWidth',2.5)
% hold on
% plot(ar1.macro.consumption_age_p.p99(1:31)./ar1.macro.consumption_age_p.p50(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.consumption_age_p.p99(1:31)./ar1.macro_covar_inv.consumption_age_p.p50(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Ratio','fontsize',24)
ylim([1 3])
print('beta_FullMacCov_inv_P9950Cons','-dpng')
%HFCS data
dshare_wealth_ab99=.4300277;
dshare_wealth_ab99(end+1,:)=.3723064;
dshare_wealth_ab99(end+1,:)=.3452095;
dshare_wealth_ab99(end+1,:)=.3456799;
dshare_wealth_ab99(end+1,:)=.3782158;
dshare_wealth_ab99(end+1,:)=.4792084;

dshare_wealth_ab90=.5063796;
dshare_wealth_ab90(end+1,:)=.445008 ;
dshare_wealth_ab90(end+1,:)=.4115019;
dshare_wealth_ab90(end+1,:)=.3936368;
dshare_wealth_ab90(end+1,:)=.441824 ;
dshare_wealth_ab90(end+1,:)=.5374377;

wealth_ratios_p9950=14.7239;
wealth_ratios_p9950(end+1,:)=12.234176	;
wealth_ratios_p9950(end+1,:)=11.563314;
wealth_ratios_p9950(end+1,:)=5.472764;
wealth_ratios_p9950(end+1,:)=14.10082;
wealth_ratios_p9950(end+1,:)=17.74454	;

wealth_ratios_p9050=6.086948;
wealth_ratios_p9050(end+1,:)=6.7750342;
wealth_ratios_p9050(end+1,:)=4.0973276		;
wealth_ratios_p9050(end+1,:)=3.1043758		;
wealth_ratios_p9050(end+1,:)=3.576224	;
wealth_ratios_p9050(end+1,:)=2.8926938;

wealth_ratios_p5020=8.4357216;
wealth_ratios_p5020(end+1,:)=3.6777038;
wealth_ratios_p5020(end+1,:)=3.6054872;
wealth_ratios_p5020(end+1,:)=4.4818674;
wealth_ratios_p5020(end+1,:)=7.9658716;
wealth_ratios_p5020(end+1,:)=3.881811;

wealth_ratios_var_log=3.4564282;
wealth_ratios_var_log(end+1,:)=2.1736254;
wealth_ratios_var_log(end+1,:)=1.7472004	;
wealth_ratios_var_log(end+1,:)=2.2997104;
wealth_ratios_var_log(end+1,:)=2.6347232	;
wealth_ratios_var_log(end+1,:)=2.98709;

wealth_ratios_gini=0.600068;
wealth_ratios_gini(end+1,:)=0.590218;
wealth_ratios_gini(end+1,:)=0.548858;
wealth_ratios_gini(end+1,:)=0.532308;
wealth_ratios_gini(end+1,:)=0.585706;
wealth_ratios_gini(end+1,:)=0.719616;

X_known = [3 8 13  18  23 28];
Y_known = wealth_ratios_p9950 ;
Y_known=Y_known';
X_desired = 1:31;
Y_desired_p9950 = interp1(X_known, Y_known, X_desired);

figure
plot(baseline.wealth_age_p.p99(1:31)./baseline.wealth_age_p.p50(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.wealth_age_p.p99(1:31)./ar1.macro_covar_inv.wealth_age_p.p50(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(Y_desired_p9950(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','North');
set(h,'FontSize',7); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',10,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 10)
set(gcf,'units','inches','PaperPosition',[0,0,20,6])
ylabel('Ratio','fontsize',10)
ylim([0 18])
print('beta_FullMacCov_inv_P9950Wealth','-dpng')
%
X_known = [3 8 13  18  23 28];
Y_known = wealth_ratios_p9050;
Y_known=Y_known';
X_desired = 1:31;
Y_desired_p9050 = interp1(X_known, Y_known, X_desired);

figure
plot(baseline.wealth_age_p.p90(1:31)./baseline.wealth_age_p.p50(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.wealth_age_p.p90(1:31)./ar1.macro_covar_inv.wealth_age_p.p50(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(Y_desired_p9050(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Northeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Ratio','fontsize',24)
ylim([0 10])
print('beta_FullMacCov_inv_P9050Wealth','-dpng')

figure
plot(baseline.wealth_age_p.p50(1:31)./baseline.wealth_age_p.p20(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.wealth_age_p.p50(1:31)./ar1.macro_covar_inv.wealth_age_p.p20(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Northeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Ratio','fontsize',24)
ylim([0 10])
print('beta_FullMacCov_inv_P5020Wealth','-dpng')

figure
plot(baseline.earn_age_p.p99(1:31)./baseline.earn_age_p.p50(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p99(1:31)./ar1.macro_covar_inv.earn_age_p.p50(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p99(1:31)./baseline.data_simplified_earn_age_p.p50(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Southeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Ratio Earnings','fontsize',24)
ylim([1 5])
print('beta_FullMacCov_inv_P9950Earn','-dpng')

figure
plot(baseline.earn_age_p.p95(1:31)./baseline.earn_age_p.p50(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p95(1:31)./ar1.macro_covar_inv.earn_age_p.p50(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p95(1:31)./baseline.data_simplified_earn_age_p.p50(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Ratio Earnings','fontsize',24)
ylim([1 5])
print('beta_FullMacCov_inv_P9550Earn','-dpng')

figure
plot(baseline.earn_age_p.p90(1:31)./baseline.earn_age_p.p50(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p90(1:31)./ar1.macro_covar_inv.earn_age_p.p50(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p90(1:31)./baseline.data_simplified_earn_age_p.p50(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Ratio Earnings','fontsize',24)
ylim([1 5])
print('beta_FullMacCov_inv_P9050Earn','-dpng')

figure
plot(baseline.earn_age_p.p50(1:31)./baseline.earn_age_p.p10(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p50(1:31)./ar1.macro_covar_inv.earn_age_p.p10(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p50(1:31)./baseline.data_simplified_earn_age_p.p10(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Ratio Earnings','fontsize',24)
ylim([1 5])
print('beta_FullMacCov_inv_P5010Earn','-dpng')

figure
plot(baseline.earn_age_p.p10(1:31)./baseline.earn_age_p.p5(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p10(1:31)./ar1.macro_covar_inv.earn_age_p.p5(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p10(1:31)./baseline.data_simplified_earn_age_p.p5(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('P_{10}/P_{05}  Earnings','fontsize',24)
ylim([1 5])
print('beta_FullMacCov_inv_P1005Earn','-dpng')

%
gini_age_data=csvread('gini_age_data.out');
%
figure
plot(baseline.income_age_gini(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.income_age_gini(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(gini_age_data(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Southeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Gini [Earnings]','fontsize',24,'interpreter','latex')
% ylim([0 0.2])
print('beta_FullMacCov_inv_gini_inc','-dpng')
%
%
figure
plot(baseline.consumption_age_gini(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.consumption_age_gini(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Southeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Gini [Consumption]','fontsize',24,'interpreter','latex')
% ylim([0 0.2])
print('beta_FullMacCov_inv_gini_cons','-dpng')
%

load('wealth.mat','wealth')
%var_log wealth
X_known = [3 8 13  18  23 28] ;
Y_known = wealth_ratios_var_log ;
Y_known=Y_known';
X_desired = 1:31 ;
Y_desired = interp1(X_known, Y_known, X_desired);
figure
plot(wealth.age_var_log(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.wealth.age_var_log(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(Y_desired,'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Northeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xt = get(gca, 'XTick');
set(gca, 'FontSize', 30)
xlabel('Age','fontsize',24,'FontWeight','bold')
y=ylabel('Var [log (Wealth)]','fontsize',24,'interpreter','latex');
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);
ylim([0 6])
print('beta_FullMacCov_inv_Var_log_Wealth','-dpng')
%
X_known = [3 8 13  18  23 28] ;
Y_known = wealth_ratios_gini ;
Y_known=Y_known';
X_desired = 1:31 ;
Y_desired = interp1(X_known, Y_known, X_desired);
figure
plot(baseline.wealth_age_gini(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.wealth_age_gini(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(Y_desired,'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Gini [Wealth]','fontsize',24,'interpreter','latex')
ylim([0 1])
print('beta_FullMacCov_inv_gini_Wealth','-dpng')
%
%
figure
plot(baseline.log_var_meanC_age(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.log_var_meanC_age(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Var[log Consumption]','fontsize',24,'interpreter','latex')
ylim([0 0.2])
print('beta_FullMacCov_inv_Var_Cons','-dpng')
%
ref=baseline.panel;
ref(ref(:,8)>32,:)=[];
perc_10=prctile(ref(:,6),10);
perc_20=prctile(ref(:,6),20);
%
ref(:,end+1)=ref(:,6)<perc_10;
ref(:,end+1)=ref(:,6)<perc_20;
%
aux = sortrows(ref(:,[11 8]),2);
fcn = @(x)mean(x);
share_perc_10_age = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(ref(:,[12 8]),2);
fcn = @(x)mean(x);
share_perc_20_age = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
%
ref_macro=ar1.macro_covar_inv.panel_macro;
ref_macro(ref_macro(:,7)>32,:)=[];
ref_macro(:,end+1)=ref_macro(:,5)<perc_10;
ref_macro(:,end+1)=ref_macro(:,5)<perc_20;
%
aux = sortrows(ref_macro(:,[10 7]),2);
fcn = @(x)mean(x);
share_perc_10_age_macro = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(ref_macro(:,[11 7]),2);
fcn = @(x)mean(x);
share_perc_20_age_macro = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
%
figure
plot(share_perc_10_age,'LineWidth',2.5)
hold on
plot(share_perc_10_age_macro,'LineWidth',2.5)
hold off
grid on
h=legend('AVRM','AIRM','Location','Northeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Share  P_{10}','fontsize',24)
ylim([0 1])
print('cat_cons_p10','-dpng')
%
figure
plot(share_perc_20_age,'LineWidth',2.5)
hold on
plot(share_perc_20_age_macro,'LineWidth',2.5)
hold off
grid on
h=legend('AVRM','AIRM','Location','Northeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Share  P_{20}','fontsize',24)
ylim([0 1])
print('cat_cons_p20','-dpng')
%share of wealth over the life-cycle by the top 10% and top 1%
ref=baseline.panel;
ref(ref(:,8)>32,:)=[];
perc_90=prctile(ref(:,7),90);
perc_99=prctile(ref(:,7),99);
%
ref(:,end+1)=ref(:,7)<perc_90;
ref(:,end+1)=ref(:,7)<perc_99;
%
aux = sortrows(ref(:,[11 8]),2);
fcn = @(x)mean(x);
share_perc_90_age = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(ref(:,[12 8]),2);
fcn = @(x)mean(x);
share_perc_99_age = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
%
ref_macro=ar1.macro_covar_inv.panel_macro;
ref_macro(ref_macro(:,7)>32,:)=[];
ref_macro(:,end+1)=ref_macro(:,6)<perc_90;
ref_macro(:,end+1)=ref_macro(:,6)<perc_99;
%
aux = sortrows(ref_macro(:,[10 7]),2);
fcn = @(x)mean(x);
share_perc_90_age_macro = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
aux = sortrows(ref_macro(:,[11 7]),2);
fcn = @(x)mean(x);
share_perc_99_age_macro = accumarray_expand_s(aux(:,1),aux(:,2),fcn);
%
figure
plot(share_perc_90_age,'LineWidth',2.5)
hold on
plot(share_perc_90_age_macro,'LineWidth',2.5)
hold off
grid on
h=legend('AVRM','AIRM','Location','Northeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Share  P_{90}','fontsize',24)
ylim([0 1])
print('share_wealth_p90','-dpng')
%
figure
plot(share_perc_99_age,'LineWidth',2.5)
hold on
plot(share_perc_99_age_macro,'LineWidth',2.5)
hold off
grid on
h=legend('AVRM','AIRM','Location','Northeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Share  P_{99}','fontsize',24)
ylim([0 1])
print('share_wealth_p20','-dpng')
%share wealth by age:
ref=baseline.panel;
ref(ref(:,8)>32,:)=[];
sum_90_age_ab=zeros(31,1);
sum_90_age_be=zeros(31,1);
sum_99_age_ab=zeros(31,1);
sum_99_age_be=zeros(31,1);
for i=2:32    
    perc_90=baseline.wealth_age_p.p90(i,1);
	perc_99=baseline.wealth_age_p.p99(i,1);
    aux = sortrows(ref(:,[6 8]),2);
    aux(aux(:,2)~=i,:)=[];
    aux_ab90=aux(:,1);
    aux_be90=aux(:,1);
    aux_ab99=aux(:,1);
    aux_be99=aux(:,1);
    aux_ab90(aux_ab90(:,1)<perc_90,:)=[];
    aux_be90(aux_be90(:,1)>perc_90,:)=[];
    aux_ab99(aux_ab99(:,1)<perc_99,:)=[];
    aux_be99(aux_be99(:,1)>perc_99,:)=[];
    sum_90_age_ab(i-1,1) = sum(aux_ab90);
    sum_90_age_be(i-1,1) = sum(aux_be90);
    sum_99_age_ab(i-1,1) = sum(aux_ab99);
    sum_99_age_be(i-1,1) = sum(aux_be99);
end
share_wealth_age_90=sum_90_age_ab./(sum_90_age_ab+sum_90_age_be);
share_wealth_age_99=sum_99_age_ab./(sum_99_age_ab+sum_99_age_be);
%
ref=ar1.macro_covar_inv.panel_macro;
ref(ref(:,7)>32,:)=[];
sum_90_age_ab=zeros(31,1);
sum_90_age_be=zeros(31,1);
sum_99_age_ab=zeros(31,1);
sum_99_age_be=zeros(31,1);
for i=2:32    
    perc_90=ar1.macro_covar_inv.wealth_age_p.p90(i,1);
	perc_99=ar1.macro_covar_inv.wealth_age_p.p99(i,1);
    aux = sortrows(ref(:,[5 7]),2);
    aux(aux(:,2)~=i,:)=[];
    aux_ab90=aux(:,1);
    aux_be90=aux(:,1);
    aux_ab99=aux(:,1);
    aux_be99=aux(:,1);
    aux_ab90(aux_ab90(:,1)<perc_90,:)=[];
    aux_be90(aux_be90(:,1)>perc_90,:)=[];
    aux_ab99(aux_ab99(:,1)<perc_99,:)=[];
    aux_be99(aux_be99(:,1)>perc_99,:)=[];
    sum_90_age_ab(i-1,1) = sum(aux_ab90);
    sum_90_age_be(i-1,1) = sum(aux_be90);
    sum_99_age_ab(i-1,1) = sum(aux_ab99);
    sum_99_age_be(i-1,1) = sum(aux_be99);
end
share_wealth_age_90_macro=sum_90_age_ab./(sum_90_age_ab+sum_90_age_be);
share_wealth_age_99_macro=sum_99_age_ab./(sum_99_age_ab+sum_99_age_be);
%
X_known = [3 8 13  18  23 28];
Y_known = dshare_wealth_ab90 ;
Y_known=Y_known';
X_desired = 1:31;
Y_desired_p90 = interp1(X_known, Y_known, X_desired);
%
figure
plot(share_wealth_age_90,'LineWidth',2.5)
hold on
plot(share_wealth_age_90_macro,'LineWidth',2.5)
hold on
plot(Y_desired_p90(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Northeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Share  P_{90}','fontsize',24)
ylim([0 1])
print('share_wealth_p90_age','-dpng')
%
X_known = [3 8 13  18  23 28];
Y_known = dshare_wealth_ab99 ;
Y_known=Y_known';
X_desired = 1:31;
Y_desired_p99 = interp1(X_known, Y_known, X_desired);
%
figure
plot(share_wealth_age_99,'LineWidth',2.5)
hold on
plot(share_wealth_age_99_macro,'LineWidth',2.5)
hold on
plot(Y_desired_p99(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Northeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 12 22 32] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Share  P_{99}','fontsize',24)
ylim([0 1])
print('share_wealth_p99_age','-dpng')

%earnings percentiles levels in each model!
figure
plot(baseline.earn_age_p.p99(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p99(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p99(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Southeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Earnings','fontsize',24)
% ylim([1 5])
print('beta_FullMacCov_inv_P99Earn','-dpng')
%
figure
plot(baseline.earn_age_p.p95(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p95(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p95(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Southeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Earnings','fontsize',24)
% ylim([1 5])
print('beta_FullMacCov_inv_P95Earn','-dpng')
%
figure
plot(baseline.earn_age_p.p90(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p90(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p90(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Southeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Earnings','fontsize',24)
% ylim([1 5])
print('beta_FullMacCov_inv_P90Earn','-dpng')
%
figure
plot(baseline.earn_age_p.p50(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p50(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p50(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Southeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Earnings','fontsize',24)
% ylim([1 5])
print('beta_FullMacCov_inv_P50Earn','-dpng')
%
figure
plot(baseline.earn_age_p.p20(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p20(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p20(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Southeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Earnings','fontsize',24)
% ylim([1 5])
print('beta_FullMacCov_inv_P20Earn','-dpng')
%
figure
plot(baseline.earn_age_p.p10(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p10(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p10(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Southeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Earnings','fontsize',24)
% ylim([1 5])
print('beta_FullMacCov_inv_P10Earn','-dpng')
%
figure
plot(baseline.earn_age_p.p5(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p5(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p5(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Southeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Earnings','fontsize',24)
% ylim([1 5])
print('beta_FullMacCov_inv_P5Earn','-dpng')
%
figure
plot(baseline.earn_age_p.p1(1:31),'LineWidth',2.5)
hold on
plot(ar1.macro_covar_inv.earn_age_p.p1(1:31),'LineWidth',2.5,'LineStyle','--')
hold on
plot(baseline.data_simplified_earn_age_p.p1(1:31),'LineWidth',2.5,'Marker','o')
hold off
grid on
h=legend('AVRM','AIRM','Data','Location','Southeast');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Earnings','fontsize',24)
% ylim([1 5])
print('beta_FullMacCov_inv_P1Earn','-dpng')
%
%utilities from consumption!
util_baseline=zeros(20000,1);
util_macro=zeros(5000,1);
q=1;
for i=1:size(baseline.panel,1)
    if baseline.panel(i,8)==1
           util_baseline(q,1)=baseline.panel(i,10);
           q=q+1;
    end
end
q=1;
for i=1:size(panel_macro,1)
    if panel_macro(i,7)==1
           util_macro(q,1)=panel_macro(i,9);
           q=q+1;
    end
end
sum_baseline=sum(util_baseline)
sum_macro=sum(util_macro)
%
mean_baseline=mean(util_baseline)
mean_macro=mean(util_macro)
%
var_baseline=var(util_baseline)
var_macro=var(util_macro)
%
skew_baseline=skewness(util_baseline)
skew_macro=skewness(util_macro)
%
kurt_baseline=kurtosis(util_baseline)
kurt_macro=kurtosis(util_macro)
%
%value function by age
SP_C_number_baseline=u_uncertain(baseline.SP.C,baseline.beta,gamma,1,life)
SP_C_number_macro=u_uncertain(SP.Car1,beta,gamma,1,life)
%

%histogram
figure
histogram(util_baseline)
xlim([-0.6 -0.1])
title('Baseline Utility')
print('hist_util_baseline','-dpng')
figure
histogram(util_macro)
xlim([-0.6 -0.1])
title('Macro Utility')
print('hist_util_macro','-dpng')
%
save('util_baseline.mat','util_baseline')
save('util_macro.mat','util_macro')
%

%Statistics on Consumption

cons_baseline=baseline.panel(:,7);
cons_baseline(baseline.panel(:,8)>32,:)=[];

earn_baseline=baseline.panel(:,5);
earn_baseline(baseline.panel(:,8)>32,:)=[];
var_log_earn_baseline=var(log(earn_baseline))

var_log_cons_baseline=var(log(cons_baseline))
skew_cons_baseline=skewness(cons_baseline)
skew_log_cons_baseline=skewness(log(cons_baseline))

p_99=prctile(cons_baseline,99);
cons_baseline(cons_baseline(:,1)>p_99,:)=[];
var_log_cons_baseline_drop=var(log(cons_baseline))
skew_cons_baseline_drop=skewness(cons_baseline)
skew_log_cons_baseline_drop=skewness(log(cons_baseline))


cons_macro=panel_macro(:,6);
cons_macro(panel_macro(:,7)>32,:)=[];

earn_macro=panel_macro(:,4);
earn_macro(panel_macro(:,7)>32,:)=[];
var_log_earn_macro=var(log(earn_macro))

var_log_cons_macro=var(log(cons_macro))
skew_cons_macro=skewness(cons_macro)
skew_log_cons_macro=skewness(log(cons_macro))

p_99=prctile(cons_macro,99);
cons_macro(cons_macro(:,1)>p_99,:)=[];
var_log_cons_macro_drop=var(log(cons_macro))
skew_cons_macro_drop=skewness(cons_macro)
skew_log_cons_macro_drop=skewness(log(cons_macro))

%Statistics on Baseline shocks:

pos_shocks=baseline.panel_insure;
pos_shocks(:,end+1)=pos_shocks(:,12)+pos_shocks(:,14);
fcn = @(x){cumsum(x)};
pos_shocks(:,end+1) = 1;
pos_shocks(:,end) = accumarray_expand(pos_shocks(:,end),pos_shocks(:,1),fcn);
pos_shocks(pos_shocks(:,15)==0,:)=[];

pos_shocks_after50=pos_shocks;
pos_shocks_after50(pos_shocks_after50(:,16)<26,:)=[];

pos_shocks_25=pos_shocks;
pos_shocks_25(pos_shocks_after50(:,16)==2,:)=[];

mean_pos_shocks_after50=mean(pos_shocks_after50(:,15));
var_pos_shocks_after50=var(pos_shocks_after50(:,15));

mean_pos_shocks_25=mean(pos_shocks_25(:,15));
var_pos_shocks_25=var(pos_shocks_25(:,15));

mean_pos_shocks_after50_over25=(mean_pos_shocks_after50/mean_pos_shocks_25)

var_pos_shocks_after50_over25=(var_pos_shocks_after50/var_pos_shocks_25)

neg_shocks=baseline.panel_insure;
neg_shocks(:,end+1)=neg_shocks(:,11)+neg_shocks(:,13);
fcn = @(x){cumsum(x)};
neg_shocks(:,end+1) = 1;
neg_shocks(:,end) = accumarray_expand(neg_shocks(:,end),neg_shocks(:,1),fcn);
neg_shocks(neg_shocks(:,15)==0,:)=[];

neg_shocks_after50=neg_shocks;
neg_shocks_after50(neg_shocks_after50(:,16)<26,:)=[];

mean_neg_shocks_after50=mean(abs(neg_shocks_after50(:,15)));
var_neg_shocks_after50=var(neg_shocks_after50(:,15));

neg_shocks_25=neg_shocks;
neg_shocks_25(neg_shocks_after50(:,16)==2,:)=[];

mean_neg_shocks_25=mean(abs(neg_shocks_25(:,15)));
var_neg_shocks_25=var(neg_shocks_25(:,15));

mean_neg_shocks_after50_over25=mean_neg_shocks_after50/mean_neg_shocks_25

var_neg_shocks_after50_over25=var_neg_shocks_after50/var_neg_shocks_25


figure
plot(baseline.wealth_age_p.p10(1:31),'LineWidth',2.5)
hold on
plot(wealth_age_p.p10(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Wealth','fontsize',24)
% ylim([1 3])
print('beta_FullMacCov_inv_P10Wealth','-dpng')

figure
plot(baseline.wealth_age_p.p20(1:31),'LineWidth',2.5)
hold on
plot(wealth_age_p.p20(1:31),'LineWidth',2.5,'LineStyle','--')
hold off
grid on
h=legend('AVRM','AIRM','Location','Northwest');
set(h,'FontSize',20); 
axis tight
set(gca,'XTick',[1 11 21 31] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[24 35 45 55] ); %This is what it's going to appear in those places.
xlabel('Age','fontsize',24,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 24)
ylabel('Wealth','fontsize',24)
% ylim([1 3])
print('beta_FullMacCov_inv_P20Wealth','-dpng')

%
disp('Finished!')
beep on
toc