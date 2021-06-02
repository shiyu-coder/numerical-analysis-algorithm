function res = dif_fun(f, x)
% 求函数数值一阶导
% f:需要求导的函数
% x:求x处的导数值
e = 0.00000001;
res = diff([f(x), f(x+e)])/e;
end