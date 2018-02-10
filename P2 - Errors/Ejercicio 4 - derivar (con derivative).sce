//VERSION USANDO DERIVATIVE
function y=Df(f,v,n)
  if n==0 then
    y=f(v)
  else
    deff("s=D0f(x)","s=f(x)"); //PARTE ARREGLADA
    for i=1:(n-1)
      deff("s=D"+string(i)+"f(x)","s=derivative(D"+string(i-1)+"f,x)");
    end
    deff("s=DNf(x)","s=derivative(D"+string(n-1)+"f,x)");
    y = DNf(v);
  end
endfunction


//VERSION USANDO DIFERENCIAS FINITAS (Que da cualquier cosa)

function y = dfa(f,x,h)
y = (f(x+h) - f(x))/h;
endfunction

function y=Dfn(f,v,n,h)
  if n==0 then
    y=f(v)
  else
    y=(f((Dfn(f,v,n-1,h))+h)-f((Dfn(f,v,n-1,h))))/h
  end
endfunction


//PRUEBAS

function y=pol(x)
    y=x^4+2*x^2
endfunction



Dfn(pol,1,1,10^(-8)) //
//Dfn(pol,1,2,10^(-8))
//Dfn(pol,1,3,10^(-8))
//Dfn(pol,1,4,10^(-8))
