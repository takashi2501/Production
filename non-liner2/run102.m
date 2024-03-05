C=zeros(1,3);
global epsilon;

clear t y;
C(1)=10;
C(2)=1;
C(3)=C(1);

epsilon = 0.01;

[t,y]=ode15s('model102',[0 10],C);
zr = 1-y(:,3);

figure(1);
subplot(2,1,1); plot(t,y(:,1),t,y(:,3));
xlabel('time');
ylabel('x');
subplot(2,1,2); plot(t,y(:,2),t,zr);
xlabel('time');
ylabel('z');