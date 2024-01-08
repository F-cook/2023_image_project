% This function is used to do donate inverse process before diffusion

function P1 = inverse_concatenate(P2,K)


[M,N] = size(P2);

 
 
for i = M*N:-1:M*N-K+1
    P1(i-(M*N-K)) = P2(i);
end
 
 

for i = M*N-K:-1:1
    P1(i+K) = P2(i);
end


end












