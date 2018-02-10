function x = resoltrsup(A, b)
  n = size(A,1)
  x(n)= b(n)/A(n,n)
  for i=n-1:-1:1
    x(i) = (b(i)-A(i, i+1:n)*x(i+1:n))/A(i, i)
  end
endfunction


function m=max_pos(columna, k) // devuelve el numero de fila del mayor elemento en la columna, de la k-esima en adelante
  n = length(columna)
  m = k
  for i = k+1:n
    if (abs(columna(i))>abs(columna(m))) then
      m= i
    end
  end
endfunction

function [sol,T, c] = gauss(A, b) //con PIVOTEO (hago siempre intercambio de filas)
  n = size(A, 1)
  for k = 1:n-1
    m = max_pos( A(:, k) , k )
    if (k <> m) then //intercambio de filas!
      disp("intercambio filas:")
      disp (k)
      disp (m)
      vaux =  A(m, :)
      A(m, :) = A(k , :)
      A(k, :) = vaux
      
      
      vaux2= b(m)
      b(m) = b(k)
      b(k)=vaux2
      
    end
    
    for j = k+1:n
      mjk = A(j, k)/A(k,k)
      A(j, k)=0 //Para ahorrar operaciones directamente pongo en cero.
      A(j, k+1:n) = A(j, k+1:n) - mjk * A(k, k+1:n)
      b(j) = b(j) - mjk*b(k)
    end
  end
  
  T = A
  c = b 
  sol=resoltrsup(T,c)
  
endfunction



