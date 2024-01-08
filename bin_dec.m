% 这是加密最后一个算法了，就是把8位的二进制转为十进制矩阵


function SS = bin_dec(S)

[M,N] = size(S);



for i = 1:1:M
    for j = 1:8:N
        sum = 0;
        for k = 1:1:8
            temp = 8-k;
            sum = sum + S(i,j+k-1) * 2^temp;
        end
        SS(i,fix(j/8) + 1) = sum;
    end
end

            
            


end


