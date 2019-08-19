clear all;
grndTruth = imread('D:\Images\manually segmented eyes\081_segmententedimage.png');
grndTruth=im2bw(grndTruth);
segIm=imread('D:\Images\experimentally segmented eyes\081_output.png');
segIm=im2bw(segIm);
dice=2*nnz(segIm&grndTruth)/(nnz(segIm)+nnz(grndTruth));
% figure,imshow(grndTruth);
% figure,imshow(segIm);
subplot (1,2,1),imshow(grndTruth),title('Manually Segmented');
subplot (1,2,2),imshow(segIm),title('Experimentally Segmented');
% A=dice; fc
% msgbox(sprintf('A = %2.3g',A),'A')
if dice<0.5
    f=msgbox('The eye contains some pathalogies');
else if (dice>0.5) &&(dice<0.6)
        f=msgbox('The optic disc was detected with 50% accuracy (Dice coefficient)');
    else if (dice>0.6) &&(dice<0.7)
          f=msgbox('The optic disc was detected with 60% accuracy (Dice coefficient)'); 
           else if (dice>0.7) &&(dice<0.8)
                   f=msgbox('The optic disc was detected with 70% accuracy (Dice coefficient)');
                    else if (dice>0.8) &&(dice<0.9)
                            f=msgbox('The optic disc was detected with 80% accuracy (Dice coefficient)');
                             else if (dice>0.9) &&(dice<1)
                                     f=msgbox('The optic disc was detected with 90% accuracy (Dice coefficient)');
                                 else if dice==1
                                         f=msgbox('The optic disc was detected with 100% accuracy (Dice coefficient)');
                                 else
                                     f=msgbox('Invalid data set');
                                     end
                                 end
                        end
               end
        end
    end
end
        



% grndTruth = imread('C:\Users\maqlin\Downloads\079_segmententedimage.png');
% grndTruth=im2bw(grndTruth);
% segIm=imread('C:\Users\maqlin\Downloads\079_output.png');
% segIm=im2bw(segIm);
%  
% dice=2*nnz(segIm&grndTruth)/(nnz(segIm)+nnz(grndTruth));
%  



