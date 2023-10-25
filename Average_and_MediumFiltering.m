clc;
close all;
img= imread('Fig0349(a)(ckt_board_saltpep_prob_pt05).tif');
img= im2double(img);
figure (1) ; 
subplot(1,3,1)
imshow(img);
title('[a] original image')

  
fun = @(x) mean(x(:));    % built function for nlfilter to form 3*3 box filter
img_avg= nlfilter(img,[3,3],fun) ; %apply averaging filter to each pixel
figure(1)
subplot(1,3,2) 
imshow(img_avg);
title('[b] averaging filter')

fun_median = @(y) median(y(:));   %built function for nlfilter to form 3*3 box filter (median)
img_median= nlfilter(img,[5,5],fun_median);
figure(1)
subplot(1,3,3) 
imshow(img_median)
title('[c] median filter')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sig= 3;
sz= 9;

[m,n]=meshgrid(-sz:sz,-sz:sz);
X = size(m,1)-1;
Y = size(n,1)-1;
Exponent= -(m.^2+n.^2)/(2*sig^2);    % -r^2/2*sigma^2
kernel= exp(Exponent)/(2*pi*sig^2);
img_gauss=zeros(size(img));

for i = 1:size(img,1)-X
    for j =1:size(img,2)-Y
        Temp = img(i:i+X,j:j+Y).*kernel;
        img_gauss(i,j)=sum(Temp(:));
    end
end

figure (2);
subplot(1,3,2)
imshow(img_gauss);
title('[b] gauss filter')

fun_median = @(y) median(y(:));   
img_median= nlfilter(img,[7,7],fun_median);
figure(2)
subplot(1,3,3) 
imshow(img_median)
title('[c] median filter')


