
// Ejercicio 2
// a) sin(x) = x^2/2 <=> 2*sin(x)-x^2=0
// x = linspace(-10,10,10000);
// deff('r=f(x)','r=2*sin(x)-x^2');
// plot(x,f(x),x,x.*0);
// f(-1)>0 f(1)<0 f(2)>0
// biseccion(f,-1,1,1e-2) -> - 0.0078125 
// biseccion(f,1,2,1e-2)  ->   1.4043579
// b) ver [-10 , -6] y [-2,2]
//    f(-10)<0 f(-6)>0 f(0)<0 f(2)>0
//    biseccion(f,-10,-6,1e-2) -> - 8.6171875
//    biseccion(f,-6,0,1e-2)   -> - 1.4238281
//    biseccion(f,0,2,1e-2)    ->   0.8203125  
// c) ver (0,1.2]
//    f(0.1)>0 f(0.5)<0 f(1.2)>0
//    biseccion(f,0.1,0.5,1e-2) -> 0.13125 
//    biseccion(f,0.5,1.2,1e-2) -> 0.9921875  


function r = biseccion(f,a,b,err)
    if f(a)*f(b)>0 then printf("Bad preconditions"); return; end
    while %T do
        c = (a+b)/2;
        if f(a)*f(c)<=0 then b=c;
        else a=c;
        end
        
        if (b-a)/2<=err then break;
        end
        
    end
    r = (a+b)/2;
endfunction

// Ejercicio 3
// f(1)<0  f(4)>0
// biseccion -> 1.9337537628270207168413
// secante   -> 1.933753762827021160930 

function xn=secante(f,x0,x1,its)
    xn_1 = x0; fxn_1 = f(xn_1);
    xn = x1; fxn = f(xn);
    for i=1:its
        if (fxn==fxn_1) then break
        end
        xnext = xn - fxn * (xn-xn_1)/(fxn-fxn_1);
        xn_1 = xn; fxn_1 = f(xn_1);
        xn = xnext; fxn = f(xn);
    end
endfunction

// Ejercicio 4
// ptoFijo(f,0,100000)
// 0.7390851332151606722931  

function xi=ptoFijo(f,x0,it)
    xi = x0
    for i=1:it
        xi = f(xi);
    end
endfunction

// Ejercicio 5
// Ver entre [0.7, 2.20]
// Los puntos fijos son 1 y 2
// Es visible que x0 en (-inf,1) -> converge a 1 (1,2) -> converge a 1 (2,inf) -> diverge

// Ejercicio 6
// Si c = 1/10 para x en (-10,0) converge a -sqrt(5)

// Ejercicio 7
//  l = 9.8*25/(2*%pi)*tanh(8*%pi/l)
//  deff('r=g(x)','r=9.8*25/2/%pi*tanh(8*%pi/x)');
//  deff('r=f(x)','r=g(x)-x');
//  deff('r=df(x)','r=numderivative(f,x,0.0001)');
//  sol1=ptoFijoerr(g,1,e-1);
//  sol = newton(f,df,sol1,1e-4)
//  27.928551258524098699354

function xi=ptoFijoerr(f,x0,err)
    xi = x0
    while abs(f(xi)-xi)>err do
        xi = f(xi);
        
    end
endfunction

function xi=newtonErr(f,df,x0,its)
    xi = x0;
    for i=1:its
        xi = xi - inv(df(xi))*f(xi);
    end
endfunction

// Ejercicio 8
// Ver en [0, 2] tiene dos raices r1<r2 f(0.4)<0 f(1)>0 f(2)<0
// deff('r=f(x)','r=3*x-%e^x');
// deff('r=g1(x)','r=%e^x/3');
// deff('r=g2(x)','r=(%e^x-x)/2');
// deff('r=g3(x)','r=log(3*x)');
// deff('r=g4(x)','r=%e^x-2*x');
// r1 = 0.6190613  
// r2 = 1.5121346  
// g1,g2 y g4 convergen a r1 (o divergen si x0>r2)
// g3 converge a r2 (o diverge si x0<r1)

// Ejercicio 9
// deff('r=f(x)','r=[1+x(1)^2-x(2)^2+%e^x(1)*cos(x(2));2*x(1)*x(2)+%e^x(1)*sin(x(2))]');
// deff('r=jf(x)','r=numderivative(f,x,0.0001)');
// x0 = [-1;4];
// newton(f,jf,x0,5)
//  - 0.2931627  
//    1.1726598

