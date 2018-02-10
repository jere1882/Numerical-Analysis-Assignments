//Ej 6
//x = [0 1.5 .31 .5 .6 .75];
//y = [1 1.004 1.31 1.117 1.223 1.422];

//M = [sum(x.**2) sum(x); sum(x) 6];
//b = [sum(x.*y); sum(y)];

//[A, B] = M\b;

//g = 1;

//Ahora vemos una forma abreviada

// k = 1:2

//Construimos una matriz F de orden n * m donde n es el nro du puntos y m es la cantidad de funciones que tomo

//g es el grado del pol
//for k=1:g+1
//  F(:, k) = x' .** (k-1);
//end

//El siguiente cod sirve no solo para ajuste polinomial, pero en ese caso, pasar la F con las funciones base
//x: vector
//y: vector
//g: grado de P
//P: polinomio de ajuste
function P = ajuste(x, y, g) // AJUSTE POLINOMIAL! USAMOS COMO BASE (1, x , x^2, ... , x^g)
  for k=1:g+1
    F(:, k) = x' .^ (k-1);
  end
  A = F'*F;
  b = F'*y';
  c = A\b;
  P = poly(c, "x", "coeff");
endfunction


function C = coeficientes_ajuste_general(x, y, F)  // 
    
 // AJUSTE GENERAL! USAMOS COMO BASE (phi 1, phi 2, phi 3, .... , phi p), p funciones. Tenemos (xi,yi) puntos para i desde 1 hasta m.
 
 // Debemos ingresarle a la función una matriz F de p columnas y m filas, donde cada columna corresponde a una función:
 
 // F(i,j)= phi_j (x_j) 
 

  A = F'*F;
  b = F'*y';
  c = A\b;  // aquí quedan guardados los coeficientes a_i para i desde 1 hasta p, que minimizan el error cuadratico. entonces quedaria la funcion de ajuste:
  
endfunction



