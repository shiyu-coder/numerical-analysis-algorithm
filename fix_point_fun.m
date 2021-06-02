function res = fix_point_fun(f, x0, e)
% f:函数指针
% x0:迭代初值
% e:精度
x1 = f(x0);
while abs(x1 - x0) >= e
    x0 = x1;
    x1 = f(x0);
end
res = x1;
end