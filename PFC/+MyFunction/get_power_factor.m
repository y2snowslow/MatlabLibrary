function [PF] = get_power_factor(V,I)
%get_power_factor 有効電力を計算するソフト
%  input:       V       ･･･　　電圧時系列データ(V)
%               I       ･･･　　電流時系列データ(A)
%               
%  Output       PF      ･･･　　全波高調波歪　Σfpow_1-40 / Σfpow_2-40
% 
%  needs:       singla processing toolbox
% 

% 221204 ver 1.0 作成
apparent_power = rms(V)*rms(I);
real_power = mean(V.*I);

PF = real_power/apparent_power;
end

