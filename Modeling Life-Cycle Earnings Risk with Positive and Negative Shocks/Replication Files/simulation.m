function [panel,qi,ri,si,transitory] = simulation(H,work,retire,determ,ss,R,c_r,c_w,agrid,amin,grid_p,grid_n,grid_tran,Np,Nn,na,nnodes...
                    ,mu_p,sigma_p,mu_n,sigma_n,rho_p,rho_n,grid_perm,prob_perm...
                    ,prob_pp,prob_nn,mu_t,sigma_t,sigma_pt,sigma_nt,NPP)
%% create shock series
clear mex
life = work+retire;
rand('seed',256344);
randn('seed',66573);
lognrnd('seed',6247887); 
%
tran_max = max(grid_tran);
tran_min = min(grid_tran);
%
shock_p = zeros(H,work);%pos permanent productivity shocks
shock_n = zeros(H,work);
shock_tp = zeros(H,work);%pos transitory productivity shocks
shock_tn = zeros(H,work);
shock_t = zeros(H,work);%pos permanent productivity shocks
%
for t = 1:work
%     shock_t(:,t) = trunc_nrnd(mu_t(t,1),sigma_t(t,1),10H);%no need to truncate
    shock_tp(:,t) = lognrnd(mu_p(t,1),sigma_pt(t,1),[H,1]);
    shock_tn(:,t) = lognrnd(mu_n(t,1),sigma_nt(t,1),[H,1]);
    shock_n(:,t) = lognrnd(mu_n(t,1),sigma_n(t,1),[H,1]);
    shock_p(:,t) = lognrnd(mu_p(t,1),sigma_p(t,1),[H,1]);
    shock_t(:,t)=mu_t(t,1)+sigma_t(t,1).*randn(H,1);
end
for i=1:work
    replaceIdx = (shock_tp(:,i) > exp(mu_p(i,1)+3*sigma_pt(i,1)));
        while sum(replaceIdx)>0
            shock_tp(replaceIdx,i) = lognrnd(mu_p(i,1),sigma_pt(i,1),1,sum(replaceIdx));
            replaceIdx = (shock_tp(:,i) > exp(mu_p(i,1)+3*sigma_pt(i,1)));
        end
    replaceIdx = (shock_tn(:,i) > exp(mu_n(i,1)+3*sigma_nt(i,1)));
        while sum(replaceIdx)>0
            shock_tn(replaceIdx,i) = lognrnd(mu_n(i,1),sigma_nt(i,1),1,sum(replaceIdx));
            replaceIdx = (shock_tn(:,i) > exp(mu_n(i,1)+3*sigma_nt(i,1)));
        end
    replaceIdx = (shock_n(:,i) > exp(mu_n(i,1)+3*sigma_n(i,1)));
        while sum(replaceIdx)>0
            shock_n(replaceIdx,i) = lognrnd(mu_n(i,1),sigma_n(i,1),1,sum(replaceIdx));
            replaceIdx = (shock_n(:,i) > exp(mu_n(i,1)+3*sigma_n(i,1)));
        end
    replaceIdx = (shock_p(:,i) > exp(mu_p(i,1)+3*sigma_p(i,1)));
        while sum(replaceIdx)>0
            shock_p(replaceIdx,i) = lognrnd(mu_p(i,1),sigma_p(i,1),1,sum(replaceIdx));
            replaceIdx = (shock_p(:,i) > exp(mu_p(i,1)+3*sigma_p(i,1)));
        end     
end
shock_n=-shock_n;
shock_tn=-shock_tn;
%
shock_prob = rand(H,work);%mixture probability
shock_perm = rand(H,1); %permanent productivity
% shock_wealth = rand(H,1);
qi=zeros(H,work);
ri=zeros(H,work);
si=zeros(H,work);
%% simulation
%initilization
panel = zeros(H,7,life); %ID, perm prod, positive prod, negative prod, income, asset, consumption
panel(:,1,1) = 1:H; %individual ID
prob_perm = cumsum(prob_perm);
for i =1:H %permanent productivity
    panel(i,2,1) = sum(shock_perm(i,1)>prob_perm)+1;
end
for i = 1:H
    panel(i,3,1) = 0; %pos component
    panel(i,4,1) = 0; %negative component
