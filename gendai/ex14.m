%%% 高速サンプル・ホールド近似の有効性
%%% 離散化制御対象に対して最適レギュレータを構成し, 有効性を検証

% 連続時間制御対象
pca=[2,-1;1,0];
pcb=[1;0];
pcc=[0,1];
pcd=0;

q = 1;
r = 1*10^-8;

sys = ss(pca,pcb,pcc,pcd);

% 初期状態 x0
x0=[10;1];

% サンプル周期
h=0.2;
hsim=0.2/2;

% 応答評価
tfinal=3;	% シミュレーション終了時刻
k=[1,1];	% いい加減なゲイン

sysd = c2d(sys,h,'zoh');
A1 = sysd.A;
B1 = sysd.B;
C1 = sysd.C;
D1 = sysd.D;
Q1 = q*(C1'*C1);
R1 = r + q*(D1'*D1);
N1 = q*(C1'*D1);

K1 = dlqr(A1,B1,Q1,R1,N1);

sysd2 = c2d(sys,hsim,'zoh');

A2 = sysd2.A;
B2 = sysd2.B;
C2 = sysd2.C;
D2 = sysd2.D;
Q2 = (q/2)*(C2'*C2);
R2 = (q/2)*[1 1]*(D2'*D2)*[1; 1] + r;
N2 = (q/2)*(C2'*D2).*[1; 1];

K2 = dlqr(A2,B2,Q2,R2,N2);

ex14_eval;

figure(1);
plot(y.time,y.signals.values,'-*','MarkerIndices',1:10:length(y.signals.values));
xlabel('時間[s]');
ylabel('応答');
title('ディジタル制御系連続時間応答')