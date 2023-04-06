clear all
clc

a = 0.7;
b = 0.2;

S = zeros(50,1);
I = zeros(50,1);
R = zeros(50,1);

S(1) = 0.99;
I(1) = 0.01;
R(1) = 0.00;

for t=1:50
    S(t+1) = S(t) - a*I(t)*S(t);
    I(t+1) = I(t) + a*I(t)*S(t) -b*I(t);
    R(t+1) = R(t) + b*I(t);
end
tmtx = 0:1:50;
plot(tmtx,S,tmtx,I,tmtx,R)
legend(["Susceptible","Infected","Recovered"])
xlabel("Days")
ylabel("Ratio")
title("SIR Model")
