function y=fea(x)
  y=(%e)^x+2 - x^3
endfunction

//MÉTODO DE NEWTON-RAPHSON - 
//Según el x0 inicial puede o no converger, es un método LOCAL

function c=newton1(f,x0,delta,niter) 
    //niter: cantidad máxima de iteraciones
    //delta: tolerancia
    c=x0
    for x=0:niter
        c= c  - f(c)/numderivative(f,c)
        if (abs(f(c))<delta) then break end
    end
endfunction

function c=newton2(f,df,x0,delta,niter) 
    //df es la derivada de primer orden de f. A veces conviene pasarla de argumento para minimizar errores.
    //niter: cantidad máxima de iteraciones
    //delta: tolerancia
    c=x0
    i=0;
    while (abs(f(c))<delta & i<niter)
        c= c  - f(c)/df(c)
        i=i+1
    end
endfunction

function x0=newton_check(f,df,x0,delta,epsilon,maxit)
    for k=1:maxit
        x1=x0 - f(x0)/df(x0);
        err=abs(x1-x0)
        x0=x1;
  
        if (err<delta) | (abs(f(x0))<epsilon) then break end
    end
endfunction

