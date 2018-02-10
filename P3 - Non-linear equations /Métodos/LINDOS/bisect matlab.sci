//  MÉTODO DE LA BISECCIÓN

function [c,err,yc]=bisect(f,a,b,delta)
    // f función contínua en [a,b]
    // delta es el error cometido en la aproximación de la raíz alpha mediante c
    ya= f(a);
    yb= f(b);
    if (f(a)*f(b))>0 then
        break
    end //no cumple los requisitos para que el método converja
    
    maxit = 1 + round ((log(b-a) - log(delta))/log(2)); //calculo la cantidad de iteraciones necesarias para que el error sea menor que la tolerancia
    
    for k=1:maxit
        c=(a+b)/2;
        yc=f(c);
        if yc==0 then
            a=c;
            b=c;
        elseif yb*yc>0 then
            b=c;
            yb=yc;
        else
            a=c;
            ya=yc;
        end
        if b-a<delta then break end
    end
    c= (a+b)/2;
    err=abs(b-a);
    yc=f(c);
    
endfunction


// Si tengo f(x)= (x-0.412)(x-1.003) , y quiero calcular la primera raiz con tres cifras significativas de precision:


//  bisect(f,0,0.5,0.0001)
