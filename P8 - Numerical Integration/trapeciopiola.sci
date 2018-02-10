function y = trapecio(func1, a, b)
    y = ((b - a) / 2) * (func1(a) + func1(b));
    //error = f''(c) * (h^3 / 12)      c tal que la f'' sea máxima
endfunction


function y = trapeciocompuesto(func1, a, b, n)
    h = (b - a) / n
    y = 0
    for x = a: h: (b - h)
        y = y + trapecio(func1, x, x + h);
    end
    //error = f''(c) * (h^3 / (12 * n^2))      c tal que la f'' sea máxima
endfunction

function y = err_trap(a, b, n, maxder2)
    //google: 4chan trap thread
    y = -maxder2 * (((b - a)^3) / (12 * n^2))
endfunction

function y = simpson(func, a, b)
    y = ((b - a) / 6) * (func(a) + 4 * func((a + b) / 2) + func(b));
    //error = (h^5 / 90) * f''''(c)     c tal que la f'''' sea máxima
endfunction

function y = simpsoncompuesto(func, a, b, n)
    h = (b - a) / n
    y = 0
    for x = a: h: (b - h)
        y = y + simpson(func, x, x + h);
    end
    //error = (b - a) * (h^4 / 180) * f''''(c)     c tal que la f'''' sea máxima
endfunction

function y = err_simp(a, b, n, maxder4)
    h = (b - a) / n;
    y = (b - a) * ((h^4) / 180) * maxder4;
endfunction

function y = trap_aux(func, x, a, b)
    [p1, p2, p3] = string(func)
    y = ((b - a) / 2) * (func(x, a) + func(x, b));
    //error = f''(c) * (h^3 / 12)      c tal que la f'' sea máxima
endfunction


function y = trap_comp_aux(func, x, a, b, n)
    h = (b - a) / n
    y = 0
    for i = a: h: (b - h)
        y = y + trap_aux(func, x, i, i + h);
    end
    //error = f''(c) * (h^3 / (12 * n^2))      c tal que la f'' sea máxima
endfunction

function y = simp_aux(func2, x, a, b)
    y = ((b - a) / 6) * (func2(x, a) + 4 * func2(x, (a + b) / 2) + func2(x, b));
    //error = (h^5 / 90) * f''''(c)     c tal que la f'''' sea máxima
endfunction

function y = simp_comp_aux(func2, x, a, b, n)
    h = (b - a) / n
    y = 0
    for i = a: h: (b - h)
        y = y + simp_aux(func2, x, i, i + h);
    end
    //error = (b - a) * (h^4 / 180) * f''''(c)     c tal que la f'''' sea máxima
endfunction

function y = trapecio_ext(func, a, b, fC, fD, n)
    //deff("r = G(x)", "r = trap_comp_aux(func, x, fC(x), fD(x), n)");
    
    function r = G(x)
        r = trap_comp_aux(func, x, fC(x), fD(x), n)
    endfunction
    
    y = trapeciocompuesto(G, a, b, n);
endfunction


function y = simpson_ext(func1, a, b, fC, fD, n)
    //deff("r = G(x)", "r = trap_comp_aux(func, x, fC(x), fD(x), n)");
    
    function r = G(x)
        r = simp_comp_aux(func1, x, fC(x), fD(x), n)
    endfunction
    
    y = simpsoncompuesto(G, a, b, n);
endfunction
