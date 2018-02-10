function U=gauss_schmidt(V)
    //V  es una matriz cuyas columnas son un conjunto de vectores LI
    n=size(V,1) //longitud de cada vector
    m=size(V,2) //cantidad de vectores
    
    U=zeros(n,m);
    
    U( : , 1) = V (: , 1) / norm (V (: , 1));
    
    
    for k=2:m
        sumatoria=0
        for i=1:k-1
            sumatoria=sumatoria+ (V(:, k)'*U(:,i))*U(:,i)
        end
      
        V( : , k) = V ( : , k) - sumatoria 
        U( : , k) = V (: , k )/ norm (V (: , k));
    end
    
endfunction


// U es una matriz cuyas columnas son un conjunto ortonormal que genera lo mismo que V!

//FACTORIZACION QR

function [Q,R]=fact_qr(A)
    n=size(A,1)
//Aplicamos gauss-schmitd a las columas de A
    Q=gauss_schmidt(A)
    R=  Q' * A 
    
    
    //NO ANDA BIEN.. es una aproximación, puede quedar casi una triang inferior
    for i=1:n
        for j=1:i-1
            R(i,j)=0
        end
    end
endfunction


//En álgebra lineal, la descomposición o factorización QR de una matriz es una descomposición de la misma como producto de una matriz ortogonal por una triangular superior. La descomposición QR es la base del algoritmo QR utilizado para el cálculo de los vectores y valores propios de una matriz.




