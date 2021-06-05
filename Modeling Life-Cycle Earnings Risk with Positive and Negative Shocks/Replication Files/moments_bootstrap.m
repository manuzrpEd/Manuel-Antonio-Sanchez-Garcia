close all
clear
clear mex
clc
n_draws = 150; 
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

ind_c2(:,2)=se_ind(int32(length(ind_c2)),ind_c2(:,1),le_hump_se_2(:,7),int32(length(le_hump_se_2)));

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

%construct data from the bootstrap:
%regression hump
log_panel=[le_hump_se_1; le_hump_se_2; le_hump_se_3; le_hump_se_4; le_hump_se_5; le_hump_se_6; le_hump_se_7; le_hump_se_8; le_hump_se_9];
%

log_panel=sortrows(log_panel,[1 5 4]);%age year year_birth/coh
log_panel(1,end+1) = 1;
for i=2:length(log_panel)
if log_panel(i,1)==log_panel(i-1,1) && log_panel(i,5)==log_panel(i-1,5) && log_panel(i,4)==log_panel(i-1,4)
   log_panel(i,end)=0;
else
    log_panel(i,9)=1;    
end
end
log_panel(:,end+1)=cumsum(log_panel(:,9));
fcn = @(x){var(x)};
log_panel(:,end+1)=accumarray_expand(log_panel(:,3),log_panel(:,10),fcn);%variance by age, year and year_birth cohort
%variance by age unconditionally
log_panel=sortrows(log_panel,1);
log_panel(:,end+1)=accumarray_expand(log_panel(:,3),log_panel(:,1),fcn);
% regress variance log earnings against age, year and year_birth cohort dummies:
x1=zeros(length(log_panel),range(log_panel(:,1))+1);
for i=min(log_panel(:,1)):max(log_panel(:,1))
    x1(:,i-min(log_panel(:,1))+1)=log_panel(:,1)==i;
end%here I can declare the matrix as int32
x1=x1(:,2:end);%24 excluded in Stata
x2=zeros(length(log_panel),range(log_panel(:,5))+1);
for i=min(log_panel(:,5)):max(log_panel(:,5))
    x2(:,i-min(log_panel(:,5))+1)=log_panel(:,5)==i;
end
x2=x2(:,2:end);%year 1975
x3=zeros(length(log_panel),range(log_panel(:,4))+1);
for i=min(log_panel(:,4)):max(log_panel(:,4))
    x3(:,i-min(log_panel(:,4))+1)=log_panel(:,4)==i;
end
x3=x3(:,2:end);%year_birth 1927 (first) excluded in Stata
dep=log_panel(:,11);
save('log_panel.mat','log_panel');
clear log_panel
b=regress(dep,[x1 x2 x3]);
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
b_coh=regress(log_panel(:,11),[x1 x2 x3]);
b_coh=mean(b_coh(end-7:end));

