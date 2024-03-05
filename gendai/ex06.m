sim('simulation_ex6_2');

figure(1);
plot(out1);
hold on
plot(out2);
plot(out3);
xlabel('時間 [s]')
ylabel('応答')
ylim([-1 2]);
legend('Kg=0.5','Kg=1','Kg=2');


sys = tf([2 8],[1 8 9 2]);
[A,B,C,D] = tf2ss([2 8], [1 8 9 2]);
sys_1 = ss(A,B,C,D);
K = place(A,B,[-6;-2;-1]);
L = place(A',C',[-6;-2;-1])';
est = estim(sys_1,L);
A_t =[-8 -17.6 -36.4;
      1 1.4 5.6;
      0 0.4 -2.4];
B_t = [4.3; -0.7; 0.3];
C_t = [0 2 8;
       1 0 0;
       0 1 0;
       0 0 1];
D_t = 0;

sys2 = tf(ss(A_t,B_t,C_t,D_t));