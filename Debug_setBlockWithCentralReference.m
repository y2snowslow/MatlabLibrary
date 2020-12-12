clear all
close all
clc

TargetJPGfile = 'testpicsmall.jpg';

%Make and Open SystemMode;
slxFileName = regexprep(TargetJPGfile,'.jpg','');
new_system(slxFileName);
open_system(slxFileName);

%read Image and Normalize [0 1];
Image = imread(TargetJPGfile);
for i =1:3
    ImageDouble(:,:,i) = cast(Image(:,:,i)','double')/255; %transpose X,Y
end
ImageSize = zeros( size(Image(:,:,1)) );
height = size(ImageSize,1);
width = size(ImageSize,2);


%Make Simuink model 
for i = 1:length(ImageSize(:))
    %get pixcel Position    
    X=floor((i-1)/height)+1;
    Y=mod((i-1),height)+1;
    
    %SetParameter
    Source  = 'simulink/Sources/Constant';
    Dest  = [slxFileName,'/','MyScope',num2str(X,'%03d'),num2str(Y,'%03d')];
    CenterPos = [40+40*X 80+40*Y];
    
    %getColor like Color as text ex. '[0.1 0,2 0.3]' ,'[r,g,b]'
    Color = ['[',...
        num2str(ImageDouble(X,Y,1)),' ',...
        num2str(ImageDouble(X,Y,2)),' ',...
        num2str(ImageDouble(X,Y,3)),...
        ']'];
    %SetConstant
    MyFunction.setBlockWithCentralReference(Source,Dest,CenterPos);
    
    %SetBackGroundColor
    set_param(gcb,'BackgroundColor',Color);

    %Process Ratio
    disp([num2str(i/(height*width)*100),'% Complete Process']);
end

%Save Simulink model
save_system(slxFileName);