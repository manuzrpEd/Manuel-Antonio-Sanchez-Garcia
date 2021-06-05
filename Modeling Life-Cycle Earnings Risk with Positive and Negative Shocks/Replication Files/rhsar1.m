function B = rhsar1(c,beta,R,gamma,na,Nt,Np,NP,prob_pers,prob_tran)

c = c.^(-gamma);

%weight conditional marginal utilities
c_w = zeros(na,Np,NP); 
P_t = repmat(reshape(prob_tran,[1 Nt]),[na 1]);
for i =1:Np %state
    for j = 1:Np %transition to
        for k = 1:NP
            c_w(:,i,k) = c_w(:,i,k)+prob_pers(i,j)*sum((squeeze(c(:,j,:,k)).*P_t),2);
        end
    end
end

B = beta*R*c_w;
B = reshape(B,[na Np 1 NP]);
B = repmat(B,[1 1 Nt 1]); %expected consumption independent of current transitory state

end