function res = division(fun, precision, b, e)
    res = 0;
    max_iter = 2000;
    iter = 1;
    while(abs(res - (b + e) / 2) >= precision && iter <= max_iter)
        res = (b + e) / 2;
        if fun(b) * fun(res) <= 0
            e = res;
        else
            b = res;
        end
        iter = iter + 1;
    end
    res = (b + e) / 2;
end