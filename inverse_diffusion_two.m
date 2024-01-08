% This page describe the second inverse diffusion stage

function C1 = inverse_diffusion_two(C2,S)

[M,N] = size(C2);

C = C2;

for i = N:-1:2
    C(i) = mod(bitxor(bitxor(C(i),C(i-1)),S(i)),256);
end



C1 = C;

end