hump=[b_coh; b];

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
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh1_outbound = [NaN(31-length(skew_kelly),1); outbound];
%compute kurtosis by age
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
kurt_cs = (pctile975-pctile025)./(pctile75-pctile25);
coh1_kurt_cs = [NaN(31-length(skew_kelly),1); kurt_cs];
%fraction of positive/negative growths
r=length(aux);
for j=1:r;
for i=1:32;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
fcn = @(x)skewness(x); 
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh1_skew = [NaN(31-length(skew_kelly),1); skew];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh1_mean = [NaN(31-length(skew_kelly),1); sammean];
%compute conditional mean by age
pos = resid_coh_1_inloop(resid_coh_1_inloop(:,3)>=0,:);
neg = resid_coh_1_inloop(resid_coh_1_inloop(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh1_mean_p = [NaN(31-length(skew_kelly),1); mean_p];
coh1_mean_n = [NaN(31-length(skew_kelly),1); mean_n];
%conditional variance by age

fcn = @(x)var(x); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh1_var_p = [NaN(31-length(skew_kelly),1); var_p];
coh1_var_n = [NaN(31-length(skew_kelly),1); var_n];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_1_inloop(resid_coh_1_inloop(:,13)>0,:); 
aux_n = resid_coh_1_inloop(resid_coh_1_inloop(:,13)<0,:);
aux_p(:,17)=aux_p(:,3).*aux_p(:,13);
aux_n(:,17)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh1_covar1_p = [NaN(31-length(skew_kelly),1); covar_p; NaN];
coh1_covar1_n = [NaN(31-length(skew_kelly),1); covar_n; NaN];
%conditional 2nd co-variance by age
% fcn = @(x){expect_t2(x,2)}; 
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
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh2_outbound = [NaN(31-length(skew_kelly),1); outbound];
%compute kurtosis by age
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
kurt_cs = (pctile975-pctile025)./(pctile75-pctile25);
coh2_kurt_cs = [NaN(31-length(skew_kelly),1); kurt_cs];
%fraction of positive/negative growths
r=length(aux);
for j=1:r;
for i=1:32;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
fcn = @(x)skewness(x); 
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh2_skew = [NaN(31-length(skew_kelly),1); skew];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh2_mean = [NaN(31-length(skew_kelly),1); sammean];
%compute conditional mean by age
pos = resid_coh_2_inloop(resid_coh_2_inloop(:,3)>=0,:);
neg = resid_coh_2_inloop(resid_coh_2_inloop(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh2_mean_p = [NaN(31-length(skew_kelly),1); mean_p];
coh2_mean_n = [NaN(31-length(skew_kelly),1); mean_n];
%conditional variance by age

fcn = @(x)var(x); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh2_var_p = [NaN(31-length(skew_kelly),1); var_p];
coh2_var_n = [NaN(31-length(skew_kelly),1); var_n];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_2_inloop(resid_coh_2_inloop(:,13)>0,:); 
aux_n = resid_coh_2_inloop(resid_coh_2_inloop(:,13)<0,:);
aux_p(:,17)=aux_p(:,3).*aux_p(:,13);
aux_n(:,17)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh2_covar1_p = [NaN(31-length(skew_kelly),1); covar_p; NaN];
coh2_covar1_n = [NaN(31-length(skew_kelly),1); covar_n; NaN];
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
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh3_outbound = [NaN(31-length(skew_kelly),1); outbound];
%compute kurtosis by age
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
kurt_cs = (pctile975-pctile025)./(pctile75-pctile25);
coh3_kurt_cs = [NaN(31-length(skew_kelly),1); kurt_cs];
%fraction of positive/negative growths
r=length(aux);
for j=1:r;
for i=1:32;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
fcn = @(x)skewness(x); 
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh3_skew = [NaN(31-length(skew_kelly),1); skew];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh3_mean = [NaN(31-length(skew_kelly),1); sammean];
%compute conditional mean by age
pos = resid_coh_3_inloop(resid_coh_3_inloop(:,3)>=0,:);
neg = resid_coh_3_inloop(resid_coh_3_inloop(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh3_mean_p = [NaN(31-length(skew_kelly),1); mean_p];
coh3_mean_n = [NaN(31-length(skew_kelly),1); mean_n];
%conditional variance by age

fcn = @(x)var(x); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh3_var_p = [NaN(31-length(skew_kelly),1); var_p];
coh3_var_n = [NaN(31-length(skew_kelly),1); var_n];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_3_inloop(resid_coh_3_inloop(:,13)>0,:); 
aux_n = resid_coh_3_inloop(resid_coh_3_inloop(:,13)<0,:);
aux_p(:,17)=aux_p(:,3).*aux_p(:,13);
aux_n(:,17)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh3_covar1_p = [NaN(31-length(skew_kelly),1); covar_p; NaN];
coh3_covar1_n = [NaN(31-length(skew_kelly),1); covar_n; NaN];
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
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh4_outbound = [NaN(31-length(skew_kelly),1); outbound];
%compute kurtosis by age
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
kurt_cs = (pctile975-pctile025)./(pctile75-pctile25);
coh4_kurt_cs = [NaN(31-length(skew_kelly),1); kurt_cs];
%fraction of positive/negative growths
r=length(aux);
for j=1:r;
for i=1:32;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
fcn = @(x)skewness(x); 
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh4_skew = [NaN(31-length(skew_kelly),1); skew];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh4_mean = [NaN(31-length(skew_kelly),1); sammean];
%compute conditional mean by age
pos = resid_coh_4_inloop(resid_coh_4_inloop(:,3)>=0,:);
neg = resid_coh_4_inloop(resid_coh_4_inloop(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh4_mean_p = [NaN(31-length(skew_kelly),1); mean_p];
coh4_mean_n = [NaN(31-length(skew_kelly),1); mean_n];
%conditional variance by age

fcn = @(x)var(x); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh4_var_p = [NaN(31-length(skew_kelly),1); var_p];
coh4_var_n = [NaN(31-length(skew_kelly),1); var_n];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_4_inloop(resid_coh_4_inloop(:,13)>0,:); 
aux_n = resid_coh_4_inloop(resid_coh_4_inloop(:,13)<0,:);
aux_p(:,17)=aux_p(:,3).*aux_p(:,13);
aux_n(:,17)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh4_covar1_p = [NaN(31-length(skew_kelly),1); covar_p; NaN];
coh4_covar1_n = [NaN(31-length(skew_kelly),1); covar_n; NaN];
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
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh5_outbound = [NaN(31-length(skew_kelly),1); outbound];
%compute kurtosis by age
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
kurt_cs = (pctile975-pctile025)./(pctile75-pctile25);
coh5_kurt_cs = [NaN(31-length(skew_kelly),1); kurt_cs];
%fraction of positive/negative growths
r=length(aux);
for j=1:r;
for i=1:32;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
fcn = @(x)skewness(x); 
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh5_skew = [NaN(31-length(skew_kelly),1); skew];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh5_mean = sammean;
%compute conditional mean by age
pos = resid_coh_5_inloop(resid_coh_5_inloop(:,3)>=0,:);
neg = resid_coh_5_inloop(resid_coh_5_inloop(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh5_mean_p = [NaN(31-length(skew_kelly),1); mean_p];
coh5_mean_n = [NaN(31-length(skew_kelly),1); mean_n];
%conditional variance by age

fcn = @(x)var(x); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh5_var_p = [NaN(31-length(skew_kelly),1); var_p];
coh5_var_n = [NaN(31-length(skew_kelly),1); var_n];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_5_inloop(resid_coh_5_inloop(:,13)>0,:); 
aux_n = resid_coh_5_inloop(resid_coh_5_inloop(:,13)<0,:);
aux_p(:,17)=aux_p(:,3).*aux_p(:,13);
aux_n(:,17)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh5_covar1_p = [NaN(31-length(skew_kelly),1); covar_p; NaN];
coh5_covar1_n = [NaN(31-length(skew_kelly),1); covar_n; NaN];
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
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh6_outbound = [outbound; NaN(31-length(skew_kelly),1)];
%compute kurtosis by age
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
kurt_cs = (pctile975-pctile025)./(pctile75-pctile25);
coh6_kurt_cs = [kurt_cs; NaN(31-length(skew_kelly),1)];
%
%fraction of positive/negative growths
r=length(aux);
for j=1:r;
for i=1:32;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
fcn = @(x)skewness(x); 
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh6_skew = [skew; NaN(31-length(skew_kelly),1)];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh6_mean = [sammean; NaN(31-length(skew_kelly),1)];
%compute conditional mean by age
pos = resid_coh_6_inloop(resid_coh_6_inloop(:,3)>=0,:);
neg = resid_coh_6_inloop(resid_coh_6_inloop(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh6_mean_p = [mean_p; NaN(31-length(skew_kelly),1)];
coh6_mean_n = [mean_n; NaN(31-length(skew_kelly),1)];
%conditional variance by age

fcn = @(x)var(x); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh6_var_p = [var_p; NaN(31-length(skew_kelly),1)];
coh6_var_n = [var_n; NaN(31-length(skew_kelly),1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_6_inloop(resid_coh_6_inloop(:,13)>0,:); 
aux_n = resid_coh_6_inloop(resid_coh_6_inloop(:,13)<0,:);
aux_p(:,17)=aux_p(:,3).*aux_p(:,13);
aux_n(:,17)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh6_covar1_p = [covar_p; NaN(32-length(skew_kelly),1)];
coh6_covar1_n = [covar_n; NaN(32-length(skew_kelly),1)];
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
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh7_outbound = [outbound; NaN(31-length(skew_kelly),1)];
%compute kurtosis by age
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
kurt_cs = (pctile975-pctile025)./(pctile75-pctile25);
coh7_kurt_cs = [kurt_cs; NaN(31-length(skew_kelly),1)];
%fraction of positive/negative growths
r=length(aux);
for j=1:r;
for i=1:32;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
fcn = @(x)skewness(x); 
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh7_skew = [skew; NaN(31-length(skew_kelly),1)];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh7_mean = [sammean; NaN(31-length(skew_kelly),1)];
%compute conditional mean by age
pos = resid_coh_7_inloop(resid_coh_7_inloop(:,3)>=0,:);
neg = resid_coh_7_inloop(resid_coh_7_inloop(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh7_mean_p = [mean_p; NaN(31-length(skew_kelly),1)];
coh7_mean_n = [mean_n; NaN(31-length(skew_kelly),1)];
%conditional variance by age

fcn = @(x)var(x); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh7_var_p = [var_p; NaN(31-length(skew_kelly),1)];
coh7_var_n = [var_n; NaN(31-length(skew_kelly),1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_7_inloop(resid_coh_7_inloop(:,13)>0,:); 
aux_n = resid_coh_7_inloop(resid_coh_7_inloop(:,13)<0,:);
aux_p(:,17)=aux_p(:,3).*aux_p(:,13);
aux_n(:,17)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh7_covar1_p = [covar_p; NaN(32-length(skew_kelly),1)];
coh7_covar1_n = [covar_n; NaN(32-length(skew_kelly),1)];
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
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh8_outbound = [outbound; NaN(31-length(skew_kelly),1)];
%compute kurtosis by age
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
kurt_cs = (pctile975-pctile025)./(pctile75-pctile25);
coh8_kurt_cs = [kurt_cs; NaN(31-length(skew_kelly),1)];
%fraction of positive/negative growths
r=length(aux);
for j=1:r;
for i=1:32;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
fcn = @(x)skewness(x); 
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh8_skew = [skew; NaN(31-length(skew_kelly),1)];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh8_mean = [sammean; NaN(31-length(skew_kelly),1)];
%compute conditional mean by age
pos = resid_coh_8_inloop(resid_coh_8_inloop(:,3)>=0,:);
neg = resid_coh_8_inloop(resid_coh_8_inloop(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh8_mean_p = [mean_p; NaN(31-length(skew_kelly),1)];
coh8_mean_n = [mean_n; NaN(31-length(skew_kelly),1)];
%conditional variance by age
 
fcn = @(x)var(x); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh8_var_p = [var_p; NaN(31-length(skew_kelly),1)];
coh8_var_n = [var_n; NaN(31-length(skew_kelly),1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_8_inloop(resid_coh_8_inloop(:,13)>0,:); 
aux_n = resid_coh_8_inloop(resid_coh_8_inloop(:,13)<0,:);
aux_p(:,17)=aux_p(:,3).*aux_p(:,13);
aux_n(:,17)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh8_covar1_p = [covar_p; NaN(32-length(skew_kelly),1)];
coh8_covar1_n = [covar_n; NaN(32-length(skew_kelly),1)];
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
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh9_outbound = [outbound; NaN(31-length(skew_kelly),1)];
%compute kurtosis by age
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
kurt_cs = (pctile975-pctile025)./(pctile75-pctile25);
coh9_kurt_cs = [kurt_cs; NaN(31-length(skew_kelly),1)];
%fraction of positive/negative growths
r=length(aux);
for j=1:r;
for i=1:32;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
fcn = @(x)skewness(x); 
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh9_skew = [skew; NaN(31-length(skew_kelly),1)];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh9_mean = [sammean; NaN(31-length(skew_kelly),1)];
%compute conditional mean by age
pos = resid_coh_9_inloop(resid_coh_9_inloop(:,3)>=0,:);
neg = resid_coh_9_inloop(resid_coh_9_inloop(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh9_mean_p = [mean_p; NaN(31-length(skew_kelly),1)];
coh9_mean_n = [mean_n; NaN(31-length(skew_kelly),1)];
%conditional variance by age

fcn = @(x)var(x); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh9_var_p = [var_p; NaN(31-length(skew_kelly),1)];
coh9_var_n = [var_n; NaN(31-length(skew_kelly),1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_9_inloop(resid_coh_9_inloop(:,13)>0,:); 
aux_n = resid_coh_9_inloop(resid_coh_9_inloop(:,13)<0,:);
aux_p(:,17)=aux_p(:,3).*aux_p(:,13);
aux_n(:,17)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,17),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,17),aux_n(:,1),fcn);
coh9_covar1_p = [covar_p; NaN(32-length(skew_kelly),1)];
coh9_covar1_n = [covar_n; NaN(32-length(skew_kelly),1)];
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
sammean = zeros(31,1);
outbound = zeros(31,1);
var_n = zeros(31,1);
var_p = zeros(31,1);
mean_n = zeros(31,1);
mean_p = zeros(31,1);
covar1_n = zeros(31,1);
covar1_p = zeros(31,1);
covar2_p = zeros(31,1);
covar2_n = zeros(31,1);
skew_kelly = zeros(31,1);
skew = zeros(31,1);
kurt_cs = zeros(31,1);
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
        sammean(i,1) =sammean(i,1)+coh1_mean(i,1);
        outbound(i,1) =outbound(i,1)+coh1_outbound(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh1_kurt_cs(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh1_skew_kelly(i,1);
        skew(i,1) =skew(i,1)+coh1_skew(i,1);
        var_n(i,1) =var_n(i,1)+coh1_var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh1_var_p(i,1);
        mean_n(i,1) =mean_n(i,1)+coh1_mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh1_mean_p(i,1);
        n=n+1;
        if isnan(coh1_covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh1_covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh1_covar1_n(i,1);
            nc1=nc1+1;
        end
        if isnan(coh1_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh1_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh1_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh2_skew_kelly(i,1))==0
        sammean(i,1) =sammean(i,1)+coh2_mean(i,1);
        outbound(i,1) =outbound(i,1)+coh2_outbound(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh2_kurt_cs(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh2_skew_kelly(i,1);
        skew(i,1) =skew(i,1)+coh2_skew(i,1);
        var_n(i,1) =var_n(i,1)+coh2_var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh2_var_p(i,1);
        mean_n(i,1) =mean_n(i,1)+coh2_mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh2_mean_p(i,1);
        n=n+1;
        if isnan(coh2_covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh2_covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh2_covar1_n(i,1);
            nc1=nc1+1;
        end
        if isnan(coh2_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh2_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh2_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh3_skew_kelly(i,1))==0
        sammean(i,1) =sammean(i,1)+coh3_mean(i,1);
        outbound(i,1) =outbound(i,1)+coh3_outbound(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh3_kurt_cs(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh3_skew_kelly(i,1);
        skew(i,1) =skew(i,1)+coh3_skew(i,1);
        var_n(i,1) =var_n(i,1)+coh3_var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh3_var_p(i,1);
        mean_n(i,1) =mean_n(i,1)+coh3_mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh3_mean_p(i,1);
        n=n+1;
        if isnan(coh3_covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh3_covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh3_covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh3_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh3_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh3_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh4_skew_kelly(i,1))==0
        sammean(i,1) =sammean(i,1)+coh4_mean(i,1);
        outbound(i,1) =outbound(i,1)+coh4_outbound(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh4_kurt_cs(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh4_skew_kelly(i,1);
        skew(i,1) =skew(i,1)+coh4_skew(i,1);
        var_n(i,1) =var_n(i,1)+coh4_var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh4_var_p(i,1);
        mean_n(i,1) =mean_n(i,1)+coh4_mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh4_mean_p(i,1);
        n=n+1;
        if isnan(coh4_covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh4_covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh4_covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh4_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh4_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh4_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh5_skew_kelly(i,1))==0
        sammean(i,1) =sammean(i,1)+coh5_mean(i,1);
        outbound(i,1) =outbound(i,1)+coh5_outbound(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh5_kurt_cs(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh5_skew_kelly(i,1);
        skew(i,1) =skew(i,1)+coh5_skew(i,1);
        var_n(i,1) =var_n(i,1)+coh5_var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh5_var_p(i,1);
        mean_n(i,1) =mean_n(i,1)+coh5_mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh5_mean_p(i,1);
        n=n+1;
        if isnan(coh5_covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh5_covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh5_covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh5_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh5_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh5_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh6_skew_kelly(i,1))==0
        sammean(i,1) =sammean(i,1)+coh6_mean(i,1);
        outbound(i,1) =outbound(i,1)+coh6_outbound(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh6_kurt_cs(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh6_skew_kelly(i,1);
        skew(i,1) =skew(i,1)+coh6_skew(i,1);
        var_n(i,1) =var_n(i,1)+coh6_var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh6_var_p(i,1);
        mean_n(i,1) =mean_n(i,1)+coh6_mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh6_mean_p(i,1);
        n=n+1;
        if isnan(coh6_covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh6_covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh6_covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh6_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh6_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh6_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh7_skew_kelly(i,1))==0
        sammean(i,1) =sammean(i,1)+coh7_mean(i,1);
        outbound(i,1) =outbound(i,1)+coh7_outbound(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh7_kurt_cs(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh7_skew_kelly(i,1);
        skew(i,1) =skew(i,1)+coh7_skew(i,1);
        var_n(i,1) =var_n(i,1)+coh7_var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh7_var_p(i,1);
        mean_n(i,1) =mean_n(i,1)+coh7_mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh7_mean_p(i,1);
        n=n+1;
        if isnan(coh7_covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh7_covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh7_covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh7_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh7_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh7_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh8_skew_kelly(i,1))==0
        sammean(i,1) =sammean(i,1)+coh8_mean(i,1);
        outbound(i,1) =outbound(i,1)+coh8_outbound(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh8_kurt_cs(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh8_skew_kelly(i,1);
        skew(i,1) =skew(i,1)+coh8_skew(i,1);
        var_n(i,1) =var_n(i,1)+coh8_var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh8_var_p(i,1);
        mean_n(i,1) =mean_n(i,1)+coh8_mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh8_mean_p(i,1);
        n=n+1;
        if isnan(coh8_covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh8_covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh8_covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh8_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh8_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh8_covar2_n(i,1);
            nc2=nc2+1;
        end
    end
    if isnan(coh9_skew_kelly(i,1))==0
        sammean(i,1) =sammean(i,1)+coh9_mean(i,1);
        outbound(i,1) =outbound(i,1)+coh9_outbound(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh9_kurt_cs(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh9_skew_kelly(i,1);
        skew(i,1) =skew(i,1)+coh9_skew(i,1);
        var_n(i,1) =var_n(i,1)+coh9_var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh9_var_p(i,1);
        mean_n(i,1) =mean_n(i,1)+coh9_mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh9_mean_p(i,1);
        n=n+1;
        if isnan(coh9_covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh9_covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh9_covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh9_covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh9_covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh9_covar2_n(i,1);
            nc2=nc2+1;
        end        
    end
    sammean(i,1) = sammean(i,1)./n;
    outbound(i,1) = outbound(i,1)./n;
    kurt_cs(i,1) = kurt_cs(i,1)./n;
    skew_kelly(i,1) = skew_kelly(i,1)./n;
    skew(i,1) = skew(i,1)./n;
    var_n(i,1) = var_n(i,1)./n;
    var_p(i,1) = var_p(i,1)./n;
    mean_n(i,1) = mean_n(i,1)./n;
    mean_p(i,1) = mean_p(i,1)./n;
    covar1_n(i,1) = covar1_n(i,1)./nc1;
    covar1_p(i,1) = covar1_p(i,1)./nc1;
    covar2_n(i,1) = covar2_n(i,1)./nc2;
    covar2_p(i,1) = covar2_p(i,1)./nc2;
end
fract_p=zeros(31,1);
for i=1:31;
fract_p(i,1)=sum_p(i,1)/(sum_p(i,1)+sum_n(i,1));
end
mom_bootstrap(q).outbound=outbound;
mom_bootstrap(q).mean=sammean;
mom_bootstrap(q).fract_p=fract_p;
mom_bootstrap(q).kurt_cs = kurt_cs;
mom_bootstrap(q).skew_kelly = skew_kelly;
mom_bootstrap(q).skew = skew;
mom_bootstrap(q).var_n = var_n;
mom_bootstrap(q).var_p = var_p;
mom_bootstrap(q).mean_n = mean_n;
mom_bootstrap(q).mean_p = mean_p;
mom_bootstrap(q).covar1_n = covar1_n;
mom_bootstrap(q).covar1_p = covar1_p;
mom_bootstrap(q).covar2_n = covar2_n;
mom_bootstrap(q).covar2_p = covar2_p;
mom_bootstrap(q).hump=hump;
%
resid_coh_1_inloop(1,18)=1;
ro=length(resid_coh_1_inloop);
for z=2:ro;
    if resid_coh_1_inloop(z,16)>resid_coh_1_inloop(z-1,16)
        resid_coh_1_inloop(z,18)=resid_coh_1_inloop(z-1,18);
    elseif resid_coh_1_inloop(z,16)<resid_coh_1_inloop(z-1,16)
        resid_coh_1_inloop(z,18)=resid_coh_1_inloop(z-1,18)+1;
    end
end
r=max(resid_coh_1_inloop(:,18));
ores_1=zeros(r,col);
res_1=wide(resid_coh_1_inloop,int32(ro),int32(r),ores_1);
mi=zeros(col,col); %sum of individual variance covariance 
n=zeros(col,col); %number of observations
for m=1:r
mi_j=res_1(m,1:col)'*res_1(m,1:col);
n_j=mi_j~=0;
n_j=+n_j;
mi=mi+mi_j;
n=n+n_j;
end
m1=mi./n;
resid_coh_2_inloop(1,18)=1;
ro=length(resid_coh_2_inloop);
for z=2:ro;
    if resid_coh_2_inloop(z,16)>resid_coh_2_inloop(z-1,16)
        resid_coh_2_inloop(z,18)=resid_coh_2_inloop(z-1,18);
    elseif resid_coh_2_inloop(z,16)<resid_coh_2_inloop(z-1,16)
        resid_coh_2_inloop(z,18)=resid_coh_2_inloop(z-1,18)+1;
    end
end
r=max(resid_coh_2_inloop(:,18));
ores_2=zeros(r,col);
res_2=wide(resid_coh_2_inloop,int32(ro),int32(r),ores_2);
mi=zeros(col,col); %sum of individual variance covariance 
n=zeros(col,col); %number of observations
for m=1:r
mi_j=res_2(m,1:col)'*res_2(m,1:col);
n_j=mi_j~=0;
n_j=+n_j;
mi=mi+mi_j;
n=n+n_j;
end
m2=mi./n;
resid_coh_3_inloop(1,18)=1;
ro=length(resid_coh_3_inloop);
for z=2:ro;
    if resid_coh_3_inloop(z,16)>resid_coh_3_inloop(z-1,16)
        resid_coh_3_inloop(z,18)=resid_coh_3_inloop(z-1,18);
    elseif resid_coh_3_inloop(z,16)<resid_coh_3_inloop(z-1,16)
        resid_coh_3_inloop(z,18)=resid_coh_3_inloop(z-1,18)+1;
    end
end
r=max(resid_coh_3_inloop(:,18));
ores_3=zeros(r,col);
res_3=wide(resid_coh_3_inloop,int32(ro),int32(r),ores_3);
mi=zeros(col,col); %sum of individual variance covariance 
n=zeros(col,col); %number of observations
for m=1:r
mi_j=res_3(m,1:col)'*res_3(m,1:col);
n_j=mi_j~=0;
n_j=+n_j;
mi=mi+mi_j;
n=n+n_j;
end
m3=mi./n;
resid_coh_4_inloop(1,18)=1;
ro=length(resid_coh_4_inloop);
for z=2:ro;
    if resid_coh_4_inloop(z,16)>resid_coh_4_inloop(z-1,16)
        resid_coh_4_inloop(z,18)=resid_coh_4_inloop(z-1,18);
    elseif resid_coh_4_inloop(z,16)<resid_coh_4_inloop(z-1,16)
        resid_coh_4_inloop(z,18)=resid_coh_4_inloop(z-1,18)+1;
    end
end
r=max(resid_coh_4_inloop(:,18));
ores_4=zeros(r,col);
res_4=wide(resid_coh_4_inloop,int32(ro),int32(r),ores_4);
mi=zeros(col,col); %sum of individual variance covariance 
n=zeros(col,col); %number of observations
for m=1:r
mi_j=res_4(m,1:col)'*res_4(m,1:col);
n_j=mi_j~=0;
n_j=+n_j;
mi=mi+mi_j;
n=n+n_j;
end
m4=mi./n;
resid_coh_5_inloop(1,18)=1;
ro=length(resid_coh_5_inloop);
for z=2:ro;
    if resid_coh_5_inloop(z,16)>resid_coh_5_inloop(z-1,16)
        resid_coh_5_inloop(z,18)=resid_coh_5_inloop(z-1,18);
    elseif resid_coh_5_inloop(z,16)<resid_coh_5_inloop(z-1,16)
        resid_coh_5_inloop(z,18)=resid_coh_5_inloop(z-1,18)+1;
    end
end
r=max(resid_coh_5_inloop(:,18));
ores_5=zeros(r,col);
res_5=wide(resid_coh_5_inloop,int32(ro),int32(r),ores_5);
mi=zeros(col,col); %sum of individual variance covariance 
n=zeros(col,col); %number of observations
for m=1:r
mi_j=res_5(m,1:col)'*res_5(m,1:col);
n_j=mi_j~=0;
n_j=+n_j;
mi=mi+mi_j;
n=n+n_j;
end
m5=mi./n;
resid_coh_6_inloop(1,18)=1;
ro=length(resid_coh_6_inloop);
for z=2:ro;
    if resid_coh_6_inloop(z,16)>resid_coh_6_inloop(z-1,16)
        resid_coh_6_inloop(z,18)=resid_coh_6_inloop(z-1,18);
    elseif resid_coh_6_inloop(z,16)<resid_coh_6_inloop(z-1,16)
        resid_coh_6_inloop(z,18)=resid_coh_6_inloop(z-1,18)+1;
    end
end
r=max(resid_coh_6_inloop(:,18));
ores_6=zeros(r,col);
res_6=wide(resid_coh_6_inloop,int32(ro),int32(r),ores_6);
mi=zeros(col,col); %sum of individual variance covariance 
n=zeros(col,col); %number of observations
for m=1:r
mi_j=res_6(m,1:col)'*res_6(m,1:col);
n_j=mi_j~=0;
n_j=+n_j;
mi=mi+mi_j;
n=n+n_j;
end
m6=mi./n;
resid_coh_7_inloop(1,18)=1;
ro=length(resid_coh_7_inloop);
for z=2:ro;
    if resid_coh_7_inloop(z,16)>resid_coh_7_inloop(z-1,16)
        resid_coh_7_inloop(z,18)=resid_coh_7_inloop(z-1,18);
    elseif resid_coh_7_inloop(z,16)<resid_coh_7_inloop(z-1,16)
        resid_coh_7_inloop(z,18)=resid_coh_7_inloop(z-1,18)+1;
    end
end
r=max(resid_coh_7_inloop(:,18));
ores_7=zeros(r,col);
res_7=wide(resid_coh_7_inloop,int32(ro),int32(r),ores_7);
mi=zeros(col,col); %sum of individual variance covariance 
n=zeros(col,col); %number of observations
for m=1:r
mi_j=res_7(m,1:col)'*res_7(m,1:col);
n_j=mi_j~=0;
n_j=+n_j;
mi=mi+mi_j;
n=n+n_j;
end
m7=mi./n;
resid_coh_8_inloop(1,18)=1;
ro=length(resid_coh_8_inloop);
for z=2:ro;
    if resid_coh_8_inloop(z,16)>resid_coh_8_inloop(z-1,16)
        resid_coh_8_inloop(z,18)=resid_coh_8_inloop(z-1,18);
    elseif resid_coh_8_inloop(z,16)<resid_coh_8_inloop(z-1,16)
        resid_coh_8_inloop(z,18)=resid_coh_8_inloop(z-1,18)+1;
    end
end
r=max(resid_coh_8_inloop(:,18));
ores_8=zeros(r,col);
res_8=wide(resid_coh_8_inloop,int32(ro),int32(r),ores_8);
mi=zeros(col,col); %sum of individual variance covariance 
n=zeros(col,col); %number of observations
for m=1:r
mi_j=res_8(m,1:col)'*res_8(m,1:col);
n_j=mi_j~=0;
n_j=+n_j;
mi=mi+mi_j;
n=n+n_j;
end
m8=mi./n;
resid_coh_9_inloop(1,18)=1;
ro=length(resid_coh_9_inloop);
for z=2:ro;
    if resid_coh_9_inloop(z,16)>resid_coh_9_inloop(z-1,16)
        resid_coh_9_inloop(z,18)=resid_coh_9_inloop(z-1,18);
    elseif resid_coh_9_inloop(z,16)<resid_coh_9_inloop(z-1,16)
        resid_coh_9_inloop(z,18)=resid_coh_9_inloop(z-1,18)+1;
    end
end
r=max(resid_coh_9_inloop(:,18));
ores_9=zeros(r,col);
res_9=wide(resid_coh_9_inloop,int32(ro),int32(r),ores_9);
mi=zeros(col,col); %sum of individual variance covariance 
n=zeros(col,col); %number of observations
for m=1:r
mi_j=res_9(m,1:col)'*res_9(m,1:col);
n_j=mi_j~=0;
n_j=+n_j;
mi=mi+mi_j;
n=n+n_j;
end
m9=mi./n;
M_1=m1;
M_2=m2;
M_3=m3;
M_4=m4;
M_5=m5;
M_6=m6;
M_7=m7;
M_8=m8;
M_9=m9;
M_1(isnan(M_1))=0;
M_2(isnan(M_2))=0;
M_3(isnan(M_3))=0;
M_4(isnan(M_4))=0;
M_5(isnan(M_5))=0;
M_6(isnan(M_6))=0;
M_7(isnan(M_7))=0;
M_8(isnan(M_8))=0;
M_9(isnan(M_9))=0;
M=zeros(col,col);
n=zeros(col,col);
n_1=M_1~=0;
n_1=+n_1;
n=n+n_1;
M=M+M_1;
n_2=M_2~=0;
n_2=+n_2;
n=n+n_2;
M=M+M_2;
n_3=M_3~=0;
n_3=+n_3;
n=n+n_3;
M=M+M_3;
n_4=M_4~=0;
n_4=+n_4;
n=n+n_4;
M=M+M_4;
n_5=M_5~=0;
n_5=+n_5;
n=n+n_5;
M=M+M_5;
n_6=M_6~=0;
n_6=+n_6;
n=n+n_6;
M=M+M_6;
n_7=M_7~=0;
n_7=+n_7;
n=n+n_7;
M=M+M_7;
n_8=M_8~=0;
n_8=+n_8;
n=n+n_8;
M=M+M_8;
n_9=M_9~=0;
n_9=+n_9;
n=n+n_9;
M=M+M_9;
M=M./n;
M_ave=zeros(31,1);
M_ave(1,1) = mean(diag(M));
for i = 1:T-1-1
    M_ave(i+1,1) = mean(diag(M,i));
end
mom_bootstrap(q).unc_var=diag(M);
mom_bootstrap(q).M_ave=M_ave;
% 
toc
end
save('mom_bootstrap.mat','mom_bootstrap')