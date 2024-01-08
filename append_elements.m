% This function is used for appending elements to a vector
function C = append_elements(P,S)


[M1,N1] = size(P);
[M2,N2] = size(S);



for i = 1:1:M2*N2
    P(M1*N1+i) = S(i);
end

C = P;



end













