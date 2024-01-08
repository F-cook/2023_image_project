% This page describes various test for the encrypted images.
% A-clock,B-plane,C-rocks,D-village

% clock 250.5781
% plane 251.1484
% rocks 258.7813
% village 237.6797




% histogram

A = imread('village.tiff');
imwrite(uint8(A),'village.png');
% imhist(A);





% A_enc = imread('village.tiff');
% imhist(A_enc);

%{

%}

%{

A_enc = imread('village_enc.png');
X = imhist(A_enc);

v = 0;
z = 0;

for i = 1:1:256
    z = ((X(i)-256)^2)/256;
    v = v + z;
end
    


%}

%{

B = imread('plane.tiff');
imhist(B);

%}



% B_enc = imread('plane_enc.jpg');
% imhist(B_enc);



% C = imread('rocks.tiff');
% imhist(C);


% C_enc = imread('rocks_enc.jpg');
% imhist(C_enc);


% D = imread('village.tiff');
% imhist(D);


% D_enc = imread('village_enc.jpg');
% imhist(D_enc);















