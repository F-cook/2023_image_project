% This page describes the right stage,i.e.,diffusion_stage_three_ar

function C3 = diffusion_stage_three_ar(C2,S)

[M,N] = size(C2);

C = C2;



for i = N-1:-1:2
    C(i) = mod(C(i) + C(i+1) + S(i),256);
end

C3 = C;

end