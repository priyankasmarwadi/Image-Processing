clc;
close all;
img     =imread('Fig0440(a)(testpattern).tif');
img     =im2double(img);
[M,N]   =size(img);
P       =2*M;
Q       =2*N;
%%%%%%%%%%%% add paddin to image %%%%%%%%%
img_pad = padarray(img,[P/2 Q/2],'post');

%%%%%%%%%%%% centering %%%%%%%%%
img_cent= zeros(P,Q);
 for i=1:P
     for j=1:Q
        img_cent(i,j)= img_pad(i,j).*(-1).^(i+j);
     end
 end

%%%%%%%%%%%% DFT of padded image %%%%%%%%%
img_FT1= fft2(img_cent);
img_FT2= fftshift(img_FT1);
img_FT= 20.*log(abs(img_FT2));


for D= [60 160]
D
    img_Dist= zeros(P,Q);
        for i=1:P
            for j=1:Q
           img_Dist(i,j)= sqrt((i-P/2).^2+(j-Q/2).^2);
           %img_Dist(i,j)= sqrt(R(i,j).^2 + S(i,j).^2);   
            end
        end


     img_filt_L = zeros(P,Q);
        for i = 1:P
            for j = 1:Q
                if  img_Dist(i,j) <= D
                img_filt_L(i,j) = 0;
                else
                img_filt_L(i,j) = 1;
                end
            end
        end
   


     img_filt_G= zeros(P,Q);

    for i = 1:P
        for j = 1:Q
           img_filt_G(i,j) =1- exp(-((i-P/2).^2+(j-Q/2).^2)/(2*D.^2));

        end
    end
    

     Dist=  zeros(P,Q);
     img_filt_B = zeros(P,Q);
    n=2;
    for i = 1:P
        for j = 1:Q
            Dist(i,j)= sqrt((i-P/2).^2+(j-Q/2).^2);

        end
    end
    
    for i = 1:P
        for j = 1:Q
            img_filt_B(i,j) = 1/(1+ (D/Dist(i,j)).^2*n);
        end
    end

    img_G_B= img_FT1.* img_filt_B;

    img_G_L= img_FT1.* img_filt_L;

    img_G_G= img_FT1.* img_filt_G;
    

    img_invF1= ifft2(img_G_L);
    img_invF2= ifft2(img_G_G);
    img_invF3= ifft2(img_G_B);

    img_real1= zeros(P,Q);
    img_real2= zeros(P,Q);
    img_real3= zeros(P,Q);
     for i=1:P
         for j=1:Q
            img_real1(i,j)= img_invF1(i,j).*(-1).^(i+j);
            img_real2(i,j)= img_invF2(i,j).*(-1).^(i+j);
            img_real3(i,j)= img_invF3(i,j).*(-1).^(i+j);
         end
     end

    img_out1 = zeros(M,N);
    img_out2 = zeros(M,N);
    img_out3 = zeros(M,N);
    for x = 1:M
        for y = 1:N
            img_out1(x,y) = img_real1(x,y);
            img_out2(x,y) = img_real2(x,y);
            img_out3(x,y) = img_real3(x,y);
        end
    end

    if D==60
        i=1;
    else
        i=4;
    end
    figure(1);
     subplot(2,3,i);imshow(img_out1);title('IHPF');
     subplot(2,3,i+1);imshow(img_out2);title('GHPF');
     subplot(2,3,i+2);imshow(img_out3);title('BHPF');
     hold on;
end