clear
clc
img=imread('Fig0809(a).tif');
img=double(img);

wavelet='Haar';

%To perform a level 1 decomposition of the image     
[C,S] = wavedec2(img,1,wavelet);
A1 = wrcoef2('a',C,S,wavelet,1);
H1 = wrcoef2('h',C,S,wavelet,1); 
V1 = wrcoef2('v',C,S,wavelet,1); 
D1 = wrcoef2('d',C,S,wavelet,1); 

colors = size(unique(img));
grayLevels = colors(1);
a1_cod = wcodemat(A1,grayLevels);
d1_hcod = wcodemat(H1,grayLevels);
d1_vcod = wcodemat(V1,grayLevels);
d1_dcod = wcodemat(D1,grayLevels);
L1 = [a1_cod,d1_hcod;d1_vcod,d1_dcod];

[thr,sorh,keepapp] = ddencmp('cmp','wv',img);
[Xcomp,CXC,LXC,PERF0,PERFL2] = wdencmp('gbl',C,S,wavelet,1,thr,sorh,keepapp);

NC = wthcoef2('t',C,S,1,thr,'s');
        % Reconstruction of the image from the approximate and details
        img_R = waverec2(NC,S,wavelet);
% Reconstruct the original image from the I level decomposition. 
%To reconstruct the original image from the wavelet decomposition structure, type
img=double(img);
 %mse1=sum(sum((img-img_R).*(img-img_R)))/(512*512)

%To view the compressed image side by side with the original, type

% subplot(1,2,1); image(img); title('Original Image');
% subplot(1,2,2); image(img_R); title('Reconstructed Image');


RMSE1=sqrt(immse(img_R,img))
Num1= (img_R.^2);
Num1= sum(Num1);
Denom1=sum((img_R-img).^2);
SNR1= Num1/Denom1


%To perform a level 2 decomposition of the image
[C,S] = wavedec2(img,2,wavelet);
%Reconstruct the Level 2 approximation and the Level 1 and 2 details. 
%To reconstruct the level 2 approximation from C, type
A2 = wrcoef2('a',C,S,wavelet,2);
A1 = wrcoef2('a',C,S,wavelet,1);
H1 = wrcoef2('h',C,S,wavelet,1); 
V1 = wrcoef2('v',C,S,wavelet,1); 
D1 = wrcoef2('d',C,S,wavelet,1); 
H2 = wrcoef2('h',C,S,wavelet,2);
V2 = wrcoef2('v',C,S,wavelet,2); 
D2 = wrcoef2('d',C,S,wavelet,2);
%colormap(map);
colors = size(unique(img));
grayLevels = colors(1);
a1_cod = wcodemat(A1,grayLevels);
d1_hcod = wcodemat(H1,grayLevels);
d1_vcod = wcodemat(V1,grayLevels);
d1_dcod = wcodemat(D1,grayLevels);
L1 = [a1_cod,d1_hcod;d1_vcod,d1_dcod];
%image(uint8(L1));
%axis image;
%title('Level 1 decomposition');

% 2nd level coefficients coding
a2_cod = wcodemat(A2,grayLevels);
d2_hcod = wcodemat(H2,grayLevels);
d2_vcod = wcodemat(V2,grayLevels);
d2_dcod = wcodemat(D2,grayLevels);
% Displaying level 2 structure
%image(uint8([imresize([a2_cod,d2_hcod;d2_vcod,d2_dcod],size(d1_hcod),'bilinear'),d1_hcod;d1_vcod,d1_dcod]));
%axis image;
%title('Level 2 decomposition');


% Compress the image and display

% Compress the image and display it. 
% To compress the original image X, use the ddencmp command to calculate the default parameters
% and the wdencmp command to perform the actual compression. Type
[thr2,sorh2,keepapp2] = ddencmp('cmp','wv',img);

[Xcomp2,CXC2,LXC2,PERF02,PERFL22] = wdencmp('gbl',C,S,wavelet,2,thr2,sorh2,keepapp2);

NC2 = wthcoef2('t',C,S,2,thr2,'s');
        % Reconstruction of the image from the approximate and details
        img_R2 = waverec2(NC2,S,wavelet);
        
       % mse2=sum(sum((img-img_R2).*(img-img_R2)))/(512*512)

%To view the compressed image side by side with the original, type

%subplot(1,2,1); image(img); title('Original Image');
%subplot(1,2,2); image(img_R2); title('Reconstructed Image');


RMSE2=sqrt(immse(img_R2,img_R))
Num2= (img_R2.^2);
Num2= sum(Num2);
Denom2=sum((img_R2-img).^2);
SNR2= Num2/Denom2

