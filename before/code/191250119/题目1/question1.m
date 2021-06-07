%% �ö��ַ����������������ţ�ٷ���һ������ţ�ٷ�������·����Է��̡�
% ��1��sin x = 6x + 5 
% ��2��lnx + x^2 = 3 
% ��3��e^x + x = 7
clear;clc;
% ��ֹ����Ϊǰ�����ν��ƽ�֮��С��10^?3
precision = 0.001;
% �����Ա���x
syms x;
%% sin x = 6x + 5
disp('����һ��sin x = 6x + 5');

% ���ַ�
fun(x) = sin(x) - 6*x - 5;
division_res = division(fun, precision, -1, 0);
disp('���ַ���');
disp('�۲��֪�÷�����-1��0���н�');
disp('�������');
disp(division_res);

% �����㷨
fun(x) = (sin(x) - 5) / 6;
fixed_point_res = fixed_point(fun, precision, -1);
disp('�������������');
disp('�����̱���Ϊx = (sin(x) - 5) / 6��ȡx = -1��Ϊ��ʼ������');
disp('�������');
disp(fixed_point_res);

% ţ�ٷ�
fun(x) = sin(x) - 6*x - 5;
newton_res = newton(fun, precision, -1);
disp('ţ�ٷ���');
disp('ȡx = -1��Ϊ��ʼ������');
disp('�������');
disp(newton_res);

%% ln x + x^2 = 3
disp('���̶���lnx + x^2 = 3');

% ���ַ�
fun(x) = log(x) + x^2 - 3;
division_res = division(fun, precision, 1, 2);
disp('���ַ���');
disp('�۲��֪�÷�����1��2���н�');
disp('�������');
disp(division_res);

% �����㷨
fun(x) = sqrt(3 - log(x));
fixed_point_res = fixed_point(fun, precision, 2);
disp('�������������');
disp('�����̱���Ϊx = (3 - ln(x))^0.5��ȡx = 2��Ϊ��ʼ������');
disp('�������');
disp(fixed_point_res);

% ţ�ٷ�
fun(x) = log(x) + x^2 - 3;
newton_res = newton(fun, precision, 2);
disp('ţ�ٷ���');
disp('ȡx = 2��Ϊ��ʼ������');
disp('�������');
disp(newton_res);

%% e^x + x = 7
disp('��������e^x + x = 7');

% ���ַ�
fun(x) = exp(x) + x - 7;
division_res = division(fun, precision, 1, 2);
disp('���ַ���');
disp('�۲��֪�÷�����1��2���н�');
disp('�������');
disp(division_res);

% �����㷨
fun(x) = log(7 - x);
fixed_point_res = fixed_point(fun, precision, 2);
disp('�������������');
disp('�����̱���Ϊx = ln(7 - x)��ȡx = 2��Ϊ��ʼ������');
disp('�������');
disp(fixed_point_res);

% ţ�ٷ�
fun(x) = exp(x) + x - 7;
newton_res = newton(fun, precision, 2);
disp('ţ�ٷ���');
disp('ȡx = 2��Ϊ��ʼ������');
disp('�������');
disp(newton_res);