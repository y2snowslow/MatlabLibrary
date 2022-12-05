clear all
close all
clc 


RL = 20*10^-3;
L = 200*10^-6;
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
% 
% omega = 2*pi*3000;
% Kp =  L*omega/Vbus;
% Ki =  RL*omega/Vbus;


C = pidtune(sys_muda*sys_plant,'PI',2*pi*2000);

% sisotool(sys_muda*sys_plant,C)


% Ki = C.Ki/Vbus;

Kp = C.Kp;
Ki = C.Ki;


%%
% IL2 = 1/2*sin(2*pi*50.*Time) + 1/2 * sin(2*pi*200.*Time) + 1/2 * sin(2*pi*200.*Time);
% 
% [b,a] = butter(2, 400 / ( 1 / sample_time /2 ) );
% IL2 =filtfilt(b,a, IL1);
% 
% [dB, arms_dB, freq_lsit] = thd(IL2,1/sample_time,40); %40次まで見る。
% amp_data = 10.^(arms_dB/20); %dB→実効値への変換
% THD_percent =  sum(amp_data(2:end)) / sum(amp_data) ;
% 
% disp(THD_percent)
% 
% plot(Time, [IL1, IL2] );

[THD,freq] = MyFunction.getTHD(IL1, 1/sample_time, 40);




% [ harmonicOrder, harmonicMagnitude, fundamentalFrequency ] = ee_getHarmonics( Sinwave );
% thdPercent = ee_calculateThdPercent( harmonicOrder, harmonicMagnitude );
% disp( [ 'Total Harmonic Distortion percentage = ' num2str( thdPercent ), ' %' ] );
% 



