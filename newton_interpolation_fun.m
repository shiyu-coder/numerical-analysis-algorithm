function res = newton_interpolation_fun(X, Y)
% X:横坐标向量
% Y:纵坐标向量
ps = [];
n = length(X);
for i = 1:n
    ps = [ps; poly(X(i))];
end
T = Y;
for i = 1:n-1
    ls = zeros(1, n);
    for j = i:n-1
        ls(j+1) = (T(i, j+1) - T(i, j)) / (X(j+1) - X(j+1-i));
    end
    T = [T; ls];
end

res = zeros(1, n);
for i = 2:n
    xp = 1;
    for j = 1:i-1
        xp = conv(xp, ps(j, :));
    end
    xpf = zeros(1, n);
    for j = 1:length(xp)
        xpf(n-length(xp)+j) = xp(j);
    end
    res = res + T(i, i) * xpf;
    disp(res)
end
res(n) = res(n) + T(1, 1);
res = res';
end