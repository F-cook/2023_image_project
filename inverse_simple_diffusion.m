% This function is the inverse process of simple diffusion

function P = inverse_simple_diffusion(C,S)


[M,N] = size(C);

for i = 1:1:M*N
    P(i) = bitxor(C(i),S(i));
end



end





