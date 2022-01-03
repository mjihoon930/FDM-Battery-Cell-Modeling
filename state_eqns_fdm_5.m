function out =state_eqns_fdm_5(in)

u = in(2);

A = matrix_A_n(5);
B = matrix_B_n(5);

C_s=in(3:end);


out = A*C_s+B*u;


end