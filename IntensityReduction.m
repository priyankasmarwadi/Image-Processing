clc;
close all;
X= imread('drip-bottle-256.tiff');                % input image
N =input('Enter the shrinking factor of the image: ');                                        % desired number of intensity level

while (N > 0)   
 Intensity_level = 2^N                            % current intensity level
 Intensity_level_N = 256 / Intensity_level;
 Revised_image = uint8(floor(double(X)/256 * Intensity_level) * Intensity_level_N);
 N = N - 1;                                       % reduce the power of 2 
end