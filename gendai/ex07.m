syms x

% 分母の特性方程式
f1 = 1/(x^6 + 5*x^4 - 461*x^2 - 7225);
f2 = 1/(x^4 - 4*x^3 + 18*x^2 - 76*x + 221);
f3_1 = 1/(x^2 -6*x +25);
f3_2 = 1/(x^4 +5*x^3+13*x^2+31*x-170);

% 極の計算
p1 = poles(f1,x);
p2 = poles(f2,x);
p3_1 = poles(f3_1,x);
p3_2 = poles(f3_2,x);

% 伝達関数
G1 = tf([1 -2],[1 3 7 85]);
G1_m = tf([-1 -2],[-1 3 -7 85]);
G1_std = zpk(-2,[-5 -1+4i -1-4i],1);
G2 = tf([1 -1],[1 -4 18 -76 221]);
G2_m = tf([-1 -1],[1 4 18 76 221]);
G2_std = zpk(-1,[-1+4i -1-4i -3+2i -3-2i],1);
G3_std = zpk([-3+4i -3-4i], [-5 -1+4i -1-4i],1);

% P(s)
P1 = G1_m*G1;
P2 = G2_m*G2;

% 重み関数
rho1 = 0;
rho2 = 100;
rho3 = 10000;

% 閉ループ系
sys1_1 = feedback(G1_std,rho1);
sys1_2 = feedback(G1_std,rho2);
sys1_3 = feedback(G1_std,rho3);
sys2_1 = feedback(G2_std,rho1);
sys2_2 = feedback(G2_std,rho2);
sys2_3 = feedback(G2_std,rho3);
sys3_1 = feedback(G3_std,rho1);
sys3_2 = feedback(G3_std,rho2);
sys3_3 = feedback(G3_std,rho3);

% システムの根軌跡の描画
figure(1);
rlocus(sys3_1);
title('根軌跡 ρ=0');

figure(2);
rlocus(sys3_2);
title('根軌跡 ρ=100');

figure(3);
rlocus(sys3_3);
title('根軌跡 ρ=10000');