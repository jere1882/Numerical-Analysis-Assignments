function y=fea(x)
  y=(%e)^x+2 - x^3
endfunction

//REGULA FALSI: Combinación del método de la secante y el método de la bisección

function c=reg_falsi(f,a,b,delta,epsilon,maxit)
//    f función
//    a y b aproximaciones iniciales tales que f(a)f(b)<0
//    maxit: cantidad máxima de iteraciones permitida
//    epsilon: tolerancia para la imágen
//    delta: diferencia entre dos aproximaciones sucesivas
    if  f(a)*f(b)>0 then 
        disp("par (a,b) no válido")
    else
        c=a;
        for i=1:maxit
            c_ant=c
            c = (a*f(b)-f(a)*b)/(f(b)-f(a)) // SALE DE LA ECUACION DE LA RECTA QUE PASA POR (a,f(a)) , (b,f(b)), al despejar el punto (c,0) !
            if f(a)*f(c)<0 then
                b=c
            else
                a=c
            end
            if abs(f(c))<epsilon then disp ("termina por epsilon"), break end
            if abs(c_ant - c)<delta then disp ("termina por delta"), break end
        end
    end
    
endfunction


