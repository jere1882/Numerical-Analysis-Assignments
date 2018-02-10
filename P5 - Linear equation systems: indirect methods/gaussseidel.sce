//MÉTODO EN CLASE 
//no anda si hay ceros en la diag
//x0 tiene que ser vector columna

function x = gauss_seidel(A, b, x0, delta, max1)
  
  
  
  
  n = size(A, 1)
  for k=1:max1
    for i=1:n
      x(i) = (b(i) - (     A(i, [1:i-1])* x([1:i-1]) +   A(i,[i+1:n])* x0([i+1:n])  )  )/ A(i,i)
    end
    err = norm(x-x0,'inf'); //euclidea por defecto, si le agrego inf es la infinita, 'inf' o %inf
    x0=x;
    if err<delta then break end
  end
endfunction 




// CONVERGENCIA DE METODOS ITERATIVOS:

// Ax=b si Nx = Nx - Ax + b sii Nx = (N-A)x+b 
// Nx^k+1 = (N-A)x^k + b Forma general de un m.i.r.s.e.l.
// Si norm (I - N^(-1)A) < 1 p.a. norma inducida => la iteracion converge al resultado Ax=b
//  P(I- N^(-1)A) < 1 sii la iteracion converge al resultado de Ax=b 

// A = L + D + U

// Jordan: N=D 
// Si A es diagonal dominante estrictamente => jordan converge

// Gauss-Seidel
// Si A es dd entonces converge, si es definida positiva y simetrica converge.

// SOR
// N = D + wL donde w es el factor de escala
