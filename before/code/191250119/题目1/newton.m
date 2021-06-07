function res = newton(fun, precision, begin)
    syms x;
    diff_fun(x) = diff(fun(x));
    res = begin;
    iter = 1;
    max_iter = 2000;
    while(abs(res - (res - eval(fun(res)) ./ eval(diff_fun(res)))) >= ...
        precision && iter <= max_iter)
        res = res - eval(fun(res)) ./ eval(diff_fun(res));
        iter = iter + 1;
    end
    res = res - eval(fun(res)) ./ eval(diff_fun(res));
end