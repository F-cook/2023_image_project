% This page is used to test the correlation of adjacent pixels

% Already function: Correlation_of_adjacent_pixels
% Webpage address: https://blog.csdn.net/qq_40666149/article/details/106161094

% Horizontal, Vertical, Diagonal

% clock 0.95422163 0.97281259 0.93279200
% 0.00755509 0.00863754 -0.00271710
% plane 0.95520683 0.88899653 0.84168231
% -0.00848229 0.01488556 0.02567358
% rocks 0.90160877 0.93786849 0.89837895
% 0.01589989 -0.00865170 0.00677589
% village 0.90124276 0.84725473 0.81213267
% 0.00504247 0.00314081 -0.00123499



A = imread('village_enc.png');

co = Correlation_of_adjacent_pixels(A,3,10000);











