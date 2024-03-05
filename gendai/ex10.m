M = 1;
D = 0.1;


sim('simulation_ex10');

figure(1);
plot(out.y);
xlabel('Time[s]','FontSize',9, 'FontName','Latex');
ylabel('Response','FontSize',9, 'FontName','Latex');
title('Response p(t)');

figure(2);
plot(out.u);
xlabel('Time[s]','FontSize',9, 'FontName','Latex');
ylabel('Control Input','FontSize',9, 'FontName','Latex');
title('Control Input u(t)');