function f = model(t,IN)
f = zeros(3,1);
ka = 10.0;
kd = 1.0;

x1 = IN(1); 
x2 = IN(2);
x3 = IN(3);

v = ka * x1 * x2 - kd * x3;

f(1) = -v;
f(2) = -v;
f(3) = +v;