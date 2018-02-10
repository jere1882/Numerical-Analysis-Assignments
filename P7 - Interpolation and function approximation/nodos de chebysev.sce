//Dada una funcion crea el polinomio de lagrange con los puntos que minimizan el error
function [P,x]=nodos_chebyshev(g,n,a,b)
//g: funcion que quiero interpolar
//n: grado del polinomio interpolador que quiero obtener (nec n+1 puntos)
//P es el polinomio interpolador de grado n de g con nodos en [a,b]

  
  
  
  //Si [a,b]=[-1,1] no necesitamos ajustar los nodos
  
  if argn(2)==2 then//Es un vector argn=[cant_salidas,cant_entradas]
    a=-1;
    b=1;
  end
  
  x=zeros(1,n+1);
  
  for k=1:n+1
      x(k)=cos((2*k-1)*(%pi/(2*n+2))); // calcula las raíces del polinomio de tchebyshev de orden n
  end
  
  t=(b-a)*x/2 + (a+b)/2; //t \in [a,b]
  y=g(t);
  P=lagrange(t,y);

endfunction
//PUEDE PEDIRSE LA GRÁFICA DEL ERROR G-P
//Usar horner para evaluar
