
clear all
close all

%parameter
sample_time = 1e-6; %sec

%�����ݒ�
Vdc = 800; % Volt
C2 = 100e-6;
Fsw = 10e3; %Hz


%���[�^�萔
Ra = 50e-3;
L = 200e-6;

%SW����
P1sw = 0;
P2sw = 0;
Nsw= 1; % Nsw_on


%���[�v�ݒ�
Nsw_list = [ 0, 1]; % ON,OFF
L_list = 1e-6*[ 1, 10 , 50, 100, 200, 500, 1000]; % uH
C2_List = 1e-6*[1,2, 5, 10, 50, 100, 300];


% Simulink���f���̃p�X
model = 'Ytest';

% �e�ݒ�̃��[�v
for Nsw = Nsw_list
    for L = L_list
        for C2 = C2_List
            % Simulink�p�����[�^�̐ݒ�
            Nsw 
            L
            C2 

            % ���f���̃��[�h�ƃV�~�����[�V����
            load_system(model);
            sim(model);

            % ���ʂ̕ۑ�
            % �t�@�C�����̐����FNsw�AL�AC2�̒l���܂�
            filename = sprintf('Result_Nsw%d_L_%g_C2_%g.mat', Nsw, L*1e6, C2*1e6); % L��C2�̓ʒP�ʂŕ\��
            % �ϐ������w�肵�ĕۑ��������ꍇ�́Asave�֐��ɕϐ����𕶎���Ƃ��Ēǉ�
            save(filename); % �ۑ��������ϐ��̖��O���w��
        end
    end
end




