% This page is a try to cryptanalysis in 9*9 image



P = [1,2,3;4,5,6;7,8,9];

R = round(0.7*9);



% Key generation

K1 = load('vector_K1.txt');
K2 = load('vector_K2.txt');
K3 = load('vector_K3.txt');


% Encryption and decryption


% C = enc(P,R,K1,K2,K3);
% PR = dec(C,R,K1,K2,K3);





% Chosen-ciphertext attack

CC = zeros(3,3);

PP = dec(CC,R,K1,K2,K3);

[M,N] = size(PP);

PP1 = reshape(PP,1,M*N);
PP2 = concatenate(PP1,R);

SS = key_generate_new(PP2);














