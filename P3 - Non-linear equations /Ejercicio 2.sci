function y=f1(x)
    y=1/2 * x^2 - sin(x)
endfunction

function y=f2(x)
    y=x^4-(%e)^(-x)
endfunction

function y=f3(x)
    y=log(x)-x+1
endfunction



function c=bisect(f,a,b,delta)
  
  fa=f(a);
  fb=f(b);
  
  if fa*fb>0 then
    disp("Intervalo no valido para método de la biseccion")
  else
    //Calculamos la cantidad de iteraciones necesarias para que el error de nuestra raíz sea menor a delta
    k =   ceil ( log2(b-a) - log2(delta) );  //precisamos k iteraciones, incluyendo una iteración 0.
    
    for it=0:k
      c= a+(b-a)/2
      fc = f(c)
      if fc==0 then break end
      if fa*fc<0 then
        b=c
        fb=fc        
      else
        a=c
        fa=fc
      end //if
    end //for    
  end //if
endfunction

bisect(f1,-1,1,0.01) //0
bisect(f1,1,5,0.01) //1.4023438 

bisect(f2,-2,-1,0.01) // - 1.4257812  
bisect(f2,0,1,0.01) // 0.8164062
bisect(f2,-10,-8,0.01) // - 8.6132812  

// en f3 no se puede aplicar el método de la bisección pues para todo x del dominio, la funcion es menor o igual a cero; ningun intervalo es apto para la bisección.



