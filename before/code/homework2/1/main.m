% 拉格朗日插值
x = [25, 40, 50, 60];
y = [95, 75, 63, 54];
x0 = 70;
res = lagrange(x, y, x0);
res = double(res);
sprintf('%.1f', res)