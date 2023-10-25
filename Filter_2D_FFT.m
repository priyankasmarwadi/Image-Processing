clc;
close all;
img     =imread('Fig0440(a)(testpattern).tif');
img     =im2double(img);
figure;
subplot(3,3,1)
imshow (img);
title('[a]');
[M,N]   =size(img);
P       =2*M;
Q       =2*N;
%%%%%%%%%%%% add paddin to image %%%%%%%%%
img_pad = padarray(img,[P/2 Q/2],'post');
subplot(3,3,2)
imshow (img_pad);
title('[b]');
%%%%%%%%%%%% centering %%%%%%%%%
img_cent= zeros(P,Q);
 for i=1:P
     for j=1:Q
        img_cent(i,j)= img_pad(i,j).*(-1).^(i+j);
     end
 end
 subplot(3,3,3)
 imshow (img_cent)
 title('[c]');
%%%%%%%%%%%% DFT of padded image %%%%%%%%%
img_FT1= fft2(img_cent);
img_FTB= 20.*log(abs(img_FT1));
subplot(3,3,4)
imshow(img_FTB,[]);
title('[d]');
hp= impixelinfo;

%%%%%%%%%%%% symmetric filter function %%%%%%%%%

img_Dist= zeros(P,Q);
for i=1:P
    for j=1:Q
       img_Dist(i,j)= sqrt((i-P/2).^2+(j-Q/2).^2);  
     end
end
 
 
 img_filt = zeros(P,Q);
for i = 1:P
    for j = 1:Q
        if  img_Dist(i,j) <= 460
            img_filt(i,j) = 1;
         else
            img_filt(i,j) = 0;
        end
    end
end
subplot(3,3,5)
imshow(img_filt); 
title('[e]');

%%%%%%%%% Multiply fourier transforme image by filter%%%%%%%%%%

img_G= img_FT1.* img_filt;
subplot(3,3,6)
imshow(img_G); 
title('[f]');

%%%%%%%% Inverse fourier transorm %%%%%%%%%%%%
img_invF= ifft2(img_G);

%%%%%%%%%%%% Multiply by (-1)^(x+y)
img_real= zeros(P,Q);
 for i=1:P
     for j=1:Q
        img_real(i,j)= img_invF(i,j).*(-1).^(i+j);
     end
 end
subplot(3,3,7)
imshow(img_real); 
title('[g]');

%%%%%%%%%%%%% image in original M*N dimenstion
img_out = zeros(M,N);
for i = 1:M
    for j = 1:N
        img_out(i,j) = img_real(i,j);
    end
end
subplot(3,3,8)
imshow(img_out); 
title('[h]');
