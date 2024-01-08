% test some funcions
% function reshape()
% progress bar
% imshow, imwrite, image processing

% logistic error ramdom generater
% function test


%{

P1 = [1,2,3,4,5,6,7,8,9];

P2 = reshape(P1,3,3);

P3 = reshape(P2,1,9);

%}




% create a progress bar


%{

L = 0;

h = waitbar(0,'please wait...');
steps = 1000;

for i = 1:1:steps
    L = L + i;
    p = fix(i/steps*10000)/100; % To show 2 numbers 
    str = [num2str(p),'% complete ',num2str(i),'/',num2str(steps)];
    waitbar(i/steps,h,str);
end

delete(h)


%}



% test image process

%{

P = imread('PR_64.jpg');

C = double(P);

imwrite(uint8(C),'PR_64_test.jpg');

%}



% logistic map: X(n+1) = 4X(n) * (1-X(n))
% initial conditions: 0.1, 0.1 + 10 (-15)
% new signal: S(t) = ln(|| X1(t) - X2(t)||)
% transformation way: S = uint8(mod(10^13 * |SS - floor(SS)|,256));

%{

a = 0.1;
b = 0.1 + 10^(-15);

X1(1) = a;
X2(1) = b;


for i = 1:1:20
    X1(i+1) = 4 * X1(i) * (1-X1(i));
    X2(i+1) = 4 * X2(i) * (1-X2(i));
    SS(i) = log(abs(X1(i+1)-X2(i+1)));
    S(i) = uint8(mod(10^13 * abs(SS(i)-floor(SS(i))),256));
end


%}

% test the function of above random number generation

[~,S2] = logi_error_random(0.1,4,20);












