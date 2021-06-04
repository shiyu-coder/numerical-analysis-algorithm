function res = cubic_spline_interpolation_fun(X, Y, condi)
% 目前只能设定自然条件
% X:横坐标向量
% Y:纵坐标向量
% condi:边界条件值
n = length(X);
form = zeros(n,n);
form(:,1)=Y;
M0 = condi(1);
Mn = condi(2);
for i=2:n
    for j=i:n
        form(j,i) = (form(j,i-1)-form(j-1,i-1))/(X(j)-X(j-i+1));
    end
end
h = zeros(n-1,1);
for i=1:n-1
    h(i)=X(i+1)-X(i);
end
b = zeros(n-2,1);
c = zeros(n-2,n-2);
for i=1:n-2
    c(i,i)=2;
    if (i==1)
        b(i,1)=6 * form(i+2,3)-h(i)/(h(i)+h(i+1))* M0;
    elseif (i==(n-2))
        b(i,1)=6 * form(i+2,3)-(h(i+1)/(h(i)+h(i+1)))* Mn;
    else
        b(i,1)=6 * form(i+2,3);
    end             
end
for i=2:n-2
    c(i,i-1)= h(i)/(h(i)+h(i+1));
    c(i-1,i)= h(i)/(h(i-1)+h(i));
end
c(1,n-2) = h(1)/(h(1)+h(2));
c(n-2,1) = h(n-1)/(h(n-2)+h(n-1));
M = c\b;
M = [M0; M; Mn];
res = [];
for i = 1:n-1
    s1 = conv(conv([-1, X(i+1)], [-1, X(i+1)]), [-1, X(i+1)]);
    s1 = s1 * M(i) / (6 * h(i));
    s2 = conv(conv([1, -X(i)], [1, -X(i)]), [1, -X(i)]);
    s2 = s2 * M(i+1) / (6 * h(i));
    s3 = [-1, X(i+1)] * (Y(i) - M(i) * h(i) * h(i) / 6) / h(i);
    s4 = [1, -X(i)] * (Y(i+1) - M(i+1) * h(i) * h(i) / 6) / h(i);
    ss = zeros(1, 4);
    for j = 1:length(s1)
        ss(4-length(s1)+j) = ss(4-length(s1)+j) + s1(j);
    end
    for j = 1:length(s2)
        ss(4-length(s1)+j) = ss(4-length(s1)+j) + s2(j);
    end
    for j = 1:length(s3)
        ss(4-length(s1)+j) = ss(4-length(s1)+j) + s3(j);
    end
    for j = 1:length(s4)
        ss(4-length(s1)+j) = ss(4-length(s1)+j) + s4(j);
    end
    res = [res; ss];
end

end