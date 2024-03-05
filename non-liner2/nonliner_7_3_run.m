C=zeros(1,2);
global myu;

clear t y;

myu = -2;

C(1)=0; C(2)=0;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

hold on;
C(1)=1; C(2)=5;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

hold on;
C(1)=3; C(2)=5;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

hold on;
C(1)=1; C(2)=-5;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

hold on;
C(1)=3; C(2)=-5;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

hold on;
C(1)=-1; C(2)=5;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

hold on;
C(1)=-3; C(2)=5;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

hold on;
C(1)=-1; C(2)=-5;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

hold on;
C(1)=-3; C(2)=-5;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

C(1)=-5; C(2)=0;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

C(1)=6; C(2)=0;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

C(1)=1; C(2)=0;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

C(1)=-1; C(2)=0;
[t,y]=ode15s('nonliner_7_3',[0 10],C);
plot(y(:,1),y(:,2));

xlim([-5 5])
ylim([-5 5])

title('μ=-2 (μ<0)');

box on;