% This page describes the right inverse,i.e.,inverse_diffusion_three_ar


function C2 = inverse_diffusion_three_ar(C3,S)

[M,N] = size(C3);

C = C3;


for i = 2:1:N-1
    C(i) = mod(C(i) - C(i+1) - S(i),256);
end

C2 = C;

end