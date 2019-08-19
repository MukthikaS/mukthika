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
 myImage = imread('D:\Images\normal eyes\drishtiGS_083.png');

%figure
%subplot(1,3,1);
figure,imshow(myImage);
title('Original Image');
myImage(:,:,1);

%%% RGB to Gray Image
%subplot(1,3,2);
grayScaleImage = rgb2gray(myImage);
figure,imshow(grayScaleImage);
title('Grayscale Image');
% % % candidate pixels for optic disk
grayScaleImage=histeq(grayScaleImage);
bwimage=selected_region(grayScaleImage);
title('Candidate pixels of the optic disk');
figure,imshow(bwimage);



% % % the black and white image is dialated
bwimage1=imdilate(bwimage,strel('disk',3));
bwimage1=imdilate(bwimage1,strel('disk',3));
bwimage1=imdilate(bwimage1,strel('disk',3));
title('Dialated black and white image');
figure,imshow(bwimage1);

% %%% 64 parts
% bwimage1=mat2cell(bwimage1,[241 241 241 241 241 241 241 241],[257 257 257 257 257 257 257 257]);

% % % Centroid is found and image is drawn
stats=regionprops(bwimage1,'Centroid');
figure,imshow(myImage),hold on;
centroids = cat(1, stats.Centroid);
  
   plot(centroids(:,1), centroids(:,2), 'k')
   hold off
h=CIRCLE_DRAW(centroids(:,1),centroids(:,2),240);


% % % %%%spoting selected pixels
% % clear count;
% % c=1;
% % count=zeros(64,1);
% % for l=1:size(X,1)
% %     
% %     for m=1:size(X,2)
% % count(c)=sum(sum(cell2mat(X(l,m)))); 
% % c=c+1;
% %     end
% % end
% % %%finding cell with maximum maximum pixel value 
% % % method 1
% 
% % maxValue=max(count(:));
% % selected_blocknumber=find(count==max(count(:)));
% % [block_row,block_col]=ind2sub([8,8],selected_blocknumber);
% % 
% % block_start_x=257* (block_row-1);
% % block_start_y=241* (block_col-1);
% % 
% % block_center_x=block_start_x + (257/2);
% % block_center_y=block_start_y + (241/2);
% % 
% %  figure,imshow(myImage),hold on,plot(block_center_x,block_center_y,'g*');
%  
%  
%  
%  
% 
% 
% % figure,imshow(myImage),hold on,contour(bwimage,'g');
% 
% 
% 
% 
% 
% 
% 
% % % % locating cell with maximum pixels
% % for k=1:size(X,1)
% %     
% %     for n=1:size(X,2)
% %         for t=1:size(X{k,n}(:,:),1)
% %           for h=1: size(X{k,n}(:,:),2)
% % [row col]=find(sum(X{k,n}(t,h))==maxValue);
% % 
% % % k=k+1;
% % % n=n+1;
% %           end
% %         end
% %     end
% % end
% 
% % % method 2
% % for k=1:size(X,1)
% %     
% %     for n=1:size(X,2)
% %         [row col]=find(sum(sum(cell2mat(X(k,n))))==maxValue); 
% % 
% %     end
% % end
% % % method 1
% % index = false(k, numel(X));
% % for k = 1:numel(X)
% %     for l = 1:numel(X)
% % for i=1:8
% %     for j=1:8
% %   index=find([X{i,j}(:,:)]==maxValue);
% % end
% % end
% %      index(k,l) = true;
% %   end
% %     end
% % end
% % found = find(index);