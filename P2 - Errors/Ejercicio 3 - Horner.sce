function y= b(a,n,i,x) // a: vector coeficientes, n: grado pol+1, i:indice del b que quiero+1 , x: punto en el que quiero evaluar p
  if i==n then
    y=a(n)
  else
    y=a(i)+x*b(a,n,i+1,x)
  end
endfunction

function y=horner1(a,x)
  y=b(a,length(a),1,x)
endfunction 

function y=horner_generalizado(a,x)
  n = length(a);
  coef=zeros(1, n-1); 
  for i= 1:n-1
    coef(i)=b(a,n,i+1,x);
    disp(coef(i));
  end
  y=[horner1(a,x),horner1(coef,x)]
endfunction
  
a=[1,2,3]
horner_generalizado(a,2)