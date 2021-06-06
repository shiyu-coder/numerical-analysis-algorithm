function f = new_newton_interpolation_fun(X, Y)
n=length(X);
T=zeros(n,n);
% 对差商表第一列赋值
for k=1:n      
    T(k)=Y(k);
end
% 求差商表
for i=2:n       
    for k=i:n
        T(k,i)=(T(k,i-1)-T(k-1,i-1))/(X(k)-X(k+1-i));  
    end
end
f = @(x)(T(1,1)+0*x);
for i = 2:length(X)
    w = @(x)(1+0*x);
    for j = 1:i-1
        w = @(x)(w(x).*(x-X(j)));
    end
    f = @(x)(f(x)+T(i, i).*w(x));
end
end