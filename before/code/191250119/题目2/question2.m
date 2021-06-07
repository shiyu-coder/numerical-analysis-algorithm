%% 用高斯消去法、Jacobi 迭代、G-S 迭代求解以下线性方程组。
clear;clc;
precision = 0.001;
%% 第一问
% 2x - 2y - z = ?2 
% 4x + y - 2z = 1
% -2x + y - z = ?3

disp('第一问：');

% 系数矩阵cm
cm = [2, -2, -1;4, 1, -2;-2, 1, -1];
% 常数项矩阵
bm = [-2;1;-3];

% 高斯消去法
gauss_res = gauss_elimination(cm, bm);
disp('高斯消去法结果：');
disp(gauss_res);
% Jacobi迭代
[convergence, jacobi_res] = jacobi(cm, bm, precision);
disp('Jacobi迭代结果：');
if convergence
    disp(jacobi_res);
else
    disp('谱半径不小于1，迭代不收敛');
end
% G-S迭代
[convergence, GS_res] = GS(cm, bm, precision);
disp('G-S迭代结果：');
if convergence
    disp(GS_res);
else
    disp('谱半径不小于1，迭代不收敛');
end
%% 第二问

disp('第二问：');

% 系数矩阵cm
cm = zeros(100, 100);
for i = 1:100
    cm(i, i) = 3;
    if i < 100
        cm(i+1, i) = -1;
        cm(i, i+1) = -1;
    end
end
% 常数项矩阵
bm = ones(100, 1);
bm(1) = 2;
bm(100) = 2;

% 高斯消去法
gauss_res = gauss_elimination(cm, bm);
disp('高斯消去法结果：');
disp(gauss_res);
% Jacobi迭代
[convergence, jacobi_res] = jacobi(cm, bm, precision);
disp('Jacobi迭代结果：');
if convergence
    disp(jacobi_res);
else
    disp('谱半径不小于1，迭代不收敛');
end
% G-S迭代
[convergence, GS_res] = GS(cm, bm, precision);
disp('G-S迭代结果：');
if convergence
    disp(GS_res);
else
    disp('谱半径不小于1，迭代不收敛');
end