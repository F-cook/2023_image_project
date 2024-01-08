% This page test the enhanced encryption
% 256 * 256 images are used.
% follow the progress of paper


% plantext image and encryption elements generation

P = double(imread('imgs/plane.tiff'));

[M,N] = size(P);

R = round(0.7*M*N);

% three vectors used for diffusion

%{
[~,S1] = logi_error_random(0.1,4,M*N); 
dlmwrite('vector_S1_256.txt', S1);
[~,S2] = logi_error_random(0.2,4,M*N); 
dlmwrite('vector_S2_256.txt', S2);
[~,S3] = logi_error_random(0.3,4,M*N); 
dlmwrite('vector_S3_256.txt', S3);
%}


% generate a vector for bit-level permutation
% [S4,~] = logi_error_random(0.3,4,M*N*8); 
% dlmwrite('vector_S4_256.txt', S4);

% generate a vector for simple diffusion
% [~,S5] = logi_error_random(0.33,4,M*N); 
% dlmwrite('vector_S5_256.txt', S5);


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

% imshow(C,[0,255]);



% decryption

PDDR = reshape(C,1,M*N);

PDPR = inverse_simple_diffusion(PDDR,S5);

PDR = inverse_bit_level_permute(PDPR,S4);

PD2R = inverse_diffusion_three_ar(PDR,S3);

PD1R = inverse_diffusion_two(PD2R,S2);

PCR = inverse_diffusion_one_ar(PD1R,S1);

PVR = inverse_concatenate(PCR,R);

PR = reshape(PVR,M,N);

imwrite(uint8(PR),'enc_imgs/plane.png');

% imshow(PR,[0,255]);



