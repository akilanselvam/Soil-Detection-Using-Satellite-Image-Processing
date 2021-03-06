clc;
clear;
close all;

% rgb = imread('vatican_city1.jpg');
rgb = imread('pawnee_oli.jpg');%
figure;
imshow(rgb)
I = rgb2gray(rgb);
figure;
imshow(I)
text(732,501,'Image courtesy of Corel(R)',...
     'FontSize',7,'HorizontalAlignment','right')
 
 gmag = imgradient(I);
figure;
imshow(gmag,[])
title('Gradient Magnitude')

L = watershed(gmag);
Lrgb = label2rgb(L);
figure;
imshow(Lrgb)
title('Watershed Transform of Gradient Magnitude')

se = strel('disk',20);
Io = imopen(I,se);
figure;
imshow(Io)
title('Opening')

Ie = imerode(I,se);
Iobr = imreconstruct(Ie,I);
figure;
imshow(Iobr)
title('Opening-by-Reconstruction')

Ioc = imclose(Io,se);
figure;
imshow(Ioc)
title('Opening-Closing')

Iobrd = imdilate(Iobr,se);
Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
figure;
imshow(Iobrcbr)
title('Opening-Closing by Reconstruction')

fgm = imregionalmax(Iobrcbr);
figure;
imshow(fgm)
title('Regional Maxima of Opening-Closing by Reconstruction')

I2 = labeloverlay(I,fgm);
figure;
imshow(I2)
title('Regional Maxima Superimposed on Original Image')

se2 = strel(ones(5,5));
fgm2 = imclose(fgm,se2);
fgm3 = imerode(fgm2,se2);

fgm4 = bwareaopen(fgm3,20);
I3 = labeloverlay(I,fgm4);
figure;
imshow(I3)
title('Modified Regional Maxima Superimposed on Original Image')

bw = imbinarize(Iobrcbr);
figure;
imshow(bw)
title('Thresholded Opening-Closing by Reconstruction')

D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;
figure;
imshow(bgm)
title('Watershed Ridge Lines)')

gmag2 = imimposemin(gmag, bgm | fgm4);

L = watershed(gmag2);

labels = imdilate(L==0,ones(3,3)) + 2*bgm + 3*fgm4;
I4 = labeloverlay(I,labels);
figure;
imshow(I4)
title('Markers and Object Boundaries Superimposed on Original Image')

Lrgb = label2rgb(L,'jet','w','shuffle');
figure;
imshow(Lrgb)
title('Colored Watershed Label Matrix')

figure
imshow(I)
hold on
himage = imshow(Lrgb);
himage.AlphaData = 0.3;
title('Colored Labels Superimposed Transparently on Original Image')