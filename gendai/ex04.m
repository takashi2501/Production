A = [-3 3 -3;
     -1 -7 5;
      1 -1 -1];

B = [5; -3; -2];

C = [1 -5 -2];

sys = ss(A,B,C,[]);

Wc = gram(sys,'c');
Wo = gram(sys,'o');

sys2 = balreal(sys);

Wc1 = gram(sys2,'c');
Wo1 = gram(sys2,'o');

rsys1 = modred(sys,3);

rsys2 = modred(sys,2:3);

rsys3 = modred(sys,3,'truncate');

rsys4 = modred(sys,3,'matchDC');

figure(1)
bodeplot(rsys1)
title('2次元までの低次元モデル')

figure(2)
bodeplot(rsys2)
title('1次元までの低次元モデル')

figure(3)
bodeplot(rsys3)
title('ゲイン補正を行わない場合')

figure(4)
bodeplot(rsys4)
title('ゲイン補正を行う場合')

figure(5)
bodeplot(sys)
title('元のシステム')

figure(6)
step(rsys1); hold on;
step(rsys2);
step(rsys3);
step(rsys4);
step(sys);
hold off;
