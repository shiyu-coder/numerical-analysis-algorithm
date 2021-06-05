function y = poly_value_fun(param, x)
y = 0;
for j = 1:length(param)
    y = y + param(j) * x ^ (length(param)-j);
end

end