% 第三题第二问
xi = -2:0.1:6;
x = [-1, 0, 3, 4, 5];
y = [3, 5, 1, 1, 1];
pp = csape(x, [1, y, 1], [2, 2]);
yi = ppval(pp, xi);
plot(x, y, 'bo', xi, yi, 'r-');
disp('插值多项式总共分为4段，每个多项式的系数依次为');
for i = 1:size(pp.coefs, 1)
    disp(pp.coefs(i, :));
end