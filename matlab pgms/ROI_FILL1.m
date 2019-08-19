function bwimage2= ROI_FILL1(bwimage1,x,y,r )

bwimage2=zeros(size(bwimage1,1),size(bwimage1,2));
pi=3.124;
th=0:pi/500000:2*pi;
xunit=round(r*cos(th)+x);
yunit = round(r*sin(th)+y);
for i=1:size(xunit,2)
   
        bwimage2(yunit(i),xunit(i))=1;
%         bwimage1(yunit(i),xunit(i),1)=0;
   
end

bwimage2=imdilate(bwimage2,strel('disk',2));
bwimage2=imdilate(bwimage2,strel('disk',2));
bwimage2=imdilate(bwimage2,strel('disk',2));
bwimage2=imfill(bwimage2,'holes');

% bwimage2=zeros(size(bwimage1,1),size(bwimage1,2));
% pi=3.124;
% th=0:pi/500:2*pi;
% xunit=round(r*cos(th)+x);
% yunit = round(r*sin(th)+y);
% for i=1:size(xunit,2)
%    
%         bwimage1(yunit(i),xunit(i),1)=0;
%         bwimage1(yunit(i),xunit(i),2)=255;
%         bwimage1(yunit(i),xunit(i),3)=0;
%    
% end
 



