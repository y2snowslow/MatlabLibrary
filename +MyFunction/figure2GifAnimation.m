function figure2GifAnimation(FileName,imageList,DelayTime)
%FIGURE2GIFANIMATION imageList(figureの連続）からGifアニメーションを作る
%   FileName = 'test.gif';
%   imageList = img{idx};
%   DelayTime = 1 %sec;
% 
%   how to make imageList
%   fig = figure;
%   frame = getframe(fig);
%   imageList{idx} = frame2im(frame);
%     

% y2_o3 wrote this file.
% 
% As long as you retain this notice you can do whatever you want
% with this stuff. If we meet some day, and you think this stuff
% is worth it, you can buy me a ** sushi ** in return.

%check Name
if ~strcmp(FileName(end-3:end),'.gif')
    FileName = [FileName,'.gif'];
end


%make gif animation 
NumberofImages = length(imageList);

for idx = 1:NumberofImages
    [A,map] = rgb2ind(imageList{idx},256);
    if idx == 1
        imwrite(A,map,FileName,'gif','LoopCount',Inf,'DelayTime',DelayTime);
    else
        imwrite(A,map,FileName,'gif','WriteMode','append','DelayTime',DelayTime);
    end
end

end

