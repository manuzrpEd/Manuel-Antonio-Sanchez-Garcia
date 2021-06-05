function [z] = linc_19992002(parmu,parsigma,partau_one,wcl,ED2,ED3,lmexp,log_ave_wage,FT,PT,MJ,NE,npeople)
mu=zeros(npeople,48);
sig=zeros(npeople,48);
tau_one=zeros(npeople,48);
ztilda=zeros(npeople,48);
fz_one=zeros(npeople,48);
fz_two=zeros(npeople,48);
for i=1:npeople
    for t=1:48
        if (t>=2 && isnan(NE(i,t-1))==0)  
            if (wcl==2)
                mu(i,t)=parmu(1) + parmu(2)*ED2(i) + parmu(3)*ED3(i) + parmu(4)*lmexp(i,t) ...
                    + parmu(5)*PT(i,t) + parmu(6)*MJ(i,t) + parmu(7)*NE(i,t) + parmu(8);
                sig(i,t)=parsigma(1) + parsigma(2)*lmexp(i,t) + parsigma(3)*PT(i,t)+ parsigma(4)*MJ(i,t) ...
                    + parsigma(5)*NE(i,t) + parsigma(6) ;
                tau_one(i,t)=partau_one(1) + partau_one(2)*lmexp(i,t) + partau_one(3) ...
                    + partau_one(4)*FT(i,t)*PT(i,t-1) + partau_one(5)*FT(i,t)*MJ(i,t-1) ...
                    + partau_one(6)*FT(i,t)*NE(i,t-1) ...
                    + partau_one(7)*PT(i,t)*FT(i,t-1) + partau_one(8)*PT(i,t)*MJ(i,t-1) ...
                    + partau_one(9)*PT(i,t)*NE(i,t-1) ...
                    + partau_one(10)*MJ(i,t)*FT(i,t-1) + partau_one(11)*MJ(i,t)*PT(i,t-1) ...
                    + partau_one(12)*MJ(i,t)*NE(i,t-1) ...
                    + partau_one(13)*NE(i,t)*FT(i,t-1) + partau_one(14)*NE(i,t)*PT(i,t-1) ...
                    + partau_one(15)*NE(i,t)*MJ(i,t-1);
                
            else
                mu(i,t)=parmu(1) + parmu(2)*ED2(i) + parmu(3)*ED3(i) + parmu(4)*lmexp(i,t) ...
                    + parmu(5)*PT(i,t) + parmu(6)*MJ(i,t) + parmu(7)*NE(i,t);
                sig(i,t)=parsigma(1) + parsigma(2)*lmexp(i,t) + parsigma(3)*PT(i,t)+ parsigma(4)*MJ(i,t) ...
                    + parsigma(5)*NE(i,t);
                tau_one(i,t)=partau_one(1) + partau_one(2)*lmexp(i,t) ... 
                    + partau_one(4)*FT(i,t)*PT(i,t-1) + partau_one(5)*FT(i,t)*MJ(i,t-1) ...
                    + partau_one(6)*FT(i,t)*NE(i,t-1)   ...
                    + partau_one(7)*PT(i,t)*FT(i,t-1) + partau_one(8)*PT(i,t)*MJ(i,t-1) ...
                    + partau_one(9)*PT(i,t)*NE(i,t-1) ...
                    + partau_one(10)*MJ(i,t)*FT(i,t-1) + partau_one(11)*MJ(i,t)*PT(i,t-1) ...
                    + partau_one(12)*MJ(i,t)*NE(i,t-1) ...
                    + partau_one(13)*NE(i,t)*FT(i,t-1) + partau_one(14)*NE(i,t)*PT(i,t-1) ...
                    + partau_one(15)*NE(i,t)*MJ(i,t-1);
                                    
            end
        else
            if (wcl>=2)
                mu(i,t)=parmu(1) + parmu(2)*ED2(i) + parmu(3)*ED3(i) + parmu(4)*lmexp(i,t) ...
                    + parmu(5)*PT(i,t) + parmu(6)*MJ(i,t) + parmu(7)*NE(i,t) + parmu(8);
                sig(i,t)=parsigma(1) + parsigma(2)*lmexp(i,t) + parsigma(3)*PT(i,t)+ parsigma(4)*MJ(i,t) ...
                    + parsigma(5)*NE(i,t) + parsigma(6);
                tau_one(i,t)=partau_one(1) + partau_one(2)*lmexp(i,t) + partau_one(3);
            else
                mu(i,t)=parmu(1) + parmu(2)*ED2(i) + parmu(3)*ED3(i) + parmu(4)*lmexp(i,t) ...
                    + parmu(5)*PT(i,t) + parmu(6)*MJ(i,t) + parmu(7)*NE(i,t);
                sig(i,t)=parsigma(1) + parsigma(2)*lmexp(i,t) + parsigma(3)*PT(i,t)+ parsigma(4)*MJ(i,t) ...
                    + parsigma(5)*NE(i,t);
                tau_one(i,t)=partau_one(1) + partau_one(2)*lmexp(i,t);
            end
        end
        sig(i,t)=exp(sig(i,t)/2);
        tau_one(i,t)=-1+2./(1+exp(tau_one(i,t)));
        ztilda(i,t)=(log_ave_wage(i,t)-mu(i,t))/sig(i,t);
        fz_one(i,t)=exp(-0.5*(ztilda(i,t)^2))/sig(i,t);
    end
end

for i=1:npeople
    for t=2:48
        fz_two(i,t)=exp(-0.5*((ztilda(i,t)^2) + (ztilda(i,t-1)^2) - 2*tau_one(i,t)*ztilda(i,t)*ztilda(i,t-1))/(1-(tau_one(i,t)^2)));
        fz_two(i,t)=fz_two(i,t)/sig(i,t)/sig(i,t-1)/sqrt(1-(tau_one(i,t)^2));
    end
end

fz_two(:,1)=NaN;

z(:,1)=fz_one(:,1);

for i=1:npeople
    if (isnan(ztilda(i,1)))
        z(i,1)=fz_one(i,1);
    end
end

for i=1:npeople
    if (isnan(ztilda(i,2)))
        z(i,1)=fz_one(i,1);
    end
end

for i=1:npeople
    if (isnan(z(i,1)))
        z(i,1)=1;
    end
end

for i=1:npeople
    for t=2:48
        if isnan(NE(i,t-1))==0
            num=fz_two(i,t)/fz_one(i,t);
        else
            num=fz_one(i,t);
        end
        if (isnan(num)==1)
            num=1;
        end
        z(i,t)=num;%z(i)*
    end
end
end

