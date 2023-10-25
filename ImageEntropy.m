clc;
close all;
img1= imread('Fig0801(a).tif');
img1 = im2double(img1);
img2= imread('Fig0801(b).tif');
img2 = im2double(img2);
img3= imread('Fig0801(c).tif');
img3 = im2double(img3);

 figure(1)
 subplot(2,3,1)
 imshow(img1);
 title('Figure 8.1(a)')
 subplot(2,3,2)
 imshow(img2);
 title('Figure 8.1(b)')
 subplot(2,3,3)
 imshow(img3);
 title('Figure 8.1(c)')
%%%%%%%%% Calculate entropy for image 1 %%%%%%%%%%
[pixelcount,greylevel1] = imhist(img1); 
subplot(2,3,4)
imhist(img1);
title('Histogram of Figure 8.1(a)')
X1=numel(img1);
pdf1 = pixelcount/X1;      % Pdf of image
nonZeroIndices = pdf1 ~= 0;
output1 = pdf1(nonZeroIndices);   % store the values from pdf
log_P1= log2(output1);
result1= output1.*log_P1;      
entropy_value1= -sum(result1) %  entropy of image using equation 8.7
e1=entropy(img1)              %  entropy of image using inbuilt function

%%%%%%%%% Calculate entropy for image 2 %%%%%%%%%%
[pixelcount,greylevel2] = imhist(img2); 
subplot(2,3,5)
imhist(img2);
title('Histogram of Figure 8.1(b)')
X2=numel(img2);
pdf2 = pixelcount/X2;
nonZeroIndices = pdf2 ~= 0;
output2 = pdf2(nonZeroIndices);
log_P2= log2(output2);
result2= output2.*log_P2;
entropy_value2= -sum(result2)  %  entropy of image
e2=entropy(img2)  %  entropy of image using inbuilt function

%%%%%%%%% Calculate entropy for image 3 %%%%%%%%%%
[pixelcount,greylevel3] = imhist(img3); 
subplot(2,3,6)
imhist(img3);
title('Histogram of Figure 8.1(c)')
X3=numel(img3);
pdf3 = pixelcount/X3;
nonZeroIndices = pdf3 ~= 0;
output3 = pdf3(nonZeroIndices);
log_P3= log2(output3);
result3= output3.*log_P3;
entropy_value3= -sum(result3)  %  entropy of image
e3=entropy(img3)               %  entropy of image using inbuilt function