clc
clear
close all

ParSt = MyObject;
ParUnst = MyObject;

ParSt.a0 = -0.5;
ParSt.b0 = 1;
ParSt.am = -5; 
ParSt.bm = 5;
ParSt.p = 2;
ParSt.ga = 10;
ParSt.gb = 10;

ParUnst.a0 = 0.5;
ParUnst.b0 = 1;
ParUnst.am = -5;
ParUnst.bm = 5;
ParUnst.p = 2;
ParUnst.ga = 1;
ParUnst.gb = 1;

ka = (ParSt.am - ParSt.a0)/ParSt.b0
kb = (ParSt.bm - ParSt.b0)/ParSt.b0

sim('model.slx')
figure
hold on
grid
plot(ans.plant(:,1),ans.plant(:,2))
plot(ans.ref(:,1),ans.ref(:,2))
legend('plant','ref')

figure
hold on
grid
plot(ans.ka.time, ans.ka.signals.values)
plot(ans.kb.time, ans.kb.signals.values)
legend('k_{a}','k_{b}')