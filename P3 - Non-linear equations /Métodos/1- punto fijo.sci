//MÉTODO DE PUNTO FIJO PARA RESOLVER x = g(x)


function  [i,P,err,p]=pto_fijo(g,p0,tol,maxit)
//ENTRADA
//g: función de iteración
//p0: punto inicial
//tol: diferencia máxima entre dos iteraciones seguidas
//maxit: cantidad máxima de iteraciones

//SALIDA
//i es la cantidad de iteraciones realizadas
//p es la aproximación al punto fijo
//err es la diferencia entre las aproximaciones de las últimas dos iteraciones
//P es la sucesion {pn} completa

    //Acá los índices empiezan desde 1
    p(1)=g(p0) 
    for i=2:maxit
        p(i)=g(p(i-1));
        err = abs(p(i)-p(i-1));
        if err<tol then 
            break;
        end
        P=p(i) 
    end

endfunction























//OBSERVACIONES 

//Si g y g' son continuas en [a,b]
// (i): Si g es contractiva entonces tiene punto fijo en [a,b]
// (ii): Si g es contractiva y |g'(x)|<k<1 en (a,b) entonces el punto fijo es único y para todo punto inicial, el método converge.
// (iii): Si g es contractiva y g(P)>1 entonces el método diverge.
// (iv): |p-pn|leq k^n |p1 - p0| (1-k)^(-1)

