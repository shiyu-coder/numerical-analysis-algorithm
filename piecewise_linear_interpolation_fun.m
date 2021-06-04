function res = piecewise_linear_interpolation_fun(X, Y)
% X:横坐标向量
% Y:纵坐标向量
n = length(X);
res = zeros(n-1, 2);
for i = 1:n-1
    res(i, 1) = Y(i) / (X(i) - X(i+1)) + Y(i+1) / (X(i+1) - X(i));
    res(i, 2) = -X(i+1) * Y(i) / (X(i) - X(i+1)) - X(i) * Y(i+1) / (X(i+1) - X(i));
end