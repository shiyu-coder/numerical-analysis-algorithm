function x = col_pivot_gauss_elimi_fun(a, b, n)
% a:系数矩阵
% b：右边向量
% n：方程组的阶数
% x: 求解结果列向量
m = zeros(n, n);
x = zeros(n, 1);
for k = 1:n-1
    if det(a) == 0
        disp('第'+str(k)+'次迭代的矩阵a的顺序主子式为0，无法继续运算');
        return
    end
    max_ai = k;
    max_a = a(k, k);
    for i = k:n
        if a(i, k) > max_a
            max_a = a(i, k);
            max_ai = i;
        end
    end
    if max_ai ~= k
        tmp = a(k, :);
        a(k, :) = a(max_ai, :);
        a(max_ai, :) = tmp;
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
for i = n-1:1
    sum_of_ax = 0;
    for j = i+1:n
        sum_of_ax = sum_of_ax + a(i, j) * x(j);
    end
    x(i) = (b(i) - sum_of_ax) / a(i, i);
end
end