clear all
close all
clc 



RL = 15.3*2*10^-3;
L = 700*10^-6;
Vbus = 400;


sys_filter = tf(1,1);

s = tf('s');


FSW =36000;


sample_time  = 1e-6;
Ts = 1/FSW;



sys_muda = tf([-Ts/2,1],[Ts/2,1]);


% sys = exp(-1/36000*s);    
% sys_muda = pade(sys,4); 
% sys_muda = 1;

sys_plant = tf([Vbus],[L,RL]);
% sys_plant = tf([1],[L,RL]);

% sys_PI = tf([1],[1,1]);
% sys_PI = tf(1);


C = pidtune(sys_muda*sys_plant,'PI',2*pi*5000);

% sisotool(sys_muda*sys_plant,C)


% Ki = C.Ki/Vbus;

Kp = C.Kp
Ki = C.Ki





