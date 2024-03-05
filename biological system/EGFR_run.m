%変数クリア
clear;

%初期値を定義
IN(1) = 2*33.3;
IN(2) = 100;
IN(3) = 0;
IN(4) = 0;
IN(5) = 0;
IN(6) = 0;
IN(7) = 0;
IN(8) = 0;
IN(9) = 0;
IN(10) = 0;
IN(11) = 0;
IN(12) = 0;
IN(13) = 0;
IN(14) = 0;
IN(15) = 0;
IN(16) = 0;
IN(17) = 105;
IN(18) = 0;
IN(19) = 0;
IN(20) = 85;
IN(21) = 150;
IN(22) = 34;
IN(23) = 0;

%ode15sによる数値積分（時間は0秒～1000秒）
options = odeset('reltol', 1e-6, 'abstol', 1e-9);
[t,y] = ode15s('EGFRmodel', [0 120], IN, options);

total_EGFR = 2*(y(:,5)+y(:,6)+y(:,7)+y(:,8)+y(:,9)+y(:,10)+y(:,11)+y(:,12)+y(:,13));

%結果の表示
plot(t,total_EGFR);

title('EGFRモデルのシミュレーション')
xlabel('時間(s)')
ylabel('Total Phosphorylated EGFR(nM)')