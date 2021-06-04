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
xp = 1;
res = zeros(1, n);
xpf = zeros(1, n);
xpf(length(xpf)) = T(1, 1);
for i = 2:n
    res = res + xpf;
    xp = conv(xp, ps(i-1, :));
    xpf = zeros(1, n);
    for j = 1:length(xp)
        xpf(n-length(xp)+j) = xp(j);
    end
    xpf = xpf * T(i, i);
end
disp(xpf)
res = res + xpf;
res = res';
end