clear
close all
clc
clear mex
set(0,'DefaultFigureWindowStyle','docked')
tic
%
sum_p=zeros(31,1);
sum_n=zeros(31,1);
resid_coh_1_extrap = csvread('resid_coh_1_extrap.out');
%compute skewness by age
fcn = @(x)skewness(x);
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_1_extrap,1);
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
coh1.skew = [NaN(31-length(skew),1); skew];
coh1.skew_kelly = [NaN(31-length(skew),1); (pctile90+pctile10-2*pctile50)./(pctile90-pctile10)];
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh1.outbound = [NaN(31-length(skew),1); outbound];
%compute var by age
fcn = @(x)var(x);
vari = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
coh1.vari = [NaN(31-length(skew),1); vari];
%compute kurtosis by age
fcn = @(x)kurtosis(x);
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
kurt = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
coh1.kurt = [NaN(31-length(skew),1); kurt];
coh1.kurt_cs = [NaN(31-length(skew),1); (pctile975-pctile025)./(pctile75-pctile25)];
%fraction of positive/negative growths
r=size(aux,1);
for j=1:r;
for i=1:31;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh1.mean = [NaN(31-length(skew),1); sammean];
%compute conditional mean by age
fcn = @(x)mean(x); 
pos = resid_coh_1_extrap(resid_coh_1_extrap(:,3)>=0,:);
neg = resid_coh_1_extrap(resid_coh_1_extrap(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh1.mean_p = [NaN(31-length(skew),1); mean_p];
coh1.mean_n = [NaN(31-length(skew),1); mean_n];
%conditional variance by age
fcn = @(x)var(x); 
aux_p = sortrows(pos,1); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh1.var_p = [NaN(31-length(skew),1); var_p];
coh1.var_n = [NaN(31-length(skew),1); var_n];
%unconditional 1st n 2nd covariance by age
fcn = @(x)mean(x); 
aux = resid_coh_1_extrap; 
aux(:,15)=aux(:,3).*aux(:,13);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh1.covar1 = [NaN(31-length(skew),1); covar; NaN];
fcn = @(x){expect_t2(x,2)}; 
resid_coh_1_extrap(:,15) = accumarray_expand(resid_coh_1_extrap(:,3),resid_coh_1_extrap(:,2),fcn);
aux = resid_coh_1_extrap(logical((isnan(resid_coh_1_extrap(:,15))==0)),:); 
fcn = @(x)mean(x);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh1.covar2 = [NaN(31-length(skew),1); covar; NaN(2,1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_1_extrap(resid_coh_1_extrap(:,13)>0,:); 
aux_n = resid_coh_1_extrap(resid_coh_1_extrap(:,13)<0,:);
aux_p(:,15)=aux_p(:,3).*aux_p(:,13);
aux_n(:,15)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh1.covar1_p = [NaN(31-length(skew),1); covar_p; NaN];
coh1.covar1_n = [NaN(31-length(skew),1); covar_n; NaN];
%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_1_extrap(:,15) = accumarray_expand(resid_coh_1_extrap(:,3),resid_coh_1_extrap(:,2),fcn);
aux_p = resid_coh_1_extrap(logical((resid_coh_1_extrap(:,3)>0).*(isnan(resid_coh_1_extrap(:,15))==0)),:); 
aux_n = resid_coh_1_extrap(logical((resid_coh_1_extrap(:,3)<0).*(isnan(resid_coh_1_extrap(:,15))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh1.covar2_p = [NaN(31-length(skew),1); covar_p; NaN(2,1)];
coh1.covar2_n = [NaN(31-length(skew),1); covar_n; NaN(2,1)];
%
resid_coh_2_extrap = csvread('resid_coh_2_extrap.out');
%compute skewness by age
fcn = @(x)skewness(x);
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_2_extrap,1);
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
coh2.skew = [NaN(31-length(skew),1); skew];
coh2.skew_kelly = [NaN(31-length(skew),1); (pctile90+pctile10-2*pctile50)./(pctile90-pctile10)];
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh2.outbound = [NaN(31-length(skew),1); outbound];
%compute var by age
fcn = @(x)var(x);
vari = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
coh2.vari = [NaN(31-length(skew),1); vari];
%fraction of positive/negative growths
r=size(aux,1);
for j=1:r;
for i=1:31;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
%compute kurtosis by age
fcn = @(x)kurtosis(x);
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
kurt = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
coh2.kurt = [NaN(31-length(skew),1); kurt];
coh2.kurt_cs = [NaN(31-length(skew),1); (pctile975-pctile025)./(pctile75-pctile25)];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh2.mean = [NaN(31-length(skew),1); sammean];
%compute conditional mean by age
fcn = @(x)mean(x); 
pos = resid_coh_2_extrap(resid_coh_2_extrap(:,3)>=0,:);
neg = resid_coh_2_extrap(resid_coh_2_extrap(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh2.mean_p = [NaN(31-length(skew),1); mean_p];
coh2.mean_n = [NaN(31-length(skew),1); mean_n];
%conditional variance by age
fcn = @(x)var(x); 
aux_p = sortrows(pos,1); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh2.var_p = [NaN(31-length(skew),1); var_p];
coh2.var_n = [NaN(31-length(skew),1); var_n];
%unconditional 1st n 2nd covariance by age
fcn = @(x)mean(x); 
aux = resid_coh_2_extrap; 
aux(:,15)=aux(:,3).*aux(:,13);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh2.covar1 = [NaN(31-length(skew),1); covar; NaN];
fcn = @(x){expect_t2(x,2)}; 
resid_coh_2_extrap(:,15) = accumarray_expand(resid_coh_2_extrap(:,3),resid_coh_2_extrap(:,2),fcn);
aux = resid_coh_2_extrap(logical((isnan(resid_coh_2_extrap(:,15))==0)),:); 
fcn = @(x)mean(x);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh2.covar2 = [NaN(31-length(skew),1); covar; NaN(2,1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_2_extrap(resid_coh_2_extrap(:,13)>0,:); 
aux_n = resid_coh_2_extrap(resid_coh_2_extrap(:,13)<0,:);
aux_p(:,15)=aux_p(:,3).*aux_p(:,13);
aux_n(:,15)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh2.covar1_p = [NaN(31-length(skew),1); covar_p; NaN];
coh2.covar1_n = [NaN(31-length(skew),1); covar_n; NaN];
%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_2_extrap(:,15) = accumarray_expand(resid_coh_2_extrap(:,3),resid_coh_2_extrap(:,2),fcn);
aux_p = resid_coh_2_extrap(logical((resid_coh_2_extrap(:,3)>0).*(isnan(resid_coh_2_extrap(:,15))==0)),:); 
aux_n = resid_coh_2_extrap(logical((resid_coh_2_extrap(:,3)<0).*(isnan(resid_coh_2_extrap(:,15))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh2.covar2_p = [NaN(31-length(skew),1); covar_p; NaN(2,1)];
coh2.covar2_n = [NaN(31-length(skew),1); covar_n; NaN(2,1)];
%
resid_coh_3_extrap = csvread('resid_coh_3_extrap.out');
%compute skewness by age
fcn = @(x)skewness(x);
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_3_extrap,1);
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
coh3.skew = [NaN(31-length(skew),1); skew];
coh3.skew_kelly = [NaN(31-length(skew),1); (pctile90+pctile10-2*pctile50)./(pctile90-pctile10)];
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh3.outbound = [NaN(31-length(skew),1); outbound];
%compute var by age
fcn = @(x)var(x);
vari = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
coh3.vari = [NaN(31-length(skew),1); vari];
%fraction of positive/negative growths
r=size(aux,1);
for j=1:r;
for i=1:31;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
%compute kurtosis by age
fcn = @(x)kurtosis(x);
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
kurt = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
coh3.kurt = [NaN(31-length(skew),1); kurt];
coh3.kurt_cs = [NaN(31-length(skew),1); (pctile975-pctile025)./(pctile75-pctile25)];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh3.mean = [NaN(31-length(skew),1); sammean];
%compute conditional mean by age
fcn = @(x)mean(x); 
pos = resid_coh_3_extrap(resid_coh_3_extrap(:,3)>=0,:);
neg = resid_coh_3_extrap(resid_coh_3_extrap(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh3.mean_p = [NaN(31-length(skew),1); mean_p];
coh3.mean_n = [NaN(31-length(skew),1); mean_n];
%conditional variance by age
fcn = @(x)var(x); 
aux_p = sortrows(pos,1); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh3.var_p = [NaN(31-length(skew),1); var_p];
coh3.var_n = [NaN(31-length(skew),1); var_n];
%unconditional 1st n 2nd covariance by age
fcn = @(x)mean(x); 
aux = resid_coh_3_extrap; 
aux(:,15)=aux(:,3).*aux(:,13);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh3.covar1 = [NaN(31-length(skew),1); covar; NaN];
fcn = @(x){expect_t2(x,2)}; 
resid_coh_3_extrap(:,15) = accumarray_expand(resid_coh_3_extrap(:,3),resid_coh_3_extrap(:,2),fcn);
aux = resid_coh_3_extrap(logical((isnan(resid_coh_3_extrap(:,15))==0)),:); 
fcn = @(x)mean(x);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh3.covar2 = [NaN(31-length(skew),1); covar; NaN(2,1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_3_extrap(resid_coh_3_extrap(:,13)>0,:); 
aux_n = resid_coh_3_extrap(resid_coh_3_extrap(:,13)<0,:);
aux_p(:,15)=aux_p(:,3).*aux_p(:,13);
aux_n(:,15)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh3.covar1_p = [NaN(31-length(skew),1); covar_p; NaN];
coh3.covar1_n = [NaN(31-length(skew),1); covar_n; NaN];
%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_3_extrap(:,15) = accumarray_expand(resid_coh_3_extrap(:,3),resid_coh_3_extrap(:,2),fcn);
aux_p = resid_coh_3_extrap(logical((resid_coh_3_extrap(:,3)>0).*(isnan(resid_coh_3_extrap(:,15))==0)),:); 
aux_n = resid_coh_3_extrap(logical((resid_coh_3_extrap(:,3)<0).*(isnan(resid_coh_3_extrap(:,15))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh3.covar2_p = [NaN(31-length(skew),1); covar_p; NaN(2,1)];
coh3.covar2_n = [NaN(31-length(skew),1); covar_n; NaN(2,1)];
%
resid_coh_4_extrap = csvread('resid_coh_4_extrap.out');
%compute skewness by age
fcn = @(x)skewness(x);
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_4_extrap,1);
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
coh4.skew = [NaN(31-length(skew),1); skew];
coh4.skew_kelly = [NaN(31-length(skew),1); (pctile90+pctile10-2*pctile50)./(pctile90-pctile10)];
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh4.outbound = [NaN(31-length(skew),1); outbound];
%compute var by age
fcn = @(x)var(x);
vari = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
coh4.vari = [NaN(31-length(skew),1); vari];
%fraction of positive/negative growths
r=size(aux,1);
for j=1:r;
for i=1:31;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
%compute kurtosis by age
fcn = @(x)kurtosis(x);
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
kurt = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
coh4.kurt = [NaN(31-length(skew),1); kurt];
coh4.kurt_cs = [NaN(31-length(skew),1); (pctile975-pctile025)./(pctile75-pctile25)];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh4.mean = [NaN(31-length(skew),1); sammean];
%compute conditional mean by age
fcn = @(x)mean(x); 
pos = resid_coh_4_extrap(resid_coh_4_extrap(:,3)>=0,:);
neg = resid_coh_4_extrap(resid_coh_4_extrap(:,3)<0,:);
aux_p = sortrows(pos,1);
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh4.mean_p = [NaN(31-length(skew),1); mean_p];
coh4.mean_n = [NaN(31-length(skew),1); mean_n];
%conditional variance by age
fcn = @(x)var(x); 
aux_p = sortrows(pos,1); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh4.var_p = [NaN(31-length(skew),1); var_p];
coh4.var_n = [NaN(31-length(skew),1); var_n];
%unconditional 1st n 2nd covariance by age
fcn = @(x)mean(x); 
aux = resid_coh_4_extrap; 
aux(:,15)=aux(:,3).*aux(:,13);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh4.covar1 = [NaN(31-length(skew),1); covar; NaN];
fcn = @(x){expect_t2(x,2)}; 
resid_coh_4_extrap(:,15) = accumarray_expand(resid_coh_4_extrap(:,3),resid_coh_4_extrap(:,2),fcn);
aux = resid_coh_4_extrap(logical((isnan(resid_coh_4_extrap(:,15))==0)),:); 
fcn = @(x)mean(x);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh4.covar2 = [NaN(31-length(skew),1); covar; NaN(2,1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_4_extrap(resid_coh_4_extrap(:,13)>0,:); 
aux_n = resid_coh_4_extrap(resid_coh_4_extrap(:,13)<0,:);
aux_p(:,15)=aux_p(:,3).*aux_p(:,13);
aux_n(:,15)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh4.covar1_p = [NaN(31-length(skew),1); covar_p; NaN];
coh4.covar1_n = [NaN(31-length(skew),1); covar_n; NaN];
%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_4_extrap(:,15) = accumarray_expand(resid_coh_4_extrap(:,3),resid_coh_4_extrap(:,2),fcn);
aux_p = resid_coh_4_extrap(logical((resid_coh_4_extrap(:,3)>0).*(isnan(resid_coh_4_extrap(:,15))==0)),:); 
aux_n = resid_coh_4_extrap(logical((resid_coh_4_extrap(:,3)<0).*(isnan(resid_coh_4_extrap(:,15))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh4.covar2_p = [NaN(31-length(skew),1); covar_p; NaN(2,1)];
coh4.covar2_n = [NaN(31-length(skew),1); covar_n; NaN(2,1)];
%
resid_coh_5_extrap = csvread('resid_coh_5_extrap.out');
%compute skewness by age
fcn = @(x)skewness(x);
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_5_extrap,1);
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
coh5.skew = skew;
coh5.skew_kelly = (pctile90+pctile10-2*pctile50)./(pctile90-pctile10);
% fcn = @(x)skewness(x); 
% aux = sortrows(resid_coh_5_extrap,1); 
% skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
% coh5.skew = skew;
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh5.outbound = outbound;
%compute var by age
fcn = @(x)var(x);
vari = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
coh5.vari = vari;
%fraction of positive/negative growths
r=size(aux,1);
for j=1:r;
for i=1:31;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
%compute kurtosis by age
fcn = @(x)kurtosis(x);
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
kurt = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
coh5.kurt = kurt;
coh5.kurt_cs = (pctile975-pctile025)./(pctile75-pctile25);
% fcn = @(x)kurtosis(x);
% kurt = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
% coh5.kurt = kurt;
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh5.mean = sammean;
%compute conditional mean by age
fcn = @(x)mean(x); 
pos = resid_coh_5_extrap(resid_coh_5_extrap(:,3)>=0,:);
neg = resid_coh_5_extrap(resid_coh_5_extrap(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh5.mean_p = mean_p;
coh5.mean_n = mean_n;
%conditional variance by age
fcn = @(x)var(x); 
aux_p = sortrows(pos,1); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh5.var_p = [NaN(31-length(skew),1); var_p];
coh5.var_n = [NaN(31-length(skew),1); var_n];
%
%unconditional 1st n 2nd covariance by age
fcn = @(x)mean(x); 
aux = resid_coh_5_extrap; 
aux(:,15)=aux(:,3).*aux(:,13);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh5.covar1 = [NaN(31-length(skew),1); covar; NaN];
fcn = @(x){expect_t2(x,2)}; 
resid_coh_5_extrap(:,15) = accumarray_expand(resid_coh_5_extrap(:,3),resid_coh_5_extrap(:,2),fcn);
aux = resid_coh_5_extrap(logical((isnan(resid_coh_5_extrap(:,15))==0)),:); 
fcn = @(x)mean(x);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh5.covar2 = [NaN(31-length(skew),1); covar; NaN(2,1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_5_extrap(resid_coh_5_extrap(:,13)>0,:); 
aux_n = resid_coh_5_extrap(resid_coh_5_extrap(:,13)<0,:);
aux_p(:,15)=aux_p(:,3).*aux_p(:,13);
aux_n(:,15)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh5.covar1_p = [NaN(31-length(skew),1); covar_p; NaN];
coh5.covar1_n = [NaN(31-length(skew),1); covar_n; NaN];
%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_5_extrap(:,15) = accumarray_expand(resid_coh_5_extrap(:,3),resid_coh_5_extrap(:,2),fcn);
aux_p = resid_coh_5_extrap(logical((resid_coh_5_extrap(:,3)>0).*(isnan(resid_coh_5_extrap(:,15))==0)),:); 
aux_n = resid_coh_5_extrap(logical((resid_coh_5_extrap(:,3)<0).*(isnan(resid_coh_5_extrap(:,15))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh5.covar2_p = [NaN(31-length(skew),1); covar_p; NaN(2,1)];
coh5.covar2_n = [NaN(31-length(skew),1); covar_n; NaN(2,1)];
%
resid_coh_6_extrap = csvread('resid_coh_6_extrap.out');
%compute skewness by age
fcn = @(x)skewness(x);
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_6_extrap,1);
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
coh6.skew = [skew; NaN(31-length(skew),1)];
coh6.skew_kelly = [(pctile90+pctile10-2*pctile50)./(pctile90-pctile10); NaN(31-length(skew),1)];
% fcn = @(x)skewness(x); 
% aux = sortrows(resid_coh_6_extrap,1); 
% skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
% coh6.skew = [skew; NaN(31-length(skew),1)];
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh6.outbound = [outbound; NaN(31-length(skew),1)];
%compute var by age
fcn = @(x)var(x);
vari = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
coh6.vari = [vari; NaN(31-length(skew),1)];
%fraction of positive/negative growths
r=size(aux,1);
for j=1:r;
for i=1:31;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
%compute kurtosis by age
fcn = @(x)kurtosis(x);
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
kurt = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
coh6.kurt = [kurt; NaN(31-length(skew),1)];
coh6.kurt_cs = [(pctile975-pctile025)./(pctile75-pctile25); NaN(31-length(skew),1)];
% fcn = @(x)kurtosis(x);
% kurt = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
% coh6.kurt = [kurt; NaN(31-length(skew),1)];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh6.mean = [sammean; NaN(31-length(skew),1)];
%compute conditional mean by age
fcn = @(x)mean(x); 
pos = resid_coh_6_extrap(resid_coh_6_extrap(:,3)>=0,:);
neg = resid_coh_6_extrap(resid_coh_6_extrap(:,3)<0,:);
aux_p = sortrows(pos,1);
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh6.mean_p = [mean_p; NaN(31-length(skew),1)];
coh6.mean_n = [mean_n; NaN(31-length(skew),1)];
%conditional variance by age
fcn = @(x)var(x); 
aux_p = sortrows(pos,1); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh6.var_p = [var_p; NaN(31-length(skew),1)];
coh6.var_n = [var_n; NaN(31-length(skew),1)];
%
%unconditional 1st n 2nd covariance by age
fcn = @(x)mean(x); 
aux = resid_coh_6_extrap; 
aux(:,15)=aux(:,3).*aux(:,13);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh6.covar1 = [covar; NaN(32-length(skew),1)];
fcn = @(x){expect_t2(x,2)}; 
resid_coh_6_extrap(:,15) = accumarray_expand(resid_coh_6_extrap(:,3),resid_coh_6_extrap(:,2),fcn);
aux = resid_coh_6_extrap(logical((isnan(resid_coh_6_extrap(:,15))==0)),:); 
fcn = @(x)mean(x);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh6.covar2 = [covar; NaN(31-length(skew),1); NaN(2,1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_6_extrap(resid_coh_6_extrap(:,13)>0,:); 
aux_n = resid_coh_6_extrap(resid_coh_6_extrap(:,13)<0,:);
aux_p(:,15)=aux_p(:,3).*aux_p(:,13);
aux_n(:,15)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh6.covar1_p = [covar_p; NaN(33-length(skew),1)];
coh6.covar1_n = [covar_n; NaN(33-length(skew),1)];
%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_6_extrap(:,15) = accumarray_expand(resid_coh_6_extrap(:,3),resid_coh_6_extrap(:,2),fcn);
aux_p = resid_coh_6_extrap(logical((resid_coh_6_extrap(:,3)>0).*(isnan(resid_coh_6_extrap(:,15))==0)),:); 
aux_n = resid_coh_6_extrap(logical((resid_coh_6_extrap(:,3)<0).*(isnan(resid_coh_6_extrap(:,15))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh6.covar2_p = [covar_p; NaN(33-length(skew),1)];
coh6.covar2_n = [covar_n; NaN(33-length(skew),1)];
%
resid_coh_7_extrap = csvread('resid_coh_7_extrap.out');
%compute skewness by age
fcn = @(x)skewness(x);
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_7_extrap,1);
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
coh7.skew = [skew; NaN(31-length(skew),1)];
coh7.skew_kelly = [(pctile90+pctile10-2*pctile50)./(pctile90-pctile10); NaN(31-length(skew),1)];
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh7.outbound = [outbound; NaN(31-length(skew),1)];
%compute var by age
fcn = @(x)var(x);
vari = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
coh7.vari =[vari; NaN(31-length(skew),1)];
%fraction of positive/negative growths
r=size(aux,1);
for j=1:r;
for i=1:31;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
%compute kurtosis by age
fcn = @(x)kurtosis(x);
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
kurt = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
coh7.kurt = [kurt; NaN(31-length(skew),1)];
coh7.kurt_cs = [(pctile975-pctile025)./(pctile75-pctile25); NaN(31-length(skew),1)];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh7.mean = [sammean; NaN(31-length(skew),1)];
%compute conditional mean by age
fcn = @(x)mean(x); 
pos = resid_coh_7_extrap(resid_coh_7_extrap(:,3)>=0,:);
neg = resid_coh_7_extrap(resid_coh_7_extrap(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh7.mean_p = [mean_p; NaN(31-length(skew),1)];
coh7.mean_n = [mean_n; NaN(31-length(skew),1)];
%conditional variance by age
fcn = @(x)var(x); 
aux_p = sortrows(pos,1); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh7.var_p = [var_p; NaN(31-length(skew),1)];
coh7.var_n = [var_n; NaN(31-length(skew),1)];
%
%unconditional 1st n 2nd covariance by age
fcn = @(x)mean(x); 
aux = resid_coh_7_extrap; 
aux(:,15)=aux(:,3).*aux(:,13);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh7.covar1 = [covar; NaN(32-length(skew),1)];
fcn = @(x){expect_t2(x,2)}; 
resid_coh_7_extrap(:,15) = accumarray_expand(resid_coh_7_extrap(:,3),resid_coh_7_extrap(:,2),fcn);
aux = resid_coh_7_extrap(logical((isnan(resid_coh_7_extrap(:,15))==0)),:); 
fcn = @(x)mean(x);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh7.covar2 = [covar; NaN(31-length(skew),1); NaN(2,1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_7_extrap(resid_coh_7_extrap(:,13)>0,:); 
aux_n = resid_coh_7_extrap(resid_coh_7_extrap(:,13)<0,:);
aux_p(:,15)=aux_p(:,3).*aux_p(:,13);
aux_n(:,15)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh7.covar1_p = [covar_p; NaN(32-length(skew),1)];
coh7.covar1_n = [covar_n; NaN(32-length(skew),1)];
%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_7_extrap(:,15) = accumarray_expand(resid_coh_7_extrap(:,3),resid_coh_7_extrap(:,2),fcn);
aux_p = resid_coh_7_extrap(logical((resid_coh_7_extrap(:,3)>0).*(isnan(resid_coh_7_extrap(:,15))==0)),:); 
aux_n = resid_coh_7_extrap(logical((resid_coh_7_extrap(:,3)<0).*(isnan(resid_coh_7_extrap(:,15))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh7.covar2_p = [covar_p; NaN(33-length(skew),1)];
coh7.covar2_n = [covar_n; NaN(33-length(skew),1)];
%
resid_coh_8_extrap = csvread('resid_coh_8_extrap.out');
%compute skewness by age
fcn = @(x)skewness(x);
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_8_extrap,1);
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
coh8.skew = [skew; NaN(31-length(skew),1)];
coh8.skew_kelly = [(pctile90+pctile10-2*pctile50)./(pctile90-pctile10); NaN(31-length(skew),1)];
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh8.outbound = [outbound; NaN(31-length(skew),1)];
%compute var by age
fcn = @(x)var(x);
vari = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
coh8.vari = [vari; NaN(31-length(skew),1)];
%fraction of positive/negative growths
r=size(aux,1);
for j=1:r;
for i=1:31;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
%compute kurtosis by age
fcn = @(x)kurtosis(x);
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
kurt = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
coh8.kurt = [kurt; NaN(31-length(skew),1)];
coh8.kurt_cs = [(pctile975-pctile025)./(pctile75-pctile25); NaN(31-length(skew),1)];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh8.mean = [sammean; NaN(31-length(skew),1)];
%compute conditional mean by age
fcn = @(x)mean(x); 
pos = resid_coh_8_extrap(resid_coh_8_extrap(:,3)>=0,:);
neg = resid_coh_8_extrap(resid_coh_8_extrap(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh8.mean_p = [mean_p; NaN(31-length(skew),1)];
coh8.mean_n = [mean_n; NaN(31-length(skew),1)];
%conditional variance by age
fcn = @(x)var(x); 
aux_p = sortrows(pos,1); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh8.var_p = [var_p; NaN(31-length(skew),1)];
coh8.var_n = [var_n; NaN(31-length(skew),1)];
%
%unconditional 1st n 2nd covariance by age
fcn = @(x)mean(x); 
aux = resid_coh_8_extrap; 
aux(:,15)=aux(:,3).*aux(:,13);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh8.covar1 = [covar; NaN(32-length(skew),1)];
fcn = @(x){expect_t2(x,2)}; 
resid_coh_8_extrap(:,15) = accumarray_expand(resid_coh_8_extrap(:,3),resid_coh_8_extrap(:,2),fcn);
aux = resid_coh_8_extrap(logical((isnan(resid_coh_8_extrap(:,15))==0)),:); 
fcn = @(x)mean(x);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh8.covar2 = [covar; NaN(31-length(skew),1); NaN(2,1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_8_extrap(resid_coh_8_extrap(:,13)>0,:); 
aux_n = resid_coh_8_extrap(resid_coh_8_extrap(:,13)<0,:);
aux_p(:,15)=aux_p(:,3).*aux_p(:,13);
aux_n(:,15)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh8.covar1_p = [covar_p; NaN(33-length(skew),1)];
coh8.covar1_n = [covar_n; NaN(33-length(skew),1)];
%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_8_extrap(:,15) = accumarray_expand(resid_coh_8_extrap(:,3),resid_coh_8_extrap(:,2),fcn);
aux_p = resid_coh_8_extrap(logical((resid_coh_8_extrap(:,3)>0).*(isnan(resid_coh_8_extrap(:,15))==0)),:); 
aux_n = resid_coh_8_extrap(logical((resid_coh_8_extrap(:,3)<0).*(isnan(resid_coh_8_extrap(:,15))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh8.covar2_p = [covar_p; NaN(33-length(skew),1)];
coh8.covar2_n = [covar_n; NaN(33-length(skew),1)];
%
resid_coh_9_extrap = csvread('resid_coh_9_extrap.out');
%compute skewness by age
fcn = @(x)skewness(x);
fcn10 = @(x)prctile(x,10);
fcn50 = @(x)prctile(x,50);
fcn90 = @(x)prctile(x,90);
aux = sortrows(resid_coh_9_extrap,1);
skew = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile10 = accumarray_expand_s(aux(:,3),aux(:,1),fcn10);%growth from today to tomorrow
pctile50 = accumarray_expand_s(aux(:,3),aux(:,1),fcn50);%growth from today to tomorrow
pctile90 = accumarray_expand_s(aux(:,3),aux(:,1),fcn90);%growth from today to tomorrow
coh9.skew = [skew; NaN(31-length(skew),1)];
coh9.skew_kelly = [(pctile90+pctile10-2*pctile50)./(pctile90-pctile10); NaN(31-length(skew),1)];
%compute outbound by age
fcn = @(x)mean(x);
vect = aux;
vect(:,4)=abs(vect(:,3))>0.05;
outbound = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
coh9.outbound = [outbound; NaN(31-length(skew),1)];
%compute var by age
fcn = @(x)var(x);
vari = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
coh9.vari = [vari; NaN(31-length(skew),1)];
%fraction of positive/negative growths
r=size(aux,1);
for j=1:r;
for i=1:31;
    if aux(j,1)==23+i;
    if aux(j,3)>0;
        sum_p(i)=sum_p(i,1)+1;
    elseif aux(j,3)<0;
        sum_n(i)=sum_n(i,1)+1;
    end
    end
end
end
%compute kurtosis by age
fcn = @(x)kurtosis(x);
fcn975 = @(x)prctile(x,97.5);
fcn025 = @(x)prctile(x,2.5);
fcn75 = @(x)prctile(x,75);
fcn25 = @(x)prctile(x,25);
kurt = accumarray_expand_s(aux(:,3),aux(:,1),fcn);%growth from today to tomorrow
pctile975 = accumarray_expand_s(aux(:,3),aux(:,1),fcn975);%growth from today to tomorrow
pctile025 = accumarray_expand_s(aux(:,3),aux(:,1),fcn025);%growth from today to tomorrow
pctile75 = accumarray_expand_s(aux(:,3),aux(:,1),fcn75);%growth from today to tomorrow
pctile25 = accumarray_expand_s(aux(:,3),aux(:,1),fcn25);%growth from today to tomorrow
coh9.kurt = [kurt; NaN(31-length(skew),1)];
coh9.kurt_cs = [(pctile975-pctile025)./(pctile75-pctile25); NaN(31-length(skew),1)];
%compute unconditional mean by age
fcn = @(x)mean(x); 
sammean = accumarray_expand_s(aux(:,3),aux(:,1),fcn);
coh9.mean = [sammean; NaN(31-length(skew),1)];
%compute conditional mean by age
fcn = @(x)mean(x); 
pos = resid_coh_9_extrap(resid_coh_9_extrap(:,3)>=0,:);
neg = resid_coh_9_extrap(resid_coh_9_extrap(:,3)<0,:);
aux_p = sortrows(pos,1); 
mean_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
mean_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh9.mean_p = [mean_p; NaN(31-length(skew),1)];
coh9.mean_n = [mean_n; NaN(31-length(skew),1)];
%conditional variance by age
fcn = @(x)var(x); 
aux_p = sortrows(pos,1); 
var_p = accumarray_expand_s(aux_p(:,3),aux_p(:,1),fcn);
aux_n = sortrows(neg,1); 
var_n = accumarray_expand_s(aux_n(:,3),aux_n(:,1),fcn);
coh9.var_p = [var_p; NaN(31-length(skew),1)];
coh9.var_n = [var_n; NaN(31-length(skew),1)];
%unconditional 1st n 2nd covariance by age
fcn = @(x)mean(x); 
aux = resid_coh_9_extrap; 
aux(:,15)=aux(:,3).*aux(:,13);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh9.covar1 = [covar; NaN(32-length(skew),1)];
fcn = @(x){expect_t2(x,2)}; 
resid_coh_9_extrap(:,15) = accumarray_expand(resid_coh_9_extrap(:,3),resid_coh_9_extrap(:,2),fcn);
aux = resid_coh_9_extrap(logical((isnan(resid_coh_9_extrap(:,15))==0)),:); 
fcn = @(x)mean(x);
aux = sortrows(aux,1); 
covar = accumarray_expand_s(aux(:,15),aux(:,1),fcn);
coh9.covar2 = [covar; NaN(31-length(skew),1); NaN(2,1)];
%conditional 1st co-variance by age
fcn = @(x)mean(x); 
aux_p = resid_coh_9_extrap(resid_coh_9_extrap(:,13)>0,:); 
aux_n = resid_coh_9_extrap(resid_coh_9_extrap(:,13)<0,:);
aux_p(:,15)=aux_p(:,3).*aux_p(:,13);
aux_n(:,15)=aux_n(:,3).*aux_n(:,13);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh9.covar1_p = [covar_p; NaN(32-length(skew),1)];
coh9.covar1_n = [covar_n; NaN(32-length(skew),1)];
%conditional 2nd co-variance by age
fcn = @(x){expect_t2(x,2)}; 
resid_coh_9_extrap(:,15) = accumarray_expand(resid_coh_9_extrap(:,3),resid_coh_9_extrap(:,2),fcn);
aux_p = resid_coh_9_extrap(logical((resid_coh_9_extrap(:,3)>0).*(isnan(resid_coh_9_extrap(:,15))==0)),:); 
aux_n = resid_coh_9_extrap(logical((resid_coh_9_extrap(:,3)<0).*(isnan(resid_coh_9_extrap(:,15))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1); 
covar_p = accumarray_expand_s(aux_p(:,15),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1); 
covar_n = accumarray_expand_s(aux_n(:,15),aux_n(:,1),fcn);
coh9.covar2_p = [covar_p; NaN(33-length(skew),1)];
coh9.covar2_n = [covar_n; NaN(33-length(skew),1)];
%
% Average over cohorts
sammean = zeros(31,1);
mean_n = zeros(31,1);
mean_p = zeros(31,1);
var_n = zeros(31,1);
var_p = zeros(31,1);
covar1_n = zeros(31,1);
covar1_p = zeros(31,1);
covar2_p = zeros(31,1);
covar2_n = zeros(31,1);
skew = zeros(31,1);
skew_kelly = zeros(31,1);
vari = zeros(31,1);
outbound = zeros(31,1);
kurt = zeros(31,1);
kurt_cs = zeros(31,1);
covar1 = zeros(31,1);
covar2 = zeros(31,1);
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
    n1=0;
    n2=0;
    if isnan(coh1.skew(i,1))==0
        sammean(i,1) =sammean(i,1)+coh1.mean(i,1);
        kurt(i,1) =kurt(i,1)+coh1.kurt(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh1.kurt_cs(i,1);
        skew(i,1) =skew(i,1)+coh1.skew(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh1.skew_kelly(i,1);
        vari(i,1) =vari(i,1)+coh1.vari(i,1);
        outbound(i,1) =outbound(i,1)+coh1.outbound(i,1);
        mean_n(i,1) =mean_n(i,1)+coh1.mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh1.mean_p(i,1);
        var_n(i,1) =var_n(i,1)+coh1.var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh1.var_p(i,1);
        n=n+1;
        if isnan(coh1.covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh1.covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh1.covar1_n(i,1);
            nc1=nc1+1;
        end
        if isnan(coh1.covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh1.covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh1.covar2_n(i,1);
            nc2=nc2+1;
        end
        if isnan(coh1.covar1(i,1))==0
            covar1(i,1)=covar1(i,1)+coh1.covar1(i,1);
            n1=n1+1;
        end
        if isnan(coh1.covar2(i,1))==0
            covar2(i,1)=covar2(i,1)+coh1.covar2(i,1);
            n2=n2+1;
        end
    end
    if isnan(coh2.skew(i,1))==0
        sammean(i,1) =sammean(i,1)+coh2.mean(i,1);
        kurt(i,1) =kurt(i,1)+coh2.kurt(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh2.kurt_cs(i,1);
        skew(i,1) =skew(i,1)+coh2.skew(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh2.skew_kelly(i,1);
        vari(i,1) =vari(i,1)+coh2.vari(i,1);
        outbound(i,1) =outbound(i,1)+coh2.outbound(i,1);
        mean_n(i,1) =mean_n(i,1)+coh2.mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh2.mean_p(i,1);
        var_n(i,1) =var_n(i,1)+coh2.var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh2.var_p(i,1);
        n=n+1;
        if isnan(coh2.covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh2.covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh2.covar1_n(i,1);
            nc1=nc1+1;
        end
        if isnan(coh2.covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh2.covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh2.covar2_n(i,1);
            nc2=nc2+1;
        end
        if isnan(coh2.covar1(i,1))==0
            covar2(i,1)=covar1(i,1)+coh2.covar1(i,1);
            n1=n1+1;
        end
        if isnan(coh2.covar2(i,1))==0
            covar2(i,1)=covar2(i,1)+coh2.covar2(i,1);
            n2=n2+1;
        end
    end
    if isnan(coh3.skew(i,1))==0
        sammean(i,1) =sammean(i,1)+coh3.mean(i,1);
        kurt(i,1) =kurt(i,1)+coh3.kurt(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh3.kurt_cs(i,1);
        skew(i,1) =skew(i,1)+coh3.skew(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh3.skew_kelly(i,1);
        vari(i,1) =vari(i,1)+coh3.vari(i,1);
        outbound(i,1) =outbound(i,1)+coh3.outbound(i,1);
        mean_n(i,1) =mean_n(i,1)+coh3.mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh3.mean_p(i,1);
        var_n(i,1) =var_n(i,1)+coh3.var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh3.var_p(i,1);
        n=n+1;
        if isnan(coh3.covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh3.covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh3.covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh3.covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh3.covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh3.covar2_n(i,1);
            nc2=nc2+1;
        end
        if isnan(coh3.covar1(i,1))==0
            covar1(i,1)=covar1(i,1)+coh3.covar1(i,1);
            n1=n1+1;
        end
        if isnan(coh3.covar1(i,1))==0
            covar2(i,1)=covar2(i,1)+coh3.covar2(i,1);
            n2=n2+1;
        end
    end
    if isnan(coh4.skew(i,1))==0
        sammean(i,1) =sammean(i,1)+coh4.mean(i,1);
        kurt(i,1) =kurt(i,1)+coh4.kurt(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh4.kurt_cs(i,1);
        skew(i,1) =skew(i,1)+coh4.skew(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh4.skew_kelly(i,1);
        vari(i,1) =vari(i,1)+coh4.vari(i,1);
        outbound(i,1) =outbound(i,1)+coh4.outbound(i,1);
        mean_n(i,1) =mean_n(i,1)+coh4.mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh4.mean_p(i,1);
        var_n(i,1) =var_n(i,1)+coh4.var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh4.var_p(i,1);
        n=n+1;
        if isnan(coh4.covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh4.covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh4.covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh4.covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh4.covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh4.covar2_n(i,1);
            nc2=nc2+1;
        end
        if isnan(coh4.covar1(i,1))==0
            covar1(i,1)=covar1(i,1)+coh4.covar1(i,1);
            n1=n1+1;
        end
        if isnan(coh4.covar2(i,1))==0
            covar2(i,1)=covar2(i,1)+coh4.covar2(i,1);
            n2=n2+1;
        end
    end
    if isnan(coh5.skew(i,1))==0
        sammean(i,1) =sammean(i,1)+coh5.mean(i,1);
        kurt(i,1) =kurt(i,1)+coh5.kurt(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh5.kurt_cs(i,1);
        skew(i,1) =skew(i,1)+coh5.skew(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh5.skew_kelly(i,1);
        vari(i,1) =vari(i,1)+coh5.vari(i,1);
        outbound(i,1) =outbound(i,1)+coh5.outbound(i,1);
        mean_n(i,1) =mean_n(i,1)+coh5.mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh5.mean_p(i,1);
        var_n(i,1) =var_n(i,1)+coh5.var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh5.var_p(i,1);
        n=n+1;
        if isnan(coh5.covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh5.covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh5.covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh5.covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh5.covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh5.covar2_n(i,1);
            nc2=nc2+1;
        end
        if isnan(coh5.covar1(i,1))==0
            covar1(i,1)=covar1(i,1)+coh5.covar1(i,1);
            n1=n1+1;
        end
        if isnan(coh5.covar2(i,1))==0
            covar2(i,1)=covar2(i,1)+coh5.covar2(i,1);
            n2=n2+1;
        end
   end
    if isnan(coh6.skew(i,1))==0
        sammean(i,1) =sammean(i,1)+coh6.mean(i,1);
        kurt(i,1) =kurt(i,1)+coh6.kurt(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh6.kurt_cs(i,1);
        skew(i,1) =skew(i,1)+coh6.skew(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh6.skew_kelly(i,1);
        vari(i,1) =vari(i,1)+coh6.vari(i,1);
        outbound(i,1) =outbound(i,1)+coh6.outbound(i,1);
        mean_n(i,1) =mean_n(i,1)+coh6.mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh6.mean_p(i,1);
        var_n(i,1) =var_n(i,1)+coh6.var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh6.var_p(i,1);
        n=n+1;
         if isnan(coh6.covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh6.covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh6.covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh6.covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh6.covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh6.covar2_n(i,1);
            nc2=nc2+1;
        end
        if isnan(coh6.covar1(i,1))==0
            covar1(i,1)=covar1(i,1)+coh6.covar1(i,1);
            n1=n1+1;
        end
        if isnan(coh6.covar2(i,1))==0
            covar2(i,1)=covar2(i,1)+coh6.covar2(i,1);
            n2=n2+1;
        end
    end
    if isnan(coh7.skew(i,1))==0
        sammean(i,1) =sammean(i,1)+coh7.mean(i,1);
        kurt(i,1) =kurt(i,1)+coh7.kurt(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh7.kurt_cs(i,1);
        skew(i,1) =skew(i,1)+coh7.skew(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh7.skew_kelly(i,1);
        vari(i,1) =vari(i,1)+coh7.vari(i,1);
        outbound(i,1) =outbound(i,1)+coh7.outbound(i,1);
        mean_n(i,1) =mean_n(i,1)+coh7.mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh7.mean_p(i,1);
        var_n(i,1) =var_n(i,1)+coh7.var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh7.var_p(i,1);
        n=n+1;
        if isnan(coh7.covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh7.covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh7.covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh7.covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh7.covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh7.covar2_n(i,1);
            nc2=nc2+1;
        end
        if isnan(coh7.covar1(i,1))==0
            covar1(i,1)=covar1(i,1)+coh7.covar1(i,1);
            n1=n1+1;
        end
        if isnan(coh7.covar2(i,1))==0
            covar2(i,1)=covar2(i,1)+coh7.covar2(i,1);
            n2=n2+1;
        end
    end
    if isnan(coh8.skew(i,1))==0
        sammean(i,1) =sammean(i,1)+coh8.mean(i,1);
        kurt(i,1) =kurt(i,1)+coh8.kurt(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh8.kurt_cs(i,1);
        skew(i,1) =skew(i,1)+coh8.skew(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh8.skew_kelly(i,1);
        vari(i,1) =vari(i,1)+coh8.vari(i,1);
        outbound(i,1) =outbound(i,1)+coh8.outbound(i,1);
        mean_n(i,1) =mean_n(i,1)+coh8.mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh8.mean_p(i,1);
        var_n(i,1) =var_n(i,1)+coh8.var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh8.var_p(i,1);
        n=n+1;
        if isnan(coh8.covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh8.covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh8.covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh8.covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh8.covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh8.covar2_n(i,1);
            nc2=nc2+1;
        end
        if isnan(coh8.covar1(i,1))==0
            covar1(i,1)=covar1(i,1)+coh8.covar1(i,1);
            n1=n1+1;
        end
        if isnan(coh8.covar2(i,1))==0
            covar2(i,1)=covar2(i,1)+coh8.covar2(i,1);
            n2=n2+1;
        end
    end
    if isnan(coh9.skew(i,1))==0
        sammean(i,1) =sammean(i,1)+coh9.mean(i,1);
        kurt(i,1) =kurt(i,1)+coh9.kurt(i,1);
        kurt_cs(i,1) =kurt_cs(i,1)+coh9.kurt_cs(i,1);
        skew(i,1) =skew(i,1)+coh9.skew(i,1);
        skew_kelly(i,1) =skew_kelly(i,1)+coh9.skew_kelly(i,1);
        vari(i,1) =vari(i,1)+coh9.vari(i,1);
        outbound(i,1) =outbound(i,1)+coh9.outbound(i,1);
        mean_n(i,1) =mean_n(i,1)+coh9.mean_n(i,1);
        mean_p(i,1) =mean_p(i,1)+coh9.mean_p(i,1);
        var_n(i,1) =var_n(i,1)+coh9.var_n(i,1);
        var_p(i,1) =var_p(i,1)+coh9.var_p(i,1);
        n=n+1;
        if isnan(coh9.covar1_p(i,1))==0
            covar1_p(i,1)=covar1_p(i,1)+coh9.covar1_p(i,1);
            covar1_n(i,1)=covar1_n(i,1)+coh9.covar1_n(i,1);
            nc1 = nc1+1;
        end
        if isnan(coh9.covar2_p(i,1))==0
            covar2_p(i,1)=covar2_p(i,1)+coh9.covar2_p(i,1);
            covar2_n(i,1)=covar2_n(i,1)+coh9.covar2_n(i,1);
            nc2=nc2+1;
        end
        if isnan(coh9.covar1(i,1))==0
            covar1(i,1)=covar1(i,1)+coh9.covar1(i,1);
            n1=n1+1;
        end
        if isnan(coh9.covar2(i,1))==0
            covar2(i,1)=covar2(i,1)+coh9.covar2(i,1);
            n2=n2+1;
        end
    end
    sammean(i,1) = sammean(i,1)./n;
    kurt(i,1) = kurt(i,1)./n;
    kurt_cs(i,1) = kurt_cs(i,1)./n;
    skew(i,1) = skew(i,1)./n;
    skew_kelly(i,1) = skew_kelly(i,1)./n;
    vari(i,1) = vari(i,1)./n;
    outbound(i,1) = outbound(i,1)./n;
    mean_n(i,1) = mean_n(i,1)./n;
    mean_p(i,1) = mean_p(i,1)./n;
    var_n(i,1) = var_n(i,1)./n;
    var_p(i,1) = var_p(i,1)./n;
    covar1_n(i,1) = covar1_n(i,1)./nc1;
    covar1_p(i,1) = covar1_p(i,1)./nc1;
    covar2_n(i,1) = covar2_n(i,1)./nc2;
    covar2_p(i,1) = covar2_p(i,1)./nc2;
    covar1(i,1) = covar1(i,1)./n1;
    covar2(i,1) = covar2(i,1)./n2;
end
%
fract_p=zeros(31,1);
for i=1:31;
fract_p(i,1)=sum_p(i,1)/(sum_p(i,1)+sum_n(i,1));
end
%fraction of residual wage growth outside the bound [-0.5%,0.5%]
%
vect=resid_coh_1_extrap;
vect(:,4)=abs(vect(:,3))>0.05;
vect = sortrows(vect,1);
fcn = @(x)mean(x); 
outbound_1 = accumarray_expand_s(vect(:,4),vect(:,1),fcn);
%
%
data.outbound=outbound;
data.mean=sammean;
data.sum_p=sum_p;
data.sum_n=sum_n;
data.fract_p=fract_p;
data.kurt = kurt;
data.kurt_cs = kurt_cs;
data.skew = skew;
data.skew_kelly = skew_kelly;
data.mean_n = mean_n;
data.mean_p = mean_p;
data.var_n = var_n;
data.var_p = var_p;
data.covar1_n = covar1_n;
data.covar1_p = covar1_p;
data.covar2_n = covar2_n;
data.covar2_p = covar2_p;
data.covar1 = covar1;
data.covar2 = covar2;
%
gr=[resid_coh_9_extrap(:,1) resid_coh_9_extrap(:,3);resid_coh_8_extrap(:,1) resid_coh_8_extrap(:,3);resid_coh_7_extrap(:,1) resid_coh_7_extrap(:,3);resid_coh_6_extrap(:,1) resid_coh_6_extrap(:,3);resid_coh_5_extrap(:,1) resid_coh_5_extrap(:,3);resid_coh_4_extrap(:,1) resid_coh_4_extrap(:,3);resid_coh_3_extrap(:,1) resid_coh_3_extrap(:,3);resid_coh_2_extrap(:,1) resid_coh_2_extrap(:,3);resid_coh_1_extrap(:,1) resid_coh_1_extrap(:,3)];
gr_26=gr(:,2);
gr_30=gr(:,2);
gr_36=gr(:,2);
gr_40=gr(:,2);
gr_46=gr(:,2);
gr_50=gr(:,2);
gr_54=gr(:,2);
gr_26=gr_26(logical(gr(:,1)==26));
gr_30=gr_30(logical(gr(:,1)==30));
gr_36=gr_36(logical(gr(:,1)==36));
gr_40=gr_40(logical(gr(:,1)==40));
gr_46=gr_46(logical(gr(:,1)==46));
gr_50=gr_50(logical(gr(:,1)==50));
gr_54=gr_54(logical(gr(:,1)==54));
data.gr_26=gr_26;
data.gr_30=gr_30;
data.gr_36=gr_36;
data.gr_40=gr_40;
data.gr_46=gr_46;
data.gr_50=gr_50;
data.gr_54=gr_54;
%
%conditional 1-nth autocovariance by age
resid=cell(9,1);
resid{1} = csvread('resid_coh_1_extrap.out');
resid{2} = csvread('resid_coh_2_extrap.out');
resid{3} = csvread('resid_coh_3_extrap.out');
resid{4} = csvread('resid_coh_4_extrap.out');
resid{5} = csvread('resid_coh_5_extrap.out');
resid{6} = csvread('resid_coh_6_extrap.out');
resid{7} = csvread('resid_coh_7_extrap.out');
resid{8} = csvread('resid_coh_8_extrap.out');
resid{9} = csvread('resid_coh_9_extrap.out');
N=30;
pcoh=cell(9,N);
ncoh=cell(9,N);
for j=1:9%cohort
for i=1:N%autocovariance lag
res=resid{j};
if i<=range(res(:,1))
fcn = @(x){expect_t2(x,i)}; 
res(:,end+1) = accumarray_expand(res(:,3),res(:,2),fcn);
aux_p = res(logical((res(:,3)>0).*(isnan(res(:,end))==0)),:);
aux_n = res(logical((res(:,3)<0).*(isnan(res(:,end))==0)),:);
fcn = @(x)mean(x);
aux_p = sortrows(aux_p,1);
covar_p = accumarray_expand_s(aux_p(:,end),aux_p(:,1),fcn);
aux_n = sortrows(aux_n,1);
covar_n = accumarray_expand_s(aux_n(:,end),aux_n(:,1),fcn);
pcoh{j,i} = [NaN(min(res(:,1))-24,1); covar_p; NaN(31-length([NaN(min(res(:,1))-24,1); covar_p]),1)];
ncoh{j,i} = [NaN(min(res(:,1))-24,1); covar_n; NaN(31-length([NaN(min(res(:,1))-24,1); covar_p]),1)];
else
pcoh{j,i} = NaN(31,1);
ncoh{j,i} = NaN(31,1);   
end
end
end
%
pacv=NaN(30,30);
for j=1:30;%autocovariances
for i=1:30;%year that is produced
pacv(i,j)=nanmean(cellfun(@(pcoh) pcoh(i,1), pcoh(:, j)));
end
end
cpacv=nanmean(pacv,1);%year unconditionally
cpacv=cpacv';
nacv=NaN(30,30);
for j=1:30;%autocovariances
for i=1:30;%year that is produced
nacv(i,j)=nanmean(cellfun(@(ncoh) ncoh(i,1), ncoh(:, j)));
end
end
cnacv=nanmean(nacv,1);%year unconditionally
cnacv=cnacv';
data.cpacv=cpacv;
data.cnacv=cnacv;
%Unconditional Autocovariance:
ucoh=cell(9,N+1);
for j=1:9%cohort
for i=1:N+1%autocovariance lag
res=resid{j};
if i<=range(res(:,1))+1
fcn = @(x){expect_t2(x,i-1)}; 
res(:,end+1) = accumarray_expand(res(:,3),res(:,2),fcn);
aux_u = res(logical(isnan(res(:,end))==0),:);
fcn = @(x)mean(x);
aux_u = sortrows(aux_u,1);
covar_u = accumarray_expand_s(aux_u(:,end),aux_u(:,1),fcn);
ucoh{j,i} = [NaN(min(res(:,1))-24,1); covar_u; NaN(32-length([NaN(min(res(:,1))-24,1); covar_u]),1)];
else
ucoh{j,i} = NaN(32,1);
end
end
end
uacv=NaN(30+1,30+1);
for j=1:30+1;%autocovariances
for i=1:30+1;%year that is produced
uacv(i,j)=nanmean(cellfun(@(ucoh) ucoh(i,1), ucoh(:, j)));
end
end
cuacv=nanmean(uacv,1);%year unconditionally
cuacv=cuacv';
data.M_ave=cuacv;
data.unc_var=uacv(:,1);
%
m=zeros(length(uacv),length(uacv));
for i=1:length(uacv)
    m(i:end,i)=uacv(i,1:end-(i-1));
end
%
data.m=m;
hump=csvread('hump_extrapolated.out');
start=csvread('coh_coeff_extrapolated.out');
start_2=start(end)+start(1:end-1);
hump_coh=mean(start_2);
hump=[hump_coh; hump];
data.hump=hump;
data.hump_coh=hump_coh;
%
data.le_cov1=csvread('cov1_extrapolated.out');
start=csvread('cov1_coeff_extrapolated.out');
start_2=start(end)+start(1:end-1);
data.le_cov1_coh=mean(start_2);
data.le_cov1=[data.le_cov1_coh; data.le_cov1];
%
data.le_cov2=csvread('cov2_extrapolated.out');
start=csvread('cov2_coeff_extrapolated.out');
start_2=start(end)+start(1:end-1);
data.le_cov2_coh=mean(start_2);
data.le_cov2=[data.le_cov2_coh; data.le_cov2];
%
data.le_cov3=csvread('cov3_extrapolated.out');
start=csvread('cov3_coeff_extrapolated.out');
start_3=start(end)+start(1:end-1);
data.le_cov3_coh=mean(start_3);
data.le_cov3=[data.le_cov3_coh; data.le_cov3];
%
data.le_cov4=csvread('cov4_extrapolated.out');
start=csvread('cov4_coeff_extrapolated.out');
start_4=start(end)+start(1:end-1);
data.le_cov4_coh=mean(start_4);
data.le_cov4=[data.le_cov4_coh; data.le_cov4];
%
data.le_cov5=csvread('cov5_extrapolated.out');
start=csvread('cov5_coeff_extrapolated.out');
start_5=start(end)+start(1:end-1);
data.le_cov5_coh=mean(start_5);
data.le_cov5=[data.le_cov5_coh; data.le_cov5];
%
data.le_cov6=csvread('cov6_extrapolated.out');
start=csvread('cov6_coeff_extrapolated.out');
start_6=start(end)+start(1:end-1);
data.le_cov6_coh=mean(start_6);
data.le_cov6=[data.le_cov6_coh; data.le_cov6];
%
data.le_cov7=csvread('cov7_extrapolated.out');
start=csvread('cov7_coeff_extrapolated.out');
start_7=start(end)+start(1:end-1);
data.le_cov7_coh=mean(start_7);
data.le_cov7=[data.le_cov7_coh; data.le_cov7];
%
data.le_cov8=csvread('cov8_extrapolated.out');
start=csvread('cov8_coeff_extrapolated.out');
start_8=start(end)+start(1:end-1);
data.le_cov8_coh=mean(start_8);
data.le_cov8=[data.le_cov8_coh; data.le_cov8];
%
data.le_cov9=csvread('cov9_extrapolated.out');
start=csvread('cov9_coeff_extrapolated.out');
start_9=start(end)+start(1:end-1);
data.le_cov9_coh=mean(start_9);
data.le_cov9=[data.le_cov9_coh; data.le_cov9];
%
data.le_cov10=csvread('cov10_extrapolated.out');
start=csvread('cov10_coeff_extrapolated.out');
start_10=start(end)+start(1:end-1);
data.le_cov10_coh=mean(start_10);
data.le_cov10=[data.le_cov10_coh; data.le_cov10];

le_covariances=[data.le_cov1 [data.le_cov2; NaN(31-length(data.le_cov2),1)] [data.le_cov3; NaN(31-length(data.le_cov3),1)] [data.le_cov4; NaN(31-length(data.le_cov4),1)] [data.le_cov5; NaN(31-length(data.le_cov5),1)] [data.le_cov6; NaN(31-length(data.le_cov6),1)] ...
                [data.le_cov7; NaN(31-length(data.le_cov7),1)] [data.le_cov8; NaN(31-length(data.le_cov8),1)] [data.le_cov9; NaN(31-length(data.le_cov9),1)] [data.le_cov10; NaN(31-length(data.le_cov10),1)]  ];

%
%age autocovariances:
N=30;
coh=cell(9,N);
for j=1:9%cohort
for i=1:N%autocovariance lag
res=resid{j};
if i<=range(res(:,1))
fcn = @(x){expect_t2(x,i)}; 
res(:,end+1) = accumarray_expand(res(:,3),res(:,2),fcn);
aux = res(logical((res(:,3)>0).*(isnan(res(:,end))==0)),:);
fcn = @(x)mean(x);
aux = sortrows(aux,1);
covar = accumarray_expand_s(aux(:,end),aux(:,1),fcn);
coh{j,i} = [NaN(min(res(:,1))-24,1); covar; NaN(31-length([NaN(min(res(:,1))-24,1); covar]),1)];
else
coh{j,i} = NaN(31,1);  
end
end
end
%
acv=NaN(30,30);
for j=1:30%autocovariances
for i=1:30%year that is produced
acv(i,j)=nanmean(cellfun(@(coh) coh(i,1), coh(:, j)));
end
end
cacv=nanmean(acv,1);%year unconditionally
cacv=cacv';
data.cacv=cacv;
data.acv=acv;
data_simplified=data;
%
save('data_simplified.mat','data_simplified');
save('coh1.mat','coh1');
save('coh2.mat','coh2');
save('coh3.mat','coh3');
save('coh4.mat','coh4');
save('coh5.mat','coh5');
save('coh6.mat','coh6');
save('coh7.mat','coh7');
save('coh8.mat','coh8');
save('coh9.mat','coh9');
%Saving to Excel
le_covariances(end+1,:)=NaN;
%
fract_above_five=[outbound; NaN(32-length(outbound),1)];
Sammean=[sammean; NaN(32-length(outbound),1)];
Sum_p=[sum_p; NaN(32-length(outbound),1)];
Sum_n=[sum_n; NaN(32-length(outbound),1)];
Fract_p=[fract_p; NaN(32-length(outbound),1)];
Kurt=[kurt; NaN(32-length(outbound),1)];
Kurt_cs=[kurt_cs; NaN(32-length(outbound),1)];
Skew=[skew; NaN(32-length(outbound),1)];
Skew_kelly=[skew_kelly; NaN(32-length(outbound),1)];
Mean_p=[mean_p; NaN(32-length(outbound),1)];
Mean_n=[mean_n; NaN(32-length(outbound),1)];
Var_p=[var_p; NaN(32-length(outbound),1)];
Var_n=[var_n; NaN(32-length(outbound),1)];
Covar1_n=[covar1_n; NaN(32-length(outbound),1)];
Covar1_p=[covar1_p; NaN(32-length(outbound),1)];
Covar2_n=[covar2_n; NaN(32-length(outbound),1)];
Covar2_p=[covar2_p; NaN(32-length(outbound),1)];
Unconditional_acv=[uacv(:,1); NaN(32-length(outbound),1)];
var_le=hump;
T = table(fract_above_five,Sammean,Sum_p,Sum_n,Fract_p...
    ,Kurt,Kurt_cs,Skew,Skew_kelly,Mean_p,Mean_n...
    ,Var_p,Var_n,Covar1_n,Covar1_p,Covar2_n...
    ,Covar2_p,Unconditional_acv,var_le,le_covariances);
writetable(T,'Moments.xlsx');

%variance by cohort
figure
plot(25:1:55,[NaN(31-size(coh1.skew,1),1); coh1.vari],'LineWidth',1.5,'LineStyle','-', 'Color', 'yellow','Marker','o')
hold on
plot(25:1:55,[NaN(31-size(coh2.skew,1),1); coh2.vari],'LineWidth',1.5,'LineStyle','--', 'Color', 'magenta','Marker','+')
hold on
plot(25:1:55,[NaN(31-size(coh3.skew,1),1); coh3.vari],'LineWidth',1.5,'LineStyle',':', 'Color', 'cyan','Marker','*')
hold on
plot(25:1:55,[NaN(31-size(coh4.skew,1),1); coh4.vari],'LineWidth',1.5,'LineStyle','-.','Marker','.', 'Color', 'red')
hold on
plot(25:1:55,coh5.vari,'LineWidth',1.5,'Marker','x','LineStyle','- -', 'Color', 'green')
hold on
plot(25:1:55,[coh6.vari; NaN(31-size(coh6.skew,1),1)],'LineWidth',1.5,'LineStyle','--','Marker','s', 'Color', 'blue')
hold on
plot(25:1:55,[coh7.vari; NaN(31-size(coh7.skew,1),1)],'LineWidth',1.5,'Marker','d','LineStyle',':', 'Color', [0.2 0.2 0.2])
hold on
plot(25:1:55,[coh8.vari; NaN(31-size(coh8.skew,1),1)],'LineWidth',1.5,'Marker','^','LineStyle','-.', 'Color',[0.2 0.4 0.8])
hold on
plot(25:1:55,[coh9.vari; NaN(31-size(coh9.skew,1),1)],'LineWidth',1.5,'LineStyle','-', 'Color','black','Marker','v')
% hold on
% line([25 55],[0 0],'LineWidth',2.5,'LineStyle','--', 'Color', 'black')
hold off
grid on
axis tight
xlabel('Age','fontsize',12,'FontWeight','bold')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 10)
set(gcf,'units','inches','PaperPosition',[0,0,20,8])
y=ylabel('$Var [g^{c}_{i,h,t}]$','fontsize',12,'interpreter','latex');
set(y, 'Units', 'Normalized', 'Position', [-0.12, 0.5, 0]);
ylim([0 0.25])
leg_str=['Coh_1';'Coh_2';'Coh_3';'Coh_4';'Coh_5';'Coh_6';'Coh_7';'Coh_8';'Coh_9'];
%columnlegend(3, leg_str,'Location','East');
legend(leg_str,'Location','EastOutside')
print('MEG_coh_var','-dpng')


beep
disp('Finished')
toc