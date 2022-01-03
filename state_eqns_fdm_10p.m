function out =state_eqns_fdm_10p(in)

u = in(2);

A = matrix_A_p(10);
B = matrix_B_p(10);

C_s=in(3:end);

out = A*C_s+B*u;


end