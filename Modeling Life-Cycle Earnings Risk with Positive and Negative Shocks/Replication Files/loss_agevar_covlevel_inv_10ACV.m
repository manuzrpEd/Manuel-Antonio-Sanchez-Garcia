function distance=loss_agevar_covlevel_inv_10ACV(para,T,M_ave_vect)
rho = para(1);
sigma_a = para(2);
sigma_tr = para(3);
sigma_p = para(4); %c_px - NEGAtive
sigma_tr_24 = para(5); %c_px - NEGAtive
M=NaN(T,T);

%variance
%
M(1,1)=sigma_a+sigma_tr_24+sigma_p;

% M(2,1)=sigma_a+sigma_tr+(rho^2)*sigma_p(1)+sigma_p(2);
% M(3,1)=sigma_a+sigma_tr+(rho^4)*sigma_p(1)+(rho^2)*sigma_p(2)+sigma_p(3);
% ...
    
sum=sigma_p;
for i=2:T
        M(i,1)=sigma_a+sigma_tr+(rho^(2))*sum+sigma_p;
        sum=(rho^(2))*sum+sigma_p;
end


% M(2,2)=sigma_a+rho*sigma_p(1);
% M(2,3)=sigma_a+rho*sigma_p(2)+(rho^3)*sigma_p(3);
% ...

M(2,2)=sigma_a+rho*sigma_p;%
sum=rho*sigma_p;
for i=3:T
        M(i,2)=sigma_a+(rho^(2))*sum+rho*sigma_p;
        sum=(rho^(2))*sum+rho*sigma_p;
end

% M(3,3)=sigma_a+(rho^(2))*sigma_p(1);
% sum=(rho^(2))*sigma_p(1);
% for i=4:T
%    M(3,i)=sigma_a+(rho^(2))*sum+(rho^(2))*sigma_p(i-2);
% end

for j=3:T
    M(j,j)=sigma_a+(rho^(j-1))*sigma_p;%
    sum=(rho^(j-1))*sigma_p;
    for i=(j+1):T
            M(i,j)=sigma_a+(rho^(2))*sum+(rho^(j-2))*sigma_p;%
            sum=(rho^(2))*sum+(rho^(j-2))*sigma_p;
    end
end
%
% M_vect=[M(:,1);M(2:end,2);M(3:end,3)];
M_vect=M(:,1);
for q=2:10
    M_vect=[M_vect; M(q:end,q)];
end
%
% lower_triang = tril(true(size(M)));
% M_vect = M(lower_triang);

I=eye(length(M_vect));
distance=(-M_ave_vect+M_vect)'*I*(-M_ave_vect+M_vect);
end