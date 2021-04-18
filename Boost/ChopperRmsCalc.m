
clear all
close all

Ts = 1/(20*10^3); %sec
VL = 200;
% VH = 400;
L = 50*10^-6; %H

Sampling = 0.01*10^-6; %sec

t(:,1) = 0:Sampling:Ts - Sampling;

%%

i=1;
for D = 0.1:0.05:0.9
%     D=0.1;
    VH = 1/(1-D)*VL;
   
    %îgå`çÏÇÈ
    Wave = zeros(length(t),1);

    Wave1 = VL/L*t;
    Wave2 = -(VH-VL)/L*t+ VH/L*D*Ts;
%     plot(t,[Wave1,Wave2])
    
    Wave(t <= D*Ts) = Wave1(t <= D*Ts);
    Wave(t > D*Ts) = Wave2(t > D*Ts);
    Wave = Wave -mean(Wave);
    
    
    subplot 211
    plot(t,Wave);hold on
    
    %rmsãÅÇﬂÇÈ
    Waverms = rms(Wave);
    
    %IppãÅÇﬂÇÈ
    WaveIpp = max(Wave) - min(Wave);
    
    Output(i,:) = [D,VL,VH,Waverms,WaveIpp];
    i = i+1;
    
%     L =111;
end

subplot 212
plot(Output(:,1),Output(:,4));


   
    