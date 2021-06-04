function disp_fun(X)
% X:系数矩阵
% 系数个数n
n = length(X);
if n == 1
    fprintf('%.2f', X(1))
elseif n > 1
    res = '';
    for i = 1:n
        if i == 1
            if X(i) == -1
                res = [res, '-'];
            elseif X(i) == 1.0
                res = res;
            else
                res = [res, num2str(X(i))];
            end
            res = [[res, 'x^'], num2str(n-i)];
        elseif i < n - 1
            if X(i) > 0
                res  = [[[[res, '+'], num2str(X(i))], 'x^'], num2str(n-i)];
            elseif X(i) < 0
                res  = [[[res, num2str(X(i))], 'x^'], num2str(n-i)];
            end
        elseif i == n - 1
            if X(i) > 0
                res  = [[[res, '+'], num2str(X(i))], 'x'];
            elseif X(i) < 0
                res  = [[res, num2str(X(i))], 'x'];
            end
        else
            if X(i) > 0
                res = [[res, '+'], num2str(X(i))];
            elseif X(i) < 0
                res = [res, num2str(X(i))];
            end
        end
    end
end
disp(res)
end