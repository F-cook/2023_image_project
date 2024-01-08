% This page describes the first inverse stage of diffusion

function P2 = inverse_diffusion_one(C1,S)


[M,N] = size(C1);

C = C1;

for i = N:-1:2
    P(i) = mod(bitxor(bitxor(C(i),C(i-1)),S(i)),256);
end

% P(1) = C(1);
P(1) = 0;

P2 = P;


end










