%Matrix Compressor
%Converts [i][j] matrix to a [a][b] matrix filling blank with 0s.
%Outputs:
%M = matrix[a][b]
%
%Inputs:
%N = matrix size of [i, j] 
%l, h = size of old matrix
%a, b = size of new matrix
%EX: N = [1 2 3
%         3 2 1]
% l = 2, h = 3
function M = matrixExpander(N, l, h, a, b)
    M(1:a,1:b)= 0;
    for i = 1:l
        for j = 1:h
            M(i,j) = N(i,j);
        end
    end
    M
end
