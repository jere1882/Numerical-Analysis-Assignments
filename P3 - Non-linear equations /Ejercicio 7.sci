
//      Buscamos un l que verifique:
//    l = tanh(8*%pi/l) * 245/(4*(%pi)^2 )







function c=newton1(f,x0,delta,niter) 
    //niter: cantidad máxima de iteraciones
    //delta: tolerancia
    c=x0
    for x=0:niter
        c= c  - f(c)/numderivative(f,c)
    end
endfunction

function c=newton2(f,df,x0,delta,niter) 
    //df es la derivada de primer orden de f. A veces conviene pasarla de argumento para minimizar errores.
    //niter: cantidad máxima de iteraciones
    //delta: tolerancia
    c=x0
    i=0;
    while (abs(f(c))>delta & i<niter)
        c= c  - f(c)/df(c)
        i=i+1
    end
endfunction

//MÉTODO DE LA SECANTE

function [pl,err,k,y]=secante(f,p0,p1,delta,max1)
