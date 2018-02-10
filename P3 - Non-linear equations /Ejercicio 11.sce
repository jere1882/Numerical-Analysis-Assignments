// Código resolución de sistemas no lineales

function [p,iter,err] = NewtonSistemas(F,p,delta,max1)//opcional: retornar iteracion y el error
//P lo ingresamos como fila. Entonces la F va a ser un sistema de ecuaciones, que va necesitar columnas
  Y=F(p)
  for k=1:max1
    J=derivative(F,p');
    Q= p - (J \ Y)'; //para volvera fila ;
    Z = F(Q);
    err = norm(Q-p,2); //El enunciado pide explícitamente utilizar norma 2 como critero de parada
    p=Q;
    Y=Z;
    iter=k;
    //condicion para que pare:
    if (err<delta)|(abs(Y)<delta) then 
      break
    end
  end
endfunction


// EJ 11 el sistema va a ser el gradiente:
// \{ df/dx1 = 0 = 2+e^(2x2^2+x^2)*4x1
//  { df/dx2=6x2 + ^(2x2^2+x^2) * 4x_2

// queremos escribir esto como f para  pasarselo a newtonsistemas.

//HALLAMOS CUANDO EL GRADIENTE ES NULO
deff('Y=F(X)',['Y(1)= 2+ %e^( ( 2 * X(1) ^2 +X(2)^2))*4*X(1)', ' Y(2)= 6*X(2) + %e ^ (2 * X(1)^2 + X(2)^2 ) *2 * X(2)']); 

[sol,it,err]= NewtonSistemas(F,[1 1],10^(-12),50) 


//item 2... me fijo si es definida positiva

deff('y=h(x)','y=2.*x(1) + 3.* x(2) + %e .^ (2*x(1).^2 + x(2).^2)')
//H=[[0,0];[0,0]];
[J,H]=derivative(h,sol'); //hallo la matriz en la solucion. ver si necesita '.
H2 = [H(1) H(2); H(3) H(4)]
spec(H2) //da los autovalores de H . Son positivos luego es dp y vale! 



