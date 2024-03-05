clear;
C(1) = 10;
C(2) = 12;

[t,y]=ode15s('model_non2', [0 100], C);

figure(1);
subplot(211); plot(t,y(:,1));
xlabel('time(sec)');
ylabel('x1');
subplot(212); plot(t,y(:,2));
xlabel('time(sec)');
ylabel('x2');

figure(2);
plot(y(:,1),y(:,2));
xlabel('x1');
ylabel('x2');