function res = lagrange_interpolation_fun(X, Y)
% X:横坐标向量
% Y:纵坐标向量
ps = [];
for i = 1:length(X)
    ps = [ps; poly(X(i))];
end
ls = [];
for i = 1:length(ps)
    ll = 1;
    for j = 1:length(ps)
        if j == i
            continue
        end
        ll = conv(ll, ps(j, :));
    end
    div_ll = 1;
    for j = 1:length(ps)
        if j == i
            continue
        end
        div_ll = div_ll * (X(i) - X(j));
    end
    ll = ll ./ div_ll;
    ls = [ls; ll];
end
res = 0;
for i = 1:length(ls)
    res = res + ls(i, :) * Y(i);
end
end