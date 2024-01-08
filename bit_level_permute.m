% This function is used to permute the vector in bit-level
% The input and output is all in decimalism
% The length of S is M*N*8


function C = bit_level_permute(P,S)

P_bin = dec_bin(P);

C_bin = permute_two_v(P_bin,S);

C = bin_dec(C_bin);

end










