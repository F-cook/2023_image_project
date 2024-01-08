% This page tests the complete cryptanalysis of 3*3 plain-image.


P = [1,2,3;4,5,6;7,8,9];

[M,N] = size(P);





% key generation
%
R = round(0.7*M*N);

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

C = enc(P,R,K1,K2,K3);
% PR = dec(C,R,K1,K2,K3);


% Cryptanalysis




% achieve the equivalent diffusion key

C0 = zeros(3,3);

P0 = dec(C0,R,K1,K2,K3);

% achieve the intermedia result before diffusion
P0_ = reshape(P0,1,9);
P0__ = concatenate(P0_,R);


SR = key_generate_new(P0__);





% Some tests


%{
B = zeros(1,9);
B(1) = 2^7;
B_ = reshape(B,3,3);


GR = reshape(B_,1,M*N);
ER = inverse_global_permute(GR,K3);
C3R = inverse_local_permute(ER,K2);



A = dec(B_,R,K1,K2,K3);
A_ = reshape(A,1,9);
A__ = C_diffusion(A_,R,SR);
% A_0 = C_diffusion(A,R,K1);


% B__ = C_diffusion(A,R,SR);



%}





% obtain the permutation matrix




R_loc = [];

for i = 1:1:9
    for j = 7:-1:0
        A = zeros(1,9);
        A(i) = 2^j;
        A_ = reshape(A,3,3);
        B = dec(A_,R,K1,K2,K3);
        B_ = reshape(B,1,9);
        B__ = C_diffusion(B_,R,SR);
        B__bin = dec_bin(B__);
        % B1 = local_permute(A,K2);
        % B2 = global_permute(B1,K3);
        % B2_bin = dec_bin(B2);
        location = find(B__bin == 1);
        R_loc = append_elements(R_loc,location);
    end
end
%{
%}


% Some tests of permutation


%{

A = zeros(1,9);
A(1,7) = 128;
A_ = reshape(A,3,3);
B = dec(A_,R,K1,K2,K3);
B_ = reshape(B,1,9);
B__ = C_diffusion(B_,R,K1);
% B__ = C_diffusion(B_,R,SR);

%}





% finally, obtain the plaintext 




CC0 = C;
CC1 = reshape(CC0,1,9);
CC_bin = dec_bin(CC1);
[M,N] = size(CC_bin);

index = R_loc;

for i = 1:1:M*N
    % C3R_bin(i) = CC_bin(index(i));
    C3R_bin(index(i)) = CC_bin(i);
end

C3R = bin_dec(C3R_bin);

C2R = inverse_diffusion_three_ar(C3R,SR);

C1R = inverse_diffusion_two(C2R,SR);

P2R = inverse_diffusion_one_ar(C1R,SR);

P1R = inverse_concatenate(P2R,R);

PR = reshape(P1R,3,3);

%{
%}
