clc;
close all;
X1= imread('Fig0316(1)(Dark).tif');
figure(1) ;
subplot(4,3,1)
imshow(X1);
title('a');
hold on;
[histgram,N]=imhist(im2double(X1));
%figure(2);
bar(N, histgram); %or use stem(N, histgram); or plot(N,histgram);
newmap=histeq(X1,gray(256));
 subplot(4,3,2);
 imshow(X1,newmap); % this will display the histogram % equalized image in a new figure
hold on;
 %figure(4) ;rgbplot(newmap);%Explain what function you see in the
grayimgeq=ind2gray(X1,newmap); % get an intensity image
subplot(4,3,3);
hold on;
imhist(grayimgeq,256); % display the equalized histogram

X2= imread('Fig0316(2)(WashedOut).tif');
%figure() ;
subplot(4,3,4)
imshow(X2);
title('b')
hold on;
[histgram,N]=imhist(im2double(X2));
%figure(2);
bar(N, histgram); %or use stem(N, histgram); or plot(N,histgram);
newmap=histeq(X2,gray(256));
 subplot(4,3,5);
 imshow(X2,newmap); % this will display the histogram % equalized image in a new figure
hold on;
 %figure(4) ;rgbplot(newmap);%Explain what function you see in the
grayimgeq=ind2gray(X2,newmap); % get an intensity image
subplot(4,3,6);
hold on;
imhist(grayimgeq,256); % display the equalized histogram

X3= imread('Fig0316(3)(Gray).tif');
%figure(3) ;
subplot(4,3,7)
imshow(X3);
title('c')
hold on;
[histgram,N]=imhist(im2double(X3));
%figure(2);
bar(N, histgram); %or use stem(N, histgram); or plot(N,histgram);
newmap=histeq(X3,gray(256));
 subplot(4,3,8);
 imshow(X3,newmap); % this will display the histogram % equalized image in a new figure
hold on;
 %figure(4) ;rgbplot(newmap);%Explain what function you see in the
grayimgeq=ind2gray(X3,newmap); % get an intensity image
subplot(4,3,9);
hold on;
imhist(grayimgeq,256); % display the equalized histogram

X4= imread('Fig0316(4)(HighContrast).tif');
%figure(4) ;
subplot(4,3,10)
imshow(X4);
title('d')
hold on
[histgram,N]=imhist(im2double(X4));
%figure(2);
bar(N, histgram); %or use stem(N, histgram); or plot(N,histgram);
newmap=histeq(X4,gray(256));
 subplot(4,3,11);
 imshow(X4,newmap); % this will display the histogram % equalized image in a new figure
hold on;
 %figure(4) ;rgbplot(newmap);%Explain what function you see in the
grayimgeq=ind2gray(X4,newmap); % get an intensity image
subplot(4,3,12);
hold on;
imhist(grayimgeq,256); % display the equalized histogram

