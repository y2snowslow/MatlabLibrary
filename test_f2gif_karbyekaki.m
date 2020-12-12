close all;
close all


Body = MyFunction.convertJPG2XY('./images/karbybody.jpg');
EyeL = MyFunction.convertJPG2XY('./images/karbyeyel.jpg');
EyeR = MyFunction.convertJPG2XY('./images/karbyeyer.jpg');
Mouth = MyFunction.convertJPG2XY('./images/karbymouth.jpg');
% hand = MyFunction.convertJPG2XY('./images/karbyhand.jpg');
hand1 = MyFunction.convertJPG2XY('./images/karbyhand1.jpg');
hand2 = MyFunction.convertJPG2XY('./images/karbyhand2.jpg');
hand3 = MyFunction.convertJPG2XY('./images/karbyhand3.jpg');
cheek = MyFunction.convertJPG2XY('./images/karbycheek.jpg');
hokuto = MyFunction.convertJPG2XY('./images/hokutonoken.jpg');

%Adjust Position
EyeL(:,1) = EyeL(:,1)-20;
EyeL(:,2) = EyeL(:,2)+50;
EyeR(:,1) = EyeR(:,1)+20;
EyeR(:,2) =EyeR(:,2)+50;
Mouth(:,2) =Mouth(:,2)+15;
% hand(:,1) = hand(:,1)-10;
% hand(:,2) = hand(:,2)-25;
hand1(:,1) = hand1(:,1)-92;
hand1(:,2) = hand1(:,2)+9;
hand2(:,1) = hand2(:,1) -55;
hand2(:,2) = hand2(:,2) -59;
hand3(:,1) = hand3(:,1) +65;
hand3(:,2) = hand3(:,2) -11;
cheek(:,2) = cheek(:,2)+25;
hokuto(:,1) = hokuto(:,1)+4;
hokuto(:,2) = hokuto(:,2)+19;

imageList = {};
imageIndex = 1;

fig=figure(1);
set(groot,'defaultAxesColorOrder',[0 0 0]); %Color
set(groot,'defaultAxesFontSize',20);
set(groot,'defaultAxesFontName','Meiryo UI');
% fig.axes.XTickLabel = [];

%=========================
% まるかいて
%=========================
FrameSpeed = 20; %Frame/2sec
Comment = 'ま　る　か　い　て';
for j= 1:20
    i=1+floor(length(Body)/FrameSpeed)*j;
    if i >length(Body)
        i = length(Body);
    end
    %plot
    plot(Body(1:i,1),Body(1:i,2),'.');hold on;
    plot(Body(i,1),Body(i,2),'mh','MarkerSize',10,'LineWidth',3);hold off
    %DisplaySetting
    xlim([-150 150]);ylim([-150 150]);xticklabels({});yticklabels({})
    
    %UnderComment
    k = ceil(j/2);
    if k > length(Comment)
        k = length(Comment);
    end
    xlabel(Comment(1:k));
    
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
end

%Pause
for i = 1:10
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
end


%=========================
% おまめがふたつ
%=========================
FrameSpeed = 20; %Frame/2sec
Comment = 'お　ま　め　が　ふ　た　つ';
EyeRFlag = false;
for j= 1:length(Comment)*2
    i=1+floor((length(EyeL)+length(EyeR))/FrameSpeed)*j;
    if i >length(EyeL)+length(EyeR)
        i = length(EyeR);
    elseif i >length(EyeL)
        i = i  - length(EyeL);
        EyeRFlag = true;
    end
    %plot
    plot(Body(:,1),Body(:,2),'.');hold on;
    if EyeRFlag
        plot(EyeL(:,1),EyeL(:,2),'.');hold on;
        plot(EyeR(1:i,1),EyeR(1:i,2),'.');
        plot(EyeR(i,1),EyeR(i,2),'mh','MarkerSize',10,'LineWidth',3);hold off
    else
        plot(EyeL(1:i,1),EyeL(1:i,2),'.');
        plot(EyeL(i,1),EyeL(i,2),'mh','MarkerSize',10,'LineWidth',3);hold off
    end
    
    %DisplaySetting
    xlim([-150 150]);ylim([-150 150]);xticklabels({});yticklabels({})
    
    %UnderComment
    k = ceil(j/2);
    if k > length(Comment)
        k = length(Comment);
    end
    
    xlabel(Comment(1:k));
    
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
    
end

%Pause
for i = 1:10
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
end

%=========================
% おむすびひとつ
%=========================
FrameSpeed = 20; %Frame/2sec
Comment = 'お　む　す　び　ひ　と　つ';
EyeRFlag = false;
for j= 1:length(Comment)*2
    i=1+floor(length(Mouth)/FrameSpeed)*j;
    if i >length(Mouth)
        i = length(Mouth);
    end
    %plot
    plot(Body(:,1),Body(:,2),'.');hold on;
    plot(EyeL(:,1),EyeL(:,2),'.');
    plot(EyeR(:,1),EyeR(:,2),'.');
    plot(Mouth(1:i,1),Mouth(1:i,2),'.');
    plot(Mouth(i,1),Mouth(i,2),'mh','MarkerSize',10,'LineWidth',3);hold off
    
    %DisplaySetting
    xlim([-150 150]);ylim([-150 150]);xticklabels({});yticklabels({})
    
    %UnderComment
    k = ceil(j/2);
    if k > length(Comment)
        k = length(Comment);
    end
    
    xlabel(Comment(1:k));
    
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
    
