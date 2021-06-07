function res = lagrange(x, y, x0)
syms t l;
if (length(x) == length(y))
    n = length(x);
else
    disp('x和y的维度须相等！');
    return;
end
h = sym(0);
for i = 1:n
    l = sym(y(i));
    for j = 1:i-1
        l = l * (t - x(j))/(x(i) - x(j));
    end
    for j = i+1:n
        l = l * (t - x(j))/(x(i) - x(j));
    end
    h = h + l;
end
simplify(h);
if(nargin == 3)
    res = subs(h, 't', x0);
else
    res = collect(h);
    res = vpa(res, 6);
end
end