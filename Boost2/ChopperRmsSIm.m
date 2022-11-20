


clear all
close all

i= 1;

%parameter


%in out
Vin = 50; %V


%P_(s)
L_reactor = 200e-6; %H
R_reactor = 30e-3; %Ohm

C_smooth = 400e-6; %F


%コンポ1
C1 = 200e-6;
C1_ESR = 1e-3;
C1_ESL = 1e-9;

L1   = 1e-6;
L1_R = 1e-3;

%コンポ2
C2 = 1000e-6;
C2_ESR = 1e-3;
C2_ESL = 1e-9;

L2   = 1e-6;
L2_R = 1e-3;

%コンポ３
L_cable = 10e-6;
R_cable = 12e-3;

R_load  = 1.0; %Ohm NonUse
current_source = 5.0;  % A C; Current_source_order

% Controller
FSW = 20e3; %Hz
SW_duty = 0.5; % SW_duty  0 - 1



% Duytyu
% Vac = 100; %Vrms
% Vdc  = 330;%100*sqrt(2)*sqrt(3);%330%330;%100*sqrt(2)*2; %V
% Vdc_offset  = Vdc/2%Vdc/2  - 120%
% Gain = 1.0;
% 
% 
% for D = 0.1:0.05:0.9
%     
%     sim('NormalChopper');
%     
%     %整理
%     Time = Output(:,1);
%     IL = Output(:,2);
%     IL_Cut = Output(Time > 0.28,2);
%     
%     %rms求める
%     Waverms = rms(IL_Cut-mean(IL_Cut));
%     
%     %Ipp求める
%     WaveIpp = max(IL_Cut) - min(IL_Cut);
%     
%     Output2(i,:) = [D,200,1/(1-D)*200,Waverms,WaveIpp];
%     i = i+1;
%     
%     
%     figure(i)
%     plot(Time,IL);
% end
