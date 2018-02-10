function y=psi(x)
  y=x.*(x-0.2).*(x-0.4).*(x-0.6)
endfunction

x= 0:0.001:.6;
Mpsi = max(abs(psi(x)))