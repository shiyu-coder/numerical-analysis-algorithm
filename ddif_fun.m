function res = ddif_fun(f, x)
% ������ֵ���׵�
e = 0.0001;
left = diff([f(x-e), f(x)])/e;
right = diff([f(x), f(x+e)])/e;
res = diff([left, right])/e;
end