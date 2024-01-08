% This function is used to generate random numbers for encryption.


% logistic map: X(n+1) = 4X(n) * (1-X(n))
% initial conditions: 0.1, 0.1 + 10 (-15)
% new signal: S(t) = ln(|| X1(t) - X2(t)||)
% transformation way: S = uint8(mod(10^13 * |SS - floor(SS)|,256));

% 0 < ini < 1
% 3.5699456 < k < = 4


% S1 is the random sequence, and S2 is the results of sequence moded 256


function [S1,S2] = logi_error_random(ini,k,num)



% a = 0.1;
% b = 0.1 + 10^(-15);

a = ini;
b = ini + 10^(-15);

X1(1) = a;
X2(1) = b;


for i = 1:1:num
    X1(i+1) = k * X1(i) * (1-X1(i));
    X2(i+1) = k * X2(i) * (1-X2(i));
    SS(i) = log(abs(X1(i+1)-X2(i+1)));
    S1(i) = abs(SS(i)-floor(SS(i)));
    S2(i) = uint8(mod(10^13 * abs(SS(i)-floor(SS(i))),256));
end


end















