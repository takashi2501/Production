clear;

A = [-3 1;-4 1];
e = eig(A)
[V,D] = eig(A)

C(1)=3; C(2)=6;
[t,y]=ode15s('nonliner_1',[0 100],C);
plot(y(:,1),y(:,2), 'c');

hold on;
C(1)=6; C(2)=9;
[t,y]=ode15s('nonliner_1',[0 100],C);
plot(y(:,1),y(:,2), 'b');

hold on;
C(1)=-3; C(2)=-6;
[t,y]=ode15s('nonliner_1',[0 100],C);
plot(y(:,1),y(:,2),'c');

hold on;
C(1)=-6; C(2)=-9;
[t,y]=ode15s('nonliner_1',[0 100],C);
plot(y(:,1),y(:,2),'b');

hold on;
C(1)=3; C(2)=-6;
[t,y]=ode15s('nonliner_1',[0 100],C);
plot(y(:,1),y(:,2),'m');

hold on;
C(1)=6; C(2)=-9;
[t,y]=ode15s('nonliner_1',[0 100],C);
plot(y(:,1),y(:,2),'g');

hold on;
C(1)=-3; C(2)=6;
[t,y]=ode15s('nonliner_1',[0 100],C);
plot(y(:,1),y(:,2),'m');

hold on;
C(1)=-6; C(2)=9;
[t,y]=ode15s('nonliner_1',[0 100],C);
plot(y(:,1),y(:,2),'g');

hold on;
fplot(@(x) x, 'r', 'LineWidth', 1.5);

hold on;
fplot(@(x) 2*x, 'b', 'LineWidth', 1.5);
text(5,10,'\leftarrow V2')
text(10,10,'\leftarrow V1')

xlim([-15 15])
ylim([-15 15])

ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('x1');
ylabel('x2');