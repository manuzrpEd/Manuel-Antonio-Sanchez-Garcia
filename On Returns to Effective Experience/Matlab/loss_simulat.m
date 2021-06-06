function [loss] = loss_simulat(param,Nsim,Nwork,Ne,xgrid,data,Nmonths,bbeta,emp)
clear mex
rand('seed',8842554);

b1=param(1);
b2=param(2);
b3=param(3);
Sig_e1=param(4);
Sig_e2=param(5);
Sig_e3=param(6);
dj1=param(7);
dj2=param(8);
dj3=param(9);
du1=param(10);
du2=param(11);
du3=param(12);
fe1=param(13);
fe2=param(14);
fe3=param(15);
fu1=param(16);
fu2=param(17);
fu3=param(18);
ps1=param(19);
ps2=param(20);
ps3=param(21);
pk1=param(22);
pk2=param(23);
pk3=param(24);
% sigma_a=param(25);

% auxiliary
b=(b1+b2.*(1:Nwork)+b3.*(1:Nwork).^2)';
Sig_e=sqrt(exp(Sig_e1+Sig_e2.*(1:Nwork)+Sig_e3.*(1:Nwork).^2))';
dj=(dj1+dj2.*(1:Nwork)+dj3.*(1:Nwork).^2)';
du=(du1+du2.*(1:Nwork)+du3.*(1:Nwork).^2)';
fe=(fe1+fe2.*(1:Nwork)+fe3.*(1:Nwork).^2)';
fu=(fu1+fu2.*(1:Nwork)+fu3.*(1:Nwork).^2)';
ps=(ps1+ps2.*(1:Nwork)+ps3.*(1:Nwork).^2)';
pk=(pk1+pk2.*(1:Nwork)+pk3.*(1:Nwork).^2)';
b = interp1( linspace(0,1,numel(b)), b, linspace(0,1,Nmonths) );
dj = interp1( linspace(0,1,numel(dj)), dj, linspace(0,1,Nmonths) );
du = interp1( linspace(0,1,numel(du)), du, linspace(0,1,Nmonths) );
fe = interp1( linspace(0,1,numel(fe)), fe, linspace(0,1,Nmonths) );
fu = interp1( linspace(0,1,numel(fu)), fu, linspace(0,1,Nmonths) );
ps = interp1( linspace(0,1,numel(ps)), ps, linspace(0,1,Nmonths) );
pk = interp1( linspace(0,1,numel(pk)), pk, linspace(0,1,Nmonths) );
mdu     = 1-du;
mdj     = 1-dj;
mpk     = 1-pk;
mfu     = 1-fu;
mfe     = 1-fe;
mps     = 1-ps;
%permanent heterogeneity
% [grid_perm,prob_perm] = Norm(NPP,0,sigma_a,'equi');
% prob_perm = cumsum(prob_perm);

egrid_lc=zeros(Ne,Nwork);
Pr_e_lc=zeros(Ne,Nwork);
Pr_e_c_lc=zeros(Ne,Nwork);
for i=1:Nwork
    [egrid_lc(:,i), Pemat] = mytauchen(- 0.5*Sig_e(i,1)^2 , 0 , Sig_e(i,1) , Ne);
    Pr_e_lc(:,i)    = Pemat(1,:);
    Pr_e_c_lc(:,i)  = cumsum(Pemat(1,:));
end

% Initialization of arrays
yd_w     = zeros(Ne,Nwork);%--> dims: (Match qual, human k)
for ie = 1:Ne
    for hc = 1:Nwork
       yd_w(ie,hc) = xgrid(hc)*exp(egrid_lc(ie,hc));%+grid_perm(ai)
    end   
end

