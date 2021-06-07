%% �ø�˹��ȥ����Jacobi ������G-S ��������������Է����顣
clear;clc;
precision = 0.001;
%% ��һ��
% 2x - 2y - z = ?2 
% 4x + y - 2z = 1
% -2x + y - z = ?3

disp('��һ�ʣ�');

% ϵ������cm
cm = [2, -2, -1;4, 1, -2;-2, 1, -1];
% ���������
bm = [-2;1;-3];

% ��˹��ȥ��
gauss_res = gauss_elimination(cm, bm);
disp('��˹��ȥ�������');
disp(gauss_res);
% Jacobi����
[convergence, jacobi_res] = jacobi(cm, bm, precision);
disp('Jacobi���������');
if convergence
    disp(jacobi_res);
else
    disp('�װ뾶��С��1������������');
end
% G-S����
[convergence, GS_res] = GS(cm, bm, precision);
disp('G-S���������');
if convergence
    disp(GS_res);
else
    disp('�װ뾶��С��1������������');
end
%% �ڶ���

disp('�ڶ��ʣ�');

% ϵ������cm
cm = zeros(100, 100);
for i = 1:100
    cm(i, i) = 3;
    if i < 100
        cm(i+1, i) = -1;
        cm(i, i+1) = -1;
    end
end
% ���������
bm = ones(100, 1);
bm(1) = 2;
bm(100) = 2;

% ��˹��ȥ��
gauss_res = gauss_elimination(cm, bm);
disp('��˹��ȥ�������');
disp(gauss_res);
% Jacobi����
[convergence, jacobi_res] = jacobi(cm, bm, precision);
disp('Jacobi���������');
if convergence
    disp(jacobi_res);
else
    disp('�װ뾶��С��1������������');
end
% G-S����
[convergence, GS_res] = GS(cm, bm, precision);
disp('G-S���������');
if convergence
    disp(GS_res);
else
    disp('�װ뾶��С��1������������');
end