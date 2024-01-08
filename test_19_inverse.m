% This page solves some problems about order of dec/enc.





P = [1,2,3,4,5,6,7,8,9];

K = load('vector_K1.txt');

%{

C1 = diffusion_stage_one_ar(P,K);

C2 = diffusion_stage_two(C1,K);

C3 = diffusion_stage_three_ar(C2,K);



C3R = inverse_diffusion_three_ar(C3,K);

C2R = inverse_diffusion_two(C3R,K);

C1R = inverse_diffusion_one_ar(C2R,K);

%}

%{

C3 = zeros(1,9);

C2R = inverse_diffusion_three_ar(C3,K);
C1R = inverse_diffusion_two(C2R,K);
P2R = inverse_diffusion_one_ar(C1R,K);

SR = key_generate_new(P2R);

%}







