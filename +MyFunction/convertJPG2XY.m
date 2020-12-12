function SeriesData = convertJPG2XY(JPGFilePath)
%CONVERTJPG2XY JPGÇXYånóÒÉfÅ[É^Ç÷
% 
A = imread(JPGFilePath);
B = rgb2gray(A);
% imshow(B)

XSize=size(B,1);
YSize=size(B,2);

%Base
Output = [];
cnt =1;

%get Pixcel 
for  Y=1:YSize
    for X=1:XSize
        if B(X,Y) <= 125
            Output(cnt,1:2) = [X,Y];
            cnt = cnt + 1;
        end
    end
end

Output(:,1) = Output(:,1) -mean(Output(:,1));
Output(:,2) = Output(:,2) -mean(Output(:,2));

%Sort by angle
Output(:,3) = angle(Output(:,1)+1i.*Output(:,2)); 
Output = sortrows(Output,3);

SeriesData = [Output(:,2) -1*Output(:,1)]; %Transporse Data


end

