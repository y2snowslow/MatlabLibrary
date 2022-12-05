function [PF] = get_power_factor(V,I)
%get_power_factor �L���d�͂��v�Z����\�t�g
%  input:       V       ����@�@�d�����n��f�[�^(V)
%               I       ����@�@�d�����n��f�[�^(A)
%               
%  Output       PF      ����@�@�S�g�����g�c�@��fpow_1-40 / ��fpow_2-40
% 
%  needs:       singla processing toolbox
% 

% 221204 ver 1.0 �쐬
apparent_power = rms(V)*rms(I);
real_power = mean(V.*I);

PF = real_power/apparent_power;
end

