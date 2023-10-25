clc;
close all;
X1= imread('Fig0308(a)(fractured_spine).tif');
A1= im2double(X1);
figure(1)
subplot(1,3,1)
imshow(A1);
title('original image')
c1= 1.7;
S1= c1* log(1+A1)*256;
Y1= uint8(S1);
subplot(1,3,2)
imshow(Y1)
title('Log transform')
D1= 1;
n1=0.2 ;
M1= D1*A1.^n1 ;
subplot(1,3,3)
imshow(M1);
title('Power-law transform')


X2= imread('Fig0309(a)aerialview-washedout.tif');
A2= im2double(X2);
figure(2)
subplot(1,3,1)
imshow(A2);
title('original image')
c2= 1;
S2= c2* log(1+A2)*256;
Y2= uint8(S2);
subplot(1,3,2)
imshow(Y2)
title('Log transform')
D2= 0.5;
n2=1.5 ;
M2= D2*A2.^n2 ;
subplot(1,3,3)
imshow(M2);
title('Power-law transform')