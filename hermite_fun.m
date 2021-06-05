function res = hermite_fun(X,Y,y0,yn)
% y0:左边界导数值
% yn:右边界导数值
x_input = X;
y_input = Y;
n = length(X);
y_0 = y0;
y_n = yn;
[~,number] = size(x_input);
delta_h = zeros(1,number-1);
delta_f = zeros(1,number-1);
lambda_ = zeros(1,number-2);
miu = zeros(1,number-2);
e = zeros(1,number-2);
for i = 1:(number-1)
    delta_h(i) = x_input(i+1) - x_input(i);
    delta_f(i) = (y_input(i+1) - y_input(i))/ delta_h(i);
end
for i=1:number-2
    lambda_(1,i) = delta_h(1,i+1) / (delta_h(1,i+1) + delta_h(1,i));
     miu(1,i) = 1 - lambda_(1,i);
     e(1,i) = 3*(lambda_(1,i)*delta_f(1,i) + miu(1,i)*delta_f(1,i+1));
end
A = zeros(number-2,number-2);
B = zeros(number-2,1);
A(1,1) = 2;
A(1,2) = miu(1,1);
B(1,1) = e(1,1) - lambda_(1,1) * y_0;
for i = 2:number-3
    B(i,1) = e(1,i);
    A(i,i-1) = lambda_(1,i);
    A(i,i) = 2;
    A(i,i+1) = miu(1,i);
end
A(number-2,number-3) = lambda_(1,number-2);
A(number-2,number-2) = 2;
B(number-2,1) = e(1,number-2) - miu(1,number-2)*y_n;
m_matrix = A\B;
m = zeros(1,number);
m(1) = y_0;
m(number) = y_n;
for i = 2:number-1
    m(i) = m_matrix(i-1,1);
end
res = [];
for i = 1:n-1
    s1 = conv([1/(X(i)-X(i+1)), -X(i+1)/(X(i)-X(i+1))], [1/(X(i)-X(i+1)), -X(i+1)/(X(i)-X(i+1))]);
    s1 = conv(s1, [2/(X(i+1)-X(i)), 1-2*X(i)/(X(i+1)-X(i))]);
    s1 = s1 * Y(i);
    s2 = conv([1/(X(i+1)-X(i)), -X(i)/(X(i+1)-X(i))], [1/(X(i+1)-X(i)), -X(i)/(X(i+1)-X(i))]);
    s2 = conv(s2, [2/(X(i)-X(i+1)), 1-2*X(i+1)/(X(i)-X(i+1))]);
    s2 = Y(i+1) * s2;
    s3 = conv([1/(X(i)-X(i+1)), -X(i+1)/(X(i)-X(i+1))], [1/(X(i)-X(i+1)), -X(i+1)/(X(i)-X(i+1))]);
    s3 = m(i) * conv(s3, [1, -X(i)]);
    s4 = conv([1/(X(i+1)-X(i)), -X(i)/(X(i+1)-X(i))], [1/(X(i+1)-X(i)), -X(i)/(X(i+1)-X(i))]);
    s4 = m(i+1) * conv(s4, [1, -X(i+1)]);
    res = [res; s1+s2+s3+s4];
end
end