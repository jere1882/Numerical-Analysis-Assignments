function x = resoltrsup(A, b)
  n = size(A,1)
  x(n)= b(n)/A(n,n)
  for i=n-1:-1:1
    x(i) = (b(i)-A(i, i+1:n)*x(i+1:n))/A(i, i)
  end
endfunction



function [T, c] = gauss(A, b) //SIN PIVOTEO
  n = size(A,1)
  for k = 1:n-1 // para cada pivote 
    for j = k+1:n // para cada elemento debajo del pivote
      mjk = A(j, k)/A(k,k)
      A(j, k)=0
      A(j, k+1:n) = A(j, k+1:n) - mjk * A(k, k+1:n)
      b(j) = b(j) - mjk*b(k)
    end
  end
  T= A
  c= b
endfunction



//Se puede trabajar con la matriz extendida. Poniendo A;b agrega el vector b a la matriz A.
//Ejercicio

//A=( 1,1,0,3 ; 2,1,-1,1; 3,-1,-1,2 ; -1,2,3,-1);
//B=(1,-1,2,-1;2,-2,3,-3;1,1,1,0;1,-1,4,3);



