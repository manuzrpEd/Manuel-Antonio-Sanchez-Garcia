
cd '\2005-2009'

clc
clear
close all
clear mex

% global nmobcl nwagcl nmobst empstate lempstate
% global cons lmexp lmexpsq FT PT MJ NE CJ ED2 ED3 coh %lmexpxJS2 lmexpxJS3 lmexpsqxJS2 lmexpsqxJS3
% global log_ave_wage nobs year_birth persnr year female age %year_birth_coh
% global npeople nobs_year nobs_months
% global lFT lPT lMJ lNE lCJ

data_male.nmobcl=2;
data_male.nwagcl=2;
data_male.nmobst=5;

data_persnr_males=csvread('data_persnr_males.csv');


npeople=max(data_persnr_males(:,end));
data_male.npeople=npeople;
fprintf('-> NUMBER OF INDIVIDUALS IN SAMPLE = %d ',npeople);
fprintf('-> Lowest Year IN SAMPLE = %d ',min(data_persnr_males(:,3)));
fprintf('-> Highest Year IN SAMPLE = %d ',max(data_persnr_males(:,3)));
nobs_year=max(data_persnr_males(:,3))-min(data_persnr_males(:,3))+1;
fprintf('--- MAX NUMBER OF YEARS = %d. \n',nobs_year);
nobs_months=max(data_persnr_males(:,1));
data_male.nobs_months=nobs_months;
fprintf('--- MAX NUMBER OF MONTHS = %d. \n',nobs_months);

log_ave_wage=-10*ones(npeople,nobs_months);%log wage
empstate=-10*ones(npeople,nobs_months);
UB=nan(npeople,nobs_months);
lempstate=-10*ones(npeople,nobs_months);
year=-10*ones(npeople,nobs_months);%log wage
age=-10*ones(npeople,nobs_months);%log wage
persnr=zeros(npeople,1);%panel id?
female=zeros(npeople,1);%panel id?
educ=zeros(npeople,1);%education?
year_birth=zeros(npeople,1);
% year_birth_coh=zeros(npeople,1);
nobs=zeros(npeople,1);%number of observations of each particular individual


startpt=1;
% endpt=1;
for i=1:npeople
    endpt=startpt-1+data_persnr_males(startpt,1);
    nobs(i)=data_persnr_males(startpt,1);
    year(i,1:data_persnr_males(startpt,1))=data_persnr_males(startpt:endpt,3).';
    female(i)=data_persnr_males(startpt,5);
    year_birth(i)=data_persnr_males(startpt,6);
    educ(i)=data_persnr_males(startpt,7);
    age(i,1:data_persnr_males(startpt,1))=data_persnr_males(startpt:endpt,8).';
    log_ave_wage(i,1:data_persnr_males(startpt,1))=data_persnr_males(startpt:endpt,9).';
    empstate(i,1:data_persnr_males(startpt,1))=data_persnr_males(startpt:endpt,10).';
    UB(i,1:data_persnr_males(startpt,1))=data_persnr_males(startpt:endpt,14).';
    lempstate(i,1:data_persnr_males(startpt,1))=data_persnr_males(startpt:endpt,11).';
    persnr(i)=data_persnr_males(startpt,end);  
    startpt=endpt+1;
end
clear startpt endpt data_persnr_males i;

data_male.year_birth=year_birth;
log_ave_wage(log_ave_wage<0)=NaN;%this is why they are initialized with -10
year(year<0)=NaN;%this is why they are initialized with -10
data_male.log_ave_wage=log_ave_wage;
empstate(empstate<0)=NaN;
lempstate(lempstate<0)=NaN;

% data_male.cons=ones(npeople,nobs_months);%constant
lmexp=(cumsum(ones(npeople,nobs_months),2)-1)/10;%labor market experience
lmexp(isnan(year))=NaN;
year_birth=repmat(year_birth,1,nobs_months);
year=year/100;
% data_male.year_ini=year(:,1);
% data_male.year=year(:,2:nobs_months);
data_male.year=year;
% year_birth_coh=1999-year_birth;
coh=age-22+1;
coh=coh(:,1);
coh=coh*12;
lmexp=coh/10+lmexp;
% data_male.lmexp_ini=lmexp(:,1);
% data_male.lmexp=lmexp(:,2:nobs_months);
data_male.lmexp=lmexp;
lmexpsq=lmexp.^2;

educ=repmat(educ,1,nobs_months);

