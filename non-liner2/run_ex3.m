%変数クリア
clear;
global K1;

%初期値を定義
IN(1) = 15.0; %x1 = 15.0[nM]
IN(2) = 0; %x2 = 0[nM]
IN(3) = 20.0;  %x3 = 20.0[nM]
IN(4) = 0; %x4 = 0[nM]
IN(5) = 30.0; %x5 = 30.0[nM]
IN(6) = 0; %x6 = 0[nM]
IN(7) = 5.0;

for i = 1:50
    if i == 1
        K1 = 5.0;
    else
        K1 = K1 * 25
    end
    %ode15sによる数値積分（時間は0秒～1000秒）
    [t,y] = ode15s('model_ex3', [0 10], IN);
    %結果の表示
    plot(t,y(:,6));
    b = plot(t,y(:,6));
    
    if b <= 3.0
        %ode15sによる数値積分（時間は0秒～1000秒）
        [t,y] = ode15s('model_ex3', [0 10], IN);
        %結果の表示
        plot(t,y(:,6)); hold on;
        title('問題2.4(1)のシミュレーション')
        xlabel('時間(s)')
        ylabel('体積モル濃度(nM)')
        break;
    else
        %ode15sによる数値積分（時間は0秒～1000秒）
        [t,y] = ode15s('model_ex3', [0 10], IN);
        %結果の表示
        plot(t,y(:,6)); hold on;
        title('問題2.4(1)のシミュレーション')
        xlabel('時間(s)')
        ylabel('体積モル濃度(nM)')
    end
end