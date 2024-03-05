%変数クリア
clear;

%初期値を定義
IN(1) = 15; %x1 = 15[nM]
IN(2) = 10; %x2 = 10[nM]
IN(3) = 0;  %x3 = 0[nM]
IN(4) = 10; %x4 = 10[nM]
IN(5) = 0;  %x5 = 0[nM]

%ode15sによる数値積分（時間は0秒～1000秒）
[t,y] = ode15s('model_ex1', [0 1000], IN);

%結果の表示
plot(t,y(:,1));
plot(t,y(:,2));
plot(t,y(:,3));
plot(t,y(:,4));
plot(t,y(:,5));
title('問題2.3(1)のシミュレーション')
xlabel('時間(s)')
ylabel('体積モル濃度(nM)')