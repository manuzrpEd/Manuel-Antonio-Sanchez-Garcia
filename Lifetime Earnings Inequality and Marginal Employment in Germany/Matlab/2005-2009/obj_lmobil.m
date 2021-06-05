function z=obj_lmobil(x,phat_male_wage,npeople,year_birth,year,ED2,ED3,nmobcl,nwagcl,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ,lFT,lPT,lMJ,lNE,lCJ)
clear mex
% DEFINE PARAMETERS
%------------------
% Note: Code is written for 2 income classes and 3 mobility classes.
% Amend the tau and class weight parameters accordingly, and watch parameter numbering.
pariniPT=x(1:6);
pariniMJ=x(7:12);
pariniCJ=x(13:18);
parPT=x(19:28);
parMJ=x(29:38);
parNE=x(39:48);
parCJ=x(49:58);
parmcl=x(59:62);
% parmu=phat_male_wage(1:9);
% parsigma=phat_male_wage(10:16);
% partau1=phat_male_wage(17:43);
% parwcl=phat_male_wage(44:47);
% DEFINE DENOMINATORS FOR CLASS WEIGHTS MULTINOMIAL LOGITS
%---------------------------------------------------------
denmobcl=zeros(npeople,1);
% deninccl=zeros(npeople,1); 
% 
for km=1:nmobcl
    denmobcl=denmobcl+nummobcl(parmcl,km,year_birth,ED2,ED3);%denominator mobility
end
%
% for kw=1:nwagcl
%     deninccl=deninccl+numinccl(parwcl,kw,year_birth,ED2,ED3);%denominator income
% end
lik=zeros(npeople,1);
% lik2=zeros(npeople,1);
% likw=zeros(npeople,nwagcl);
likm=zeros(npeople,nmobcl);
%
% for kw=1:nwagcl
%     likw(:,kw)=lincome(parmu,parsigma,partau1,int32(kw),ED2,ED3,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ,int32(npeople),lFT,lPT,lMJ,lNE,lCJ).*(numinccl(parwcl,kw,year_birth,ED2,ED3)./deninccl);%
% end
% 
for km=1:nmobcl
    likm(:,km)=lmobil(pariniPT,parPT,pariniMJ,parMJ,parNE,pariniCJ,parCJ,int32(km),lmexp(:,2:end),lmexp(:,1),year(:,2:end),year(:,1),ED2,ED3,FT(:,2:end),FT(:,1),PT(:,2:end),PT(:,1),MJ(:,2:end),MJ(:,1),NE(:,2:end),CJ(:,2:end),CJ(:,1),int32(npeople),lFT,lPT,lMJ,lNE,lCJ).*(nummobcl(parmcl,km,year_birth,ED2,ED3)./denmobcl);
end

for km=1:nmobcl
        lik=lik+likm(:,km);%.*likw(:,kw);
end

% for km=1:nmobcl
%     for kw=1:nwagcl
%         lik2=lik2+likm(:,km).*likw(:,kw);
%     end
% end

% z2=-log(lik2);
z=-log(lik);
% sum(isinf(z))
if sum(isinf(z))>0
    z=Inf;
end
if sum(sum(likm==0))>0
    z=Inf;
end
% if sum(isinf(z2))>0
%     z=Inf;
% end
% if sum(sum(lik2==0))>0
%     z=Inf;
% end
% if isinf(sum(z2))==1
%     z=Inf;
% end
% sum(lik<0)
% isreal(z)
para=[x; phat_male_wage];
if isinf(loglik(para,npeople,year_birth,year,ED2,ED3,nmobcl,nwagcl,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ,lFT,lPT,lMJ,lNE,lCJ))
   z=Inf; 
end
if isnan(loglik(para,npeople,year_birth,year,ED2,ED3,nmobcl,nwagcl,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ,lFT,lPT,lMJ,lNE,lCJ))
   z=Inf; 
end
z=sum(z);

