
//MÉTODO DE LA SECANTE VERSIÓN MATHEWS

function [p1,err,k,y]=secante(f,p0,p1,delta,epsilon,max1)
//Datos:
//      f  función
//      p0 y p1 son aproximaciones iniciales a un cero de f
//      delta es la tolerancia para p1
//      epsilon es la tolerancia para los valores de la función
//      max1 es el número máximo de iteraciones
//Resultados:
//      p1 es la aproximación a la raíz
//      err es una estimación del error de p1
//      k es el número de iteraciones realizadas
//      y = f(p1) , aproximadamente será cero.

    for k=1:max1
        p2= p1 - f(p1)* ((p1-p0)/(f(p1)-f(p0)));
        err=abs(p2-p1);
        relerr=2*err/(abs(p2)+delta);
        p0=p1;
        p1=p2;
        y=f(p1)
        if ((err<delta) | (relerr<delta) | (abs(y)<epsilon)) then break end 
    end
    
endfunction



