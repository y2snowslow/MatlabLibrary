clear all

%�ۑ��f�[�^�̍쐬

Time(:,1) = 0:0.2:0.8;
Data(:,1) = 1:2:10;
Data2(:,1) = (1:2:10)*4;


%csv�ŕۑ�
CSVFileName = 'test.csv';

Output = [Time,Data,Data2]; %�z��`���Ɏw��

csvwrite(CSVFileName,Output); %csv�ŏ����o��


%R2019a �ȍ~�Ȃ�writematrix�𐄏�
% Output2.Time = Time;
% Output2.Data = Data;
% Output2.Data2 = Data2;
% 
% writematrix(Output,CSVFileName)


