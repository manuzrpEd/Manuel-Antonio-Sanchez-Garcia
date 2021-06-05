close all
clear
clear mex
clc
% n_draws = 100; 
% 1. The number of bootstraps is too small (increase number)
n_draws = 150; 
H=20000;
T=32;
col=T-1;
% mom_bootstrap_2ndcovar = zeros(n_draws,T);
%%
for q=1:n_draws
    q
tic
rng('default')
rng('shuffle')
resid_coh_1_inloop = csvread('resid_coh_1_extrap.out');
resid_coh_2_inloop = csvread('resid_coh_2_extrap.out');
resid_coh_3_inloop = csvread('resid_coh_3_extrap.out');
resid_coh_4_inloop = csvread('resid_coh_4_extrap.out');
resid_coh_5_inloop = csvread('resid_coh_5_extrap.out');
resid_coh_6_inloop = csvread('resid_coh_6_extrap.out');
resid_coh_7_inloop = csvread('resid_coh_7_extrap.out');
resid_coh_8_inloop = csvread('resid_coh_8_extrap.out');
resid_coh_9_inloop = csvread('resid_coh_9_extrap.out');
%make birth cohorts as in residual growth
le_hump_se_init = csvread('hump_logearnings_se_extrapolated.out');
le_hump_se_1=le_hump_se_init(le_hump_se_init(:,end)==1,:);
le_hump_se_2=le_hump_se_init(le_hump_se_init(:,end)==2,:);
le_hump_se_3=le_hump_se_init(le_hump_se_init(:,end)==3,:);
le_hump_se_4=le_hump_se_init(le_hump_se_init(:,end)==4,:);
le_hump_se_5=le_hump_se_init(le_hump_se_init(:,end)==5,:);
le_hump_se_6=le_hump_se_init(le_hump_se_init(:,end)==6,:);
le_hump_se_7=le_hump_se_init(le_hump_se_init(:,end)==7,:);
le_hump_se_8=le_hump_se_init(le_hump_se_init(:,end)==8,:);
le_hump_se_9=le_hump_se_init(le_hump_se_init(:,end)==9,:);

%
resid_coh_1_inloop(:,15)=grp2idx(resid_coh_1_inloop(:,2));
resid_coh_2_inloop(:,15)=grp2idx(resid_coh_2_inloop(:,2));
resid_coh_3_inloop(:,15)=grp2idx(resid_coh_3_inloop(:,2));
resid_coh_4_inloop(:,15)=grp2idx(resid_coh_4_inloop(:,2));
resid_coh_5_inloop(:,15)=grp2idx(resid_coh_5_inloop(:,2));
resid_coh_6_inloop(:,15)=grp2idx(resid_coh_6_inloop(:,2));
resid_coh_7_inloop(:,15)=grp2idx(resid_coh_7_inloop(:,2));
resid_coh_8_inloop(:,15)=grp2idx(resid_coh_8_inloop(:,2));
resid_coh_9_inloop(:,15)=grp2idx(resid_coh_9_inloop(:,2));
le_hump_se_1(:,7)=grp2idx(le_hump_se_1(:,2));
le_hump_se_2(:,7)=grp2idx(le_hump_se_2(:,2));
le_hump_se_3(:,7)=grp2idx(le_hump_se_3(:,2));
le_hump_se_4(:,7)=grp2idx(le_hump_se_4(:,2));
le_hump_se_5(:,7)=grp2idx(le_hump_se_5(:,2));
le_hump_se_6(:,7)=grp2idx(le_hump_se_6(:,2));
le_hump_se_7(:,7)=grp2idx(le_hump_se_7(:,2));
le_hump_se_8(:,7)=grp2idx(le_hump_se_8(:,2));
le_hump_se_9(:,7)=grp2idx(le_hump_se_9(:,2));
le_hump_se_1(1,8)=1;
for i=2:length(le_hump_se_1)
    if le_hump_se_1(i,7)==le_hump_se_1(i-1,7);
       le_hump_se_1(i,8)=le_hump_se_1(i-1,8)+1;
    elseif le_hump_se_1(i,7)~=le_hump_se_1(i-1,7);
       le_hump_se_1(i,8)=1;
    end
