% 本文用来将十进制转化为二进制矩阵


function image_bin_matrix = dec_bin(image_dec_matrix)

[M,N] = size(image_dec_matrix);

for i = 1:1:M
    for j = 1:1:N
        for k = 1:1:8
            temp = dec2bin(image_dec_matrix(i,j),8);
            image_bin_matrix(i,k+(j-1)*8) = str2num(temp(1,k));
        end
        
    end
end


end