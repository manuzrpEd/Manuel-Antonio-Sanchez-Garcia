function z=loglik(x,par0,npeople,year_birth,year,ED2,ED3,nmobcl,nwagcl,lmexp,log_ave_wage,FT,PT,MJ,NE,lFT,lPT,lMJ,lNE)
clear mex
% DEFINE PARAMETERS
%------------------
% Note: Code is written for 2 income classes and 3 mobility classes.
% Amend the tau and class weight parameters accordingly, and watch parameter numbering.
pariniPT=par0(1:5);
pariniMJ=par0(6:10);
pariniNE=par0(11:15);
parPT=par0(16:23);
parMJ=par0(24:31);
parNE=par0(32:39);
parmcl=par0(40:43);
parmu=par0(44:51);
parsigma=par0(52:57);
partau1=par0(58:63);
parwcl=par0(64:67);
parmu(49,1)=x(1);
parmu(55,1)=x(2);
% DEFINE DENOMINATORS FOR CLASS WEIGHTS MULTINOMIAL LOGITS
%---------------------------------------------------------
denmobcl=zeros(npeople,1);
deninccl=zeros(npeople,1); 
% 
for km=1:nmobcl
    denmobcl=denmobcl+nummobcl(parmcl,km,year_birth,ED2,ED3);%denominator mobility
end
%
for kw=1:nwagcl
    deninccl=deninccl+numinccl(parwcl,kw,year_birth,ED2,ED3);%denominator income
end
% 
% ADD UP BITS OF LIKELIHOOD
%--------------------------
lik=zeros(npeople,1);
likw=zeros(npeople,nwagcl);
likm=zeros(npeople,nmobcl);
%
for kw=1:nwagcl
    likw(:,kw)=lincome_19992002(parmu,parsigma,partau1,int32(kw),ED2,ED3,lmexp,log_ave_wage,FT,PT,MJ,NE,int32(npeople),lFT,lPT,lMJ,lNE).*(numinccl(parwcl,kw,year_birth,ED2,ED3)./deninccl);%
end
% 
for km=1:nmobcl
    likm(:,km)=lmobil_19992002(pariniPT,parPT,pariniMJ,parMJ,pariniNE,parNE,int32(km),lmexp(:,2:end),lmexp(:,1),year(:,2:end),year(:,1),ED2,ED3,FT(:,2:end),FT(:,1),PT(:,2:end),PT(:,1),MJ(:,2:end),MJ(:,1),NE(:,2:end),NE(:,1),int32(npeople),lFT,lPT,lMJ,lNE).*(nummobcl(parmcl,km,year_birth,ED2,ED3)./denmobcl);
end
% 
for km=1:nmobcl
    for kw=1:nwagcl
        lik=lik+likm(:,km).*likw(:,kw);
    end
end

%
z=-log(lik);
% sum(lik==0)
% sum(lik<0)
% sum(likm==0)
% sum(likw==0)
% sum(isinf(z))
% sum(isreal(z)==0)
% sum(isinf(likm))
% sum(isinf(likw))
% sum(isinf(lik))
% sum(sum(likw==0))
% sum(sum(likm==0))
% sum(sum(lik==0))
% sum(isnan(lik))
if sum(isnan(lik))>0
    z=Inf;
end
if sum(sum(likw==0))>0
    z=Inf;
end
if sum(sum(likm==0))>0
    z=Inf;
end
if sum(isinf(z))>0
    z=Inf;
end
if isreal(z)==0
   z=Inf; 
end
z=sum(z);