


clear all
close all

i= 1;

for D = 0.1:0.05:0.9
    
    sim('NormalChopper');
    
    %®
    Time = Output(:,1);
    IL = Output(:,2);
    IL_Cut = Output(Time > 0.28,2);
    
    %rmsßé
    Waverms = rms(IL_Cut-mean(IL_Cut));
    
    %Ippßé
    WaveIpp = max(IL_Cut) - min(IL_Cut);
    
    Output2(i,:) = [D,200,1/(1-D)*200,Waverms,WaveIpp];
    i = i+1;
    
    
    figure(i)
    plot(Time,IL);
end
