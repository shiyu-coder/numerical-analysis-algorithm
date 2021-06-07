%找出100到300之间能被21整除的数字
%一旦找到三个，立刻停止循环
%展示之前的数字

res = zeros(1, 3);
N = 1;
for i = 100:300
    if mod(i, 21) == 0
        res(N) = i;
        N = N + 1;
    end
    if N > 3
        break
    end
end
disp(res);