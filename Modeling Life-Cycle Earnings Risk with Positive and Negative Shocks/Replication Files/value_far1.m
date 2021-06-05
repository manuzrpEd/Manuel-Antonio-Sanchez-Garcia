function V = value_f(c_w,V_w,anext,gamma,beta,agrid...
            ,Np,na,Nt,NP,P,prob_tran)             

%% Sum over probabilities

%weight value functions positive shocks
P_tL = repmat(reshape(prob_tran,[1 Nt]),[na 1]);
EVE = zeros(na,Np,NP); 
for j = 1:Np %state
    for k = 1:Np %transition
        for l = 1:NP
            EVE(:,j,l) = squeeze(EVE(:,j,l))+P(j,k)*sum(squeeze(V_w(:,k,:,l)).*P_tL,2);
        end
    end
end


EVE = reshape(EVE,[na Np 1 NP]);
EVE = repmat(EVE,[1 1 Nt 1]); %expected value independent of current transitory state

V = zeros(na,Np,Nt,NP);
for i = 1:Np %state
    for k = 1:Nt
        for l = 1:NP
            V(:,i,k,l) = CARRA(c_w(:,i,k,l),gamma)+beta*interp1_l(agrid(:,l),EVE(:,i,k,l),anext(:,i,k,l));
        end
    end
end

end