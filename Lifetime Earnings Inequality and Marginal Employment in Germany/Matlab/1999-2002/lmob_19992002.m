function [z] = lmob_19992002(pariniPT,parPT,pariniMJ,parMJ,pariniNE,parNE,km,lmexp,ED2,ED3,FT,PT,MJ,NE,npeople)
num_PT=zeros(npeople,48);
num_MJ=zeros(npeople,48);
num_NE=zeros(npeople,48);
for i1=1:npeople
    for t1=2:48%from period 2 to 48
        if (km>=2)
            num_PT(i1,t1)=exp(parPT(1) + parPT(2)*lmexp(i1,t1)...
                + parPT(3)*ED2(i1) + parPT(4)*ED3(i1) + parPT(8) ...
                + parPT(5)*PT(i1,t1-1) + parPT(6)*MJ(i1,t1-1) + parPT(7)*NE(i1,t1-1));
            num_MJ(i1,t1)=exp(parMJ(1) + parMJ(2)*lmexp(i1,t1) ...
                + parMJ(3)*ED2(i1) + parMJ(4)*ED3(i1) + parMJ(8) ...
                + parMJ(5)*PT(i1,t1-1) + parMJ(6)*MJ(i1,t1-1) + parMJ(7)*NE(i1,t1-1));
            num_NE(i1,t1)=exp(parNE(1) + parNE(2)*lmexp(i1,t1) ...
                + parNE(3)*ED2(i1) + parNE(4)*ED3(i1) + parNE(8) ...
                + parNE(5)*PT(i1,t1-1) + parNE(6)*MJ(i1,t1-1) + parNE(7)*NE(i1,t1-1));
        else
            num_PT(i1,t1)=exp(parPT(1) + parPT(2)*lmexp(i1,t1) ...
                + parPT(3)*ED2(i1) + parPT(4)*ED3(i1) ...
                + parPT(5)*PT(i1,t1-1) + parPT(6)*MJ(i1,t1-1) + parPT(7)*NE(i1,t1-1));
            num_MJ(i1,t1)=exp(parMJ(1) + parMJ(2)*lmexp(i1,t1) ...
                + parMJ(3)*ED2(i1) + parMJ(4)*ED3(i1) ...
                + parMJ(5)*PT(i1,t1-1) + parMJ(6)*MJ(i1,t1-1) + parMJ(7)*NE(i1,t1-1));
            num_NE(i1,t1)=exp(parNE(1) + parNE(2)*lmexp(i1,t1) ...
                + parNE(3)*ED2(i1) + parNE(4)*ED3(i1) ...
                + parNE(5)*PT(i1,t1-1) + parNE(6)*MJ(i1,t1-1) + parNE(7)*NE(i1,t1-1));
        end
    end
end

aux=zeros(npeople,48);
for i1=1:npeople
    for t1=2:48
        den=(1+num_PT(i1,t1)+num_MJ(i1,t1)+num_NE(i1,t1));
        if (FT(i1,t1)==1)
            aux(i1,t1)=(1/den);%.*(1-num_PT(i1,t1)/den).*(1-num_MJ(i1,t1)/den).*(1-num_NE(i1,t1)/den);
        elseif (PT(i1,t1)==1)
            aux(i1,t1)=(num_PT(i1,t1)/den);%.*(1-1/den).*(1-num_MJ(i1,t1)/den).*(1-num_NE(i1,t1)/den);
        elseif (MJ(i1,t1)==1)
            aux(i1,t1)=(num_MJ(i1,t1)/den);%.*(1-num_PT(i1,t1)/den).*(1-1/den).*(1-num_NE(i1,t1)/den);
        elseif (NE(i1,t1)==1)
            aux(i1,t1)=(num_NE(i1,t1)/den);%.*(1-num_PT(i1,t1)/den).*(1-num_MJ(i1,t1)/den).*(1-1/den);
        elseif (isnan(FT(i1,t1))==1)
            aux(i1,t1)=1;
        end 
    end
end
% z_temp=zeros(npeople,47)
% z_temp(:,:)=aux(:,:);
% z(:,2:end)=aux;
% for i1=1:npeople
% for t1=1:47
%     z(i1,t1+1)=z_temp(i1,t1);
% end
% end
    
% num_PT_ini=zeros(npeople,1);
% num_MJ_ini=zeros(npeople,1);
% num_NE_ini=zeros(npeople,1);
if (km>=2)
    num_PT_ini=exp(pariniPT(1) + pariniPT(2)*lmexp(:,1) ...
        + pariniPT(3)*ED2 + pariniPT(4)*ED3 + pariniPT(4+km-1));
    num_MJ_ini=exp(pariniMJ(1) + pariniMJ(2)*lmexp(:,1) ...
        + pariniMJ(3)*ED2 + pariniMJ(4)*ED3 + pariniMJ(4+km-1));
    num_NE_ini=exp(pariniNE(1) + pariniNE(2)*lmexp(:,1) ...
        + pariniNE(3)*ED2 + pariniNE(4)*ED3 + pariniNE(4+km-1));
else
    num_PT_ini=exp(pariniPT(1) + pariniPT(2)*lmexp(:,1) ...
        + pariniPT(3)*ED2 + pariniPT(4)*ED3);
    num_MJ_ini=exp(pariniMJ(1) + pariniMJ(2)*lmexp(:,1) ...
        + pariniMJ(3)*ED2 + pariniMJ(4)*ED3);
    num_NE_ini=exp(pariniNE(1) + pariniNE(2)*lmexp(:,1) ...
        + pariniNE(3)*ED2 + pariniNE(4)*ED3);
end

aux_ini=zeros(npeople,1);
for i1=1:npeople
        den=(1+num_PT_ini(i1)+num_MJ_ini(i1)+num_NE_ini(i1));
        if (FT(i1)==1)
            aux_ini(i1)=(1/den);%.*(1-num_PT_ini(i1)/den).*(1-num_MJ_ini(i1)/den).*(1-num_NE_ini(i1)/den);
        elseif (PT(i1)==1)
            aux_ini(i1)=(num_PT_ini(i1)/den);%.*(1-1/den).*(1-num_MJ_ini(i1)/den).*(1-num_NE_ini(i1)/den);
        elseif (MJ(i1)==1)
            aux_ini(i1)=(num_MJ_ini(i1)/den);%.*(1-num_PT_ini(i1)/den).*(1-1/den).*(1-num_NE_ini(i1)/den);
        elseif (NE(i1)==1)
            aux_ini(i1)=(num_NE_ini(i1)/den);%.*(1-num_PT_ini(i1)/den).*(1-num_MJ_ini(i1)/den).*(1-1/den);
        elseif (isnan(FT(i1))==1)
            aux_ini(i1)=1;
        end 
end
z=[aux_ini aux(:,2:48)];
end

