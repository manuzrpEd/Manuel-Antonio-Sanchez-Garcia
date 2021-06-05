function z=loglik_mobility(y,x,npeople,year_birth,ED2,ED3,nmobcl,nwagcl,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ)
clear mex
% DEFINE PARAMETERS
%------------------
% Note: Code is written for 2 income classes and 3 mobility classes.
% Amend the tau and class weight parameters accordingly, and watch parameter numbering.
pariniPT=y(1:5);
pariniMJ=y(6:10);
pariniNE=y(11:15);
pariniCJ=y(16:20);
parPT=y(21:29);
parMJ=y(30:38);
parNE=y(39:47);
parCJ=y(48:56);
parmcl=y(57:60);
parmu=x(61:69);
parsigma=x(70:76);
partau1=x(77:99);
parwcl=x(100:103);
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
% likm=zeros(npeople,nmobcl);
likm_panel=zeros(npeople,size(log_ave_wage,2),nmobcl);
%
for kw=1:nwagcl
    likw(:,kw)=1;%lincome_19992002(parmu,parsigma,partau1,int32(kw),ED2,ED3,lmexp,log_ave_wage,FT,PT,MJ,NE,int32(npeople),lFT,lPT,lMJ,lNE,year).*(numinccl(parwcl,kw,year_birth,ED2,ED3)./deninccl);%
end
% 
%caca=lmobil_19992002(pariniPT,parPT,pariniMJ,parMJ,pariniNE,parNE,int32(km),lmexp(:,2:end),lmexp(:,1),year(:,2:end),year(:,1),ED2,ED3,FT(:,2:end),FT(:,1),PT(:,2:end),PT(:,1),MJ(:,2:end),MJ(:,1),NE(:,2:end),NE(:,1),int32(npeople),lFT,lPT,lMJ,lNE).*(nummobcl(parmcl,km,year_birth,ED2,ED3)./denmobcl);;
% for km=1:nmobcl
%     likm(:,km)=lmobil_19992002(pariniPT,parPT,pariniMJ,parMJ,pariniNE,parNE,int32(km),lmexp(:,2:end),lmexp(:,1),year(:,2:end),year(:,1),ED2,ED3,FT(:,2:end),FT(:,1),PT(:,2:end),PT(:,1),MJ(:,2:end),MJ(:,1),NE(:,2:end),NE(:,1),int32(npeople),lFT,lPT,lMJ,lNE).*(nummobcl(parmcl,km,year_birth,ED2,ED3)./denmobcl);
% end
for km=1:nmobcl
    a=lmobil_20052009_panel(pariniPT,parPT,pariniMJ,parMJ,pariniNE,parNE,pariniCJ,parCJ,int32(km),lmexp,ED2,ED3,FT,PT,MJ,NE,CJ,int32(npeople)).*(nummobcl(parmcl,km,year_birth,ED2,ED3)./denmobcl);
    a=a.*(1-isnan(FT));
    a(a==0)=1;
    likm_panel(:,:,km)=a;
end
% for km=1:nmobcl
%     likm_panel(:,:,km)=lmob_19992002(pariniPT,parPT,pariniMJ,parMJ,pariniNE,parNE,km,lmexp,ED2,ED3,FT,PT,MJ,NE,npeople).*(nummobcl(parmcl,km,year_birth,ED2,ED3)./denmobcl);
% end
likm_panel_one=likm_panel(:,:,1);
likm_panel_two=likm_panel(:,:,2);
likm_one=prod(likm_panel_one,2);
likm_two=prod(likm_panel_two,2);
likm=[likm_one likm_two];
% 
for km=1:nmobcl
    for kw=1:nwagcl
        lik=lik+likm(:,km).*likw(:,kw);
    end
end
%http://qed.econ.queensu.ca/ETM/corrections/Fourth-pdf/pg468.pdf
%https://czep.net/stat/mlelr.pdf
%adjust likelihood by length of observations?
% noval=isnan(year);
% noval=1-1*noval;
% sum_noval=sum(noval,2);
% lik=lik.*(sum_noval./size(year,2));
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