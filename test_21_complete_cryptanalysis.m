% This page is used to describe the giant image of cryptanalysis.


% To transform the data of the image into double, or something wrong will happen. 
P = double(imread('imgs/5.2.10.tiff'));
[M,N] = size(P);



% The following is used to show the image correctly. 
% imshow(P,[0,255]);


% key generation
%
R = round(0.7*M*N);

% K1_ = random_256_row(M*N);
% dlmwrite('vector_K1.txt', K1_);
K1 = load('vector_K1_BIG.txt');

% K2_ = random_256_row(M*N*8);
% dlmwrite('vector_K2.txt', K2_);
K2 = load('vector_K2_BIG.txt');

% K3_ = random_256_row(M*N);
% dlmwrite('vector_K3.txt', K3_);
K3 = load('vector_K3_BIG.txt');




% Encryption

C = enc(P,R,K1,K2,K3);






% Cryptanalysis


% achieve the equivalent diffusion key

C0 = zeros(M,N);

P0 = dec(C0,R,K1,K2,K3);

% achieve the intermedia result before diffusion
P0_ = reshape(P0,1,M*N);
P0__ = concatenate(P0_,R);


SR = key_generate_new(P0__);













% obtain the permutation matrix




R_loc = [];

for i = 1:1:M*N
    for j = 7:-1:0
        A = zeros(1,M*N);
        A(i) = 2^j;
        A_ = reshape(A,M,N);
        B = dec(A_,R,K1,K2,K3);
        B_ = reshape(B,1,M*N);
        B__ = C_diffusion(B_,R,SR);
        B__bin = dec_bin(B__);
        % B1 = local_permute(A,K2);
        % B2 = global_permute(B1,K3);
        % B2_bin = dec_bin(B2);
        location = find(B__bin == 1);
        R_loc = append_elements(R_loc,location);
    end
end










% finally, obtain the plaintext 




CC0 = C;
CC1 = reshape(CC0,1,M*N);
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

PR = reshape(P1R,M,N);


imshow(PR,[0,255]);