end

%Pause
for i = 1:15
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
end

%=========================
%　あっというまに
%=========================
FrameSpeed = 20; %Frame/2sec
Comment = 'あ　っ　と　い　う　ま　に';
FlameSize = length(hand1) + length(hand2) + length(hand3) + length(cheek);
hand2Flag = false;
hand3Flag = false;
cheekFlag = false;
for j= 1:length(Comment)*2
    i=1+floor(FlameSize/FrameSpeed)*j;
    if i > FlameSize
        i = length(cheek);
    elseif i >  length(hand1) + length(hand2) + length(hand3)
        i = i-length(hand1) - length(hand2) - length(hand3);
        cheekFlag = true;
    elseif i >  length(hand1) + length(hand2)
        i = i-length(hand1) - length(hand2);
        hand3Flag = true;
    elseif i > length(hand1)
        i = i-length(hand1);
        hand2Flag = true;
    end
    %plot
    plot(Body(:,1),Body(:,2),'.');hold on;
    plot(EyeL(:,1),EyeL(:,2),'.');
    plot(EyeR(:,1),EyeR(:,2),'.');
    plot(Mouth(:,1),Mouth(:,2),'.');
    
    if cheekFlag
        plot(hand1(:,1),hand1(:,2),'.');
        plot(hand2(:,1),hand2(:,2),'.');
        plot(hand3(:,1),hand3(:,2),'.');
        plot(cheek(1:i,1),cheek(1:i,2),'.');
        plot(cheek(i,1),cheek(i,2),'mh','MarkerSize',10,'LineWidth',3);hold off
        
    elseif hand3Flag
        plot(hand1(:,1),hand1(:,2),'.');
        plot(hand2(:,1),hand2(:,2),'.');
        plot(hand3(1:i,1),hand3(1:i,2),'.');
        plot(hand3(i,1),hand3(i,2),'mh','MarkerSize',10,'LineWidth',3);hold off
        
    elseif hand2Flag
        plot(hand1(:,1),hand1(:,2),'.');
        plot(hand2(1:i,1),hand2(1:i,2),'.');
        plot(hand2(i,1),hand2(i,2),'mh','MarkerSize',10,'LineWidth',3);hold off 
        
    else
        plot(hand1(1:i,1),hand1(1:i,2),'.');
        plot(hand1(i,1),hand1(i,2),'mh','MarkerSize',10,'LineWidth',3);hold off
    end
    
    %DisplaySetting
    xlim([-150 150]);ylim([-150 150]);xticklabels({});yticklabels({})
    
    %UnderComment
    k = ceil(j/2);
    if k > length(Comment)
        k = length(Comment);
    end
    
    xlabel(Comment(1:k));
    
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
end

%Pause
for i = 1:20
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
end

%=========================
%　ほくとのけん
%=========================
FrameSpeed = 20; %Frame/2sec
Comment = 'ほ　く　と　の　け　ん';
for j= 1:length(Comment)*2
    %plot
    plot(Body(:,1),Body(:,2),'.');hold on;
    plot(EyeL(:,1),EyeL(:,2),'.');
    plot(EyeR(:,1),EyeR(:,2),'.');
    plot(Mouth(:,1),Mouth(:,2),'.');
    plot(hand1(:,1),hand1(:,2),'.');
    plot(hand2(:,1),hand2(:,2),'.');
    plot(hand3(:,1),hand3(:,2),'.');
    plot(cheek(:,1),cheek(:,2),'.');
    
    %DisplaySetting
    xlim([-150 150]);ylim([-150 150]);xticklabels({});yticklabels({})
    
    %UnderComment
    k = ceil(j/2);
    if k > length(Comment)
        k = length(Comment);
    end
    
    xlabel(Comment(1:k));
    
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
end

%Pause
for i = 1:20
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
end

%=========================
%　ほくとのかーびぃ全部
%=========================
for i = 1:20
    %plot
    plot(hokuto(:,1),hokuto(:,2),'.');hold off;
    plot(hokuto(:,1),hokuto(:,2),'.');hold on;
    %DisplaySetting
    xlim([-150 150]);ylim([-150 150]);xticklabels({});yticklabels({});
    
    %UnderComment
    xlabel(Comment);
    
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
end

%Pause
for i = 1:20
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
end


%===========================
%　ほくとのかーびぃ徐々に拡大
%===========================
x1 = -150;
x2 = 150;
y1 = -150;
y2 = 150;
for i = 1:100
    %Zoom
    x1 = x1 + 80  /100;
    x2 = x2 - 140 /100;
    y1 = y1 + 138 /100;
    y2 = y2 - 82 /100;

    %plot
    plot(hokuto(:,1),hokuto(:,2),'.');hold off;
    plot(hokuto(:,1),hokuto(:,2),'.');hold on;
    %DisplaySetting
    xlim([x1 x2]);ylim([y1 y2]);xticklabels({});yticklabels({});
    
    %UnderComment
    xlabel(Comment);
    
    %get frame
    frame = getframe(fig);
    imageList{imageIndex} = frame2im(frame);
    imageIndex = imageIndex + 1;
end


%=========================
% Gifアニメーション作成
%=========================
MyFunction.figure2GifAnimation('karby.gif',imageList,1/FrameSpeed)
