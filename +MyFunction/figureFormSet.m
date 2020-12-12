function figureFormSet(Fontsize)
%FIGUREFORMSET 図のデフォルトを設定する
% set:      figureFormSet(Fontsize); ex figureFormSet(14);
% reset:    figureFormSet('default');

% y2_o3 wrote this file.
% 
% As long as you retain this notice you can do whatever you want
% with this stuff. If we meet some day, and you think this stuff
% is worth it, you can buy me a ** sushi ** in return.

if isnumeric(Fontsize) && Fontsize > 0
    setStyle(Fontsize);
elseif strcmp(Fontsize,'default') || strcmp(Fontsize,'Default')
    resetStyle();
else
    disp('Error@figureFormSet:Quit')
    return;
end

end

function setStyle(Fontsize)

% =======Plz Change This Area=============
% Initial setting
AxesColor = [0.5,0.5,0.5]; %Axes Color 
LineStylemap = {'-','--',':','-.','-.'};
Colormap = [0 51/255 153/255]; %PanaBlue

% Colormap = [0    0.4470    0.7410;
%     0.8500    0.3250    0.0980;
%     0.9290    0.6940    0.1250;
%     0.4940    0.1840    0.5560;
%     0.4660    0.6740    0.1880;
%     0.3010    0.7450    0.9330;
%     0.6350    0.0780    0.1840];
% ========================================

%BackGround
set(groot,'defaultFigureColor',[1 1 1])

%Font
set(groot,'defaultAxesFontSize',Fontsize);
set(groot,'defaultAxesFontName','Meiryo UI');

%Grid
set(groot,'defaultAxesXGrid','on');
set(groot,'defaultAxesYGrid','on');
set(groot,'defaultAxesZGrid','on');
set(groot,'defaultAxesGridLineStyle' ,':');

%Axes
set(groot,'defaultTextFontSize',16);
set(groot,'defaultAxesLineWidth',1);

%Axes Color
set(groot,'defaultAxesXColor',AxesColor);
set(groot,'defaultAxesYColor',AxesColor);
set(groot,'defaultAxesZColor',AxesColor);

%Title and Legend Color
set(groot,'defaultTextColor',AxesColor);

%Plot Line Style
set(groot,'defaultLineLineWidth',1.5);
set(groot,'defaultAxesColorOrder',Colormap); %Color
set(groot,'defaultAxesLineStyleOrder',LineStylemap); %LineStyle

end


function resetStyle()
%BackGround
set(groot,'defaultFigureColor','default')
%Font
set(groot,'defaultAxesFontSize','default');
set(groot,'defaultAxesFontName','default');

%Grid
set(groot,'DefaultAxesXGrid','default');
set(groot,'DefaultAxesYGrid','default');
set(groot,'defaultAxesZGrid','default');
set(groot,'defaultAxesGridLineStyle' ,'default');

%Axes
set(groot,'defaultTextFontSize','default');
set(groot,'defaultAxesLineWidth','default');

%Axes Color
set(groot,'defaultAxesXColor','default');
set(groot,'defaultAxesYColor','default');
set(groot,'defaultAxesZColor','default');

%Title and Legend Color
set(groot,'defaultTextColor','default');

%Plot Line Style
set(groot,'defaultLineLineWidth','default');
set(groot,'defaultAxesColorOrder','default'); %Color
set(groot,'defaultAxesLineStyleOrder','default'); %LineStyle

end
