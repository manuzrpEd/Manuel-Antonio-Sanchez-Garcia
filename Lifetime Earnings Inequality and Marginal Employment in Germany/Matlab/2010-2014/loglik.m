function z=loglik(x,npeople,year_birth,year,ED2,ED3,nmobcl,nwagcl,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ,lFT,lPT,lMJ,lNE,lCJ)
clear mex
% DEFINE PARAMETERS
%------------------
% Note: Code is written for 2 income classes and 3 mobility classes.
% Amend the tau and class weight parameters accordingly, and watch parameter numbering.
pariniPT=x(1:5);
pariniMJ=x(6:10);
pariniNE=x(11:15);
pariniCJ=x(16:20);
parPT=x(21:29);
parMJ=x(30:38);
parNE=x(39:47);
parCJ=x(48:56);
parmcl=x(57:60);
parmu=x(61:69);
parsigma=x(70:76);
partau1=x(77:87);
parwcl=x(88:91);
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
    likw(:,kw)=lincome20052009(parmu,parsigma,partau1,int32(kw),ED2,ED3,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ,int32(npeople),lFT,lPT,lMJ,lNE,lCJ).*(numinccl(parwcl,kw,year_birth,ED2,ED3)./deninccl);%
end
% 
for km=1:nmobcl
    likm(:,km)=lmobil20052009(pariniPT,parPT,pariniMJ,parMJ,pariniNE,parNE,pariniCJ,parCJ,int32(km),lmexp(:,2:end),lmexp(:,1),year(:,2:end),year(:,1),ED2,ED3,FT(:,2:end),FT(:,1),PT(:,2:end),PT(:,1),MJ(:,2:end),MJ(:,1),NE(:,2:end),NE(:,1),CJ(:,2:end),CJ(:,1),int32(npeople),lFT,lPT,lMJ,lNE,lCJ).*(nummobcl(parmcl,km,year_birth,ED2,ED3)./denmobcl);
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