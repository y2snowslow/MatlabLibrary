clear all
% close all
clc

freq(:,1) = logspace(2,8,1000);
omega = 2*pi*freq;


C1 = 5.5*10^-9; 
L1 = 540*10^-8;
R1 = 14.8;

%Serial
Z1 = R1+ 1i*omega*L1 - 1./ - 1i*1./(C1*omega);

C2 = 4.5*10^-9; 
R2 = 23.3;

%Pallarel  
% Z2 = R2./( 1i*C2*R2*omega + 1);
Z2 = 1./( 1i*C2*omega )+R2;
Z3 = 1./( 1i*9.6*10^-9*omega );

% %Parallel 
% R = 10;
% L = 5*10^-6;
% C = 20*10^-9; 

% Z2 =omega.*L*R./(1i*(C*L*R*omega.*omega-R)+L.*omega);



%2インピーダンスの合計
absZ1 = abs(Z1);
absZ2 = abs(Z2);
absZ3 = abs(Z3);
% absZ1plusZ2  = abs(Z1+Z2); %直列
absZ1plusZ2 = abs(Z1.*Z2./(Z1+Z2)); %並列

ax1=subplot(211);
loglog(freq,absZ1,freq,absZ2);grid on;


ax2=subplot(212);
loglog(freq,absZ1plusZ2,freq,absZ3);grid on;

linkaxes([ax1,ax2],'xy');

xlim([1*10^3 100*10^6]);
ylim([0.1 100000]);

% 
% subplot 313
% loglog(freq,absZ)


