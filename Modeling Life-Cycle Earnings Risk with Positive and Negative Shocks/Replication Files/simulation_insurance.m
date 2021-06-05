function panel = simulation_insurance(H,work,determ,R,c_w,agrid,amin,grid_p,grid_n,grid_tran,Np,Nn,Na,nnodes...
                    ,mu_p,sigma_p,mu_n,sigma_n,rho_p,rho_n,grid_perm,prob_perm...
                    ,prob_pp,prob_nn,mu_t,sigma_t,sigma_pt,sigma_nt)
%% create shock series
clear mex
% life = work+retire;
rand('seed',256344);
randn('seed',66573);
lognrnd('seed',6247887);  
% shocks_pe=zeros(H,life);
% shocks_tr=zeros(H,life);
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
%     shock_t(:,t) = trunc_nrnd(mu_t(t,1),sigma_t(t,1),10,H);%no need to truncate
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
shock_prob = rand(H,work);%mixture probability
shock_perm = rand(H,1); %permanent productivity
%% simulation
%initilization
panel = zeros(H,14,work); %ID,perm prod,positive prod,negative prod,income,asset,consumption,consumptionN,shockT,shockP
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
                panel(i,9,t)=transitory(i,t);
                panel(i,10,t)=0;%permanent whatsoever both pos and neg
                panel(i,11,t)=shock_tn(i,t);%negative
                panel(i,12,t)=0;%positive
                panel(i,13,t)=0;%negative
                panel(i,14,t)=0;%positive
            elseif sum(shock_prob(i,t)<prob_pp(t)+prob_nn(t))==1 %positive shock
                panel(i,3,t) = 0; %productivity transition +shock_p(i,t)
                panel(i,4,t) = 0;
                transitory(i,t) = shock_t(i,t)+shock_tp(i,t);
                panel(i,9,t)=transitory(i,t);
                panel(i,10,t)=0;
                panel(i,11,t)=0;
                panel(i,12,t)=shock_tp(i,t);
                panel(i,13,t)=0;%negative
                panel(i,14,t)=0;%positive
            else %no shock
                panel(i,3,t) = rho_p*panel(i,3,1); %productivity transition
                panel(i,4,t) = rho_n*panel(i,4,1);
                transitory(i,t) = shock_t(i,t);
                panel(i,9,t)=transitory(i,t);
                panel(i,10,t)=0;
                panel(i,11,t)=0;
                panel(i,12,t)=0;
                panel(i,13,t)=0;%negative
                panel(i,14,t)=0;%positive
            end
        end
        transitory(:,t) = max(min(tran_max,transitory(:,t)),tran_min);
        panel(:,6,1) = 0.71*exp(grid_perm(panel(:,2,1))+determ(t,1)+panel(:,3,t)+panel(:,4,t)+transitory(:,t)); %zero assets // initial wealth %assets next period
    else
        for i = 1:H
            if sum(shock_prob(i,t)<prob_nn(t))==1 %negative shock
                panel(i,3,t) = rho_p*panel(i,3,t-1); %productivity transition
                panel(i,4,t) = rho_n*panel(i,4,t-1)+shock_n(i,t);
                transitory(i,t) = shock_t(i,t)+shock_tn(i,t);
                panel(i,9,t)=transitory(i,t);
                panel(i,10,t)=shock_n(i,t);
                panel(i,11,t)=shock_tn(i,t);
                panel(i,12,t)=0;
                panel(i,13,t)=shock_n(i,t);%negative
                panel(i,14,t)=0;%positive
            elseif sum(shock_prob(i,t)<prob_pp(t)+prob_nn(t))==1 %positive shock
                panel(i,3,t) = rho_p*panel(i,3,t-1)+shock_p(i,t); %productivity transition
                panel(i,4,t) = rho_n*panel(i,4,t-1);
                transitory(i,t) = shock_t(i,t)+shock_tp(i,t);
                panel(i,9,t)=transitory(i,t);
                panel(i,10,t)=shock_p(i,t);
                panel(i,11,t)=0;
                panel(i,12,t)=shock_tp(i,t);
                panel(i,13,t)=0;%negative
                panel(i,14,t)=shock_p(i,t);%positive
            else %no shock
                panel(i,3,t) = rho_p*panel(i,3,t-1); %productivity transition
                panel(i,4,t) = rho_n*panel(i,4,t-1);
                transitory(i,t) = shock_t(i,t);
                panel(i,9,t)=transitory(i,t);
                panel(i,10,t)=0;
                panel(i,11,t)=0;
                panel(i,12,t)=0;
                panel(i,13,t)=0;%negative
                panel(i,14,t)=0;%positive
            end
        end
    end
    transitory(:,t) = max(min(tran_max,transitory(:,t)),tran_min);
    panel(:,5,t) = exp(grid_perm(panel(:,2,1))+determ(t,1)+panel(:,3,t)+panel(:,4,t)+transitory(:,t)); %period earnings not grid_perm
