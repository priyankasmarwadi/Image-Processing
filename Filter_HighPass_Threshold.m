clc;
close all;
img     =imread('Fig0455(a)(thumb_print).tif');
img     =im2double(img);
figure;
subplot(1,3,1)
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
img_FT2= fftshift(img_FT1);
img_FT= 20.*log(abs(img_FT2));

 D= 60;
 img_filt= zeros(P,Q);

for i = 1:P
    for j = 1:Q
       img_filt(i,j) = 1-(exp(-((i-P/2).^2+(j-Q/2).^2)/(2*D.^2)));
           
    end
end

 img_G= img_FT1.* img_filt;

img_invF= ifft2(img_G);


img_real= zeros(P,Q);
 for i=1:P
     for j=1:Q
        img_real(i,j)= img_invF(i,j).*(-1).^(i+j);
     end
 end

img_out = zeros(M,N);
for i = 1:M
    for j = 1:N
        img_out(i,j) = img_real(i,j);
           
    end
end
subplot(1,3,2)
imshow(img_out);
title('High Pass');

img_out1= img_out;
img_out1(img_out1<=0)=0;
img_out1(img_out1 >0)=1;


subplot(1,3,3)
imshow(img_out1); 
title('Threshold');