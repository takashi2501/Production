A = [-2 0 0;
     0 -4 0;
     0 0 -4];

B = [1 0; 1 0; 0 1];

C = [1 0 1;
     0 3 -4];

D = [0 0; 0 1];

sys = tf(ss(A,B,C,D));

z = -3;
u0 = [1; 1];

x0 = inv(z*eye(3)-A)*B*u0;

% 制御器の設計 (フィードバックゲインの設定)
K = [1; 1]; % この部分を適切に設計する必要があります


% シミュレーション時間の定義 (例：0から10秒まで0.1秒刻み)
t = 0:0.1:10;

% フィードバック制御による応答の計算
[y, t_sim, x] = lsim(sys, zeros(size(t)), t, x0, -K * C);

% 結果のプロット
plot(t_sim, y(:, 1), 'r', t_sim, y(:, 2), 'b');
xlabel('Time (s)');
ylabel('Output');
legend('Output 1', 'Output 2');
grid on;