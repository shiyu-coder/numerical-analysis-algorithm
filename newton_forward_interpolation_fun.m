function [res, param] = newton_forward_interpolation_fun(X, Y, x)
% X:横坐标向量
% Y:纵坐标向量
% x:插值节点
n = length(X);
inter = X(2) - X(1);
dt = Y;
for i = 2:n
    dl = zeros(1, n);
    for j = i:n
        dl(j) = dt(i-1, j) - dt(i-1, j-1);
    end
    dt = [dt; dl];
end
t = (x - X(1)) / inter;
param = zeros(1, n);
pse = zeros(1, n);
pse(n) = dt(1, 1);
param = param + pse;
ps = 1;
for i = 2:n
    ps = conv(ps, [1, 2-i]);
    for j = 1:length(ps)
        pse(n-length(ps)+j) = ps(j);
    end
    pse = pse * dt(i, i);
    pse = pse ./ factorial(i-1);
    param = param + pse;
end
res = 0;
for i = 1:n
    res = res + param(i) * t^(n-i);
end
end