clc;clear;
xi = 1994:2003;
xi = xi';
yi = [67.052, 68.008, 69.803, 72.024, 73.400, 72.063, 74.669, 74.487, 74.065, 76.777];
x = sym('x');
p = newtonpoly(x, xi, yi);
% 绘制9次多项式图像
a = 1994:1:2003;
p = subs(p, x, a);
plot(a, p);
% 计算2010年石油产量
res = newtonpoly(2010, xi, yi);
sprintf('%.3f%', res)
