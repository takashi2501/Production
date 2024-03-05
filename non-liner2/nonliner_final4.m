function f = nonliner_final4(t,C)
global myu;
f = zeros(2,1);

x1 = C(1);
x2 = C(2);

f(1) = x2;
f(2) = myu*(x1+x2) - x2 -x1*x1*x1 - 3*x1*x1*x2;