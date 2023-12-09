%入力側インピーダンスZinと　出力側インピーダンスZoutを計算し
% Zout / Zin を伝達特性とする。
clear all


%% パラメータ
SimTime = 1;
SampleTime = 1e-6;

L1 = 1e-3;
L2 = 2e-3;
C1 = 1e-3;
C2 = 1e-3;
R  = 0.1;

Freq =logspace(0,5,10000); %解析周波数


%% 理論式
% L1 = 1e-3;
% L2 = 2e-3;
% C1 = 1e-3;
% C2 = 1e-3;
% sys =  tf([1],[C1*C2*L1*L2, 0, (C1*L1 + C2*L1 +C2*L2), 0, 1]);

sys =  tf([1], [C1*C2*L1*L2, C1*C2*L1*R+C1*C2*L2*R ,C1*C2*R^2+C1*L1+C2*L1+C2*L2,C1*R+2*C2*R,1]);
% ,1
% 
% sys = tf([1],[R*C, 1]);

[mag,phase,wout] = bode(sys,Freq*2*pi); %入力はradian
mag = squeeze(mag);
phase = squeeze(phase);
% 
% Cutoff_Freq  = 1/(2*pi*R*C); %159Hz 
% 

%% 波形演算
sim("SimTF.slx");
[Vin_f,Vin_pow,Vin_phase ] = fftFitSampling(Vin,1/SampleTime);
[Vout_f,Vout_pow,Vout_phase ] = fftFitSampling(Vout,1/SampleTime);

Vtf = Vout_pow./Vin_pow;



%% Matlabモデルからインピーダンス読み込み
Z_data = power_zmeter('SimTF',Freq); %1Hz - 10^5　Hzまで %最後のslxはつけない

%Zin 
% Freq  = Z_data.Freq;
Gain_in = abs( Z_data.Z(:,1) );
Phase_in = angle( Z_data.Z(:,1) )/pi*180;

%Zout
Gain_out = abs( Z_data.Z(:,2) );
Phase_out = angle( Z_data.Z(:,2) )/pi*180;

%% 描画して比較
close all
figure(1)
subplot 311
semilogx(Freq,20*log10([Gain_out./Gain_in]),...
    Vin_f, 20*log10(Vtf),...
    wout/2/pi, 20*log10(mag));

subplot 312
plot(tout, Vin)

subplot 313
plot(tout, Vout)

figure(2)
subplot 311
plot(Vin_f,Vin_pow)

subplot 312
plot(Vout_f,Vout_pow)





% close all
% figure()
% subplot 211
% semilogx(Freq,20*log10([Gain_out./Gain_in]),wout/2/pi, 20*log10(mag), ...
%     [Cutoff_Freq Cutoff_Freq],[0 -60],... %カットオフ周波数
%     [10 10000],[-3 -3]... % -3dBライン
%     );
% 
% subplot 212
% semilogx(Freq,Phase_out - Phase_in,wout/2/pi,phase,...
%     [Cutoff_Freq Cutoff_Freq],[0 -90],... %カットオフ周波数
%     [10 10000],[-45 -45]) % -3dBライン)
% ylim([-90 90])
