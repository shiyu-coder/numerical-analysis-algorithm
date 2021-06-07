% 第三题第一问
xi = -1:0.1:4;
x = [0, 1, 2, 3];
y = [3, 5, 4, 1];
pp = csape(x, [1, y, 1], [2, 2]);
yi = ppval(pp, xi);
plot(x, y, 'bo', xi, yi, 'r-');
disp('插值多项式总共分为3段，每个多项式的系数依次为');
for i = 1:size(pp.coefs, 1)
    disp(pp.coefs(i, :));
end