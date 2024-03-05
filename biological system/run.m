clear;

IN(1) = 10; % x1 = 10 [nM]
IN(2) = 20; % x2 = 20 [nM]
IN(3) = 0; % x3 = 0 [nM]

[t, y] = ode15s( 'model', [0 1000], IN);

plot ( t, y( : , 1 ) );
plot ( t, y( : , 2 ) );
plot ( t, y( : , 3 ) );