
i_set = 800; % 初期電流
di_dt = 4; %kA/us
t_step = 1e-9 ; %sec
t_st = 50e-9; %折れ曲がり開始点 
t_end = 500e-9; %出力時間

out_current_data = didt_current_waveform(i_set, di_dt, t_step, t_st, t_end);
%描画

close all

plot(out_current_data(:,1),out_current_data(:,2));






