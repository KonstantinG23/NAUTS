clc
clear
close all
set([figure(1)], 'WindowStyle', 'Docked');
p = 0.5;
J1 = 0.005;
J2 = 0.1;
R = 2;
ke = 1;
km = 1;
L = 0.01;
w0 = 1;
A = [0 1/J2 0 0; -p 0 p 0; 0 -1/J1 0 km/J1; 0 0 -ke/L -R/L];
b = [0; 0; 0; 1/L];
C = [1 0 0 0];
P = [-w0 -w0 -w0 -w0];
k = acker(A,b,P);
kn = 1/(-C/(A-b*k)*b);
ga = diag([100,100,100,100]);
gb = 100;
Am = A - b*k;
Bm = b;
Q1 = diag([1,1,1,1]);
Q2 = diag([100,10,10,100]);
Q3 = diag([1000,1,1,1]);
P1 = lyap(Am',Q1);
P2 = lyap(Am',Q2);
P3 = lyap(Am',Q3);
P = P3;
sim("model.slx");