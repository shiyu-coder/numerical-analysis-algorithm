function f_plot_fun(f, X, Y, e, x0, y0)
% f:函数句柄
% X:插值节点横坐标
% Y:插值节点纵坐标
% left:左边界
% right:右边界
% e:绘制图像中的两点间隔
% x:（可选）要预测的点横坐标
% y:（可选）要预测的点纵坐标
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
