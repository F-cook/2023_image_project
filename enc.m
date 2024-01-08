% This page intergrates the encryption processes


function GG = enc(P,R,K1,K2,K3)

[M,N] = size(P);



P1 = reshape(P,1,M*N);

P2 = concatenate(P1,R);

C1 = diffusion_stage_one_ar(P2,K1);

C2 = diffusion_stage_two(C1,K1);

C3 = diffusion_stage_three_ar(C2,K1);

E = local_permute(C3,K2);

G = global_permute(E,K3);

GG = reshape(G,M,N);




end