end
transitory = zeros(H,work);
%simulation
for t = 1:work
    %productivity shocks
    if t == 1
        for i = 1:H
            if sum(shock_prob(i,t)<prob_nn(t))==1 %negative shock
                panel(i,3,t) = 0; %productivity transition
                panel(i,4,t) = 0;%+shock_n(i,t)
                transitory(i,t) = shock_t(i,t)+shock_tn(i,t);
                %shocks_neg_tr(i,t)=shock_tn(i,t);
            elseif sum(shock_prob(i,t)<prob_pp(t)+prob_nn(t))==1 %positive shock
                panel(i,3,t) = 0; %productivity transition +shock_p(i,t)
                panel(i,4,t) = 0;
                transitory(i,t) = shock_t(i,t)+shock_tp(i,t);
                %shocks_pos_tr(i,t)=shock_tp(i,t);
            else %no shock
                panel(i,3,t) = 0; %productivity transition
                panel(i,4,t) = 0;
                transitory(i,t) = shock_t(i,t);
            end
        end
        transitory(:,t) = max(min(tran_max,transitory(:,t)),tran_min);
%         for i = 1:H
%             aux = sum(shock_wealth(i,1)>ini_wealth(:,panel(i,2,1)))+1;
%             panel(i,6,1) = agrid(aux,panel(i,2,1),1);
%         end
%the number at age 24 should be 0.71 and 4.8 at age 55.
        panel(:,6,1) = 0.71*exp(grid_perm(panel(:,2,1))+determ(t,1)+panel(:,3,t)+panel(:,4,t)+transitory(:,t)); %initial wealth
    else
        for i = 1:H
            if sum(shock_prob(i,t)<prob_nn(t))==1 %negative shock
                panel(i,3,t) = rho_p*panel(i,3,t-1); %productivity transition
                panel(i,4,t) = rho_n*panel(i,4,t-1)+shock_n(i,t);
                transitory(i,t) = shock_t(i,t)+shock_tn(i,t);
                %shocks_neg_tr(i,t)=shock_tn(i,t);
                %shocks_neg_pe(i,t)=shock_n(i,t);
            elseif sum(shock_prob(i,t)<prob_pp(t)+prob_nn(t))==1 %positive shock
                panel(i,3,t) = rho_p*panel(i,3,t-1)+shock_p(i,t); %productivity transition
                panel(i,4,t) = rho_n*panel(i,4,t-1);
                transitory(i,t) = shock_t(i,t)+shock_tp(i,t);
                %shocks_pos_tr(i,t)=shock_tp(i,t);
                %shocks_pos_pe(i,t)=shock_p(i,t);
            else %no shock
                panel(i,3,t) = rho_p*panel(i,3,t-1); %productivity transition
                panel(i,4,t) = rho_n*panel(i,4,t-1);
                transitory(i,t) = shock_t(i,t);
            end
        end
    end
    transitory(:,t) = max(min(tran_max,transitory(:,t)),tran_min);
%     transitory(:,t) =0;
%     caca=(grid_perm(panel(:,2,1))+panel(:,3,t)+panel(:,4,t)+transitory(:,t));
    panel(:,5,t) = exp(grid_perm(panel(:,2,1))+determ(t,1)+panel(:,3,t)+panel(:,4,t)+transitory(:,t)); %period earnings not grid_perm
    %shocks_pe(:,t)=panel(:,3,t)+panel(:,4,t);
    %shocks_tr(:,t)=transitory(:,1);
    %net wages
    w_n = zeros(H,1);
    for i = 1:H  
        ss_t = 0.0933*min(panel(i,5,t),72600); %social security taxes
        if panel(i,5,t)<=8004
            w_n(i,1) = panel(i,5,t)-ss_t;
        elseif panel(i,5,t)>8004 && panel(i,5,t)<=13469
            w_n(i,1) = panel(i,5,t)-ss_t-(panel(i,5,t)-8004)*((panel(i,5,t)-8004)*0.000009976+0.14);
        elseif panel(i,5,t)>13469 && panel(i,5,t)<=52881
            w_n(i,1) = panel(i,5,t)-ss_t-(panel(i,5,t)-13469)*((panel(i,5,t)-13469)*0.0000022874+0.2397)-948.68;
        elseif panel(i,5,t)>52881 && panel(i,5,t)<=250730
            w_n(i,1) = panel(i,5,t)-ss_t-panel(i,5,t)*0.42+8261.29;
        elseif panel(i,5,t)>250730
            w_n(i,1) = panel(i,5,t)-ss_t-panel(i,5,t)*0.45+15783.19;
        end   
    end
    %find grid positions for interpolation
    [~,qi(:,t)] = histc(panel(:,3,t),grid_p); %find lower bounds positive persistent
    qi(panel(:,3,t)<grid_p(1),t) = 1;
    qi(panel(:,3,t)>=grid_p(end),t) = Np-1;
    [~,ri(:,t)] = histc(panel(:,4,t),grid_n); %find lower bounds negative persistent
    ri(panel(:,4,t)<grid_n(1),t) = 1;
    ri(panel(:,4,t)>=grid_n(end),t) = Nn-1;
    [~,si(:,t)] = histc(transitory(:,t),grid_tran); %find lower bounds transitory
    si(transitory(:,t)<grid_tran(1),t) = 1;
    si(transitory(:,t)>=grid_tran(end),t) = nnodes-1;
    perm_int=panel(:,2,t);
    [panel(:,1,t+1),panel(:,2,t+1),panel(:,6,t+1),panel(:,7,t)]=panel_sim_o(panel,int32(H),R,w_n,amin,int32(t),agrid,grid_p,grid_n,grid_tran,c_w,transitory(:,t),int32(Np),int32(Nn),int32(nnodes),int32(NPP),int32(na),int32(work),int32(qi(:,t)),int32(ri(:,t)),int32(si(:,t)),int32(perm_int));
    %for i = 1:H      
        %aux = R*panel(i,6,t)+w_n(i,1)-amin(panel(i,2,t),t); %max consumption      
        %wi = max(1,min(sum(panel(i,6,t)>agrid(:,panel(i,2,t),t)),na-1));%find lower bounds assets
