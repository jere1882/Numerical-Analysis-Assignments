//delta: tolerancia entre dos aproximaciones consecutivas

function lambda = pot(A, maxit, delta)
  n=size(A,1)
  w=zeros(n)
  
  
  z=zeros(n)
  z(n)=1 //aproximación inicial.
  
  lambda=z
    
    
  for i=1:maxit
    w1=w
    z1=z
    lambda1=lambda
    w= A * z1
    z= w /norm(w,'inf')
    lambda =(z' * A * z) / (z' * z)
    
    
    if (norm( lambda - lambda1)<delta)
        break;
    end
  end
  
endfunction
