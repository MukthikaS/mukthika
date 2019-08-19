%%% Find p% of bright the pixels in the IMage

function [bwimage]= selected_region(grayScaleImage)
p=.5;     %% percentage of bright pixels to be selected
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
bwimage=zeros(size(grayScaleImage,1),size(grayScaleImage,2));
for x=1:size(grayScaleImage,1)
    for y=1:size(grayScaleImage,2)
        if(grayScaleImage(x,y)>graylevel(i));
            bwimage(x,y)=1;
        else
            bwimage(x,y)=0;
        end
        
    end
end
%figure,imshow(bwimage);