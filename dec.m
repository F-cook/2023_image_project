% This page intergrates the decryption processes


function PR = dec(GG,R,K1,K2,K3)

[M,N] = size(GG);

GR = reshape(GG,1,M*N);

ER = inverse_global_permute(GR,K3);

C3R = inverse_local_permute(ER,K2);

C2R = inverse_diffusion_three_ar(C3R,K1);

C1R = inverse_diffusion_two(C2R,K1);

P2R = inverse_diffusion_one_ar(C1R,K1);

P1R = inverse_concatenate(P2R,R);

PR = reshape(P1R,M,N);




end