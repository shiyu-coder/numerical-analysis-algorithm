function res = dif_fun(f, x)
% ������ֵһ�׵�
% f:��Ҫ�󵼵ĺ���
% x:��x���ĵ���ֵ
e = 0.00000001;
res = diff([f(x), f(x+e)])/e;
end