%�ҳ�100��300֮���ܱ�21����������
%һ���ҵ�����������ֹͣѭ��
%չʾ֮ǰ������

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