%         panel(i,7,t) = interp4_l(agrid(:,panel(i,2,t),t),grid_p,grid_n,grid_tran,c_w(:,:,:,:,panel(i,2,t),t)...
%            ,panel(i,6,t),panel(i,3,t),panel(i,4,t),transitory(i,t),1,qi(i,t),ri(i,t),si(i,t)); %consumption
        %panel(i,6,t+1) = R*panel(i,6,t)+w_n(i,1)-panel(i,7,t);%assets next period
        %if panel(i,7,t)<0
        %    display('Negative Consumption')
        %end
    %end
    %panel(:,1,t+1) = 1:H; %individual ID
    %panel(:,2,t+1) = panel(:,2,t); %permanent productivity
end

%retirement
for t = work+1:life-1
    %productivity transitions
    panel(:,2,t) = panel(:,2,t-1);
    panel(:,3,t) = panel(:,3,t-1);
    panel(:,4,t) = panel(:,4,t-1);  
    %find grid positions for interpolation
    [~,yi] = histc(panel(:,3,t),grid_p); %find lower bounds positive
    yi(panel(:,3,t)<grid_p(1)) = 1;
    yi(panel(:,3,t)>=grid_p(end)) = Np-1;
    [~,zi] = histc(panel(:,4,t),grid_n); %find lower bounds negative
    zi(panel(:,4,t)<grid_n(1)) = 1;
    zi(panel(:,4,t)>=grid_n(end)) = Nn-1;
    for i = 1:H
        %income
        panel(i,5,t) = interp2_l(grid_p,grid_n,ss(:,:,panel(i,2,t)),panel(i,3,t),panel(i,4,t),yi(i),zi(i));
        aux = R*panel(i,6,t)+panel(i,5,t)-amin(panel(i,2,t),t); %maximum consumption
        xi = max(1,min(sum(panel(i,6,t)>agrid(:,panel(i,2,t),t)),na-1));%find lower bounds assets
        panel(i,7,t) = min(interp3_l(agrid(:,panel(i,2,t),t),grid_p,grid_n,c_r(:,:,:,panel(i,2,t),t-work)...
                                ,panel(i,6,t),panel(i,3,t),panel(i,4,t),xi,yi(i),zi(i)),aux); %consumption       
        panel(i,6,t+1) = R*panel(i,6,t)+panel(i,5,t)-panel(i,7,t);%next period asset
    end
    panel(:,1,t+1) = 1:H; %individual ID
end
%last period
panel(:,2,end) = panel(:,2,end-1);
panel(:,3,end) = panel(:,3,end-1);
panel(:,4,end) = panel(:,4,end-1);
[~,yi] = histc(panel(:,3,end),grid_p); %find lower bounds
yi(panel(:,3,end)<grid_p(1)) = 1;
yi(panel(:,3,end)>=grid_p(end)) = Np-1;
[~,zi] = histc(panel(:,4,end),grid_n); %find lower bounds
zi(panel(:,4,end)<grid_n(1)) = 1;
zi(panel(:,4,end)>=grid_n(end)) = Nn-1;
for i = 1:H
    panel(i,5,end) = interp2_l(grid_p,grid_n,ss(:,:,panel(i,2,t)),panel(i,3,end),panel(i,4,end),yi(i),zi(i));
    panel(i,7,end) = R*panel(i,6,end)+panel(i,5,end); %consumption
end
end