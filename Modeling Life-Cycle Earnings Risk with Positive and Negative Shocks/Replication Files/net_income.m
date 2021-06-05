function net = net_income(gross)

net = zeros(length(gross),1);
for i =1:length(gross)
    ss_t = 0.0935*min(gross(i),72600); %social security taxes
    if gross(i)<=8004
        net(i) = gross(i)-ss_t;
    elseif gross(i)>8004 && gross(i)<=13469
        net(i) = gross(i)-ss_t-(gross(i)-8004)*((gross(i)-8004)*0.000009976+0.14);
    elseif gross(i)>13469 && gross(i)<=52881
        net(i) = gross(i)-ss_t-(gross(i)-13469)*((gross(i)-13469)*0.0000022874+0.2397)-948.68;
    elseif gross(i)>52881 && gross(i)<=250730
        net(i) = gross(i)-ss_t-gross(i)*0.42+8261.29;
    elseif gross(i)>250730
        net(i) = gross(i)-ss_t-gross(i)*0.45+15783.19;
    end
end


end