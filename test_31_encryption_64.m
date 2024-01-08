% This page tests the encryption process of the 64*64 size image.





% To transform the data of the image into double, or something wrong will happen. 
PP = imread('imgs/5.2.10.tiff');
P = double(imresize(PP,0.125));
[M,N] = size(P);

% The following is used to show the image correctly. 
% imshow(P,[0,255]);




% key generation

R = round(0.7*M*N);

% K1__ = random_256_row(M*N);
%{
K1__ = ceil(rand(1,M*N)*256-1);
dlmwrite('vector_K1_64.txt', K1__);

K2__ = ceil(rand(1,M*N*8)*256-1);
dlmwrite('vector_K2_64.txt', K2__);

K3__ = ceil(rand(1,M*N)*256-1);
dlmwrite('vector_K3_64.txt', K3__);
%}


K1 = load('vector_K1_64.txt');
K2 = load('vector_K2_64.txt');
K3 = load('vector_K3_64.txt');




% Encryption

P1 = reshape(P,1,M*N);

P2 = concatenate(P1,R);

C1 = diffusion_stage_one_ar(P2,K1);

C2 = diffusion_stage_two(C1,K1);

C3 = diffusion_stage_three_ar(C2,K1);

E = local_permute(C3,K2);

G = global_permute(E,K3);

GG = reshape(G,M,N);

% imshow(GG,[0,255]);


tic


% Decryption

GR = reshape(GG,1,M*N);

ER = inverse_global_permute(GR,K3);

C3R = inverse_local_permute(ER,K2);

C2R = inverse_diffusion_three_ar(C3R,K1);

C1R = inverse_diffusion_two(C2R,K1);

P2R = inverse_diffusion_one(C1R,K1);

P1R = inverse_concatenate(P2R,R);

PR = reshape(P1R,M,N);

imshow(PR,[0,255]);
% 


toc
















