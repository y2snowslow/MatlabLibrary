function [THD, THD_frequency] = getTHD(time_series_data,sampling_Hz,hamonic_order)
%getTHD ���n��f�[�^����THD���v�Z����\�t�g
%  input:       time_series_data�@�@����@�@���n��f�[�^�̔z��
%               sampling_Hz         ����@�@�T���v�����O���g��(Hz)
%               hamonic_order       ����@�@�l���ɓ���鍂���g�̎����B��{40�������Ă����B
% 
%  Output       THD                 ����@�@�S�g�����g�c�@��fpow_1-40 / ��fpow_2-40
%               THD_frequency       ����@�@��{�g�̎��g��(Hz)
% 
%  needs:       singla processing toolbox
% 

% 221204 ver 1.0 �쐬
[~, arms_dB, freq_list] = thd(time_series_data,sampling_Hz,hamonic_order); %40���܂Ō���B
amp_data = 10.^(arms_dB/20); %dB�������l�ւ̕ϊ�

THD =  sum(amp_data(2:end)) / sum(amp_data) ;
THD_frequency = freq_list(1);

end

