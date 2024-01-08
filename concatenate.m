% This function is used to do something before diffusion, 
% i.e., concatenate.


function P2 = concatenate(P1, K)


[M,N] = size(P1);


for i = 1:1:M*N-K
    P2(i) = P1(i+K);
end

for i = M*N-K+1:1:M*N
    P2(i) = P1(i-(M*N-K));
end
 



end









