function x = gauss_seidel_fun(a, b, x0, e)
% a:系数矩阵
% b:右边向量
% x0:初始向量(列向量)
% e:精度
% 最大迭代次数M
n = length(b);

 % 求系数矩阵的对角矩阵
cm_diag = diag(diag(a));
B = cm_diag \ (cm_diag - a);
% 计算谱半径
R = max(abs(eig(B)));
if R >= 1
    x = zeros(n, 1);
    disp('谱半径不小于1，无法收敛')
    return
end

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
         x(i) = -(sum_ax - b(i)) / a(i, i);
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