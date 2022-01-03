function Y = input_c(in)

t=in(1);

%{
Y =-6*(0.3.*sin(0.07*t) + sin(0.0035*t)); % case (1)

if t >1030
    Y=0;
end
%}


Y = -7.*(exp(-0.1*t) + exp(-0.018*t));  % case (2)

for i = 1:4
    if t > 400*i
    Y = -7.*(exp(-0.1*(t-400*i)) + exp(-0.018*(t-400*i)));
    end
end
