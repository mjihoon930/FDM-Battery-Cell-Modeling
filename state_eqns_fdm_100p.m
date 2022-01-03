function out =state_eqns_fdm_100p(in)

u = in(2);

A = matrix_A_p(100);
B = matrix_B_p(100);

C_s=in(3:end);

out = A*C_s+B*u;


end