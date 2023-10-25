clc;
clear;
close all;
img= imread('Chronometer.tiff');                   % input image
RI = imref2d(size(img));

s=size(img); %row,column
shrink_factor = 4;
s1=s/shrink_factor;

img_shrinked = img(1:shrink_factor:s(1),1:shrink_factor:s(2));
RI_shrinked = imref2d(size(img_shrinked));

% k=1;
% l=1;
% for i=1:s1(1)
%     for j=1:s1(2)
%         img_shrinked(i,j)=img(k,l);
%         l=l+shrink_factor;
%     end
%     l=1;
%     k=k+shrink_factor;
% end

img_zoomed_nn = imresize(img_shrinked,shrink_factor,'nearest');
RI_zoomed_nn = imref2d(size(img_zoomed_nn));

img_zoomed_bl = imresize(img_shrinked,shrink_factor,'bilinear');
RI_zoomed_bl = imref2d(size(img_zoomed_bl));




figure,
subplot(2,2,1)
imshow(img,RI)
title('Original Image');
subplot(2,2,2)
imshow(img_shrinked,RI_shrinked)
title('Shrinked Image');
subplot(2,2,3)
imshow(img_zoomed_nn,RI_zoomed_nn)
title('Nearest Neighbour Zoomed Image');
subplot(2,2,4)
imshow(img_zoomed_bl,RI_zoomed_bl)
title('Bilinear Zoomed Image');

