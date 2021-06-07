function res = newton_fun(x, param)
    res = 0;
    for i = 1:length(param)
        res = res + param(i) * x^(length(param) - i);
    end
end