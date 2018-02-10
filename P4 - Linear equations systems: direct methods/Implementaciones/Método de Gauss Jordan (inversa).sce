
function m=max_pos(columna, k) // devuelve el numero de fila del mayor elemento en la columna, de la k-esima en adelante
  n = length(columna)
  m = k
  for i = k+1:n
    if (abs(columna(i))>abs(columna(m))) then
      m= i
    end
  end
endfunction


function [A] = gauss_doble(A) //con PIVOTEO (hago siempre intercambio de filas)
    
    
  n = size(A, 1)
  invA=eye(n,n)
  
  A=[A invA]
  
  for k = 1:n-1
    m = max_pos( A(:, k) , k )
    if (k <> m) then //intercambio de filas!

      vaux =  A(m, :)
      A(m, :) = A(k , :)
      A(k, :) = vaux
      
    end
    
    for j = k+1:n
      mjk = A(j, k)/A(k,k)
      A(j, k)=0 //Para ahorrar operaciones directamente pongo en cero.
      A(j, k+1:n) = A(j, k+1:n) - mjk * A(k, k+1:n)
    end
  end
  
  for i=1:n
      for j=i:n
          A(i,j)=A(i,j)/A(i,i)
      end
  end
  

endfunction