[V_w,V_u]=Value_Fs(int32(Ne),b,bbeta,yd_w,int32(Nmonths),int32(Nwork),fe',fu',ps',pk',du',dj',mfe',mfu',mps',mpk',mdu',mdj',Pr_e_lc');%,int32(NPP)

d_s         = rand(Nsim,Nmonths);   % depreciation shock
f_s         = rand(Nsim,Nmonths);   % job finding shock
pk_s        = rand(Nsim,Nmonths);   % human k accumulation shock
ps_s        = rand(Nsim,Nmonths);   % separation probability
e_s         = rand(Nsim,Nmonths);   % match quality shock
% a_s         = rand(Nsim,1);

[L_sim,~,ws_sim,EU_sim,UE_sim,JJ_sim]=lc_simul(int32(Nsim),int32(Nmonths),int32(Nwork),int32(Ne),e_s,d_s,pk_s,ps_s,f_s,Pr_e_c_lc',fu',fe',pk',ps',du',dj',V_w,V_u,yd_w,egrid_lc);%,int32(NPP),prob_perm,a_s
% x_sim=double(x_sim);

EuE_change=EuE(int32(size(ws_sim,1)),int32(size(ws_sim,2)),L_sim,ws_sim);
EuE_change(EuE_change==0)=NaN;

JJ_change=nan(size(ws_sim,1),size(ws_sim,2));
%
for i=1:size(ws_sim,1)
    for j=3:size(ws_sim,2)
        if JJ_sim(i,j)==1 && JJ_sim(i,j-1)==0
            JJ_change(i,j)=ws_sim(i,j)-ws_sim(i,j-1);
        end
    end
end

EuE_change   = nanmean(EuE_change);
JJ_change   = nanmean(JJ_change);
job2job     =[1, sum(JJ_sim(:,2:Nmonths),1) ./ sum(L_sim(:,1:Nmonths-1)==1,1)];
u2e          =[1, sum(UE_sim(:,2:Nmonths),1) ./ sum(L_sim(:,1:Nmonths-1)==0,1)];
e2u          =[1, sum(EU_sim(:,2:Nmonths),1) ./ sum(L_sim(:,1:Nmonths-1)==1,1)];
wages_demand = mean(mean(yd_w,3))';
wages_survey = sum(ws_sim,1) ./ sum(ws_sim~=0,1);
%
EuE_change = accumarray(ceil((1:numel(EuE_change))/12)',EuE_change(:),[],@nanmean);
JJ_change = accumarray(ceil((1:numel(JJ_change))/12)',JJ_change(:),[],@nanmean);
wages_survey = accumarray(ceil((1:numel(wages_survey))/12)',wages_survey(:),[],@nanmean);
job2job = accumarray(ceil((1:numel(job2job))/12)',job2job(:),[],@nanmean);
u2e = accumarray(ceil((1:numel(u2e))/12)',u2e(:),[],@nanmean);
e2u = accumarray(ceil((1:numel(e2u))/12)',e2u(:),[],@nanmean);
employment   = mean(L_sim);
employment = accumarray(ceil((1:numel(employment))/12)',employment(:),[],@nanmean);

error_JJ=10*((job2job(4:end)-data(:,2))./1)'*((job2job(4:end)-data(:,2))./1);
error_UE=2*((u2e(4:end)-data(:,3))./1)'*((u2e(4:end)-data(:,3))./1);
error_EU=3*((e2u(4:end)-data(:,1))./1)'*((e2u(4:end)-data(:,1))./1);
error_xgrid=.05*((wages_demand(4:end)-data(:,4))./1)'*((wages_demand(4:end)-data(:,4))./1);
error_sgrid=4*((wages_survey(4:end)-data(:,5))./1)'*((wages_survey(4:end)-data(:,5))./1);
error_EUE=3000*((mean(EuE_change)-data(1,6))./1)'*((mean(EuE_change)-data(1,6))./1);
error_JJG=1000*((mean(JJ_change)-data(1,7))./1)'*((mean(JJ_change)-data(1,7))./1);
error_emp=1*((employment(2:end,1)-emp(:,1))./1)'*((employment(2:end,1)-emp(:,1))./1);
loss=error_JJ+error_UE+error_EU+error_xgrid+error_sgrid+error_EUE+error_JJG+error_emp;
end

