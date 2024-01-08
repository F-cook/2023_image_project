% This page tests the encryption and decryption of 9*9 image 
% Note: encryption and decryption simulate at the same time



% P = [1,2,3;4,5,6;7,8,9];
% P = [128,0,0,0,0,0,0,0,0];
% [M,N] = size(P);






% key generation

% R = round(0.7*M*N);
R = round(0.7*9);

% K1_ = random_256_row(M*N);
% dlmwrite('vector_K1.txt', K1_);
K1 = load('vector_K1.txt');

% K2_ = random_256_row(M*N*8);
% dlmwrite('vector_K2.txt', K2_);
K2 = load('vector_K2.txt');

% K3_ = random_256_row(M*N);
% dlmwrite('vector_K3.txt', K3_);
K3 = load('vector_K3.txt');






% Encryption

P = [81,214,0;197,38,145;251,243,182];

% P = zeros(1,9);

% P = [1,2,3;4,5,6;7,8,9];

% P = [128,0,0;0,0,0;0,0,0];

[M,N] = size(P);

P1 = reshape(P,1,M*N);

P2 = concatenate(P1,R);

% C1 = diffusion_stage_one(P2,K1,R);
C1 = diffusion_stage_one_ar(P2,K1);

C2 = diffusion_stage_two(C1,K1);

C3 = diffusion_stage_three_ar(C2,K1);

E = local_permute(C3,K2);

G = global_permute(E,K3);

GG = reshape(G,M,N);
%{
%}


% Cryptanalysis
% It is better to use another page to test


% Decryption

% 

CX = [128,0,0;0,0,0;0,0,0];
GR = reshape(CX,1,M*N);

% GR = reshape(GG,1,M*N);

ER = inverse_global_permute(GR,K3);

C3R = inverse_local_permute(ER,K2);

C2R = inverse_diffusion_three_ar(C3R,K1);

C1R = inverse_diffusion_two(C2R,K1);

P2R = inverse_diffusion_one(C1R,K1);
%P2R = inverse_diffusion_one_ar(C1R,K1);

P1R = inverse_concatenate(P2R,R);

PR = reshape(P1R,M,N);
%{
%}