ED2=1*(educ==2);%education?? highest academic qualification
ED3=1*(educ==3);
data_male.ED2=ED2(:,1);
data_male.ED3=ED3(:,1);
data_male.educ=educ(:,1);

FT=1*(empstate==1);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
FT(isnan(empstate))=NaN; % Job Sector?
PT=1*(empstate==2);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
PT(isnan(empstate))=NaN; % Job Sector?
MJ=1*(empstate==3);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
MJ(isnan(empstate))=NaN; % Job Sector?
NE=1*(empstate==4);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
NE(isnan(empstate))=NaN; % Job Sector?
CJ=1*(empstate==5);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
CJ(isnan(empstate))=NaN; % Job Sector?

data_male.FT=FT;
data_male.PT=PT;
data_male.MJ=MJ;
data_male.NE=NE;
data_male.CJ=CJ;
data_male.empstate=empstate;
data_male.lempstate=lempstate;
data_male.UB=UB;

% data_male.FT_ini=FT(:,1);
% data_male.PT_ini=FT(:,1);
% data_male.MJ_ini=FT(:,1);
% data_male.CJ_ini=FT(:,1);
% 
% data_male.FT=FT(:,2:nobs_months);
% data_male.PT=PT(:,2:nobs_months);
% data_male.MJ=MJ(:,2:nobs_months);
% data_male.NE=NE(:,2:nobs_months);
% data_male.CJ=CJ(:,2:nobs_months);

lFT=1*(empstate==1);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
lFT(isnan(empstate))=NaN; % Job Sector?
lPT=1*(empstate==2);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
lPT(isnan(empstate))=NaN; % Job Sector?
lMJ=1*(empstate==3);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
lMJ(isnan(empstate))=NaN; % Job Sector?
lNE=1*(empstate==4);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
lNE(isnan(empstate))=NaN; % Job Sector?
lCJ=1*(empstate==5);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
lCJ(isnan(empstate))=NaN; % Job Sector?

data_male.lFT=lFT(:,2:nobs_months);
data_male.lPT=lPT(:,2:nobs_months);
data_male.lMJ=lMJ(:,2:nobs_months);
data_male.lNE=lNE(:,2:nobs_months);
data_male.lCJ=lCJ(:,2:nobs_months);

save('data_male.mat','data_male')
%% Female

clc
clear
close all
clear mex

% global nmobcl nwagcl nmobst empstate lempstate
% global cons lmexp lmexpsq FT PT MJ NE CJ ED2 ED3 coh %lmexpxJS2 lmexpxJS3 lmexpsqxJS2 lmexpsqxJS3
% global log_ave_wage nobs year_birth persnr year female age %year_birth_coh
% global npeople nobs_year nobs_months
% global lFT lPT lMJ lNE lCJ

data_female.nmobcl=2;
data_female.nwagcl=2;
data_female.nmobst=5;

data_persnr_females=csvread('data_persnr_females.csv');


npeople=max(data_persnr_females(:,end));
data_female.npeople=npeople;
fprintf('-> NUMBER OF INDIVIDUALS IN SAMPLE = %d ',npeople);
fprintf('-> Lowest Year IN SAMPLE = %d ',min(data_persnr_females(:,3)));
fprintf('-> Highest Year IN SAMPLE = %d ',max(data_persnr_females(:,3)));
nobs_year=max(data_persnr_females(:,3))-min(data_persnr_females(:,3))+1;
fprintf('--- MAX NUMBER OF YEARS = %d. \n',nobs_year);
nobs_months=max(data_persnr_females(:,1));
data_female.nobs_months=nobs_months;
fprintf('--- MAX NUMBER OF MONTHS = %d. \n',nobs_months);



log_ave_wage=-10*ones(npeople,nobs_months);%log wage
empstate=-10*ones(npeople,nobs_months);
UB=nan(npeople,nobs_months);
lempstate=-10*ones(npeople,nobs_months);
year=-10*ones(npeople,nobs_months);%log wage
age=-10*ones(npeople,nobs_months);%log wage
persnr=zeros(npeople,1);%panel id?
female=zeros(npeople,1);%panel id?
educ=zeros(npeople,1);%education?
year_birth=zeros(npeople,1);
% year_birth_coh=zeros(npeople,1);
nobs=zeros(npeople,1);%number of observations of each particular individual


