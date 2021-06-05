function B = rhs_r(c_pol,beta,R,gamma)
B = beta*R*(c_pol.^(-gamma));
end