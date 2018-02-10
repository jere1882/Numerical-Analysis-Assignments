//Método directo de obtención de la factorización LU
//MÉTODO DE CROUT te da una LU con la U unitaria. CDOOLITLE CON L unitara.

function [L,U]=crout(a)

    n=size(a,1);
    for k=1:n-1
        i=k+1:n;
        a(i,k)=a(i,k)/a(k,k);
        a(i,i)=a(i,i)-a(i,k)*a(k,i);
    end
    L=tril(a,-1)+eye(n,n);
    U=triu(a);

endfunction



function [L U p]=CroutP1(a)

n=size(a,1); p=1:n;
for k=1:n-1
[r,m]=max(abs(a(k:n,k)));
m=m+k-1;
if a(m,k)==0, continue, end
if k~=m, a([k m],:)=a([m k],:); p([k m])=p([m k]); end
i=k+1:n; a(i,k)=a(i,k)/a(k,k);
j=k+1:n; a(i,j)=a(i,j)-a(i,k)*a(k,j);
end
L=tril(a,-1)+eye(n,n); U=triu(a);
