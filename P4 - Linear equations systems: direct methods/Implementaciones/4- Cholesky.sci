function [U] = cholesky(A, eps)
    
  
        //En matemáticas, la factorización o descomposición de Cholesky toma su nombre del matemático André-Louis Cholesky, quien encontró que una matriz simétrica definida positiva puede ser descompuesta como el producto de una matriz triangular inferior y la traspuesta de la matriz triangular inferior. La matriz triangular inferior es el triángulo de Cholesky de la matriz original positiva definida. El resultado de Cholesky ha sido extendido a matrices con entradas complejas. Es una manera de resolver sistemas de ecuaciones matriciales y se deriva de la factorización LU con una pequeña variación.
        
  n = size(A, 1)
  U = zeros(n, n)
  
    for i = 1:n
        t=A(i,i) - A(1:i-1,i)' * A(1:i-1,i)
        A(i,i)=sqrt(t)
        for j=i+1:n
            A(i,j)= ( A(i,j) - A(1:i-1 , i)' * A(1:i-1 ,j) )/A(i,i)
        end
    end
    
    
    // NO SÉ COMO EXTRAER EL TRIÁNGULO INFERIOR. PREGUNTAR.
    // HELP EXTTRI
        
    for i=1:n
        for j=i:n
             U(i,j)=A(i,j)
        end
    end
    
endfunction


