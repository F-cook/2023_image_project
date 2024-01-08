% This plage is used to test NPCR and UACI

% function NPCRUACIBACI() can be used for this test

% NPCR (99.6026, 99.6162) 99.6094%
% UACI (33.4379, 33.4891) 33.4635%

% clock 10
% plane 3 5
% rocks 3
% village 2 5 



% village uaci
% 4 27.8379013
% 6 30.8660409
% 3 32.4752448
% 5 36.6173837
% 2 38.9741785

% (30.8660409 + 36.6173837)/2
% 33.4417123

A = imread('village_enc.png');
B = imread('village_enc5.png');

nu = NPCRUACIBACI(A,B);




