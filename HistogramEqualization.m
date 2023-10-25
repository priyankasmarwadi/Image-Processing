clc;
close all;
X= imread('Fig0332(a)(embedded_square_noisy_512).tif');
figure(1) ;imshow(X);
[histgram,N]=imhist(im2double(X));
figure(2);
bar(N, histgram); %or use stem(N, histgram); or plot(N,histgram);
newmap=histeq(X,gray(256));
figure(3) ;imshow(X,newmap); 
gray_output_img= blkproc(X,[3,3],[0,0],'histeq',256);
figure(4);imshow(gray_output_img)
figure
imhist(gray_output_img);
