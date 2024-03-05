A = [-2 1 -2 0;
    4 -6 -4 2;
    -3 4 -1 0;
    1 -3 2 -4];

C = [0 0 0 1];

Wo = -C'*C*inv(A'+A);

sys = ss(A,[],C,[]);
wo = gram(sys,'o');
wc = gram(sys,'c');

[V,D] = eig(A);

rank(A-D);
P1 = zeros(1,4);
P2 = zeros(1,4);
P3 = zeros(1,4);
P4 = zeros(1,4);
R1 = zeros(1,4);
R2 = zeros(1,4);
R3 = zeros(1,4);
R4 = zeros(1,4);

D = sqrt(D);

P1 = V(:,1)'*A;
R1 = D(1,1)*V(:,1)';

P2 = V(:,2)'*A;
R2 = D(2,2)*V(:,2)';

P3 = V(:,3)'*A;
R3 = D(3,3)*V(:,3)';

P4 = V(:,4)'*A;
R4 = D(4,4)*V(:,4)';

