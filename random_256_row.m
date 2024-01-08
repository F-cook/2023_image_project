% This function generates 0-256 row vector


function S = random_256_row(num)


% 大小必须在1至1024之间
arrayLength = num;
% 数据类型必须为 'uint8'，'uint16'，'hex16'
dataType = 'uint8';
% 只有数据类型为'hex16'时，blockSize参数才起作用
blockSize = 2;


web1 = 'http://qrng.anu.edu.au/API/jsonI.php?length=';
web2 = '&type=';
web3 = '&size=';
% 组合网址
qrngWeb = strcat(web1,num2str(arrayLength),...
                 web2,num2str(dataType),...
                 web3,num2str(blockSize));
% 使用webread访问ANU Quantum Random Numbers Server
randNum = webread(qrngWeb);


% transport the column vector into row 
random_256_matrix = randNum.data';

S = random_256_matrix;

end







