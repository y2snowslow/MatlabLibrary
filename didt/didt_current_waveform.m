function out_current_data = didt_current_waveform(i_set, di_dt, t_step, t_st, t_end)

% i_set = 800; % 初期電流
% di_dt = 4; %kA/us
% t_step = 1e-9 ; %sec
% t_st = 50e-9; %折れ曲がり開始点 
% t_end = 500e-9; %出力時間

out_current_data  = zeros(round(t_end / t_step)+1, 2);

for i = 1:size(out_current_data,1)


    if(i == 1)%最初

        out_current_data(i,:) = [0, i_set];

    elseif(out_current_data(i-1,1) < t_st)%折れ曲がり開始点まで

        out_current_data(i,:) = [out_current_data(i-1,1) + t_step, ...
            out_current_data(i-1,2)];

    else %折れ曲がり点後

        out_current_data(i,:) = [out_current_data(i-1,1) + t_step, ...
            out_current_data(i-1,2) - ( t_step * di_dt * (1000/(10^-6)) ) ];

    end
end

%最後にゼロ以下を０に補正
out_current_data(out_current_data(:,2) < 0, 2) = 0;
end