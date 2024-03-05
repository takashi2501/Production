A =  [2 -5 5; 8 6 4; -4 5 -7];
B = [0; 2; -1];

rank([B A*B A^2*B])

a = diag(eig(A));
rank([A-a B])