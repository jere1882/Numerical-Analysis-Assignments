

// EJERCICIO 1 Determine gráficamente valores aproximados de las primeras tres raíces positivas de f(x)=cos(x)cosh(x)+1


deff ('y = f(x)', 'y = cos(x).* cosh(x)+1');
x=0:.01:15;                                 // el 15 sale de ir probando a ver donde estan las raíces.
a=gca();                                    // declarar un manejador de ejes
a.x_location="middle";                      // acceder a una propiedad de un objeto (en este caso a un campo de a, x location)
                                            // otra forma de hacer que represente el x=0 sin gca es plot(x,f(x),x,0)

plot (x,f(x));

disp("las raíces son 8, 11 , 14.14"); 


//MÉTODO DE LA BISECCIÓN. Converge siempre a una raíz (convergencia global). Para elegir el intervalo donde quiero aplicarlo podemos usar este tipo de gráficas._



