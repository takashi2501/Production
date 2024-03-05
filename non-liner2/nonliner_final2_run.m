C=zeros(1,2);

clear t y;

C(1)=0; C(2)=0.5;
[t,y]=ode15s('nonliner_final2',[0 10],C);
plot(y(:,1),y(:,2));

C(1)=1; C(2)=5;
[t,y]=ode15s('nonliner_final2',[0 10],C);
plot(y(:,1),y(:,2));

hold on;
C(1)=3; C(2)=5;
[t,y]=ode15s('nonliner_final2',[0 10],C);
plot(y(:,1),y(:,2));

C(1)=-1; C(2)=-5;
[t,y]=ode15s('nonliner_final2',[0 10],C);
plot(y(:,1),y(:,2));

C(1)=-3; C(2)=-5;
[t,y]=ode15s('nonliner_final2',[0 10],C);
plot(y(:,1),y(:,2));

C(1)=1; C(2)=-5;
[t,y]=ode15s('nonliner_final2',[0 10],C);
plot(y(:,1),y(:,2));

C(1)=3; C(2)=-5;
[t,y]=ode15s('nonliner_final2',[0 10],C);
plot(y(:,1),y(:,2));

C(1)=-1; C(2)=5;
[t,y]=ode15s('nonliner_final2',[0 10],C);
plot(y(:,1),y(:,2));

C(1)=-3; C(2)=5;
[t,y]=ode15s('nonliner_final2',[0 10],C);
plot(y(:,1),y(:,2));

xlim([-6 6])
ylim([-6 6])

xlabel('x1');
ylabel('x2');