% distance(x,y)
%Returns a matrix z which is the distance of all points connect to each
%other.
%Inputs: x, y = matrices containing x and y dimensions
%Output: z: Matrix containing distance from node to all other nodes
%Matrix size of length(x) X length(x)
%*NOTE: x and y must be matrices of same dimension
function z = distance(x,y)
    z(1:length(x),1:length(x))= 0; %First, declare N x N matrix
    for i =1:length(x)
        for j =1:length(y)
            z(i,j) = sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
        end
    end
end