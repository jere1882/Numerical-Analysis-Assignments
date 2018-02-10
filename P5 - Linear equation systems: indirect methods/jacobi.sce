function x = jacobi(A, b, x, maxit)
  n=size(A, 1)
  for k=1:1:maxit
    for i=1:1:n
      sumatoria=0
      for j=1:n
        if (j<>i) then
          sumatoria=sumatoria+A(i,j)*x(j)
        end
      x(i)=1/A(i,i) * (b(i) - sumatoria)
      end
    end
  end
endfunction
