function f = nonliner_1(t,C)
f = zeros(2,1);

x1 = C(1);
x2 = C(2);

f(1) = -3*x1+1*x2;
f(2) = -4*x1+1*x2;