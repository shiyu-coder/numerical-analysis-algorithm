% ������ڶ���
xi = -2:0.1:6;
x = [-1, 0, 3, 4, 5];
y = [3, 5, 1, 1, 1];
pp = csape(x, [1, y, 1], [2, 2]);
yi = ppval(pp, xi);
plot(x, y, 'bo', xi, yi, 'r-');
disp('��ֵ����ʽ�ܹ���Ϊ4�Σ�ÿ������ʽ��ϵ������Ϊ');
for i = 1:size(pp.coefs, 1)
    disp(pp.coefs(i, :));
end