function res = newton_unknow_root_fun(f, x0, e)
% f:����
% x0:��ʼ����ֵ
% e:����
x1 = x0 - f(x0) / dif_fun(f, x0);
while abs(x1 - x0) >= e
    x0 = x1;
    x1 = x0 - dif_fun(f, x0) * f(x0) / (dif_fun(f, x0) * dif_fun(f, x0) - f(x0) * ddif_fun(f, x0));
end
res = x1;
end