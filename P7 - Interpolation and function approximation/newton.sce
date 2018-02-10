//METODO DE NEWTON

//X vector fila con los puntos a interpolar
//Y vector fila con f(X)=Y

function N = newton(X, Y)
  n = length(X);
  d = zeros(n, n);
  d(:, 1) = Y';
  for j=2:n
    for k=j:n
      d(k, j) = (d(k, j-1) - d(k-1, j-1))/(X(k) - X(k-j+1));
    end
  end
  N = d(1, 1);
  for i=2:n
    N = N + d(i, i) * poly(X(1:i-1), "x");
  end
  
endfunction

//function y = f(x)
//  y = horner(N, x);
//endfunction
//x = min(X):(max(X)-min(X))/100:max(X);
//plot(X, Y, '*r');
//fplot2d(x, f); //o plot(x, f(x))
