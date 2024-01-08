% This page is used to permute the dec form matrix.
% P is dec form, S is 8 times form length.
% C is dec form.

function C = local_permute(P,S)



[M,N] = size(P);
P_bin = dec_bin(P);
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





end






