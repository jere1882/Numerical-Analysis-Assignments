function y=fea(x)
  y=x^2/4 - sin(x);
endfunction



function [p1,err,k,y]=secante2(f,p0,p1,delta,max1)
//Datos:
//      f  función
//      p0 y p1 son aproximaciones iniciales a un cero de f
//      delta :  tolerancia , como son números pequeños uso el mismo para todo.
//      max1 es el número máximo de iteraciones
//Resultados:
//      p1 es la aproximación a la raíz
//      err es una estimación del error de p1
//      k es el número de iteraciones realizadas
//      y = f(p1) , aproximadamente será cero.
    for k=1:max1
        p2= p1 - f(p1)* ((p1-p0)/(f(p1)-f(p0)));
        p0=p1;
        p1=p2;
        err=abs(p2-p1);
        if ((err<delta) | abs(y)<delta ) then break end
    end

endfunction


secante2(fea,2,3,0.1,100); //1.9550572  



