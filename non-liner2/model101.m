function f=model101(t,C)
global epsilon;
f=zeros(3,1);

x=C(1);
z=C(2);
f(1) = z;
f(2) = (-x-z)/epsilon;

xr = C(3);
f(3) = -xr;