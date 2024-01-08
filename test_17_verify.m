% This page verifies the previous conclusions.



P = [1,2,3;4,5,6;7,8,9];

R = round(0.7*9);

[M,N] = size(P);


% Key generation

K1 = load('vector_K1.txt');
K2 = load('vector_K2.txt');
K3 = load('vector_K3.txt');




% Encryption

P1 = reshape(P,1,M*N);

P2 = concatenate(P1,R);

C1 = diffusion_stage_one(P2,K1,R);

C2 = diffusion_stage_two(C1,K1);

C3 = diffusion_stage_three_ar(C2,K1);

E = local_permute(C3,K2);

G = global_permute(E,K3);

GG = reshape(G,M,N);



% Chosen-ciphertext attack

CC = zeros(3,3);

PP = dec(CC,R,K1,K2,K3);

[M,N] = size(PP);

PP1 = reshape(PP,1,M*N);
PP2 = concatenate(PP1,R);

SR = key_generate_new(PP2);


% verify the validation of recover key


CC1 = diffusion_stage_one(P2,SR,R);

CC2 = diffusion_stage_two(CC1,SR);

CC3 = diffusion_stage_three_ar(CC2,SR);


% It works, no problem
















