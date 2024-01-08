% This function is the inverse process of permute two vector


function P = permute_two_vi(C,S)


[M,N] = size(C);

[W,index] = sort(S,'descend');


for i = 1:1:M*N
    P(index(i)) = C(i);
end



end









