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

//POLINOMIO DE TAYLOR
function y=fact(n)
  res=1
  for i=1:n
    res = res * i
  end
  y=res
endfunction

function y=Taylor(f,n,x0,v) //Aproximación de f(v) mediente el polinomio de Taylor de orden n de f alrededor de x0
  result=0
  for i=0:n
    result = result + Df(f,v,i)*(1/fact(i))*(v-x0)^i
  end
  y=result
endfunction

function y=horrible(x)
  y= x*x+log(x)*sin(x)
endfunction
