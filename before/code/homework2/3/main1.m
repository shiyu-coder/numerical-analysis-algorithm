% �������һ��
xi = -1:0.1:4;
x = [0, 1, 2, 3];
y = [3, 5, 4, 1];
pp = csape(x, [1, y, 1], [2, 2]);
yi = ppval(pp, xi);
plot(x, y, 'bo', xi, yi, 'r-');
disp('��ֵ����ʽ�ܹ���Ϊ3�Σ�ÿ������ʽ��ϵ������Ϊ');
for i = 1:size(pp.coefs, 1)
    disp(pp.coefs(i, :));
end