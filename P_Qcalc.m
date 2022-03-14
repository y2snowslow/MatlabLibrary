
clear all

SAMPLING = 1000; %Hz

t(:,1) = 0: 0.00001 :0.5;

theta_rad = pi/6;


V(:,1) = 100*sqrt(2)*cos(2*pi*50*t);

I(:,1) = 15*sqrt(2)*cos(2*pi*50*t - theta_rad);


subplot(311)
plot(t,[V,I]);


% 出力
V_rms = zeros(length(V),1);
I_rms = zeros(length(V),1);
P_rms = zeros(length(V),1);
Q_rms = zeros(length(V),1);
VA_rms = zeros(length(V),1);


%電圧の立ち上がりにtrigger をつける。
%多分ここにノイズ除去がいる。

Trig = find(diff(V >= 0) == 1 ) +1 ;

plot(t,[V,I],t(Trig),V(Trig),'rx');

%平均化処理をする
for i =1 :length(Trig)-1
    mean_V(i,1) = rms( V(Trig(i) : Trig(i+1) -1) );
    mean_I(i,1) = rms( I(Trig(i) : Trig(i+1) -1) );
    mean_P(i,1) = mean( V(Trig(i) : Trig(i+1) -1).* I(Trig(i) : Trig(i+1) -1) ); %有効電力
end

%皮相電力,無効電力を出す。
mean_VA = mean_V .* mean_I ;
mean_Q = sqrt(mean_VA.*mean_VA - mean_P.*mean_P);

%check
% disp VA
% mean_VA(1)
% disp P 
% mean_P(1)
% disp Q
% mean_Q(1)
% 
% disp P_ans
% 100*15*cos(theta_rad)
% 
% 
% disp Q_ans
% 100*15*sin(theta_rad)

%時系列データに換算

for i =1 :length(Trig)-1
    V_rms(  Trig(i) : Trig(i+1) -1 ) =  mean_V(i);
    I_rms(  Trig(i) : Trig(i+1) -1 ) =  mean_I(i);
    P_rms(  Trig(i) : Trig(i+1) -1 ) =  mean_P(i);
    Q_rms(  Trig(i) : Trig(i+1) -1 ) =  mean_Q(i);
    VA_rms( Trig(i) : Trig(i+1) -1 ) =  mean_VA(i);
 
end


%最初と最後を埋める。
V_rms(1:Trig(1) )        = V_rms( Trig(1) );
V_rms(Trig(end)-1 :end ) = V_rms( Trig(end) -1 );

I_rms(1:Trig(1) )        = I_rms( Trig(1) );
I_rms(Trig(end)-1 :end ) = I_rms( Trig(end) -1 );

P_rms(1:Trig(1) )        = P_rms( Trig(1) );
P_rms(Trig(end)-1 :end ) = P_rms( Trig(end) -1 );

Q_rms(1:Trig(1) )        = Q_rms( Trig(1) );
Q_rms(Trig(end)-1 :end ) = Q_rms( Trig(end) -1 );


VA_rms(1:Trig(1) )        = VA_rms( Trig(1) );
VA_rms(Trig(end)-1 :end ) = VA_rms( Trig(end) -1 );


subplot(312)
plot(t,[V_rms,I_rms]);

subplot(313)
plot(t,[P_rms,Q_rms, VA_rms]);



