% This page describes the diffusion stage two

function C2 = diffusion_stage_two(C1,S)

[M,N] = size(C1);

C = C1;

for i = 2:1:N
    C(i) = mod(bitxor(bitxor(C(i),C(i-1)),S(i)),256);
end

C2 = C;

end










