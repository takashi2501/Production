function f = model(t,C)

f = zeros(2,1);
x1 = C(1);
x2 = C(2);

f(1) = 0.2*x2;
f(2) = -5*(x1 - x2 + (1/3)*x2^3);