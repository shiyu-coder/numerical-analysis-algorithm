function multi_poly_plot_fun(param, X, Y, e, x0, y0)
% param:多项式系数向量
% X:插值节点横坐标
% Y:插值节点纵坐标
% left:左边界
% right:右边界
% e:绘制图像中的两点间隔
% x:（可选）要预测的点横坐标
% y:（可选）要预测的点纵坐标
[n, m] = size(param);
for i = 1:n
    if i == 1
        x = (X(i)-3 * e):e:X(i+1);
    elseif i == n
        x = X(i):e:(X(i+1) + 3 * e);
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