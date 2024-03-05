function f = nonliner_final2(t,C)
f = zeros(2,1);

x1 = C(1);
x2 = C(2);

f(1) = -x1 + 2*x1*x1*x1 + x2;
f(2) = -x1 - x2;