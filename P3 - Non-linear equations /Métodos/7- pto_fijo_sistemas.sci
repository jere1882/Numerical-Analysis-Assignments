function P=pto_fijo_sistemas(F,x0,maxit,tol)
//ARGUMENTOS:
// F vector de funciones
// x0 aproximación inicial al vector solucion

    P=F(x0)
    
for i=2:maxit
    P=F(P);
end
endfunction

function Y=F(X)
    Y(1)=cos(X(1));
    Y(2)=sin(X(2));
endfunction
