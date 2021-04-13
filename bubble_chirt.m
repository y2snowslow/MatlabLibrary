function figure_handler = bubble_chirt(x,y,amount,marker_size,varargin)
%BUBBLE_CHIRT この関数の概要をここに記述
%   詳細説明をここに記述

if length(x) ~= length(y)...
        || length(y) ~= length(amount)...
        || marker_size < 0
    disp('data size is mismatch.quit bubble_chirt');
    disp('maybe marker size is less than 0');
    return;
end

% make bubble chirt 
figure_handler = figure();

if nargin >= 5
    for i = 1:length(x)
        scatter(x(i),y(i),amount(i)*marker_size,'b');hold on;grid on
    end
else
    for i = 1:length(x)
        scatter(x(i),y(i),amount(i)*marker_size,'b','filled');hold on;grid on
    end
end


end