end
%
le_hump_se_2(1,8)=1;
for i=2:length(le_hump_se_2)
    if le_hump_se_2(i,7)==le_hump_se_2(i-1,7);
       le_hump_se_2(i,8)=le_hump_se_2(i-1,8)+1;
    elseif le_hump_se_2(i,7)~=le_hump_se_2(i-1,7);
       le_hump_se_2(i,8)=1;
    end
end
%
le_hump_se_3(1,8)=1;
for i=2:length(le_hump_se_3)
    if le_hump_se_3(i,7)==le_hump_se_3(i-1,7);
       le_hump_se_3(i,8)=le_hump_se_3(i-1,8)+1;
    elseif le_hump_se_3(i,7)~=le_hump_se_3(i-1,7);
       le_hump_se_3(i,8)=1;
    end
end
%
le_hump_se_4(1,8)=1;
for i=2:length(le_hump_se_4)
    if le_hump_se_4(i,7)==le_hump_se_4(i-1,7);
       le_hump_se_4(i,8)=le_hump_se_4(i-1,8)+1;
    elseif le_hump_se_4(i,7)~=le_hump_se_4(i-1,7);
       le_hump_se_4(i,8)=1;
    end
end
%
le_hump_se_5(1,8)=1;
for i=2:length(le_hump_se_5)
    if le_hump_se_5(i,7)==le_hump_se_5(i-1,7);
       le_hump_se_5(i,8)=le_hump_se_5(i-1,8)+1;
    elseif le_hump_se_5(i,7)~=le_hump_se_5(i-1,7);
       le_hump_se_5(i,8)=1;
    end
end
%
le_hump_se_6(1,8)=1;
for i=2:length(le_hump_se_6)
    if le_hump_se_6(i,7)==le_hump_se_6(i-1,7);
       le_hump_se_6(i,8)=le_hump_se_6(i-1,8)+1;
    elseif le_hump_se_6(i,7)~=le_hump_se_6(i-1,7);
       le_hump_se_6(i,8)=1;
    end
end
%
le_hump_se_7(1,8)=1;
for i=2:length(le_hump_se_7)
    if le_hump_se_7(i,7)==le_hump_se_7(i-1,7);
       le_hump_se_7(i,8)=le_hump_se_7(i-1,8)+1;
    elseif le_hump_se_7(i,7)~=le_hump_se_7(i-1,7);
       le_hump_se_7(i,8)=1;
    end
end
%
le_hump_se_8(1,8)=1;
for i=2:length(le_hump_se_8)
    if le_hump_se_8(i,7)==le_hump_se_8(i-1,7);
       le_hump_se_8(i,8)=le_hump_se_8(i-1,8)+1;
    elseif le_hump_se_8(i,7)~=le_hump_se_8(i-1,7);
       le_hump_se_8(i,8)=1;
    end
end
%
%
le_hump_se_9(1,8)=1;
for i=2:length(le_hump_se_9)
    if le_hump_se_9(i,7)==le_hump_se_9(i-1,7);
       le_hump_se_9(i,8)=le_hump_se_9(i-1,8)+1;
    elseif le_hump_se_9(i,7)~=le_hump_se_9(i-1,7);
       le_hump_se_9(i,8)=1;
    end
end
%
resid_coh_1_inloop(1,16)=1;
for i=2:length(resid_coh_1_inloop)
    if resid_coh_1_inloop(i,15)==resid_coh_1_inloop(i-1,15);
       resid_coh_1_inloop(i,16)=resid_coh_1_inloop(i-1,16)+1;
    elseif resid_coh_1_inloop(i,15)~=resid_coh_1_inloop(i-1,15);
        resid_coh_1_inloop(i,16)=1;
    end
end
resid_coh_2_inloop(1,16)=1;
for i=2:length(resid_coh_2_inloop)
    if resid_coh_2_inloop(i,15)==resid_coh_2_inloop(i-1,15);
       resid_coh_2_inloop(i,16)=resid_coh_2_inloop(i-1,16)+1;
    elseif resid_coh_2_inloop(i,15)~=resid_coh_2_inloop(i-1,15);
        resid_coh_2_inloop(i,16)=1;
    end
end
resid_coh_3_inloop(1,16)=1;
for i=2:length(resid_coh_3_inloop)
    if resid_coh_3_inloop(i,15)==resid_coh_3_inloop(i-1,15);
       resid_coh_3_inloop(i,16)=resid_coh_3_inloop(i-1,16)+1;
    elseif resid_coh_3_inloop(i,15)~=resid_coh_3_inloop(i-1,15);
        resid_coh_3_inloop(i,16)=1;
    end
