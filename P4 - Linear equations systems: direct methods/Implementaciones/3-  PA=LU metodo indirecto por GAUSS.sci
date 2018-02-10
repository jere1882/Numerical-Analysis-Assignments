
function m=max_pos(columna, k) // devuelve el numero de fila del mayor elemento en la columna, de la k-esima en adelante
  n = length(columna)
  m = k
  for i = k+1:n
    if (columna(i)>columna(m)) then
      m= i
    end
  end
endfunction

function [L,U,P] = factorizacion_triangular(A)  //Factoriza la matriz de la forma PA=LU
  n = size(A, 1)
  
  
  P=eye(n,n)
  L=eye(n,n)
  
  for k = 1:n-1
    m = max_pos( A(:, k) , k )
    if (k <> m) then //intercambio de filas!
      
      vaux =  A(m, :)
      A(m, :) = A(k , :)
      A(k, :) = vaux
      
      vaux2= P(m, :)
      P(m, :)=P(k, :)
      P(k, :)=vaux2
      
      vaux3 = L(k , 1:k-1)
      L(k, 1:k-1) = L (m, 1:k-1)
      L(m, 1:k-1) = vaux3
      
      
    end
    
    for j = k+1:n
      mjk = A(j, k)/A(k,k)
      L(j,k)=mjk
      A(j, k)=0 //Para ahorrar operaciones directamente pongo en cero.
      A(j, k+1:n) = A(j, k+1:n) - mjk * A(k, k+1:n)
    end
  end
  
  U = A
endfunction



//A=[ 2 3 5 6 1 4 ; 1 3 5 5 6 6 ; 1 2 2 2 2 2 ; 0 1 2 3 1 1; 0 9 2 3 1 1 ; 0 0 2 1 4 2]

// [L,U,E]=lu(A)

// [L1,U1,P]=factorizacion_triangular(A)

// Pasa que:   E es distinto de P ; y E*A es distinto de L*U . En cambio P*A == L1*U1 .. QUE RARO!



function x = resoltrsup(A, b)
  n = size(A,1)
  x(n)= b(n)/A(n,n)
  for i=n-1:-1:1
    x(i) = (b(i)-A(i, i+1:n)*x(i+1:n))/A(i, i)
  end
endfunction


function x = resoltrinf(A, b)
  n = size(A,1)
  x(1)= b(1)/A(1, 1)
  for i=2:1:n
    x(i) = (b(i)-A(i, 1:i-1)*x(1:i-1))/A(i, i)//mal
  end
endfunction



function y=resuelve_sistemas_lu(A,b)
    [L,U,P] = factorizacion_triangular(A)
    b = P*b'
    z=resoltrinf(L,b')
    y=resoltrsup(U,z)
endfunction
