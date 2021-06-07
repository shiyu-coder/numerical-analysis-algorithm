function p= newtonpoly(x,xi,yi)
n=length(xi);
q=zeros(n,n);
for k=1:n      
    q(k)=yi(k);
end
for i=2:n
    for k=i:n
        q(k,i)=(q(k,i-1)-q(k-1,i-1))/(xi(k)-xi(k+1-i));  
    end
end
p=0;          
for k=2:n
    t=1;
    for j=1:k-1
        t=t*(x-xi(j));
    end
    p=q(k,k)*t+p;
end
p=q(1,1)+p;
end