% This page is used to generate test images for evaluating enhanced cipher



% plantext image and encryption elements generation

P = double(imread('imgs/village.tiff'));

%  P(179,179) = 200;
% P(50,50) = 200;
% P(100,100) = 200;
%  P(150,150) = 200;
P(200,200) = 200;



[M,N] = size(P);

R = round(0.7*M*N);


% S1,S2,S3 for diffusion
% S4 for permutation
% S5 for simple diffusion

S1 = load('vector_S1_256.txt');
S2 = load('vector_S2_256.txt');
S3 = load('vector_S3_256.txt');
S4 = load('vector_S4_256.txt');
S5 = load('vector_S5_256.txt');


% encryption

PV = reshape(P,1,M*N);

PC = concatenate(PV,R);

PD1 = diffusion_stage_one_ar(PC,S1);

PD2 = diffusion_stage_two(PD1,S2);

PD = diffusion_stage_three_ar(PD2,S3);

PDP = bit_level_permute(PD,S4);

PDD = simple_diffusion(PDP,S5);

C = reshape(PDD,M,N);


% imwrite(uint8(C),'enc_imgs/***_enc.jpg');

imwrite(uint8(C),'enc_imgs/village_enc6.png');





