function [Y] = output_C_3_n(in)

persistent n p c

t=in(1);


if t==0
    
    c = evalin('base','c');
    p = evalin('base','p');
    n = evalin('base','n');
end

N=3;
dr_n = n.R_n/N;
dr_p = p.R_p/N;

for i=1:N-1
    C(1,i)=0;
    if i==N-1
        C(1,i)=1;
    end
end

u=in(2);
c_n = in(3:4);
c_p = in(5:6);
c_N = in(7);

Y(1) = -((n.D_n)/(n.R_n*(dr_n)^2))*((2*dr_n+n.R_n)*c_N -2*(dr_n+n.R_n)*c_n(2)-n.R_n*c_n(1));

%Y(1) = C*c_n + D_1*u;
%Y(2) = C*c_p + D_2*u;
end