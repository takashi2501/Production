function f = nonliner_1(t,C)
f = zeros(2,1);

x1 = C(1);
x2 = C(2);
beta = 0.3304;

f(1) = x2;
f(2) = -4*x1-2*x2+beta*x2*x2*x2;