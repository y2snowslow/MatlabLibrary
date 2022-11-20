


clear all
close all
clc

i= 1;

%parameter
% aaa ="test" 

sample_time = 1e-6; %sec
%in out
Vdc = 50; %V

%0からチャープ信号スタート
phaseInit = -90;
method = 'linear';
chirp_time(:,1) =  0 : sample_time :0.3 - sample_time;
chirp_signal =  chirp(chirp_time,100, 0.3, 50e3,method, phaseInit);

plot(chirp_time, chirp_signal);

% 合体
var_chirp.time = 0 : sample_time :0.3*2 - sample_time;
var_chirp.signals.values =  [chirp_signal; chirp_signal];

%%
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

%%
%Simulation 
sim('TF_Check');

%%
%データ処理

Time_st = find(Time >= 0.3, 1, 'first');
MyFunction.timeSeriesPlot(Time, Iin, IC1, IC2, IC3); 

%%
% plot(Time, Iin)

Iin = Iin(Time_st : end);
IC1 = IC1(Time_st : end);
IC2 = IC2(Time_st : end);
IC3 = IC3(Time_st : end);

[~,P_Iin,~]  = MyFunction.fftFitSampling(Iin,1/sample_time);
[F1,P_IC1,~] = MyFunction.fftFitSampling(IC1,1/sample_time);
[~,P_IC2,~]  = MyFunction.fftFitSampling(IC2,1/sample_time);
[~,P_IC3,~]  = MyFunction.fftFitSampling(IC3,1/sample_time);

% 
% subplot 511
% plot(Time, Iin);

MyFunction.timeSeriesPlot(F1, P_Iin, P_IC1, P_IC2, P_IC3); 

%%
Output = [F1, P_Iin, P_IC1, P_IC2, P_IC3, P_IC1./P_Iin, P_IC2./P_Iin, P_IC3./P_Iin];


% make TF

subplot 411
plot(F1, P_IC1 ./ P_Iin);
xlim([0 20e3]);


subplot 412
plot(F1, P_IC2 ./ P_Iin);
xlim([0 20e3]);

subplot 413
plot(F1, P_IC3 ./ P_Iin);
xlim([0 20e3]);

% 
% subplot 412
% plot(F1,P_Iin);
% 
% subplot 413
% plot(F1,P_IC1);
% 
% subplot 414
% plot(F1,P_IC3);



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
