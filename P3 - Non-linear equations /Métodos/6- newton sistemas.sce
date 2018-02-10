// Código resolución de sistemas no lineales

function [p,k,err] = NewtonSistemas(F,p,delta,max1)
//F es un vector de funciones (Un campo escalar)
//p es una aproximación inicial al cero (R^n)
  
  Y=F(p)
  for k=1:max1
    J=derivative(F,p');
    Q= p - (J \ Y)'; //para volvera fila ;
    Z = F(Q);
    err = norm(Q-p); //Como el error es entre vectores, hay varias maneras de calcular
    //la norma -distancia- entre ellos. Usamos norm
    p=Q;
    Y=Z;
    //condicion para que pare:
    if (err<delta)|(abs(Y)<delta) then 
      break
    end
  end
endfunction


deff('Y=F(X)',['Y(1)= X(1)^2+X(1)*(X(2)^3)-9', ' Y(2)= 3*(X(1)^2)*X(2)-4-X(2)^3']); // BIEN ESCRITO. Fijarse si van los .^para el cucuadrado

[sol,it,err]= NewtonSistemas(F,[-2 , 2.5],10^(-12),50) // por defecto norma2 es norm

//RESULTADO CON LOS 4 PUNTOS: SE VA A LAS 4 DISTINTAS SOLUCIONES...








//Extension del método de newton-raphson
// Sea alpha en R^2 una raíz de F : R^2 -> R^2.  Si X0=(x0,y0) es una aproximacion de alpha, etnonces:

// F(x0,y0) + JF (x0,y0) * (alpha-X0) = 0 

//despejamos  alpha = X0 - [JF(X0)]^-1 * F(X0)    la iteración queda asi con alpha=xn y X0=xn-1
