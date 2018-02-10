
function x=generatriz1(x,maxit)
    for i=1:maxit
        x=2^(x-1)
    end
endfunction


//QUÉ SUCEDE TOMANDO ESTA GENERATRIZ??

//Si el x inicial es mayor que 2, el método no converge (tiende a infinito)
//Para otro x, tiende al punto fijo 1.
