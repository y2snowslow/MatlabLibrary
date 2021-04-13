clear all

%保存データの作成

Time(:,1) = 0:0.2:0.8;
Data(:,1) = 1:2:10;
Data2(:,1) = (1:2:10)*4;


%csvで保存
CSVFileName = 'test.csv';

Output = [Time,Data,Data2]; %配列形式に指定

csvwrite(CSVFileName,Output); %csvで書き出し


%R2019a 以降ならwritematrixを推奨
% Output2.Time = Time;
% Output2.Data = Data;
% Output2.Data2 = Data2;
% 
% writematrix(Output,CSVFileName)


