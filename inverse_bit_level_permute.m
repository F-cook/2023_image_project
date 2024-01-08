% This function is used to permute the vector in bit-level inversely
% permute_two_vi is the inverse function

function P = inverse_bit_level_permute(C,S)

C_bin = dec_bin(C);

P_bin = permute_two_vi(C_bin,S);

P = bin_dec(P_bin);


end






