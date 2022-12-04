function [THD, THD_frequency] = getTHD(time_series_data,sampling_Hz,hamonic_order)
%getTHD 時系列データからTHDを計算するソフト
%  input:       time_series_data　　･･･　　時系列データの配列
%               sampling_Hz         ･･･　　サンプリング周波数(Hz)
%               hamonic_order       ･･･　　考慮に入れる高調波の次数。基本40次を入れておく。
% 
%  Output       THD                 ･･･　　全波高調波歪　Σfpow_1-40 / Σfpow_2-40
%               THD_frequency       ･･･　　基本波の周波数(Hz)
% 
%  needs:       singla processing toolbox
% 

% 221204 ver 1.0 作成
[~, arms_dB, freq_list] = thd(time_series_data,sampling_Hz,hamonic_order); %40次まで見る。
amp_data = 10.^(arms_dB/20); %dB→実効値への変換

THD =  sum(amp_data(2:end)) / sum(amp_data) ;
THD_frequency = freq_list(1);

end

