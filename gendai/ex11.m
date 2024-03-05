syms s;
u0 = [3; 2];

A = [-7 3 0; -6 2 -2; -2 1 -1];

B = [3 -1; 0 0; 1 -2];

C = [1 1 -1; 3 0 3];

D = 0;

sys = ss(A,B,C,D);

z = tzero(sys);

Gs = [(2*s^2 -22*s -24)/(s^3 + 6*s^2 +11*s +6) (12*s^2 -12*s -24)/(s^3 + 6*s^2 +11*s +6);
      (s^2+19*s+48)/(s^3+6*s^2+11*s+6) (-9*s^2 -21*s+18)/(s^3+6*s^2+11*s+6)];

s = 3;
G = subs(Gs);

x0 = inv(z*eye(3)-A)*B*u0;

% 入力信号 u(t) の定義
t = 0:0.1:10;
u = [3; 2]* exp(4*t);

% シミュレーション
y = lsim(sys, u, t, x0);

% 結果のプロット
plot(t, y(:, 1), 'r', t, y(:, 2), 'b');
xlabel('Time (s)');
ylabel('Output');
legend('Output 1', 'Output 2');
grid on;