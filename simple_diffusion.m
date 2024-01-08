% This page is used to implement the simple diffusion
function C = simple_diffusion(P,S)

[M,N] = size(P);

for i = 1:1:M*N
    C(i) = bitxor(P(i),S(i));
end


end








