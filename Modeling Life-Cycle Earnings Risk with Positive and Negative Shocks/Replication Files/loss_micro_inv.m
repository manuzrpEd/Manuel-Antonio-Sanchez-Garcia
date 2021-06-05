function distance=loss_micro_inv(parm,col,M_ave_vect)
m=zeros(col,col);
phi=0;
sigmatr=parm(2);
theta=0;
sigmah=0;
sigmap=parm(3);
rho=parm(1);
sigmame=0;
psi=theta+phi;
mult=-rho*sigmap*(1-rho)/(1+rho)+sigmatr*(psi*(phi-1)+psi*phi*(phi-1)*(psi-1)+phi^2*psi^2*(1-phi)*(1+phi)^(-1));
%Autocovariance of order 0
for j=1:col
    m(j,j)=2*sigmap/(1+rho)+sigmah+sigmatr*(1+(psi-1)^2+psi^2*(1-phi)*(1+phi)^(-1))+2*sigmame;
end
%Autocovariance of order 1
m1=-(1-rho)/(1+rho)*sigmap+sigmah+sigmatr*((psi-1)+psi*(phi-1)*(psi-1)+phi*psi^2*(1-phi)*(1+phi)^(-1))-sigmame;
vm1=m1*ones(col-1,1);
m1=diag(vm1);
m1=horzcat(vertcat(zeros(col-1,1)',m1),zeros(col,1));
%Autocovariance of order 2
m2=sigmah+mult;
vm2=m2*ones(col-2,1);
m2=diag(vm2);
m2=horzcat(horzcat(vertcat(vertcat(zeros(col-2,1)',zeros(col-2,1)',m2)),zeros(col,1),zeros(col,1)));
%Entire matrix
m=m+m1+m2;
for i=1:col
    for j=1:col
        m(i,j)=m(j,i);
    end
end
%Autocovariance of order 3 or higher
for i=1:col-3
    for j=i+3:col
        m(i,j)=-sigmap*rho^(j-i-1)*(1-rho)/(1+rho)+sigmah+phi^(j-i-2)*mult;
    end
end
for i=1:col
    for j=1:col
        m(j,i)=m(i,j);
    end
end
M_vect=m(:,1);
I=eye(length(M_vect));
distance=(-M_ave_vect+M_vect)'*I*(-M_ave_vect+M_vect);
end