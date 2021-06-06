function multi_poly_plot_fun(param, X, Y, e, x0, y0)
% param:����ʽϵ������
% X:��ֵ�ڵ������
% Y:��ֵ�ڵ�������
% left:��߽�
% right:�ұ߽�
% e:����ͼ���е�������
% x:����ѡ��ҪԤ��ĵ������
% y:����ѡ��ҪԤ��ĵ�������
[n, m] = size(param);
for i = 1:n
    if i == 1
        if nargin > 4
            left = min([x0 - 3 * e, X(i) - 3 * e]);
            x = left:e:X(i+1);
        else
            x = (X(i)-3 * e):e:X(i+1);
        end
    elseif i == n
        if nargin > 4
            right = max([x0 + 3 * e, X(i+1) + 3 * e]);
            x = X(i):e:right;
        else
            x = X(i):e:X(i+1) + 3 * e;
        end
    else
        x = X(i):e:X(i+1);
    end
    y = zeros(1, length(x));
    for j = 1:m
        y = y + param(i, j) * x .^ (m-j);
    end
    plot(x, y, 'b');
    hold on
end
plot(X, Y, 'ro');
if nargin > 6
    hold on
    plot(x0, y0, '*');
end
end