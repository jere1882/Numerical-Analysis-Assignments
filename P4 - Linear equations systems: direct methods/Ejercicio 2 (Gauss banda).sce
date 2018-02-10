function x = resoltrsup(A, b)
  n = size(A,1)
  x(n)= b(n)/A(n,n)
  for i=n-1:-1:1
    x(i) = (b(i)-A(i, i+1:n)*x(i+1:n))/A(i, i)
  end
endfunction




function [T, c , cant_op] = gauss_matriz_2banda(A, b) // Asumimos una matriz de al menos 3x3 2-banda con diagonal no nula factorizable sin intercambio de 
  
  
  cant_op=0
  
  n = size(A,1)
  
  for k = 1:n-1 //columnas
      if (A(k+1,k)==0) then
          continue 
      end
      if (A(k,k)==0) then
          disp("Precisa intercambio de filas.")
          break
      end
      mjk = A(k+1, k)/A(k,k)
      cant_op=cant_op+1
      A(k+1, k)=0
      cant_op=cant_op+1
      A(k+1, k+1) = A(k+1, k+1) - mjk * A(k, k+1)
      cant_op=cant_op+1
      b(k+1) = b(k+1) - mjk*b(k)
      cant_op=cant_op+1
  
  end
  T= A
  c= b
endfunction


function [T, c] = gauss_matriz_pbanda(A, b , p) // Asumimos una matriz p-banda con tamaños adecuados
  
  n = size(A,1)
  
  if n<p then
      disp("Tamaño inadecuado.")
  end
  

  for k = 1:n //columnas
    for j = k+1:k+p-1 // filas
      mjk = A(j, k)/A(k,k)
      A(j, k)=0
      A(j, k+1:n) = A(j, k+1:n) - mjk * A(k, k+1:n)
      b(j) = b(j) - mjk*b(k)
    end
  end


  T= A
  c= b
endfunction



