% This page is used to caculate the entropy of the images
% The offical function entropy() can be used for this test



% clock 6.70566720
% 7.99723228
% plane 6.45227523
% 7.99723838
% rocks 6.70931233
% 7.99715328
% village 7.31180722
% 7.99738733


A = imread('village.png');

entropy_value = entropy(A);



