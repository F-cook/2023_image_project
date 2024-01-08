

% This page describe the new generation of the complete key with CCA.


function SS = key_generate_new(P)

[M,N] = size(P);


S(1) = 0;
NS(1) = 0;

NS(2) = P(2);
S(2) = mod(-NS(2),256);


for i = 3:1:N-1
    NS(i) = bitxor(bitxor(P(i),S(i-1)),NS(i-2));
    S(i) = mod(-NS(i),256);
end

S(N) = 0;



SS = S;


end