end
resid_coh_4_inloop(1,16)=1;
for i=2:length(resid_coh_4_inloop)
    if resid_coh_4_inloop(i,15)==resid_coh_4_inloop(i-1,15);
       resid_coh_4_inloop(i,16)=resid_coh_4_inloop(i-1,16)+1;
    elseif resid_coh_4_inloop(i,15)~=resid_coh_4_inloop(i-1,15);
        resid_coh_4_inloop(i,16)=1;
    end
end
resid_coh_5_inloop(1,16)=1;
for i=2:length(resid_coh_5_inloop)
    if resid_coh_5_inloop(i,15)==resid_coh_5_inloop(i-1,15);
       resid_coh_5_inloop(i,16)=resid_coh_5_inloop(i-1,16)+1;
    elseif resid_coh_5_inloop(i,15)~=resid_coh_5_inloop(i-1,15);
        resid_coh_5_inloop(i,16)=1;
    end
end
r=length(resid_coh_6_inloop);
resid_coh_6_inloop(1,16)=1;
for i=2:r
    if resid_coh_6_inloop(i,15)==resid_coh_6_inloop(i-1,15);
       resid_coh_6_inloop(i,16)=resid_coh_6_inloop(i-1,16)+1;
    elseif resid_coh_6_inloop(i,15)~=resid_coh_6_inloop(i-1,15);
        resid_coh_6_inloop(i,16)=1;
    end
end
resid_coh_7_inloop(1,16)=1;
for i=2:length(resid_coh_7_inloop)
    if resid_coh_7_inloop(i,15)==resid_coh_7_inloop(i-1,15);
       resid_coh_7_inloop(i,16)=resid_coh_7_inloop(i-1,16)+1;
    elseif resid_coh_7_inloop(i,15)~=resid_coh_7_inloop(i-1,15);
        resid_coh_7_inloop(i,16)=1;
    end
end
resid_coh_8_inloop(1,16)=1;
for i=2:length(resid_coh_8_inloop)
    if resid_coh_8_inloop(i,15)==resid_coh_8_inloop(i-1,15);
       resid_coh_8_inloop(i,16)=resid_coh_8_inloop(i-1,16)+1;
    elseif resid_coh_8_inloop(i,15)~=resid_coh_8_inloop(i-1,15);
        resid_coh_8_inloop(i,16)=1;
    end
end
resid_coh_9_inloop(1,16)=1;
for i=2:length(resid_coh_9_inloop)
    if resid_coh_9_inloop(i,15)==resid_coh_9_inloop(i-1,15);
       resid_coh_9_inloop(i,16)=resid_coh_9_inloop(i-1,16)+1;
    elseif resid_coh_9_inloop(i,15)~=resid_coh_9_inloop(i-1,15);
        resid_coh_9_inloop(i,16)=1;
    end
