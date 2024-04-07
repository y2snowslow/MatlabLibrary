
clear all
close all

%parameter
sample_time = 1e-6; %sec

%初期設定
Vdc = 800; % Volt
C2 = 100e-6;
Fsw = 10e3; %Hz


%モータ定数
Ra = 50e-3;
L = 200e-6;

%SW動作
P1sw = 0;
P2sw = 0;
Nsw= 1; % Nsw_on


%ループ設定
Nsw_list = [ 0, 1]; % ON,OFF
L_list = 1e-6*[ 1, 10 , 50, 100, 200, 500, 1000]; % uH
C2_List = 1e-6*[1,2, 5, 10, 50, 100, 300];


% Simulinkモデルのパス
model = 'Ytest';

% 各設定のループ
for Nsw = Nsw_list
    for L = L_list
        for C2 = C2_List
            % Simulinkパラメータの設定
            Nsw 
            L
            C2 

            % モデルのロードとシミュレーション
            load_system(model);
            sim(model);

            % 結果の保存
            % ファイル名の生成：Nsw、L、C2の値を含む
            filename = sprintf('Result_Nsw%d_L_%g_C2_%g.mat', Nsw, L*1e6, C2*1e6); % LとC2はμ単位で表示
            % 変数名を指定して保存したい場合は、save関数に変数名を文字列として追加
            save(filename); % 保存したい変数の名前を指定
        end
    end
end




