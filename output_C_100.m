function [Y] = output_C_100(in)

persistent n p c

t=in(1);


if t==0
 
    c = evalin('base','c');
    p = evalin('base','p');
    n = evalin('base','n');
end

N=100;
dr_n = n.R_n/N;
dr_p = p.R_p/N;

for i=N-1
    C(1,i)=0;
    if i==N-1
        C(1,i)=1;
    end
end

u=in(2);
c_s_n = in(3:101);
c_s_p = in(102:end);

D_1 = -dr_n/(n.D_n*n.a_n*n.L_n*c.F*n.A_n);
D_2 = dr_p/(p.D_p*p.a_p*p.L_p*c.F*p.A_p);

Y(1) = C*c_s_n + D_1*u;
Y(2) = C*c_s_p + D_2*u;

end