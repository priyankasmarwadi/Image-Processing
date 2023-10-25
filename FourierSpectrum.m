clc;
close all;
img     =imread('Fig0440(a)(testpattern).tif');
img     =im2double(img);
figure;
imshow (img);
title('original image');
[M,N]   =size(img);
P       =2*M;
Q       =2*N;
%%%%%%%%%%%% add paddin to image %%%%%%%%%
img_pad = padarray(img,[P/2 Q/2],'post');

%%%%%%%%%%%% centering %%%%%%%%%
img_cent= zeros(P,Q);
 for i=1:P
     for j=1:Q
        img_cent(i,j)= img_pad(i,j).*(-1).^(i+j);
     end
 end
%%%%%%%%%%%% DFT of padded image %%%%%%%%%
img_FT1= fft2(img_cent);
img_FTB= 20.*log(abs(img_FT1));
figure;
imshow(img_FTB,[]);
hp= impixelinfo;
img_Avg= mean(real(img_FT1(:)))

