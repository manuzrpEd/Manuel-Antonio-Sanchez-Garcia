function z=obj_lwage(x,phat_male_mobil,npeople,year_birth,year,ED2,ED3,nmobcl,nwagcl,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ,lFT,lPT,lMJ,lNE,lCJ)
clear mex
% DEFINE PARAMETERS
%------------------
% pariniPT=phat_male_mobil(1:6);
% pariniMJ=phat_male_mobil(7:12);
% pariniCJ=phat_male_mobil(13:18);
% parPT=phat_male_mobil(19:28);
% parMJ=phat_male_mobil(29:38);
% parNE=phat_male_mobil(39:48);
% parCJ=phat_male_mobil(49:58);
% parmcl=phat_male_mobil(59:62);
parmu=x(1:9);
parsigma=x(10:16);
partau1=x(17:43);
parwcl=x(44:47);
% DEFINE DENOMINATORS FOR CLASS WEIGHTS MULTINOMIAL LOGITS
%---------------------------------------------------------
% denmobcl=zeros(npeople,1);
deninccl=zeros(npeople,1); 
% for km=1:nmobcl
%     denmobcl=denmobcl+nummobcl(parmcl,km,year_birth,ED2,ED3);%denominator mobility
% end
%
for kw=1:nwagcl
    deninccl=deninccl+numinccl(parwcl,kw,year_birth,ED2,ED3);%denominator income
end
lik=zeros(npeople,1);
% lik2=zeros(npeople,1);
likw=zeros(npeople,nwagcl);
% likm=zeros(npeople,nmobcl);
%
for kw=1:nwagcl
    likw(:,kw)=lincome(parmu,parsigma,partau1,int32(kw),ED2,ED3,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ,int32(npeople),lFT,lPT,lMJ,lNE,lCJ).*(numinccl(parwcl,kw,year_birth,ED2,ED3)./deninccl);%
end
% 
% for km=1:nmobcl
%     likm(:,km)=lmobil(pariniPT,parPT,pariniMJ,parMJ,parNE,pariniCJ,parCJ,int32(km),lmexp(:,2:end),lmexp(:,1),year(:,2:end),year(:,1),ED2,ED3,FT(:,2:end),FT(:,1),PT(:,2:end),PT(:,1),MJ(:,2:end),MJ(:,1),NE(:,2:end),CJ(:,2:end),CJ(:,1),int32(npeople),lFT,lPT,lMJ,lNE,lCJ).*(nummobcl(parmcl,km,year_birth,ED2,ED3)./denmobcl);
% end

for kw=1:nwagcl
        lik=lik+likw(:,kw);%.*likw(:,kw);
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
if sum(sum(likw==0))>0
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
para=[phat_male_mobil; x];
if isinf(loglik(para,npeople,year_birth,year,ED2,ED3,nmobcl,nwagcl,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ,lFT,lPT,lMJ,lNE,lCJ))
   z=Inf; 
end
if isnan(loglik(para,npeople,year_birth,year,ED2,ED3,nmobcl,nwagcl,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ,lFT,lPT,lMJ,lNE,lCJ))
   z=Inf; 
end
z=sum(z);

