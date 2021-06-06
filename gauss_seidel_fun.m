function x = gauss_seidel_fun(a, b, x0, e)
% a:ϵ������
% b:�ұ�����
% x0:��ʼ����(������)
% e:����
% ����������M
n = length(b);

 % ��ϵ������ĶԽǾ���
cm_diag = diag(diag(a));
B = cm_diag \ (cm_diag - a);
% �����װ뾶
R = max(abs(eig(B)));
if R >= 1
    x = zeros(n, 1);
    disp('�װ뾶��С��1���޷�����')
    return
end

M = 100000;
m = 0;
x = zeros(n, 1);
while m <= M
    m = m + 1;
    for i = 1:n
         sum_ax = 0;
         for j = 1:i-1
             sum_ax = sum_ax + a(i, j) * x(j);
         end
         for j = i+1:n
             sum_ax = sum_ax + a(i, j) * x0(j);
         end
         x(i) = -(sum_ax - b(i)) / a(i, i);
    end
    if norm(x - x0, 1) < e
        break
    end
    x0 = x;
end
if m > M
    disp('�ﵽ���ѭ������')
end
end