end
%bootstrap sample for hump, log earnings:
ind_c1 = randi([1, max(resid_coh_1_inloop(:,15))],[max(resid_coh_1_inloop(:,15)),1]); %same for log of earnings, keep this.
ind_c1=sort(ind_c1);
ind_c1=[ind_c1 zeros(length(ind_c1),1)];
%
ind_c1(:,2)=se_ind(int32(length(ind_c1)),ind_c1(:,1),le_hump_se_1(:,7),int32(length(le_hump_se_1)));%counts the number of individuals
inte=zeros(1,1);
i=ind_c1(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c1(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c1)
    i=ind_c1(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c1(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end
le_hump_se_1=resamp_le(int32(length(inte)),int32(length(le_hump_se_1)),le_hump_se_1,inte);
%
ind_c1(:,2)=se_ind(int32(length(ind_c1)),ind_c1(:,1),resid_coh_1_inloop(:,15),int32(length(resid_coh_1_inloop(:,15))));
%
inte=zeros(1,1);
i=ind_c1(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c1(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c1)
    i=ind_c1(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c1(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end

resid_coh_1_inloop=resamp(int32(length(inte)),int32(length(resid_coh_1_inloop)),resid_coh_1_inloop,inte);

%
ind_c2 = randi([1, max(resid_coh_2_inloop(:,15))],[max(resid_coh_2_inloop(:,15)),1]); %same for log of earnings, keep this.
ind_c2=sort(ind_c2);
ind_c2=[ind_c2 zeros(length(ind_c2),1)];
%
ind_c2(:,2)=se_ind(int32(length(ind_c2)),ind_c2(:,1),le_hump_se_2(:,7),int32(length(le_hump_se_2)));
% 
inte=zeros(1,1);
i=ind_c2(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c2(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c2)
    i=ind_c2(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c2(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end

le_hump_se_2=resamp_le(int32(length(inte)),int32(length(le_hump_se_2)),le_hump_se_2,inte);

ind_c2(:,2)=se_ind(int32(length(ind_c2)),ind_c2(:,1),resid_coh_2_inloop(:,15),int32(length(resid_coh_2_inloop(:,15))));
inte=zeros(1,1);
i=ind_c2(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c2(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c2)
    i=ind_c2(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c2(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end

resid_coh_2_inloop=resamp(int32(length(inte)),int32(length(resid_coh_2_inloop)),resid_coh_2_inloop,inte);

%
ind_c3 = randi([1, max(resid_coh_3_inloop(:,15))],[max(resid_coh_3_inloop(:,15)),1]); %same for log of earnings, keep this.
ind_c3=sort(ind_c3);
ind_c3=[ind_c3 zeros(length(ind_c3),1)];
ind_c3(:,2)=se_ind(int32(length(ind_c3)),ind_c3(:,1),le_hump_se_3(:,7),int32(length(le_hump_se_3)));
inte=zeros(1,1);
i=ind_c3(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c3(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c3)
    i=ind_c3(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c3(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end
le_hump_se_3=resamp_le(int32(length(inte)),int32(length(le_hump_se_3)),le_hump_se_3,inte);
ind_c3(:,2)=se_ind(int32(length(ind_c3)),ind_c3(:,1),resid_coh_3_inloop(:,15),int32(length(resid_coh_3_inloop(:,15))));
inte=zeros(1,1);
i=ind_c3(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c3(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c3)
    i=ind_c3(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c3(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end

resid_coh_3_inloop=resamp(int32(length(inte)),int32(length(resid_coh_3_inloop)),resid_coh_3_inloop,inte);

%
ind_c4 = randi([1, max(resid_coh_4_inloop(:,15))],[max(resid_coh_4_inloop(:,15)),1]); %same for log of earnings, keep this.
ind_c4=sort(ind_c4);
ind_c4=[ind_c4 zeros(length(ind_c4),1)];
ind_c4(:,2)=se_ind(int32(length(ind_c4)),ind_c4(:,1),le_hump_se_4(:,7),int32(length(le_hump_se_4)));
inte=zeros(1,1);
i=ind_c4(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c4(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c4)
    i=ind_c4(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c4(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end
le_hump_se_4=resamp_le(int32(length(inte)),int32(length(le_hump_se_4)),le_hump_se_4,inte);
ind_c4(:,2)=se_ind(int32(length(ind_c4)),ind_c4(:,1),resid_coh_4_inloop(:,15),int32(length(resid_coh_4_inloop(:,15))));
inte=zeros(1,1);
i=ind_c4(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c4(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c4)
    i=ind_c4(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c4(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end

resid_coh_4_inloop=resamp(int32(length(inte)),int32(length(resid_coh_4_inloop)),resid_coh_4_inloop,inte);

%
ind_c5 = randi([1, max(resid_coh_5_inloop(:,15))],[max(resid_coh_5_inloop(:,15)),1]); %same for log of earnings, keep this.
ind_c5=sort(ind_c5);
ind_c5=[ind_c5 zeros(length(ind_c5),1)];
ind_c5(:,2)=se_ind(int32(length(ind_c5)),ind_c5(:,1),le_hump_se_5(:,7),int32(length(le_hump_se_5)));
inte=zeros(1,1);
i=ind_c5(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c5(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c5)
    i=ind_c5(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c5(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end
le_hump_se_5=resamp_le(int32(length(inte)),int32(length(le_hump_se_5)),le_hump_se_5,inte);
ind_c5(:,2)=se_ind(int32(length(ind_c5)),ind_c5(:,1),resid_coh_5_inloop(:,15),int32(length(resid_coh_5_inloop(:,15))));
inte=zeros(1,1);
i=ind_c5(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c5(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c5)
    i=ind_c5(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c5(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end

resid_coh_5_inloop=resamp(int32(length(inte)),int32(length(resid_coh_5_inloop)),resid_coh_5_inloop,inte);

%
ind_c6 = randi([1, max(resid_coh_6_inloop(:,15))],[max(resid_coh_6_inloop(:,15)),1]); %same for log of earnings, keep this.
ind_c6=sort(ind_c6);
ind_c6=[ind_c6 zeros(length(ind_c6),1)];
ind_c6(:,2)=se_ind(int32(length(ind_c6)),ind_c6(:,1),le_hump_se_6(:,7),int32(length(le_hump_se_6)));
inte=zeros(1,1);
i=ind_c6(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c6(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c6)
    i=ind_c6(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c6(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end
le_hump_se_6=resamp_le(int32(length(inte)),int32(length(le_hump_se_6)),le_hump_se_6,inte);
ind_c6(:,2)=se_ind(int32(length(ind_c6)),ind_c6(:,1),resid_coh_6_inloop(:,15),int32(length(resid_coh_6_inloop(:,15))));
inte=zeros(1,1);
i=ind_c6(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c6(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c6)
    i=ind_c6(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c6(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end

resid_coh_6_inloop=resamp(int32(length(inte)),int32(length(resid_coh_6_inloop)),resid_coh_6_inloop,inte);

%
ind_c7 = randi([1, max(resid_coh_7_inloop(:,15))],[max(resid_coh_7_inloop(:,15)),1]); %same for log of earnings, keep this.
ind_c7=sort(ind_c7);
ind_c7=[ind_c7 zeros(length(ind_c7),1)];
ind_c7(:,2)=se_ind(int32(length(ind_c7)),ind_c7(:,1),le_hump_se_7(:,7),int32(length(le_hump_se_7)));
inte=zeros(1,1);
i=ind_c7(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c7(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c7)
    i=ind_c7(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c7(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end
le_hump_se_7=resamp_le(int32(length(inte)),int32(length(le_hump_se_7)),le_hump_se_7,inte);
ind_c7(:,2)=se_ind(int32(length(ind_c7)),ind_c7(:,1),resid_coh_7_inloop(:,15),int32(length(resid_coh_7_inloop(:,15))));
inte=zeros(1,1);
i=ind_c7(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c7(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c7)
    i=ind_c7(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c7(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end

resid_coh_7_inloop=resamp(int32(length(inte)),int32(length(resid_coh_7_inloop)),resid_coh_7_inloop,inte);

%
ind_c8 = randi([1, max(resid_coh_8_inloop(:,15))],[max(resid_coh_8_inloop(:,15)),1]); %same for log of earnings, keep this.
ind_c8=sort(ind_c8);
ind_c8=[ind_c8 zeros(length(ind_c8),1)];
ind_c8(:,2)=se_ind(int32(length(ind_c8)),ind_c8(:,1),le_hump_se_8(:,7),int32(length(le_hump_se_8)));
inte=zeros(1,1);
i=ind_c8(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c8(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c8)
    i=ind_c8(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c8(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end
le_hump_se_8=resamp_le(int32(length(inte)),int32(length(le_hump_se_8)),le_hump_se_8,inte);
ind_c8(:,2)=se_ind(int32(length(ind_c8)),ind_c8(:,1),resid_coh_8_inloop(:,15),int32(length(resid_coh_8_inloop(:,15))));
inte=zeros(1,1);
i=ind_c8(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c8(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c8)
    i=ind_c8(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c8(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end

resid_coh_8_inloop=resamp(int32(length(inte)),int32(length(resid_coh_8_inloop)),resid_coh_8_inloop,inte);

%
ind_c9 = randi([1, max(resid_coh_9_inloop(:,15))],[max(resid_coh_9_inloop(:,15)),1]); %same for log of earnings, keep this.
ind_c9=sort(ind_c9);
ind_c9=[ind_c9 zeros(length(ind_c9),1)];
ind_c9(:,2)=se_ind(int32(length(ind_c9)),ind_c9(:,1),le_hump_se_9(:,7),int32(length(le_hump_se_9)));
inte=zeros(1,1);
i=ind_c9(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c9(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c9)
    i=ind_c9(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c9(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end
le_hump_se_9=resamp_le(int32(length(inte)),int32(length(le_hump_se_9)),le_hump_se_9,inte);
ind_c9(:,2)=se_ind(int32(length(ind_c9)),ind_c9(:,1),resid_coh_9_inloop(:,15),int32(length(resid_coh_9_inloop(:,15))));
inte=zeros(1,1);
i=ind_c9(1,2);
s=length(inte);
inte(s:s+i-1,1)=ind_c9(1,1);
inte(s:s+i-1,2)=linspace(1,s+i-1,s+i-1);
for r=2:length(ind_c9)
    i=ind_c9(r,2);
    s=length(inte);
    inte(s+1:s+i,1)=ind_c9(r,1);
    inte(s+1:s+i,2)=linspace(s-(s-1),s+i-1-(s-1),s+i-1-(s-1));
end

resid_coh_9_inloop=resamp(int32(length(inte)),int32(length(resid_coh_9_inloop)),resid_coh_9_inloop,inte);


sum_n=zeros(32,1);
sum_p=zeros(32,1);
%compute skewness by age
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_1_inloop,1);
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
skew_kelly = (pctile90+pctile10-2*pctile50)./(pctile90-pctile10);
coh1_skew_kelly = [NaN(31-length(skew_kelly),1); skew_kelly];

fcn = @(x){expect_t2(x,2)}; 
resid_coh_1_inloop(:,17) = accumarray_expand(resid_coh_1_inloop(:,3),resid_coh_1_inloop(:,2),fcn);
aux_p = resid_coh_1_inloop(logical((resid_coh_1_inloop(:,3)>0).*(isnan(resid_coh_1_inloop(:,17))==0)),:); 
aux_n = resid_coh_1_inloop(logical((resid_coh_1_inloop(:,3)<0).*(isnan(resid_coh_1_inloop(:,17))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh1_covar2_p = [NaN(31-length(skew_kelly),1); covar_p; NaN(2,1)];
coh1_covar2_n = [NaN(31-length(skew_kelly),1); covar_n; NaN(2,1)];
%
%compute skewness by age
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_2_inloop,1);
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
skew_kelly = (pctile90+pctile10-2*pctile50)./(pctile90-pctile10);
coh2_skew_kelly = [NaN(31-length(skew_kelly),1); skew_kelly];

%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_2_inloop(:,17) = accumarray_expand(resid_coh_2_inloop(:,3),resid_coh_2_inloop(:,2),fcn);
aux_p = resid_coh_2_inloop(logical((resid_coh_2_inloop(:,3)>0).*(isnan(resid_coh_2_inloop(:,17))==0)),:); 
aux_n = resid_coh_2_inloop(logical((resid_coh_2_inloop(:,3)<0).*(isnan(resid_coh_2_inloop(:,17))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh2_covar2_p = [NaN(31-length(skew_kelly),1); covar_p; NaN(2,1)];
coh2_covar2_n = [NaN(31-length(skew_kelly),1); covar_n; NaN(2,1)];
%
%compute skewness by age
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_3_inloop,1);
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
skew_kelly = (pctile90+pctile10-2*pctile50)./(pctile90-pctile10);
coh3_skew_kelly = [NaN(31-length(skew_kelly),1); skew_kelly];

%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_3_inloop(:,17) = accumarray_expand(resid_coh_3_inloop(:,3),resid_coh_3_inloop(:,2),fcn);
aux_p = resid_coh_3_inloop(logical((resid_coh_3_inloop(:,3)>0).*(isnan(resid_coh_3_inloop(:,17))==0)),:); 
aux_n = resid_coh_3_inloop(logical((resid_coh_3_inloop(:,3)<0).*(isnan(resid_coh_3_inloop(:,17))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh3_covar2_p = [NaN(31-length(skew_kelly),1); covar_p; NaN(2,1)];
coh3_covar2_n = [NaN(31-length(skew_kelly),1); covar_n; NaN(2,1)];
%
%compute skewness by age
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_4_inloop,1);
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
skew_kelly = (pctile90+pctile10-2*pctile50)./(pctile90-pctile10);
coh4_skew_kelly = [NaN(31-length(skew_kelly),1); skew_kelly];

%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_4_inloop(:,17) = accumarray_expand(resid_coh_4_inloop(:,3),resid_coh_4_inloop(:,2),fcn);
aux_p = resid_coh_4_inloop(logical((resid_coh_4_inloop(:,3)>0).*(isnan(resid_coh_4_inloop(:,17))==0)),:); 
aux_n = resid_coh_4_inloop(logical((resid_coh_4_inloop(:,3)<0).*(isnan(resid_coh_4_inloop(:,17))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh4_covar2_p = [NaN(31-length(skew_kelly),1); covar_p; NaN(2,1)];
coh4_covar2_n = [NaN(31-length(skew_kelly),1); covar_n; NaN(2,1)];
%
%compute skewness by age
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_5_inloop,1);
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
skew_kelly = (pctile90+pctile10-2*pctile50)./(pctile90-pctile10);
coh5_skew_kelly = [NaN(31-length(skew_kelly),1); skew_kelly];

%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_5_inloop(:,17) = accumarray_expand(resid_coh_5_inloop(:,3),resid_coh_5_inloop(:,2),fcn);
aux_p = resid_coh_5_inloop(logical((resid_coh_5_inloop(:,3)>0).*(isnan(resid_coh_5_inloop(:,17))==0)),:); 
aux_n = resid_coh_5_inloop(logical((resid_coh_5_inloop(:,3)<0).*(isnan(resid_coh_5_inloop(:,17))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh5_covar2_p = [NaN(31-length(skew_kelly),1); covar_p; NaN(2,1)];
coh5_covar2_n = [NaN(31-length(skew_kelly),1); covar_n; NaN(2,1)];
%
%compute skewness by age
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_6_inloop,1);
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
skew_kelly = (pctile90+pctile10-2*pctile50)./(pctile90-pctile10);
coh6_skew_kelly = [skew_kelly; NaN(31-length(skew_kelly),1)];

%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_6_inloop(:,17) = accumarray_expand(resid_coh_6_inloop(:,3),resid_coh_6_inloop(:,2),fcn);
aux_p = resid_coh_6_inloop(logical((resid_coh_6_inloop(:,3)>0).*(isnan(resid_coh_6_inloop(:,17))==0)),:); 
aux_n = resid_coh_6_inloop(logical((resid_coh_6_inloop(:,3)<0).*(isnan(resid_coh_6_inloop(:,17))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh6_covar2_p = [ covar_p; NaN(31-length(skew_kelly),1); NaN(2,1)];
coh6_covar2_n = [ covar_n; NaN(31-length(skew_kelly),1); NaN(2,1)];
%
%compute skewness by age
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_7_inloop,1);
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
skew_kelly = (pctile90+pctile10-2*pctile50)./(pctile90-pctile10);
coh7_skew_kelly = [skew_kelly; NaN(31-length(skew_kelly),1)];

%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_7_inloop(:,17) = accumarray_expand(resid_coh_7_inloop(:,3),resid_coh_7_inloop(:,2),fcn);
aux_p = resid_coh_7_inloop(logical((resid_coh_7_inloop(:,3)>0).*(isnan(resid_coh_7_inloop(:,17))==0)),:); 
aux_n = resid_coh_7_inloop(logical((resid_coh_7_inloop(:,3)<0).*(isnan(resid_coh_7_inloop(:,17))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh7_covar2_p = [ covar_p; NaN(31-length(skew_kelly),1); NaN(2,1)];
coh7_covar2_n = [ covar_n; NaN(31-length(skew_kelly),1); NaN(2,1)];
%
%compute skewness by age
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_8_inloop,1);
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
skew_kelly = (pctile90+pctile10-2*pctile50)./(pctile90-pctile10);
coh8_skew_kelly = [skew_kelly; NaN(31-length(skew_kelly),1)];

%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_8_inloop(:,17) = accumarray_expand(resid_coh_8_inloop(:,3),resid_coh_8_inloop(:,2),fcn);
aux_p = resid_coh_8_inloop(logical((resid_coh_8_inloop(:,3)>0).*(isnan(resid_coh_8_inloop(:,17))==0)),:); 
aux_n = resid_coh_8_inloop(logical((resid_coh_8_inloop(:,3)<0).*(isnan(resid_coh_8_inloop(:,17))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh8_covar2_p = [ covar_p; NaN(31-length(skew_kelly),1); NaN(2,1)];
coh8_covar2_n = [ covar_n; NaN(31-length(skew_kelly),1); NaN(2,1)];
%
%compute skewness by age
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_9_inloop,1);
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
skew_kelly = (pctile90+pctile10-2*pctile50)./(pctile90-pctile10);
coh9_skew_kelly = [skew_kelly; NaN(31-length(skew_kelly),1)];

%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_9_inloop(:,17) = accumarray_expand(resid_coh_9_inloop(:,3),resid_coh_9_inloop(:,2),fcn);
aux_p = resid_coh_9_inloop(logical((resid_coh_9_inloop(:,3)>0).*(isnan(resid_coh_9_inloop(:,17))==0)),:); 
aux_n = resid_coh_9_inloop(logical((resid_coh_9_inloop(:,3)<0).*(isnan(resid_coh_9_inloop(:,17))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh9_covar2_p = [ covar_p; NaN(31-length(skew_kelly),1); NaN(2,1)];
coh9_covar2_n = [ covar_n; NaN(31-length(skew_kelly),1); NaN(2,1)];
%
clear pos neg

covar2_p = zeros(31,1);
covar2_n = zeros(31,1);

for i =1:31
    n=0;
    nc1=0;
    nc2=0;
    nc3=0;
    nc4=0;
    nc5=0;
    nc6=0;
    nc7=0;
    nc8=0;
    nc9=0;
    if isnan(coh1_skew_kelly(i,1))==0
        if isnan(coh1_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh1_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh1_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh2_skew_kelly(i,1))==0
        if isnan(coh2_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh2_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh2_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh3_skew_kelly(i,1))==0
        if isnan(coh3_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh3_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh3_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh4_skew_kelly(i,1))==0
        if isnan(coh4_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh4_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh4_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh5_skew_kelly(i,1))==0
        if isnan(coh5_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh5_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh5_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh6_skew_kelly(i,1))==0
        if isnan(coh6_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh6_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh6_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh7_skew_kelly(i,1))==0
        if isnan(coh7_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh7_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh7_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh8_skew_kelly(i,1))==0
        if isnan(coh8_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh8_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh8_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh9_skew_kelly(i,1))==0
        if isnan(coh9_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh9_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh9_covar2_n(i,1);
            nc2=nc2+1;
        end        
    end
    covar2_n(i,1) = covar2_n(i,1)./nc2;
    covar2_p(i,1) = covar2_p(i,1)./nc2;
end
mom_bootstrap_2ndcovar(q).covar2_n = covar2_n;
mom_bootstrap_2ndcovar(q).covar2_p = covar2_p;
toc
end

save('mom_bootstrap_2ndcovar.mat','mom_bootstrap_2ndcovar')

covar2_p=NaN(col,n_draws);
covar2_n=NaN(col,n_draws);
for i=1:n_draws
    covar2_p(:,i)=mom_bootstrap_2ndcovar(i).covar2_p;
    covar2_n(:,i)=mom_bootstrap_2ndcovar(i).covar2_n;
end
covar2_p=sort(covar2_p,2);
covar2_n=sort(covar2_n,2);
covar2_p=covar2_p(:,6:95);
covar2_n=covar2_n(:,6:95);
covar2_p=[covar2_p(:,1) covar2_p(:,end)];
covar2_n=[covar2_n(:,1) covar2_n(:,end)];
%
load('data_simplified.mat','data_simplified')
figure
plot(25:1:53,data_simplified.covar2_p(1:29),'LineWidth',2.5,'Color','red')
hold on
plot(25:1:53,data_simplified.covar2_n(1:29),'LineWidth',2.5,'Color','green','LineStyle','--')
hold on
plot(25:53,covar2_p(1:29,1),'LineWidth',2.5, 'Color', 'red','LineStyle','-.')
hold on
plot(25:53,covar2_p(1:29,2),'LineWidth',2.5, 'Color', 'red','LineStyle','-.')
hold on
plot(25:53,covar2_n(1:29,1),'LineWidth',2.5, 'Color', 'green','LineStyle','-.')
hold on
plot(25:53,covar2_n(1:29,2),'LineWidth',2.5, 'Color', 'green','LineStyle','-.')
hold on
line([25 53],[0 0],'LineWidth',2.5,'LineStyle',':', 'Color', 'black')
hold off
grid on
h=legend('Positive','Negative','Location','South');
set(h,'FontSize',20); 
axis tight
xt = get(gca, 'XTick');
set(gca, 'FontSize', 30)
xlabel('Age','fontsize',40,'FontWeight','bold')
ylabel('E[g*g_{h+2}]','fontsize',40,'FontWeight','bold')
print('MEG_ci_2ndcov','-depsc')