% This page describes the first stage of diffusion (correct edition). 

function C1 = diffusion_stage_one_ar(P2,S)


[M,N] = size(P2);

C(1) = P2(1);
% C(1) = S(R);

for i = 2:1:N
    C(i) = mod(bitxor(bitxor(P2(i),C(i-1)),S(i)),256);
end

C1 = C;

end