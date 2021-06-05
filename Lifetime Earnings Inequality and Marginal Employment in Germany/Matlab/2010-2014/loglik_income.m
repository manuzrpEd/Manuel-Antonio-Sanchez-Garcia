function z=loglik_income(y,npeople,year_birth,ED2,ED3,nmobcl,nwagcl,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ,UB)
clear mex
observ=NE;
int=NE==1;
int2=UB==0;
int3=int.*int2;
% int=UB==0.*NE==1;
observ(int3==1)=NaN;
NE=observ;
% DEFINE PARAMETERS
%------------------
% Note: Code is written for 2 income classes and 3 mobility classes.
% Amend the tau and class weight parameters accordingly, and watch parameter numbering.
% pariniPT=x(1:5);
% pariniMJ=x(6:10);
% pariniNE=x(11:15);
% pariniCJ=x(16:20);
% parPT=x(21:29);
% parMJ=x(30:38);
% parNE=x(39:47);
% parCJ=x(48:56);
% parmcl=x(57:60);
parmu=y(1:9);
parsigma=y(10:16);
partau1=y(17:39);
% partau1=y(77:99);
parwcl=y(40:43);
% parwcl=y(17:20);
% DEFINE DENOMINATORS FOR CLASS WEIGHTS MULTINOMIAL LOGITS
%---------------------------------------------------------
% denmobcl=zeros(npeople,1);
deninccl=zeros(npeople,1); 
% 
% for km=1:nmobcl
%     denmobcl=denmobcl+nummobcl(parmcl,km,year_birth,ED2,ED3);%denominator mobility
% end
%
for kw=1:nwagcl
    deninccl=deninccl+numinccl(parwcl,kw,year_birth,ED2,ED3);%denominator income
end
% 
% ADD UP BITS OF LIKELIHOOD
%--------------------------
lik=zeros(npeople,1);
likw_panel=zeros(npeople,size(log_ave_wage,2),nwagcl);
% likm=zeros(npeople,nmobcl);
likm_panel=zeros(npeople,size(log_ave_wage,2),nmobcl);
%
% for kw=1:nwagcl
%     likw_panel(:,:,kw)=linc_19992002(parmu,parsigma,partau1,kw,ED2,ED3,lmexp,log_ave_wage,FT,PT,MJ,NE,npeople).*(numinccl(parwcl,kw,year_birth,ED2,ED3)./deninccl);%
% end
for kw=1:nwagcl
    a=lincome_20052009_panel(parmu,parsigma,partau1,int32(kw),ED2,ED3,lmexp,log_ave_wage,FT,PT,MJ,NE,CJ,int32(npeople)).*(numinccl(parwcl,kw,year_birth,ED2,ED3)./deninccl);%
    b=(1-isnan(FT));
    a(b==0)=1;
    likw_panel(:,:,kw)=a;
end
% 
%caca=lmobil_19992002(pariniPT,parPT,pariniMJ,parMJ,pariniNE,parNE,int32(km),lmexp(:,2:end),lmexp(:,1),year(:,2:end),year(:,1),ED2,ED3,FT(:,2:end),FT(:,1),PT(:,2:end),PT(:,1),MJ(:,2:end),MJ(:,1),NE(:,2:end),NE(:,1),int32(npeople),lFT,lPT,lMJ,lNE).*(nummobcl(parmcl,km,year_birth,ED2,ED3)./denmobcl);;
% for km=1:nmobcl
%     likm(:,km)=lmobil_19992002(pariniPT,parPT,pariniMJ,parMJ,pariniNE,parNE,int32(km),lmexp(:,2:end),lmexp(:,1),year(:,2:end),year(:,1),ED2,ED3,FT(:,2:end),FT(:,1),PT(:,2:end),PT(:,1),MJ(:,2:end),MJ(:,1),NE(:,2:end),NE(:,1),int32(npeople),lFT,lPT,lMJ,lNE).*(nummobcl(parmcl,km,year_birth,ED2,ED3)./denmobcl);
% end
for km=1:nmobcl
    likm_panel(:,:,km)=1;%lmobil_19992002_panel(pariniPT,parPT,pariniMJ,parMJ,pariniNE,parNE,int32(km),lmexp(:,2:end),lmexp(:,1),ED2,ED3,FT(:,2:end),FT(:,1),PT(:,2:end),PT(:,1),MJ(:,2:end),MJ(:,1),NE(:,2:end),NE(:,1),int32(npeople),lPT,lMJ,lNE).*(nummobcl(parmcl,km,year_birth,ED2,ED3)./denmobcl);
end
% for km=1:nmobcl
%     likm_panel(:,:,km)=lmob_19992002(pariniPT,parPT,pariniMJ,parMJ,pariniNE,parNE,km,lmexp(:,2:end),lmexp(:,1),ED2,ED3,FT(:,2:end),FT(:,1),PT(:,2:end),PT(:,1),MJ(:,2:end),MJ(:,1),NE(:,2:end),NE(:,1),npeople,lPT,lMJ,lNE).*(nummobcl(parmcl,km,year_birth,ED2,ED3)./denmobcl);
% end
likm_panel_one=likm_panel(:,:,1);
likm_panel_two=likm_panel(:,:,2);
likm_one=prod(likm_panel_one,2);
likm_two=prod(likm_panel_two,2);
likm=[likm_one likm_two];
%
likw_panel_one=likw_panel(:,:,1);
likw_panel_two=likw_panel(:,:,2);
% likw_panel_one=likw_panel_one+1;
% likw_panel_one(likw_panel_one==2)=1;
% likw_panel_two=likw_panel_two+1;
% likw_panel_two(likw_panel_two==2)=1;
likw_one=prod(likw_panel_one,2);
likw_two=prod(likw_panel_two,2);
likw=[likw_one likw_two];
% 
for km=1:nmobcl
    for kw=1:nwagcl
        lik=lik+likm(:,km).*likw(:,kw)+0.01;
    end
end
%http://qed.econ.queensu.ca/ETM/corrections/Fourth-pdf/pg468.pdf
%https://czep.net/stat/mlelr.pdf
%adjust likelihood by length of observations?
% noval=isnan(year_birth);
% noval=1-1*noval;
% sum_noval=sum(noval,2);
% lik=lik.*(sum_noval./size(year_birth,2));
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
% if sum(isnan(lik))>0
%     z=Inf;
% end
% if sum(sum(likw==0))>0
%     z=Inf;
% end
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