%     shocks_pe(:,t)=panel(:,3,t)+panel(:,4,t);
%     shocks_tr(:,t)=transitory(:,t);
    %net wages
    w_n = zeros(H,1);
    for i = 1:H  
        ss_t = 0.0935*min(panel(i,5,t),72600); %social security taxes
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
    %find grid positions for interpolation (actual consumption)
    [~,xi] = histc(panel(:,3,t),grid_p); %find lower bounds positive persistent
    xi(panel(:,3,t)<grid_p(1)) = 1;
    xi(panel(:,3,t)>=grid_p(end)) = Np-1;
    [~,yi] = histc(panel(:,4,t),grid_n); %find lower bounds negative persistent
    yi(panel(:,4,t)<grid_n(1)) = 1;
    yi(panel(:,4,t)>=grid_n(end)) = Nn-1;
    [~,zi] = histc(transitory(:,t),grid_tran); %find lower bounds transitory
    zi(transitory(:,t)<grid_tran(1)) = 1;
    zi(transitory(:,t)>=grid_tran(end)) = nnodes-1;
    %find grid positions for interpolation (no shocks)
    if t == 1
        xiN = xi;
        yiN = yi;
    else
        [~,xiN] = histc(rho_p*panel(:,3,t-1),grid_p); %find lower bounds positive persistent
        xiN(rho_p*panel(:,3,t-1)<grid_p(1)) = 1;
        xiN(rho_p*panel(:,3,t-1)>=grid_p(end)) = Np-1;
        [~,yiN] = histc(rho_n*panel(:,4,t-1),grid_n); %find lower bounds negative persistent
        yiN(rho_n*panel(:,4,t-1)<grid_n(1)) = 1;
        yiN(rho_n*panel(:,4,t-1)>=grid_n(end)) = Nn-1;
    end
    [~,ziN] = histc(0,grid_tran); %find lower bounds transitory
    ziN(0<grid_tran(1)) = 1;
    ziN(0>=grid_tran(end)) = nnodes-1;
    %negative consumption with code of Felix:
%         aux = R*panel(i,6,t)+w_n(i,1)-amin(panel(i,2,t),t); %max consumption      
%         wi = max(1,min(sum(panel(i,6,t)>agrid(:,panel(i,2,t),t)),Na-1));%find lower bounds assets
%         panel(i,7,t) = min(interp4_l(agrid(:,panel(i,2,t),t),grid_p,grid_n,grid_tran,c_w(:,:,:,:,panel(i,2,t),t)...
%            ,panel(i,6,t),panel(i,3,t),panel(i,4,t),transitory(i,t),wi,xi(i),yi(i),zi(i)),aux); %actual consumption
%     perm_int=panel(:,2,t);
%     [~,~,~,panel(:,7,t)]=panel_sim_o(panel,int32(H),R,w_n,amin,int32(t),agrid,grid_p,grid_n,grid_tran,c_w,transitory(:,t),int32(Np),int32(Nn),int32(nnodes),int32(NPP),int32(Na),int32(work),int32(xi),int32(yi),int32(zi),int32(perm_int));
    
    %
    for i = 1:H
        aux = R*panel(i,6,t)+w_n(i,1)-amin(panel(i,2,t),t); %max consumption 
        wi = max(1,min(sum(panel(i,6,t)>agrid(:,panel(i,2,t),t)),Na-1));%find lower bounds assets
         panel(i,7,t) = min(interp4_l(agrid(:,panel(i,2,t),t),grid_p,grid_n,grid_tran,c_w(:,:,:,:,panel(i,2,t),t)...
             ,panel(i,6,t),panel(i,3,t),panel(i,4,t),transitory(i,t),wi,xi(i),yi(i),zi(i)),aux); %actual consumption
       if t == 1
            panel(i,8,t) = min(interp4_l(agrid(:,panel(i,2,t),t),grid_p,grid_n,grid_tran,c_w(:,:,:,:,panel(i,2,t),t)...
                ,panel(i,6,t),panel(i,3,t),panel(i,4,t),0,wi,xiN(i),yiN(i),ziN),aux); %consumption no shock
       else
           panel(i,8,t) = min(interp4_l(agrid(:,panel(i,2,t),t),grid_p,grid_n,grid_tran,c_w(:,:,:,:,panel(i,2,t),t)...
                ,panel(i,6,t),rho_p*panel(i,3,t-1),rho_n*panel(i,4,t-1),0,wi,xiN(i),yiN(i),ziN),aux); %consumption no shock
       end
       if t<work
           panel(i,6,t+1) = R*panel(i,6,t)+w_n(i,1)-panel(i,7,t);%assets next period
       end
           
    end
    if t<work
        panel(:,1,t+1) = 1:H; %individual ID
        panel(:,2,t+1) = panel(:,2,t); %permanent productivity
    end
end
end