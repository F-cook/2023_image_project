% This page tests the fusion of two stage permutation
% permutation function: local permute, global permute



%P = [2,0,0,0,0,0,0,0,0];

%[M,N] = size(P);





% key generation

%R = round(0.7*M*N);

% K1_ = random_256_row(M*N);
% dlmwrite('vector_K1.txt', K1_);
K1 = load('vector_K1.txt');

% K2_ = random_256_row(M*N*8);
% dlmwrite('vector_K2.txt', K2_);
K2 = load('vector_K2.txt');

% K3_ = random_256_row(M*N);
% dlmwrite('vector_K3.txt', K3_);
K3 = load('vector_K3.txt');



%{

% Encryption

C1 = local_permute(P,K2);

C2 = global_permute(C1,K3);

C2_bin = dec_bin(C2);

location = find(C2_bin == 1);

%}



% A = zeros(1,9);
R_loc = [];


%{

for i = 1:1:9
    for j = 7:-1:0
        A = zeros(1,9);
        A(i) = 2^j;
        
        B1 = local_permute(A,K2);
        B2 = global_permute(B1,K3);
        
        B2_bin = dec_bin(B2);
        location = find(B2_bin == 1);
        R_loc = append_elements(R_loc,location);
    end
end
        

%}




for i = 1:1:9
    for j = 7:-1:0
        A = zeros(1,9);
        A(i) = 2^j;
        B1 = inverse_global_permute(A,K3);
        B2 = inverse_local_permute(B1,K2);
        % B1 = local_permute(A,K2);
        % B2 = global_permute(B1,K3);
        B2_bin = dec_bin(B2);
        location = find(B2_bin == 1);
        R_loc = append_elements(R_loc,location);
    end
end
%{
%}


%{
A = zeros(1,9);
A(1) = 128;
B1 = inverse_global_permute(A,K3);
B2 = inverse_local_permute(B1,K2);
%}





% Test the correctness of record location

% Encryption



PP = [1,2,3,4,5,6,7,8,9];
% PP = [1,0,0,0,0,0,0,0,0];

%{

CM = local_permute(PP,K2);
CC = global_permute(CM,K3);

%}


% test global permutation first 


CM = inverse_global_permute(PP,K3);
CC = inverse_local_permute(CM,K2);
%{ 
%}


% CC_bin = dec_bin(CC);

%{
%}



%{

PP_bin = dec_bin(PP);
CC_bin = dec_bin(CC);

MM = 0;
NN = 0;

for i = 1:1:72
    if PP_bin(i) == 1
        MM = MM +1;
    end
end

for i = 1:1:72
    if CC_bin(i) == 1
        NN = NN +1;
    end
end     

%}



% Cryptanalysis



CC_bin = dec_bin(CC);
[M,N] = size(CC_bin);

index = R_loc;

for i = 1:1:M*N
    PR_bin(i) = CC_bin(index(i));
end

PR = bin_dec(PR_bin);
%{

%}





%{

LL = 0;

for i = 1:1:72
    if PR_bin(i) == 1
        LL = LL +1;
    end
end     

%}

% PR = bin_dec(PR_bin);






%{
%}








