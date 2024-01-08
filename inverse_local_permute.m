% This function is the inverse process of local permute

function P = inverse_local_permute(C,S)

[M,N] = size(C);

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


P = RP;




end