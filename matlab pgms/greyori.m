myImage = imread('D:\mini project\1 NTFS\LostFiles1\DRISHTI_GS\Drishti-GS1_files\Training\Images\drishtiGS_035.png');

figure
subplot(1,2,1);
imshow(myImage);
title('Original Image');

subplot(1,2,2);
grayScaleImage = rgb2gray(myImage);
imshow(grayScaleImage);
title('Grayscale Image');