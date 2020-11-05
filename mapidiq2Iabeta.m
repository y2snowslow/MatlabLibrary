function [map_Iabeta,varargout] = mapidiq2Iabeta(Map_idiq,id,iq,Ia,beta)
%MAPIDIQ2IABETA Map_idiq ���@Ia  beta �̊֐��Ƃ��ă��T���v�����O
% allcomb.m ���K�v


%�c������SeriesData��
Series_idiq = allcomb(id,iq);
Series_Iabeta = allcomb(Ia,beta);

%Map_idiq��SeriesData��
Series_Map_idiq = reshape(Map_idiq,size(Map_idiq,1)*size(Map_idiq,2),1); 

%�@��������Ia.beta�@�� id,iq �֕ύX
Iabeta2idiq = [Series_Iabeta(:,1).*sin(deg2rad(Series_Iabeta(:,2)))*-1,Series_Iabeta(:,1).*cos(deg2rad(Series_Iabeta(:,2))) ];

% griddata�ŕۊ�
[Series_map_Iabeta] = griddata(Series_idiq(:,1),Series_idiq(:,2),Series_Map_idiq,Iabeta2idiq(:,1),Iabeta2idiq(:,2) );


%�`�悵�Ă��Ƃ̃f�[�^�ƈ�v���邱�Ƃ��m�F
% plot3(Y_idiq(:,1),Y_idiq(:,2),Z_Iabeta,'ro');

map_Iabeta = reshape(Series_map_Iabeta,length(beta),length(Ia));
varargout{1} = [Iabeta2idiq,Series_map_Iabeta];

end

