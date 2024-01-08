% This function is the combination of concatenate and diffusion
function C3 = C_diffusion(P1,R,K1)


P2 = concatenate(P1,R);

C1 = diffusion_stage_one_ar(P2,K1);

C2 = diffusion_stage_two(C1,K1);

C3 = diffusion_stage_three_ar(C2,K1);



end
















