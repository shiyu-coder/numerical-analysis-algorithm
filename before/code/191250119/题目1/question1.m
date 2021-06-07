%% 用二分法、不动点迭代（与牛顿法不一样）、牛顿法求解以下非线性方程。
% （1）sin x = 6x + 5 
% （2）lnx + x^2 = 3 
% （3）e^x + x = 7
clear;clc;
% 终止条件为前后两次近似解之差小于10^?3
precision = 0.001;
% 声明自变量x
syms x;
%% sin x = 6x + 5
disp('方程一：sin x = 6x + 5');

% 二分法
fun(x) = sin(x) - 6*x - 5;
division_res = division(fun, precision, -1, 0);
disp('二分法：');
disp('观察可知该方程在-1和0间有解');
disp('求解结果：');
disp(division_res);

% 不动点法
fun(x) = (sin(x) - 5) / 6;
fixed_point_res = fixed_point(fun, precision, -1);
disp('不动点迭代法：');
disp('将方程变形为x = (sin(x) - 5) / 6，取x = -1作为初始迭代解');
disp('求解结果：');
disp(fixed_point_res);

% 牛顿法
fun(x) = sin(x) - 6*x - 5;
newton_res = newton(fun, precision, -1);
disp('牛顿法：');
disp('取x = -1作为初始迭代解');
disp('求解结果：');
disp(newton_res);

%% ln x + x^2 = 3
disp('方程二：lnx + x^2 = 3');

% 二分法
fun(x) = log(x) + x^2 - 3;
division_res = division(fun, precision, 1, 2);
disp('二分法：');
disp('观察可知该方程在1和2间有解');
disp('求解结果：');
disp(division_res);

% 不动点法
fun(x) = sqrt(3 - log(x));
fixed_point_res = fixed_point(fun, precision, 2);
disp('不动点迭代法：');
disp('将方程变形为x = (3 - ln(x))^0.5，取x = 2作为初始迭代解');
disp('求解结果：');
disp(fixed_point_res);

% 牛顿法
fun(x) = log(x) + x^2 - 3;
newton_res = newton(fun, precision, 2);
disp('牛顿法：');
disp('取x = 2作为初始迭代解');
disp('求解结果：');
disp(newton_res);

%% e^x + x = 7
disp('方程三：e^x + x = 7');

% 二分法
fun(x) = exp(x) + x - 7;
division_res = division(fun, precision, 1, 2);
disp('二分法：');
disp('观察可知该方程在1和2间有解');
disp('求解结果：');
disp(division_res);

% 不动点法
fun(x) = log(7 - x);
fixed_point_res = fixed_point(fun, precision, 2);
disp('不动点迭代法：');
disp('将方程变形为x = ln(7 - x)，取x = 2作为初始迭代解');
disp('求解结果：');
disp(fixed_point_res);

% 牛顿法
fun(x) = exp(x) + x - 7;
newton_res = newton(fun, precision, 2);
disp('牛顿法：');
disp('取x = 2作为初始迭代解');
disp('求解结果：');
disp(newton_res);