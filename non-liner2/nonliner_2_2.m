function f = nonliner_1(t,C)
f = zeros(2,1);

x1 = C(1);
x2 = C(2);
beta = 0.1;

f(1) = x2+beta*x1*x1*x1;
f(2) = -0.5*x1-x2;