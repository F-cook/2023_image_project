% This page tests the posibility of multiple keys.
% This page firstly tests the chosen-ciphertext attacks.
% Conclusion_1: This attack only recover the complete equivalent key except
% the first and the last elements.




vec_one = [1,2,3,4,5,6,7,8,9];

vec_s = [12,23,13,24,56,46,57,46,35];
S = vec_s;


NS = mod(-S,256);
% NS(9) = 0;
% NS(1) = 0;

% Three stage diffusion encryption

%{
P2 = vec_one;

C1 = diffusion_stage_one(P2,S);

C2 = diffusion_stage_two(C1,S);

C3 = diffusion_stage_three_ar(C2,S);
%}






% Three inverse stage decryption

C3 = zeros(1,9);

C2R = inverse_diffusion_three_ar(C3,S);
C1R = inverse_diffusion_two(C2R,S);
P2R = inverse_diffusion_one(C1R,S);

% C1R2 = bitxor(bitxor(NS(2),NS(1)),S(2));
C1R2 = bitxor(NS(2),S(2));
% P2R2 = bitxor(NS(2),NS(1));
P2R2 = NS(2);
P2R3 = bitxor(NS(3),S(2));


SR = key_generate_new(P2R);

%{
C2R9 = 0;
C1R9 = bitxor(NS(9-1),S(9));
P2R9 = bitxor(NS(9-2),S(9-1));
% S(9) is conteract
%}






vec_sT = [0,23,13,24,56,46,57,46,60];
ST = vec_sT;

C2RT = inverse_diffusion_three_ar(C3,ST);
C1RT = inverse_diffusion_two(C2RT,ST);
P2RT = inverse_diffusion_one(C1RT,ST);


% P2RR9 = bitxor(NS(7),S(8));
% SS2 = key_generate_new(P2R2);
%{
%}



%{

C1R9 = bitxor(bitxor(C2R(9),C2R(8)),S(9));
C1R8 = bitxor(bitxor(C2R(8),C2R(7)),S(8));
C1R7 = bitxor(bitxor(C2R(7),C2R(6)),S(7));
C1R6 = bitxor(bitxor(C2R(6),C2R(5)),S(6));
C1R5 = bitxor(bitxor(C2R(5),C2R(4)),S(5));
C1R4 = bitxor(bitxor(C2R(4),C2R(3)),S(4));
C1R3 = bitxor(bitxor(C2R(3),C2R(2)),S(3));
C1R2 = bitxor(bitxor(C2R(2),C2R(1)),S(2));
C1R1 = 0;

%}


%{

P2R9 = bitxor(bitxor(C1R(9),C1R(8)),S(9));
P2R8 = bitxor(bitxor(C1R(8),C1R(7)),S(8));
P2R7 = bitxor(bitxor(C1R(7),C1R(6)),S(7));

P2R2 = bitxor(bitxor(C1R(2),C1R(1)),S(2));
P2R1 = 0;



P2R99 = bitxor(bitxor(NS(9),S(8)),NS(7));
P2R88 = bitxor(bitxor(NS(8),S(7)),NS(6));
P2R77 = bitxor(bitxor(NS(7),S(6)),NS(5));
P2R66 = bitxor(bitxor(NS(6),S(5)),NS(4));
P2R55 = bitxor(bitxor(NS(5),S(4)),NS(3));
P2R44 = bitxor(bitxor(NS(4),S(3)),NS(2));
P2R33 = bitxor(bitxor(NS(3),S(2)),NS(1));
P2R22 = bitxor(NS(2),NS(1));


%}



%{


P2R = inverse_diffusion_one(C1R,S);


SS = key_generate(P2R);


NS = mod(-S,256);


%}




% P2R2 = bitxor(NS(2),S(1));
% C1R2 = bitxor(bitxor(NS(2),NS(1)),S(2));



%{
%}












