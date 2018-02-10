function y=fea(x)
  y=(%e)^x+2 - x^3
endfunction

//MÉTODO DE LA BISECCIÓN
//Método global: converge para toda función contínua con a y b adecuados.

function c=bisect2(f,a,b,delta)
  
  fa=f(a);
  fb=f(b);
  
  if fa*fb>0 then
    disp("Intervalo no valido para método de la biseccion")
  else
    //Calculamos la cantidad de iteraciones necesarias para que el error de nuestra raíz sea menor a delta
    k =   ceil ( log2(b-a) - log2(delta) );  //precisamos k iteraciones, incluyendo una iteración 0.
    
    for it=0:k
      c= a+(b-a)/2
      disp(c)
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



// Tiene menor orden de convergencia (El órden de conv de una sucesión {x_n}-> z  es  max p :  lim n-> inf |x_n+1 - z| / |x_n - z|^p)