startpt=1;
% endpt=1;
for i=1:npeople
    endpt=startpt-1+data_persnr_females(startpt,1);
    nobs(i)=data_persnr_females(startpt,1);
    year(i,1:data_persnr_females(startpt,1))=data_persnr_females(startpt:endpt,3).';
    female(i)=data_persnr_females(startpt,5);
    year_birth(i)=data_persnr_females(startpt,6);
    educ(i)=data_persnr_females(startpt,7);
    age(i,1:data_persnr_females(startpt,1))=data_persnr_females(startpt:endpt,8).';
    log_ave_wage(i,1:data_persnr_females(startpt,1))=data_persnr_females(startpt:endpt,9).';
    empstate(i,1:data_persnr_females(startpt,1))=data_persnr_females(startpt:endpt,10).';
    UB(i,1:data_persnr_females(startpt,1))=data_persnr_females(startpt:endpt,14).';
    lempstate(i,1:data_persnr_females(startpt,1))=data_persnr_females(startpt:endpt,11).';
    persnr(i)=data_persnr_females(startpt,end);  
    startpt=endpt+1;
end
clear startpt endpt data_persnr_females i;

data_female.year_birth=year_birth;
log_ave_wage(log_ave_wage<0)=NaN;%this is why they are initialized with -10
year(year<0)=NaN;%this is why they are initialized with -10
data_female.log_ave_wage=log_ave_wage;
empstate(empstate<0)=NaN;
lempstate(lempstate<0)=NaN;

% data_male.cons=ones(npeople,nobs_months);%constant
lmexp=(cumsum(ones(npeople,nobs_months),2)-1)/10;%labor market experience
lmexp(isnan(year))=NaN;
year_birth=repmat(year_birth,1,nobs_months);
year=year/100;
% data_male.year_ini=year(:,1);
% data_male.year=year(:,2:nobs_months);
data_female.year=year;
% year_birth_coh=1999-year_birth;
coh=age-22+1;
coh=coh(:,1);
coh=coh*12;
lmexp=coh/10+lmexp;
% data_male.lmexp_ini=lmexp(:,1);
% data_male.lmexp=lmexp(:,2:nobs_months);
data_female.lmexp=lmexp;
lmexpsq=lmexp.^2;

educ=repmat(educ,1,nobs_months);

ED2=1*(educ==2);%education?? highest academic qualification
ED3=1*(educ==3);
data_female.ED2=ED2(:,1);
data_female.ED3=ED3(:,1);
data_female.educ=educ(:,1);

FT=1*(empstate==1);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
FT(isnan(empstate))=NaN; % Job Sector?
PT=1*(empstate==2);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
PT(isnan(empstate))=NaN; % Job Sector?
MJ=1*(empstate==3);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
MJ(isnan(empstate))=NaN; % Job Sector?
NE=1*(empstate==4);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
NE(isnan(empstate))=NaN; % Job Sector?
CJ=1*(empstate==5);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
CJ(isnan(empstate))=NaN; % Job Sector?

data_female.FT=FT;
data_female.PT=PT;
data_female.MJ=MJ;
data_female.NE=NE;
data_female.CJ=CJ;
data_female.empstate=empstate;
data_female.lempstate=lempstate;
data_female.UB=UB;

% data_male.FT_ini=FT(:,1);
% data_male.PT_ini=FT(:,1);
% data_male.MJ_ini=FT(:,1);
% data_male.CJ_ini=FT(:,1);
% 
% data_male.FT=FT(:,2:nobs_months);
% data_male.PT=PT(:,2:nobs_months);
% data_male.MJ=MJ(:,2:nobs_months);
% data_male.NE=NE(:,2:nobs_months);
% data_male.CJ=CJ(:,2:nobs_months);

lFT=1*(empstate==1);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
lFT(isnan(empstate))=NaN; % Job Sector?
lPT=1*(empstate==2);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
lPT(isnan(empstate))=NaN; % Job Sector?
lMJ=1*(empstate==3);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
lMJ(isnan(empstate))=NaN; % Job Sector?
lNE=1*(empstate==4);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
lNE(isnan(empstate))=NaN; % Job Sector?
lCJ=1*(empstate==5);      % The '1*' is here because JS2 must be numerical (not logical) to handle NaN's.
lCJ(isnan(empstate))=NaN; % Job Sector?

data_female.lFT=lFT(:,2:nobs_months);
data_female.lPT=lPT(:,2:nobs_months);
data_female.lMJ=lMJ(:,2:nobs_months);
data_female.lNE=lNE(:,2:nobs_months);
data_female.lCJ=lCJ(:,2:nobs_months);

save('data_female.mat','data_female')
disp('Finished')
% beep on