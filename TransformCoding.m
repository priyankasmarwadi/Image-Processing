% Priyanka Marwadi 
clear ;
clc;
close all;
warning off;

fdct = @(block_struct) dct2(block_struct.data);   % function for DCT
fidct = @(block_struct) idct2(block_struct.data); % function for inverse DCT

fftC = @(block_struct) fft2(block_struct.data);  %function for DFT
ifftC = @(block_struct) ifft2(block_struct.data); % function for inverse DFT


img1 = double(imread('Fig0809(a).tif'));  % read image 
[r,c]=size(img1);      % size of image 
D= r*c;   
%n= 8;
    
img1_compress1 = blockproc(img1,[8 8],fdct);    % image to DCT 
fnlargest_C = @(block_struct) nlargest(block_struct.data,2);  % calculate the function for compression
img1_compress_b1 = blockproc(img1_compress1,[8,8],fnlargest_C); % Compressed DCT image
img1_uncompress1 = blockproc(img1_compress_b1,[8 8],fidct); % retrived image from compressed DCT 

figure(1)
subplot(1,3,1)
imshow(img1/255)
title('Original image')
subplot(1,3,2)
imshow(img1_compress1/255)
title('DCT transformed image')
subplot(1,3,3)
imshow(img1_uncompress1/255)
title('reconstructed image')

RMSE_C=sqrt(immse(img1_uncompress1,img1))  % calculate root mean squared error between original and reconstructed image
Num1= (img1_uncompress1.^2);   % numerator to calculation mean square SNR
Num1= sum(Num1);
Denom1=sum((img1_uncompress1-img1).^2);  % denominator to calculation mean square SNR
SNR1= Num1/Denom1   % mean square SNR

%%
%%%%%%%% Similarly compress and reconstruct image for DFT %%%%%%%%%

img1_compress2 = blockproc(img1,[8 8],fftC);
fnlargest_F = @(block_struct) nlargest(block_struct.data,2);
img1_compress2_b2 = blockproc(img1_compress2,[8,8],fnlargest_F);
img1_uncompress2 = blockproc(img1_compress2_b2,[8 8],ifftC);

figure(2)
subplot(1,3,1)
imshow(img1/255)
title('Original image')
subplot(1,3,2)
imshow(img1_compress2/255)
title('DFT transformed image')
subplot(1,3,3)
imshow(img1_uncompress2/255)
title('reconstructed image')

%%%%%%%%% Quantify loss of information %%%%%%%%%%%%%

RMSE_F=sqrt(immse(img1_uncompress2,img1))
Num2= (img1_uncompress2.^2);
Num2= sum(Num2);
Denom2=sum((img1_uncompress2-img1).^2);
SNR2= Num2/Denom2


%%%%%%%% function for compression %%%%%%%
function img = nlargest(img,N)
    min_of_nlargest = abs(min(maxk(img(:),N)));
    less_pixels = find(img < min_of_nlargest);
    img(less_pixels) = zeros(size(less_pixels));
end