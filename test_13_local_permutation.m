% This page tests the local permutation function


% Using 9*9 matrix as plaintext-image to test 

P = [1,2,3,4,5,6,7,8,9];
P_bin = dec_bin(P);

% Generating the key 

record_data = load('vector_3.txt');
S = record_data(1,:);

% function permute_two_v is used to permute the vector with same length 
% key matrix






% [M,N] = size(P);


%{
%}

[M,N] = size(P);
C_bin = [];


for i = 1:1:M*N
    for j = 1:1:8
        sub_P_bin(j) = P_bin(j+8*(i-1));
        sub_S(j) = S(j+8*(i-1));
    end
    sub_C_bin = permute_two_v(sub_P_bin,sub_S);
    C_bin = append_elements(C_bin,sub_C_bin);
end

C = bin_dec(C_bin);






% The following content tests the process is or not true permutation
% i.e., the zeros and the ones are equal or not in plain-text and cipher

%{
MM = 0;
NN = 0;

for i = 1:1:72
    if P_bin(i) == 1
        MM = MM +1;
    end
end

for i = 1:1:72
    if C_bin(i) == 1
        NN = NN +1;
    end
end     

%}





% C = local_permute(P,S);










% Recovering the P

%{
RC_bin = dec_bin(C);

RP_bin = []; 

for i = 1:1:M*N
    for j = 1:1:8
        sub_RC_bin(j) = RC_bin(j+8*(i-1));
        sub_S(j) = S(j+8*(i-1));
    end
    sub_RP_bin = permute_two_vi(sub_RC_bin,sub_S);
    RP_bin = append_elements(RP_bin,sub_RP_bin);
end

RP = bin_dec(RP_bin);

%}


RP = inverse_local_permute(C,S);







