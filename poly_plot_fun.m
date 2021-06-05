function poly_plot_fun(param, X, Y, e, x0, y0)
% param:多项式系数向量
% X:插值节点横坐标
% Y:插值节点纵坐标
% left:左边界
% right:右边界
% e:绘制图像中的两点间隔
% x:（可选）要预测的点横坐标
% y:（可选）要预测的点纵坐标
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