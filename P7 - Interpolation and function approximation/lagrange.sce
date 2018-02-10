//X vector con los puntos a interpolar -filas-
//Y vector con f(X)=Y -fila-

function P = lagrange(X, Y)
  n = length(X);
  x = poly(0, 'x');
  P = 0;
  for k=1:n
    L=1;
    for i=[1:k-1, k+1:n]      
      L = L * (x-X(i))/(X(k)-X(i));
    end
    P = P + L*Y(k);
  end
endfunction

//  EJERCICIO 1 DEL PARCIAL

-->X=[1,2,4,6,8]
 X  =
 
    1.    2.    4.    6.    8.  
    
    -->Y=log(X)
 Y  =
 
    0.    0.6931472    1.3862944    1.7917595    2.0794415  
    
    
    