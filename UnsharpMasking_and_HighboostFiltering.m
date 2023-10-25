clc;
close all;
img= imread('Fig0352(a)(blurry_moon).tif');
img= im2double(img);
figure ; 
subplot(2,3,1)
imshow(img); 
title('[a] original image')

%%%%%%%%% Q3a Gaussian filter %%55%%%%%%
 % K= 1/(2*pi*sig^2) 
 % G(r)=K*exp(-r^2/2*sigma^2)
sig= 2.5;
z=5;

[m,n]=meshgrid(-z:z,-z:z);
X = size(m,1)-1;
Y = size(n,1)-1;
Exponent= -(m.^2+n.^2)/(2*sig^2);   
kernel= exp(Exponent)/(2*pi*sig^2);  


img_gauss=zeros(size(img));

%Convolution
for i = 1:size(img,1)-X
    for j =1:size(img,2)-Y
        Temp = img(i:i+X,j:j+Y).*kernel;
        img_gauss(i,j)=sum(Temp(:));
    end
end

subplot(2,3,2)
imshow(img_gauss);
title('[b] Gauss lowpass')


%%%%%%%%%%%% unsharpen mask %%%%%%%%%%%%%

gmask= img-img_gauss;      
gmask1= rescale(gmask,0,1);
subplot(2,3,3);
imshow(gmask1);
title('[c] Mask')


%%%%%%%%%%%% sharpen image with k=1 %%%%%%%%%%%%%

k=1;
img_final1 = img+ k*gmask;
subplot(2,3,4)
imshow(img_final1);
title('[d] k=1')

%%%%%%%%%%%% Q3b high-boost filtering %%%%%%%%%%%%%
k=2;
img_final3 = img+ k*gmask;
subplot(2,3,5)
imshow(img_final3);
title('[e] k=2')


k=4;
img_final3 = img+ k*gmask;
subplot(2,3,6)
imshow(img_final3);
title('[f] k=4')



