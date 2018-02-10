

// EJERCICIO 1 Determine gráficamente valores aproximados de las primeras tres raíces positivas de f(x)=cos(x)cosh(x)+1


deff ('y = f(x)', 'y = x .* sin(x)');
x=0:.01:15;                                 // el 15 sale de ir probando a ver donde estan las raíces.
a=gca();                                    // declarar un manejador de ejes
a.x_location="middle";                      // acceder a una propiedad de un objeto (en este caso a un campo de a, x location)
                                            // otra forma de hacer que represente el x=0 sin gca es plot(x,f(x),x,0)

plot (x,f(x),x,x,x,(-x));

disp("las raíces son 8, 11 , 14.14"); 

































//MÉTODO DE LA BISECCIÓN. Converge siempre a una raíz (convergencia global). Para elegir el intervalo donde quiero aplicarlo podemos usar este tipo de gráficas._


{zn} -> z, entonces, el orden de convergencia es  alpha tq


lim (zn+1-z)/(zn-z)âlpha con n->inf es finito

si alpha es 1 y el limite esta entre 0 y 1 abierto, la conv es lineal y lambda es la velocidad d convergencia
si alpha es 1 y lambda 0 es superlinal
idem si alpha>1
