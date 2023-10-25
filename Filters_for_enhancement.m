clc;
close all;
img= imread('Fig0363(a)(skeleton_orig).tif');
img= im2double(img);
figure ; 
subplot(2,2,1)
imshow(img);   
title('a');

kernel2= [-1 -1 -1; -1 8 -1; -1 -1 -1];
img_Lap2 = conv2(img,kernel2,'same');
img_Lap2= rescale(img_Lap2,0,1);
subplot(2,2,2)
imshow(img_Lap2); 
title('b');

 C=-1;
 img_grad = gradient(gradient(img));
 A= C* img_grad;
 img_sharp1= img+ A;
 subplot(2,2,3)
imshow(img_sharp1); 
title('c');
% [Gx,Gy] = imgradientxy(img);
% figure
% imshowpair(Gx,Gy,'montage')

 kx= [-1 ,0 ,1; -2,0,2; -1, 0 ,1];
 ky= kx.';
 filtered_image= zeros(size(img));
 
for i = 1:size(img, 1) - 2
    for j = 1:size(img, 2) - 2
  
        % Gradient approximations
        Gx = sum(sum(kx.*img(i:i+2, j:j+2)));
        Gy = sum(sum(ky.*img(i:i+2, j:j+2)));
                 
        % Calculate magnitude of vector
        filtered_image(i+1, j+1) = sqrt(Gx.^2 + Gy.^2);
         
    end
end
 %filtered_image = uint8(filtered_image);
subplot(2,2,4)
 imshow(filtered_image); 
 title('d');

n=5;
Box_filter= (ones(n,n))/(n*n);
img1= imfilter(filtered_image,Box_filter);


figure;
subplot(2,2,1)
imshow(img1);
  title('e');

new_img = img_Lap2 .* img1;
subplot(2,2,2)
imshow(new_img);
title('f');

new2= new_img+ img;
subplot(2,2,3)
imshow(new_img);
title('g');

D2= 1.5;
n2=0.5 ;
M2= D2*new_img.^n2 ;
subplot(2,2,4)
imshow(M2);
title('h')