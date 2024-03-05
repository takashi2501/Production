function f = EGFRmodel(t,IN)
f = zeros(23,1);

k1 = 0.003; 
k_1=0.06;
k2=0.01; 
k_2=0.1;
k3=1.00;
k_3=0.01;
V4=450.00;
K4=50.00;
k5=0.06;
k_5=0.2;
k6=1.00;
k_6=0.05;
k7=0.3;
k_7=0.006;
V8=1.00; 
K8=100.00;
k9=0.003;
k_9=0.05;
k10=0.01;
k_10=0.06;
k11=0.03;
k_11=4.50*10^-3;
k12=1.50*10^-3;
k_12=10^-4;
k13=0.09; 
k_13=0.6;
k14=6.00; 
k_14=0.06;
k15=0.30;
k_15=9*10^-4;
V16=1.70;
K16 = 340.00;
k17=0.003;
k_17=0.10;
k18=0.30;
k_18=9*10^-4;
k19=0.01;
k_19=2.14*10^-2;
k20=0.12;
k_20=2.4*10^-4;
k21=0.003;
k_21=0.10;
k22=0.03;
k_22=0.064;
k23=0.10; 
k_23=0.021;
k24=0.009;
k_24=4.29*10^-2;
k25=1.00;
k_25=0.03;

EGF=IN(1); %EGF
R=IN(2); %R
Ra=IN(3); %Ra
R2=IN(4); %R2
RP=IN(5); %RP
R_PL=IN(6); %R-PL
R_PLP=IN(7); %R-PLP
R_G=IN(8); %R-G
R_G_S=IN(9); %R-G-S
R_Sh=IN(10); %R-Sh
R_ShP=IN(11); %R-ShP
R_Sh_G=IN(12); %R-Sh-G
R_Sh_G_S=IN(13); %R-Sh-G-S
G_S=IN(14); %G-S
ShP=IN(15); %Shp
Sh_G=IN(16); %Sh-G
PLCgamma=IN(17); %PLCgamma
PLCgammaP=IN(18); %PLCgammaP
PLCgammaP_I=IN(19); %PLCgammaP-I
Grb=IN(20); %Grb
Shc=IN(21); %Shc
SOS=IN(22); %SOS
Sh_G_S=IN(23); %Sh-G-S

v1 = k1 * R * EGF - k_1 * Ra;
v2 = k2 * Ra * Ra - k_2 * R2;
v3 = k3 * R2 - k_3 * RP;
v4 = V4 * RP / (K4 + RP);
v5 = k5 * RP * PLCgamma - k_5 * R_PL;
v6 = k6 * R_PL - k_6 * R_PLP;
v7 = k7 * R_PLP - k_7 * RP * PLCgammaP;
v8 = V8 * PLCgammaP / (K8 + PLCgammaP);
v9 = k9 * RP * Grb - k_9 * R_G;
v10 = k10 * R_G * SOS - k_10 * R_G_S;
v11 = k11 * R_G_S - k_11 * RP * G_S;
v12 = k12 * G_S - k_12 * Grb * SOS;
v13 = k13 * RP * Shc - k13 * R_Sh;
v14 = k14 * R_Sh - k_14 * R_ShP;
v15 = k15 * R_ShP - k_15 * ShP * RP;
v16 = V16 * ShP / (K16 + ShP);
v17 = k17 * R_ShP * Grb - k_17 * R_Sh_G;
v18 = k18 * R_Sh_G - k_18 * RP * Sh_G;
v19 = k19 * R_Sh_G * SOS - k_19 * R_Sh_G_S;
v20 = k20 * R_Sh_G_S - k_20 * Sh_G_S * RP;
v21 = k21 * ShP * Grb - k_21 * Sh_G;
v22 = k22 * Sh_G * SOS-k_22*Sh_G_S;
v23 = k23 * Sh_G_S - k_23 * ShP * G_S;
v24 = k24 * R_ShP * G_S - k_24 * R_Sh_G_S;
v25 = k25 * PLCgammaP - k_25 * PLCgammaP_I;

f(1)=-v1;
f(2)=-v1;
f(3)=v1-2*v2;
f(4)=v2+v4-v3;
f(5)=v3+v7+v11+v15+v18+v20-v4-v5-v9-v13;
f(6)=v5-v6;
f(7)=v6-v7;
f(8)=v9-v10;
f(9)=v10-v11;
f(10)=v13-v14;
f(11)=v14-v24-v15-v17;
f(12)=v17-v18-v19;
f(13)=v19-v20+v24;
f(14)=v11+v23-v12-v24;
f(15)=v15+v23-v21-v16;
f(16)=v18+v21-v22;
f(17)=v8-v5;
f(18)=v7-v8-v25;
f(19)=v25;
f(20)=v12-v9-v17-v21;
f(21)=v16-v13;
f(22)=v12-v10-v19-v22;
f(23)=-v23+v20+v22;