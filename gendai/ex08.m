% 開ループ伝達関数の定義
psys=tf(1,[1,3,5]);

% シミュレーションの実行
out=sim('ex08_1_1');

% ステップ応答の表示
%plot([0;15],[1;1],'r-.');  	% 参照入力
%hold on;
%plot(out.tout,out.y.data,'b-');	% ステップ応答
%axis([0,15,0,1.2]);
%grid on;
%legend({'$r(t)$','$y(t)$'},'Interpreter','latex');
%xlabel('time [s]');
%ylabel('$y(t)$','Interpreter','latex');
%hold off;

%figure(2);
%plot(out.tout,out.y.data,'b-');
%xlabel('time [s]');
%ylabel('step response');

%figure(3);
%plot(out.tout,out.y1.data,'b-');
%xlabel('time [s]');
%ylabel('ramp response');

%figure(4);
%plot(out.tout,out.y3.data,'-b');
%xlabel('time [s]');
%ylabel('Feedback step response');

figure(5);
plot(out.tout,out.y3.data,'-b');
xlabel('time [s]');
ylabel('Feedback ramp response');