%変数クリア
clear;

%初期値を定義
IN(1) = 15; %x1 = 15[nM]
IN(2) = 10; %x2 = 10[nM]
IN(3) = 0;  %x3 = 0[nM]
IN(4) = 10; %x4 = 10[nM]
IN(5) = 0;  %x5 = 0[nM]
IN(6) = 0;  %x6 = 0[nM]

%ode15sによる数値積分（時間は0秒～1000秒）
[t,y] = ode15s('model_ex2', [0 0.1], IN);


%結果の表示
plot(t,y(:,6));
title('問題2.3(3)のシミュレーション')
xlabel('時間(s)')
ylabel('体積モル濃度(nM)')