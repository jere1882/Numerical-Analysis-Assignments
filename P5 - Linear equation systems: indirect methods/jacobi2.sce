//MÉTODO EN CLASE 
//no anda si hay ceros en la diag
//x0 tiene que ser vector columna

function x = jacobi(A, b, x0, delta, max1)
  
  
  
  
  n = size(A, 1)
  for k=1:max1
    for i=1:n
      x(i) = (b(i) - ( A(i, [1:i-1, i+1:n])* x0([1:i-1, i+1:n])) )/ A(i,i)
    end
    err = norm(x-x0,'inf'); //euclidea por defecto, si le agrego inf es la infinita, 'inf' o %inf
    x0=x;
    if err<delta then break end
  end
endfunction 

