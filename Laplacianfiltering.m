clc;
close all;
img= imread('Fig0352(a)(blurry_moon).tif');
img= im2double(img);
figure(1) ; 
subplot(2,2,1);
imshow(img);   % image a
title('a')

kernel1= [0 1 0; 1 -4 1; 0 1 0];     % kernel used for laplacian 
img_Lap = conv2(img,kernel1,'same');  % taking laplacian for image
img_Lap1= rescale(img_Lap,0,1);       % rescaling image 
figure(1) ; 
subplot(2,2,2);
imshow(img_Lap);  % image b
title('b')

figure(2);
imshow(img_Lap1);
title('Laplacian image rescaled')

 C=-1;
 img_grad = gradient(gradient(img));     
 A= C* img_grad;
 img_sharp1= img+ A;               %g(x,y)=f(x,y)+C[Delta^2 f(x,y)]
 figure(1) ; 
 subplot(2,2,3);
 imshow(img_sharp1);  % image c
 title('c')
 
kernel2= [1 1 1; 1 -8 1; 1 1 1];              % 2nd kernel    
img_Lap2 = conv2(img,kernel2,'same');      
%figure ; imshow(img_Lap2);  

img_sharp2= img-img_Lap2;     % sharpened image 2
figure(1) ; 
subplot(2,2,4);
imshow(img_sharp2);  % image D
 title('d')