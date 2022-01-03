function V = output_V(in)

persistent  n p c

t = in(1);

if t==0  
    n = evalin('base','n');
    p = evalin('base','p');
    c = evalin('base','c');
end
u = in(2);
c_n = in(3);
c_p = in(4);
T = in(5);


theta_n = c_n/n.c_max_n;
theta_p = c_p/p.c_max_p;

U_ref_n = 0.7222 + 0.1387*theta_n + 0.029*theta_n^(1/2) - (0.0172/theta_n) + (0.0019/theta_n^(1.5)) + 0.2808*exp(0.9-15*theta_n) - 0.7984*exp(0.4465*theta_n-0.4108);
U_ref_p = 3.4323 - 0.8428*exp(-80.2493*(1-theta_p)^1.3198) -...
       3.2474*10^-6*exp(20.2645*(1-theta_p)^3.8003) +...
       3.2482*10^-6*exp(20.2645*(1-theta_p)^3.7995);% From Safari/Delacourt's "Modeling of a Commercial Graphite/LiFePO4 Cell (?).

k_p = (c.k_ref_p*exp((c.E_a_p/c.R_u)*((1/T)-(1/c.T_ref))));
k_n = (c.k_ref_n*exp((c.E_a_n/c.R_u)*((1/T)-(1/c.T_ref))));

eta_p = ((2*c.R_u*T)/c.F)*asinh(-u/(2*p.A_p*p.L_p*p.a_p*k_p*(c.c_e*c_p*(p.c_max_p-c_p))^(0.5)));
eta_n = ((2*c.R_u*T)/c.F)*(asinh(u/(2*n.A_n*n.L_n*n.a_n*k_n*(c.c_e*c_n*(n.c_max_n-c_n))^(0.5))));

   
V = U_ref_p - U_ref_n + eta_p - eta_n - ((p.R_film_p/(p.A_p*p.L_p*p.a_p))+(n.R_film_n/(n.A_n*n.L_n*n.a_n)) + c.R_c)*u;

end