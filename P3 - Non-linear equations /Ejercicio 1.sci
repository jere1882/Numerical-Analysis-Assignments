

// EJERCICIO 1 Determine gr�ficamente valores aproximados de las primeras tres ra�ces positivas de f(x)=cos(x)cosh(x)+1


deff ('y = f(x)', 'y = cos(x).* cosh(x)+1');
x=0:.01:15;                                 // el 15 sale de ir probando a ver donde estan las ra�ces.
a=gca();                                    // declarar un manejador de ejes
a.x_location="middle";                      // acceder a una propiedad de un objeto (en este caso a un campo de a, x location)
                                            // otra forma de hacer que represente el x=0 sin gca es plot(x,f(x),x,0)

plot (x,f(x));

disp("las ra�ces son 8, 11 , 14.14"); 


//M�TODO DE LA BISECCI�N. Converge siempre a una ra�z (convergencia global). Para elegir el intervalo donde quiero aplicarlo podemos usar este tipo de gr�ficas._



