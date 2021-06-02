function res = newton_downhill_fun(f, x0, e)
% f:函数
% x0:初始迭代值
% e:精度
x1 = x0 - f(x0) / dif_fun(f, x0);
while abs(x1 - x0) >= e
    lambda = 1;
    while abs(f(x1)) >= abs(f(x0))
        lambda = lambda / 2;
        x1 = x0 - lambda * f(x0) / dif_fun(f, x0);
    end
    x0 = x1;
    x1 = x0 - lambda * f(x0) / dif_fun(f, x0);
end
res = x1;
end