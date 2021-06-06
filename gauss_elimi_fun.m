function x = gauss_elimi_fun(a, b)
% a:系数矩阵
% b：右边向量
% n：方程组的阶数
% x: 求解结果列向量
n = length(b);
m = zeros(n, n);
x = zeros(n, 1);
for k = 1:n-1
    if det(a) == 0
        disp('第'+str(k)+'次迭代的矩阵a的顺序主子式为0，无法继续运算');
        return
    end
    for i = k+1:n
        m(i, k) = a(i, k) / a(k, k);
        for j = k+1:n
            a(i, j) = a(i, j) - m(i, k) * a(k, j);
        end
        b(i) = b(i) - m(i, k) * b(k);
    end
end
x(n) = b(n) / a(n, n);
for i = n-1:-1:1
    sum_of_ax = 0;
    for j = i+1:n
        sum_of_ax = sum_of_ax + a(i, j) * x(j);
    end
    disp(sum_of_ax)
    x(i) = (b(i) - sum_of_ax) / a(i, i);
end
end