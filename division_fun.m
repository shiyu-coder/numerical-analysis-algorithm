function res = division_fun(f, a, b, e)
% f:����ָ��
% a:������˵�
% b:�����Ҷ˵�
% e:����
while abs(b - a) > e
    mid = f((a + b) / 2);
    if mid == 0
        res = (a + b) / 2;
        break
    elseif mid * f(a) < 0
            b = (a + b) / 2;
    elseif mid * f(a) > 0
            a = (a + b) / 2;
    end
end
res = (a + b) / 2;
end