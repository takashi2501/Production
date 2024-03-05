m1 = 1; m2 = 2;
k = 2; d = 4;
syms s;

A = [zeros(2,2) eye(2);
    -k/m1 k/m1 -d/m1 d/m1;
    k/m2 -k/m2 d/m2 -d/m2];

B = [0; 0; 1/m1; 0];
C = [1 0 0 0; 0 1 0 0];
D = [0; 0];

sys = ss(A,B,C,D);

p = [-3+1i, -3-1i, -2+1i, -2-1i];

F = place(A,B,p);
Acl = A-B*F;
syscl = ss(Acl,B,C,D);

Pcl = pole(syscl);

L = place(A',C',[-7,-7,-6,-6])';
At = A-L*C;
Bt = [B,L];
Ct = [C;zeros(2,2) eye(2)];
Dt = 0;
sysObserver = ss(At,Bt,Ct,Dt);

N = 100;
t = linspace(0,10,N);
u = [ones(N/2,1); zeros(N/2,1)];
x0 = [1; -2; 2; -1];
[y,t,x] = lsim(sys,u,t,x0);


[observerOutput,t] = lsim(sysObserver,[u,y],t);
yHat = observerOutput(:,1);
xHat = observerOutput(:,[3,4]);

figure(1);
hold on;
plot(t, x(:, 3), '--', 'LineWidth', 1.2);  % x_3の応答を追加
plot(t, x(:, 4), '--', 'LineWidth', 1.2);  % x_4の応答を追加
plot(t, xHat(:, 1), 'LineWidth', 1.2);  % xHat_3をプロット
plot(t, xHat(:, 2), 'LineWidth', 1.2);  % xHat_4をプロット
legend('x_3', 'x_4', 'xHat_3', 'xHat_4');  % x_3の応答を追加
xlabel('時間[s]')
ylabel('応答')
title('制御対象の状態とオブザーバが与える推定値の比較');


L_t = place(A',C',[-6,-6,0,0])';

At2 = A - L_t*C;
Bt2 = [B,L_t];
Ct2 = [C; zeros(2,2) eye(2)];
Dt2 = 0;
sysObserver2 = ss(At2,Bt2,Ct2,Dt2);

N = 100;
t = linspace(0,10,N);
u = [ones(N/2,1); zeros(N/2,1)];
x0 = [1; -2; 2; -1];
[y,t,x] = lsim(sys,u,t,x0);

xhat0 = [0;0;0;0];
[observerOutput2,t] = lsim(sysObserver2,[u,y],t,xhat0);
yHat2 = observerOutput2(:,1);
xHat2 = observerOutput2(:,[3,4]);

figure(2);
hold on;
plot(t, x(:, 3), '--', 'LineWidth', 1.2);  % x_3の応答を追加
plot(t, x(:, 4), '--', 'LineWidth', 1.2);  % x_4の応答を追加
plot(t, xHat2(:, 1), 'LineWidth', 1.2);  % xHat_3をプロット
plot(t, xHat2(:, 2), 'LineWidth', 1.2);  % xHat_4をプロット
legend('x_3', 'x_4', 'xHat_3', 'xHat_4');  % x_3の応答を追加
xlabel('時間[s]')
ylabel('応答')
title('制御対象の状態とオブザーバが与える推定値の比較');