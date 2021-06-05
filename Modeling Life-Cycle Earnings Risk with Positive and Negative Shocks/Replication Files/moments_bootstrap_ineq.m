close all
clear
clear mex
clc
n_draws = 100; 
H=20000;
T=32;
col=T-1;
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
%  le_hump_se
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
%  ind_c1
resid_coh_1_inloop=resamp(int32(length(inte)),int32(length(resid_coh_1_inloop)),resid_coh_1_inloop,inte);
%  inte
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
% 
le_hump_se_2=resamp_le(int32(length(inte)),int32(length(le_hump_se_2)),le_hump_se_2,inte);
% 
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

%construct data from the bootstrap:
%regression hump
log_panel=[le_hump_se_1; le_hump_se_2; le_hump_se_3; le_hump_se_4; le_hump_se_5; le_hump_se_6; le_hump_se_7; le_hump_se_8; le_hump_se_9];
%
log_panel=sortrows(log_panel,[1 4]);%age year_birth/coh 
log_panel(1,end+1) = 1;
for i=2:length(log_panel)
if log_panel(i,1)==log_panel(i-1,1)  && log_panel(i,4)==log_panel(i-1,4) %&& log_panel(i,5)==log_panel(i-1,5)%
   log_panel(i,end)=0;
else
    log_panel(i,end)=1;    
end
end
log_panel(:,end+1)=cumsum(log_panel(:,9));
fcn = @(x){var(x)};
log_panel(:,end+1)=accumarray_expand(log_panel(:,3),log_panel(:,10),fcn);%variance by age and year_birth cohort
%variance by age unconditionally
log_panel=sortrows(log_panel,1);
log_panel(:,end+1)=accumarray_expand(log_panel(:,3),log_panel(:,1),fcn);
% regress variance log earnings against age and year_birth cohort dummies:
x1=zeros(length(log_panel),range(log_panel(:,1))+1);
for i=min(log_panel(:,1)):max(log_panel(:,1))
    x1(:,i-min(log_panel(:,1))+1)=log_panel(:,1)==i;
end%here I can declare the matrix as int32
x1=x1(:,2:end);%24 excluded in Stata
x3=zeros(length(log_panel),range(log_panel(:,4))+1);
for i=min(log_panel(:,4)):max(log_panel(:,4))
    x3(:,i-min(log_panel(:,4))+1)=log_panel(:,4)==i;
end
x3=x3(:,2:end);%year_birth 1927 (first) excluded in Stata
dep=log_panel(:,11);
save('log_panel.mat','log_panel');
clear log_panel
b=regress(dep,[x1 x3]);%x2
load('log_panel.mat','log_panel');
%
b=b(1:31);
diff=max(log_panel(log_panel(:,1)==40,12))-b(16);
b=b+diff;
x3=zeros(length(log_panel),range(log_panel(:,6))+1);
for i=min(log_panel(:,6)):max(log_panel(:,6))
    x3(:,i-min(log_panel(:,6))+1)=log_panel(:,6)==i;
end
x3=x3(:,2:end);%birth cohorts
b_coh=regress(log_panel(:,11),[x1 x3]);
b_coh=mean(b_coh(end-7:end));
% hump=b+(b_coh-b(1));% done this hump.
hump=[b_coh; b];
% log_panel x3 x2 x1
%
mom_bootstrap_ineq(q).hump=hump;
% 
toc
end
%delete(gcp)
save('mom_bootstrap_ineq.mat','mom_bootstrap_ineq')
%http://www.sjsu.edu/faculty/gerstman/StatPrimer/t-table.pdf