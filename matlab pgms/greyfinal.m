close all;
clear all;
%%%%%% Localization of Disc


%%% Read Input Image
myImage = imread('D:\mini project\1 NTFS\LostFiles1\DRISHTI_GS\Drishti-GS1_files\Training\Images\drishtiGS_007.png');
%%

figure
subplot(1,3,1);
imshow(myImage);
title('Original Image');


%%% RGB to Gray Image
subplot(1,3,2);
grayScaleImage = rgb2gray(myImage);
imshow(grayScaleImage);
title('Grayscale Image');

%%% Find p% of bright the pixels in the IMage
p=1;     %% percentage of bright pixels to be selected
n=(size(grayScaleImage,1)*size(grayScaleImage,2)*p)/100;%%finding NUMBER OF P% OF BRIGHT PIXELS

counter=0;
[count,graylevel]=imhist(grayScaleImage);
for i=255:-1:1
counter=counter+(count(i));
if (counter>n)
break;
end;
end;


%%% creating binary image of the p% bright pixels in the image
bwimage=zeros(size(grayScaleImage,2),size(grayScaleImage,1));
for x=1:size(grayScaleImage,1)
    for y=1:size(grayScaleImage,2)
        if(grayScaleImage(x,y)>graylevel(i));
            bwimage(x,y)=1;
        else
            bwimage(x,y)=0;
        end
        
    end
end
figure,imshow(bwimage);

% %to select pixels
% figure; fid=imagesc(grayScaleImage);
% axis image;
% title('click on the mouse to hold and drag');
% m=imfreehand();
% maskImg=m.createMask;
% figure;imagesc(maskImg);colormap g ray;axis image;
% amountIncrease=255/2;
% alphaImg(2,3,1)=zeros(size(maskImg));
% alphaImg(2,3,2)=round(maskImg*(amountIncrease));
% alphaImg(2,3,3)=zeros(size(maskImg));
% alphaImg=unit8(alphaImg);
% figure;imagesc(alphaImg);axis image;
% blendImg=grayScaleimage+alphaImg;
% figure;imagesc(blendImg);axis image;
% 
% %dividing image into equal parts
