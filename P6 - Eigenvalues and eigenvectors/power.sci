// MÉTODO DE LAS POTENCIAS PARA CALCULAR ÉL AUTOVALOR DOMINANTE lambda Y EL AUTOVECTOR ASOCIADO V DE UNA MATRIZ A DE ORDEN n x n. SE SUPONE QUE LOS AUTOVALORES VERIFICAN LA CONDICION DE DOMINACION (UN AUTOVALOR ES MAYOR A TODOS LOS OTROS EN VALOR ABSOLUTO, DISTINTO DE CERO)

function [lambda, V]=power(A,X,epsilon,maxit)
    // A matriz de nxn
    // X vector aproximación inicial a un autovector de lambda, n x 1
    
    //lambda: radio espectral
    //V: autovector asociado
    
    
    //inicializacion
    
   lambda=0;
   cnt=0;
   err=1;
   state=1;
   
   while ((cnt<maxit)&(state==1))
       Y=A*X
       [m j]=max(abs(Y))
       c1=m
       dc=abs(lambda-c1)
       Y=(1/c1)*Y
       
       //actualizacion de X y de lambda y criterio de convergencia
       dv=norm(X-Y)
       err=max(dc,dv)
       X=Y
       lambda=c1
       state=0
       if (err>eps) then
           state=1
       end
       cnt=cnt+1
   end
   V=X
endfunction


