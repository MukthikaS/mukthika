close all;
clear all;
%%%%%% Localization of Disc
%% to take a folder of images as input
% srcFiles = dir('D:\Images\*.png');  % the folder in which ur images exists
% for i = 1 : length(srcFiles)
%     filename = strcat('D:\Images\',srcFiles(i).name);
%     myImage = imread(filename);
% end
%%% Read Input Image
 myImage = imread('D:\Images\normal eyes\drishtiGS_081.png');
figure,imshow(myImage);
figure
subplot(1,3,1);

title('Original Image');
myImage(:,:,1);


%%% RGB to Gray Image
%subplot(1,3,2);
grayScaleImage = rgb2gray(myImage);
a=grayScaleImage;
% figure,imshow(grayScaleImage);
grayScaleImage=histeq(grayScaleImage);
% imhist(grayScaleImage);
subplot (2,4,1),imshow(myImage),title('Original Image');
subplot (2,4,2),imshow(a),title('grayScaleImage');
subplot (2,4,3),imhist(a),title('Histogram');
subplot (2,4,4),imhist(grayScaleImage,16),title('Normalized Histogram');

% % % candidate pixels for optic disk
bwimage=selected_region(grayScaleImage);
% figure,imshow(bwimage);
bwimage1=imdilate(bwimage,strel('disk',3));
bwimage1=imdilate(bwimage1,strel('disk',3));
bwimage1=imdilate(bwimage1,strel('disk',3));
title('Candidate pixels of the optic disk');
% figure,imshow(bwimage1);
subplot (2,4,5),imshow(bwimage),title('Binary Image');
subplot (2,4,6),imshow(bwimage1),title('Dialated Binary Image'); 
stats=regionprops(bwimage1,'Centroid');
subplot (2,4,7),imshow(myImage),title('Dialated Binary Image'),hold on; 
% figure,imshow(myImage),hold on;
centroids = cat(1, stats.Centroid);
  
   plot(centroids(:,1), centroids(:,2), 'k')
   hold off
CIRCLE_DRAW(centroids(:,1),centroids(:,2),240);
 clear bwimage2;
 bwimage2=ROI_FILL1(bwimage1,centroids(:,1),centroids(:,2),240);
imwrite(bwimage2,'D:\Images\experimentally segmented eyes\081_output.png');
subplot (2,4,8),imshow(bwimage2),title('Dialated Binary Image'),hold on; 
% figure,imshow(bwimage2);
% rgboutput=ROI_FILL1(myImage,centroids(:,1),centroids(:,2),240);
% imwrite(rgboutput,'D:\Images\experimentally segmented eyes\007_output.png');
%  figure,imshow(rgboutput);



 
 
 
 
 
 
 
 
 
 
% bwimage3=imerode(bwimage2,strel('disk',2));
% bwimage3=bwimage2-bwimage3;
% 
% figure;imshow(bwimage2,[]);hold on;
%  
% grayScaleImage = rgb2gray(myImage);
% grayScaleImage=imdilate(grayScaleImage,strel('disk',2));
% grayScaleImage=imerode(grayScaleImage,strel('disk',2));
% subplot(2,2,1); imshow(grayScaleImage); title('Input Image');
% subplot(2,2,2); imshow(bwimage2); title('Initialization');
% subplot(2,2,3); title('Segmentation');
% grayScaleImage = imresize(rgb2gray(myImage),[640 685]);
% bwimage2=imresize(bwimage2,[640 685]);
% 
% grayScaleImage = imgaussfilt(grayScaleImage, 20, 2);
% %         BW4 
% seg = region_seg(grayScaleImage, bwimage2, 100,1);
% 
% 
% subplot(2,2,4); imshow(seg); title('Global Region-Based Segmentation');
% 
% stats=regionprops(seg,'Centroid');
% segbwdist=bwdist(~seg,'euclidean');
% rad=max(max(segbwdist));
% clear seg1;
% seg1=ROI_FILL(seg,stats(1).Centroid(1),stats(1).Centroid(2),rad);
% figure,imshow(seg1)





