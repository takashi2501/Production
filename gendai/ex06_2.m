sys = tf([2 8], [1 8 9 2]); % 制御対象の伝達関数

Kp = 1; % 比例ゲイン
Ki = 1; % 積分ゲイン
Kd = 1; % 微分ゲイン
controller = pid(Kp, Ki, Kd); % P-ID制御器


L = tf([4 14 100], [1]); % 外乱オブザーバのゲイン（k1、k2、k3は適切な値）
disturbance_observer = feedback(sys*L, 1); % 外乱オブザーバのフィードバック結合

t = 0:0.01:10; % シミュレーション時間

u = zeros(size(t)); % ステップ入力 u(t)
u(t>=2) = 1;

d = zeros(size(t)); % 外乱ステップ入力 d(t)
d(t>=6) = -2;

system_with_observer = series(disturbance_observer, controller); % 外乱オブザーバと制御器を直列に結合
system_with_observer = feedback(system_with_observer, sys); % 制御入力と制御対象をフィードバック

figure;
step(system_with_observer, t, 'b'); % 制御入力に対するシステムの応答を青色でプロット
hold on;
plot(t, u, 'r--'); % ステップ入力を赤色の破線でプロット
plot(t, d, 'g--'); % 外乱ステップ入力を緑色の破線でプロット
hold off;
legend('System Response', 'Step Input', 'Disturbance Step Input');
xlabel('Time');
