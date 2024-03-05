C=zeros(1,2);

clear t y;

C(1)=1; C(2)=0;
[t,y]=ode15s('nonliner_final3',[0 10],C);
plot(y(:,1),y(:,2));

axis([-6 6 -6 6])

xlabel('x1');
ylabel('x2');