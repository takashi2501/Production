function f=model102(t,C)
global epsilon;
f=zeros(3,1);

x=C(1);
z=C(2);
f(1) = -x+z;
f(2) = atan(1-z-x)/epsilon;

xr = C(3);
f(3) = 1-2*xr;