clear;

C(1)=1; C(2)=1;

[t,y]=ode15s('nonliner_2',[0 100],C);

figure(1);
plot(y(:,1),y(:,2));
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('x1');
ylabel('x2');

figure(2);
subplot(211); plot(t,y(:,1));
xlabel('time(sec)');
ylabel('x1');
subplot(212); plot(t,y(:,2));
xlabel('time(sec)');
ylabel('x2');