function xi=newton(f,df,x0,its)
    xi = x0;
    for i=1:its
        xi = xi - inv(df(xi))*f(xi);
    end
endfunction

// Ejercicio 10
// deff('r=f(x)','r=[x(1)^2+x(1)*x(2)^3-9;3*x(1)^2*x(2)-4-x(2)^3]');
// deff('r=jf(x)','r=numderivative(f,x,0.0001)');
// x0a = [1.2, 2.5]
// x0b = [-2 ; 2.5]
// x0c = [-1.2 ; -2.5]
// x0d = [2 ; -2.5]
//-->sol_a = newton(f,jf,x0a,10000)
// sol_a  =
// 
//    1.3363553772171670175339  
//    1.7542351976516987743793  
// 
//-->sol_b = newton(f,jf,x0b,10000)
// sol_b  =
// 
//  - 0.9012661907830336049940  
//  - 2.0865875946569794052721  
// 
//-->sol_c = newton(f,jf,x0c,10000)
// sol_c  =
// 
//  - 0.9012661907830334939717  
//  - 2.0865875946569794052721  
// 
//-->sol_d = newton(f,jf,x0d,10000)
// sol_d  =
// 
//  - 3.0016248866767227809760  
//    0.14810799495836599049  


// Ejercicio 11
// deff('r=f(x)', 'r=2*x(1)+3*x(2)^2+%e^(2*x(1)^2+x(2)^2)');
// deff('r=g(x)', 'r=[2+%e^(2*x(1)^2+x(2)^2)*4*x(1) ; 6*x(2)+%e^(2*x(1)^2+x(2)^2)*2*x(2)]');
// deff('r=Jg(x)', 'r=[4*%e^(2*x(1)^2+x(2)^2)*(1+4*x(1)^2) , %e^(2*x(1)^2+x(2)^2)*8*x(1)*x(2) ; %e^(2*x(1)^2+x(2)^2)*8*x(1)*x(2) , 6+2*%e^(2*x(1)^2+x(2)^2)*(2*x(2)^2+1) ]');
// deff('r=Jf(x)','r=(numderivative(f,x,0.00001))''');
// deff('r=Hf(x)','[J,r]=numderivative(f,x,0.0001,1,''blockmat'') ');
// x0 = [1;1];
// sol_exac = newtonerr(g,Jg,x0,1e-4);
// det(Jg(sol_exac))

function r=f(x)
    r = 2*x(1)+3*x(2)^2+%e^(2*x(1)^2+x(2)^2);
endfunction

function r=g(x)
    r=[2+%e^(2*x(1)^2+x(2)^2)*4*x(1) ; 6*x(2)+%e^(2*x(1)^2+x(2)^2)*2*x(2)];
endfunction

function r=Jg(x)
    r=[4*%e^(2*x(1)^2+x(2)^2)*(1+4*x(1)^2) , %e^(2*x(1)^2+x(2)^2)*8*x(1)*x(2) ; %e^(2*x(1)^2+x(2)^2)*8*x(1)*x(2) , 6+2*%e^(2*x(1)^2+x(2)^2)*(2*x(2)^2+1) ];
endfunction

function r=Jf(x)
    r=numderivative(f,x,0.0001)';
endfunction

function r=Hf(x)
    [J,H] = numderivative(f,x,0.0001,1,'blockmat');
    r = H;
endfunction

function xi=newtonerr(f,df,x0,err)
    xi = x0;
    while %T
        x0 = xi;
        xi = xi - inv(df(xi))*f(xi);
        if abs(x0-xi)<err then break;
        end
    end
endfunction


// Ejercicio 12
// deff('r=f(k)', 'r= [ k(1)*%e^(k(2))+k(3)-10 ;k(1)*%e^(2*k(2))+2*k(3)-12 ; k(1)*%e^(3*k(2))+3*k(3)-15 ]');
// deff('r=jf(x)','r=numderivative(f,x,0.0001)');
// x0 = [2;2;2]
// k = newton(f,jf,x0,10000)
// deff('result=g(r)', 'result=k(1)*%e^(k(2)*r)+k(3)*r-500/(%pi*r^2)');
// deff('r=dg(x)','r=numderivative(g,x,0.0001)');
// r0 = 1;
// rsol = newton(g,dg,r0,10000);



























