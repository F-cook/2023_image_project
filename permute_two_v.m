% This function can permute vector with aother vector
% The vector of parameters are not transport into 8-bit

function C = permute_two_v(P,S)


[M,N] = size(P);

[W,index] = sort(S,'descend');


for i = 1:1:M*N
    C(i) = P(index(i));
end



end











