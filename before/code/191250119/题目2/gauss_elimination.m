function res = gauss_elimination(cm, bm)
% input:
%  cm: ϵ������:n*n
%  bm�����������:n*1
% output:
%  res�������:n*1

    [rcm, ccm] = size(cm);
    [rbm, ~] = size(bm);
    res = zeros(rbm, 1);
    if (rcm ~= ccm) || (rcm ~= rbm)
        disp('��������ʽ����');
    else
        for i = 1:rcm-1
            if cm(i, i) == 0
                disp('���Խ���Ԫ�ش���');
            else
                for j = i+1:rcm
                    ratio = cm(j, i) / cm(i, i);
                    for k = i+1:ccm
                        cm(j, k) = cm(j, k) - ratio * cm(i, k);
                    end
                    bm(j) = bm(j) - ratio * bm(i);
                    cm(j, 1) = 0;
                end
            end
        end
    end
    res(rcm) = bm(rcm) / cm(rcm, ccm);
    for i = rcm-1:-1:1
        tmp = 0;
        for j = i+1:ccm
            tmp = tmp + cm(i, j) * res(j);
        end
        res(i) = (bm(i) - tmp) / cm(i, i);
    end
end