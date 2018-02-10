// Código resolución de sistemas no lineales

function [p,iter,err] = NewtonSistemas(F,p,delta,max1)//opcional: retornar iteracion y el error
//P lo ingresamos como fila. Entonces la F va a ser un sistema de ecuaciones, que va necesitar columnas
  Y=F(p)
  for k=1:max1
    J=derivative(F,p');
    Q= p - (J \ Y)'; //para volvera fila ;
    Z = F(Q);
    err = norm(Q-p); 
    p=Q;
    Y=Z;
    iter=k;
    //condicion para que pare:
    if (err<delta)|(abs(Y)<delta) then 
      break
    end
  end
endfunction



deff('Y=F(X)',['Y(1)= X(1)*(%e)^(X(2))+X(3)-10', ' Y(2)= X(1)*(%e)^(X(2)*2)+X(3)*2-12' , 'Y(3)= X(1)*(%e)^(X(2)*3)+X(3)*3-15']); 

[sol,it,err]= NewtonSistemas(F,[1 1 1],10^(-12),10) 



