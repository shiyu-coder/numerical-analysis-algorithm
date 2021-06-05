function poly_plot_fun(param, X, Y, e, x0, y0)
% param:����ʽϵ������
% X:��ֵ�ڵ������
% Y:��ֵ�ڵ�������
% left:��߽�
% right:�ұ߽�
% e:����ͼ���е�������
% x:����ѡ��ҪԤ��ĵ������
% y:����ѡ��ҪԤ��ĵ�������
left = min([x0 - 3 * e, X(1) - 3 * e]);
right = max([x0 + 3 * e, X(length(X)) + 3 * e]);
x = left:e:right;
y = zeros(1, length(x));
for i = 1:length(x)
    for j = 1:length(param)
        y(i) = y(i) + param(j) * x(i) ^ (length(param)-j);
    end
end
plot(x, y, 'b');
hold on
plot(X, Y, 'ro');
if nargin > 4
    hold on
    plot(x0, y0, '*');
end
end