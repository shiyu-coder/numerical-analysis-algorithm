function f_plot_fun(f, X, Y, e, x0, y0)
% f:�������
% X:��ֵ�ڵ������
% Y:��ֵ�ڵ�������
% left:��߽�
% right:�ұ߽�
% e:����ͼ���е�������
% x:����ѡ��ҪԤ��ĵ������
% y:����ѡ��ҪԤ��ĵ�������
if nargin > 4
    left = min([x0 - 2 * e, X(1) - 2 * e]);
    right = max([x0 + 2 * e, X(length(X)) + 2 * e]);
else
    left = X(1) - 2 * e;
    right = X(length(X)) + 2 * e;
end
x = left:e:right;
y = zeros(1, length(x));
for i = 1:length(x)
    y(i) = f(x(i));
end
plot(x, y, 'b');
hold on
plot(X, Y, 'ro');
if nargin > 4
    hold on
    plot(x0, y0, '*');
end
end
