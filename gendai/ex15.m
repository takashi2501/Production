% ex15_data.matからytを読み込む
load('ex15_data.mat'); % ex15_data.matにytが保存されていると仮定

% 状態遷移行列 A
A = [0.88, -0.46; 0.46, 0.88];

% 観測行列 C
C = [0, 1];

% プロセスノイズの共分散行列 Q
Q = [1e-2, 0; 0, 16e-2];

% 観測ノイズの共分散行列 R
R = 1;

% 初期推定誤差の共分散行列 P[0|0]
P_k_k_minus = eye(2) * 1e6;

% 時刻k=0における状態の初期推定値 ^x[0|0]
x_k_k_minus = [0; 0];

% データ数
num_data = length(yt);

% 推定結果を保存する配列
x_estimated = zeros(2, num_data);
y_estimated = zeros(1, num_data);
y_diff = zeros(1, num_data); % ymとytの差
y_estimated_diff = zeros(1, num_data); % 推定された出力とytの差


% カルマンフィルタの計算
for k = 1:num_data
    % 予測ステップ (時間更新)
    x_k_k_minus = A * x_k_k_minus;
    P_k_k_minus = A * P_k_k_minus * A' + Q;

    % 観測値 y (ytを使用)
    y_k_true = yt(k);
    y_k = C * x_k_k_minus;

    % カルマンゲイン K
    K = P_k_k_minus * C' / (C * P_k_k_minus * C' + R);

    % 更新ステップ (観測更新)
    x_k_k = x_k_k_minus + K * (y_k_true - y_k);
    P_k_k = (eye(2) - K * C) * P_k_k_minus;

    % 状態の推定値と観測値を保存
    x_estimated(:, k) = x_k_k;
    y_estimated(k) = C * x_k_k;

    % ymとytの差を保存
    y_diff(k) = ym(k) - y_k_true;

    % 推定された出力とytの差を保存
    y_estimated_diff(k) = y_estimated(k) - y_k_true;


    % 次のステップの準備
    x_k_k_minus = x_k_k;
    P_k_k_minus = P_k_k;
end

% 推定結果と真の値をプロット
time_steps = 0:num_data-1;
figure(1);
plot(time_steps, y_estimated, 'b', 'LineWidth', 2);
hold on;
plot(time_steps, yt, 'r', 'LineWidth', 2);
legend('推定された出力', '真の出力 (yt)');
xlabel('時刻 k');
ylabel('出力');
title('推定された出力と真の出力の比較');
grid on;
hold off;

figure(2);
% ymとytの差のプロット
plot(time_steps, y_diff, 'b', 'LineWidth', 2); hold on;
xlabel('時刻 k');
ylabel('ym - yt');
grid on;

% 推定された出力とytの差のプロット
plot(time_steps, y_estimated_diff, 'r', 'LineWidth', 2);
xlabel('時刻 k');
ylabel('推定された出力 - yt');
legend('観測値 ym と真値 yt の差','推定された出力と真の出力 yt の差');
grid on;
hold off;

% ymとytの差の2乗和を計算
mse_observed = sum(y_diff.^2);

% 推定された出力とytの差の2乗和を計算
mse_estimated = sum(y_estimated_diff.^2);

% 結果を表示
fprintf('出力の観測値 ym と真値 yt の差の2乗和: %f\n', mse_observed);
fprintf('出力の推定値 C * x_hat[k|k] と真値 yt の差の2乗和: %f\n', mse_estimated);