% This page tests global permutation.


% Using 9*9 matrix as plaintext-image to test 

P = [1,2,3,4,5,6,7,8,9];


% Generating the key 

record_data = load('vector_2.txt');
S = record_data(1,:);


C = global_permute(P,S);

PR = inverse_global_permute(C,S);










