function res = fixed_point(fun, precision, begin)
    res = eval(fun(begin));
    max_iter = 2000;
    iter = 1;
    while(abs(res - eval(fun(res))) >= precision && iter <= max_iter)
        res = eval(fun(res));
        iter = iter + 1;
    end
    res = eval(fun(res));
end