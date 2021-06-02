function res = newton_know_root_fun(f, x0, m, e)
% f:函数
% x0:初始迭代值
% m:m重根
% e:精度
x1 = x0 - f(x0) / dif_fun(f, x0);
while abs(x1 - x0) >= e
    x0 = x1;
    x1 = x0 - m * f(x0) / dif_fun(f, x0);
end
res = x1;
end