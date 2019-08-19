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
 myImage = imread('D:\Images\drishtiGS_099.png');

%figure
%subplot(1,3,1);
figure,imshow(myImage);
title('Original Image');


%%% RGB to Gray Image
%subplot(1,3,2);
grayScaleImage = rgb2gray(myImage);
figure,imshow(grayScaleImage);
title('Grayscale Image');
bwimage=selected_region(grayScaleImage);
figure,imshow(bwimage);
title('Candidate pixels of the optic disk');
% % % %image padding
% % % % % % % % % % % % % % pad_img=padarray(grayScaleImage,77,0,'pre');
% 
% %%% 64 parts
% pad_img=padarray(grayScaleImage,75,0,'pre');
%  c = mat2cell(grayScaleImage, [230 230 230 230 230 230 230 230],[256 256 256 256 256 256 256 256]);
% 
% sz = size(grayScaleImage); % size of input image
% I = rand(sz); % make up some random data for testing
% chunk_size = [8 8]; % your desired size of the chunks image is broken into
% c = sz/chunk_size; % number of chunks in each dimension; must be integer
% sc=floor(c);
% split to chunk_size(1) by chunk_size(2) chunks
% X = mat2cell(I, chunk_size(1) * ones(sc(1),1), chunk_size(2) *ones(sc(2),2));
% imshow(X);
 X=mat2cell(grayScaleImage([241 241 241 241 241 241 241 241],[257 257 257 257 257 257 257 257]));
% 
% 
% % % 
% % %  I = pad_img;
% % % I = im2double(I);
% % % T = dctmtx(8);
% % % dct = @(block_struct) T * block_struct.data * T';
% % % B = blockproc(I,[8 8],dct);
% % % figure;
% % % imagesc(B)
% 
% 
% %%%spoting selected pixels
for l=1:size(X,1)
    for m=1:size(X,2)
        if(has(X(l,m),(bwimage)));
%             X(l,m)=1;
            temp(i)=X(l,m);
            b=sort(temp,'descend');
        else
            X(l,m)=0;
        end
        
    end
end