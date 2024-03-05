a = [-1 6;
     8 9];

b = [1; -3];

c = [2 3];

sys = ss(a,b,c,[]);

Q = [10 0;
     0 80];
R = 1;

[K,P,S] = lqr(sys,Q,R);

F = -R'*b'*P(1,1);
G = -R'*b'*P(1,2);

H1 = 0;
H2 = [-F 1]*inv([a b; c 0])*[0; 0; 1];
H3 = [-F+G*P(2,2)*P(1,2) 1]*inv([a b; c 0])*[0; 0; 1];