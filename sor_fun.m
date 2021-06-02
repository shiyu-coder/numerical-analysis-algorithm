function x = sor_fun(a, b, n, x0, e, w)
% a:系数矩阵
% b:右边向量
% x0:初始向量(列向量)
% e:精度
% w:松弛因子
% 最大迭代次数M
M = 100000;
m = 0;
x = zeros(n, 1);
while m <= M
    m = m + 1;
    for i = 1:n
         sum_ax = 0;
         for j = 1:i-1
             sum_ax = sum_ax + a(i, j) * x(j);
         end
         for j = i+1:n
             sum_ax = sum_ax + a(i, j) * x0(j);
         end
         if i == 0
            x(i) = -(sum_ax - b(i)) / a(i, i);
         elseif i > 0
             x(i) = -w * (sum_ax - b(i)) / a(i, i) + (1 - w) * x0(i);
         end
    end
    if norm(x - x0, 1) < e
        break
    end
    x0 = x;
end
if m > M
    disp('达到最大循环次数')
end
end