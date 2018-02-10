function p=tchebyshev(n)
    if n==0 then
        p=poly([1],'x','c');
    end
    if n==1 then
        p=poly([0,1],"x",'c');
    end
    if n>1 then
        aux=poly([0,1],"x",'c'); 
        p= 2* aux * tchebyshev(n-1) - tchebyshev (n-2)
    end
endfunction

function p=tchebyshev2(n)
    p= cos(n*arcos(x));
endfunction


//SON POLINOMIOS DEFINIDOS EN -1,1.

//EL POLINOMIO MÓNICO DE TCHEBYSHEV:



function p=tch_monico(n)
    p= tchebyshev(n)/2**(n-1);
endfunction

//tiene el menor maximo [-1,1]

// 1/2^(n-1)
