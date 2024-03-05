sys = tf([0.1 0],[1 0.1 49]);

Ts = 0.1*pi;

sysd1 = c2d(sys,Ts,'tustin');

opts = c2dOptions('Method','tustin','PrewarpFrequency',7);
sysd2 = c2d(sys,Ts,opts);


figure(1);
bode(sys); 
title('Band pass filter $G_{1}(s)$','Interpreter','latex');

figure(2);
bode(sysd1);
h = 'Digital Filter $\tilde{G}_{1}$(s)';
title(h,'interpreter','latex');

figure(3);
bode(sys); hold on;
bode(sysd2);
h2 = 'BPF $G_{1}(s)$ and Digital Filter $\tilde{G}_{2}$(s)';
title(h2,'interpreter','latex');
Label1 = '$G_{1}$(s)';
Label2 = '$\tilde{G}_2$(s)';
legend(Label1,Label2,'Interpreter','latex');
hold off;