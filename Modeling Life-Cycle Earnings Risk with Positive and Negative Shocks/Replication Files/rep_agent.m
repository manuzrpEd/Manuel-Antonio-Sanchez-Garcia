function C_sp = rep_agent(life,agrid,na,beta,R,gamma,amin,income,ini_a)
%solving representative agent model
C_per = zeros(na,life);
%V_per = zeros(na,life);
C_per(:,end) = R*agrid+income(end);%consume all income
%V_per(:,end) = CARRA(C_per(:,end),gamma); %consume all income
t=1;
while t<life
    B = rhs_r(C_per(:,life-t+1),beta,R,gamma); %rhs of Euler equation
    c_aux = B.^(-1/gamma); %solve for the implied consum
    a = (c_aux-income(life-t)+agrid)./R; %the asset position that is consistent with the asset choice
    binding_constraints = agrid < a(1);
    c_t=interp1_l(a,c_aux,agrid);
    AUX= income(life-t) + agrid*R - amin;
    c_t(binding_constraints) = AUX(binding_constraints);
    C_per(:,life-t) = c_t; 
    %anext = R*agrid+income(life-t)-C_per(:,life-t); %implied savings
    %V_per(:,life-t) = CARRA(C_per(:,life-t),gamma)+beta*interp1_l(agrid,V_per(:,life-t+1),anext);
    t = t+1;
end
% solve consumption path
C_sp = zeros(life,1);
a_sp = zeros(life,1);
%initial resources
a_sp(1,1) = ini_a;
for s = 1:life-1
    C_sp(s,1) = interp1_l(agrid,C_per(:,s),a_sp(s,1));
    a_sp(s+1,1) = R*a_sp(s,1)+income(s,1)-C_sp(s,1);
end
C_sp(end,1) = R*a_sp(end,1)+income(end,1);
end