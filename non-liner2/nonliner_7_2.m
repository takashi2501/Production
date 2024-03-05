function f = nonliner_7_1(t,C)
global myu;
f = zeros(2,1);

x1 = C(1);
x2 = C(2);

f(1) = myu*x1 - x1*x1;
f(2) = -x2;