function vp = CalculezValProprii(d, s, m, tol)
% Intrari:
% -> d: diagonala principala a matricei tridiagonale simetrice;
% -> s: supradiagonala matricei tridiagonale simetrice;
% -> m: limita pentru numarul de valori proprii;
% -> tol: precizia determinarii.
% Iesiri:
% -> vp: vector de valori proprii, de dimensiune m.

n = length(d);
r = IntervaleValProprii(d,s,m);


if m > n
  m = n;
endif

for i = 1 : m

  pas = 0;
  b = r(i + 1);
  a = r(i);
  
  %Metoda bisectiei
  
  while( abs(ValoriPolinoame(d,s, (a+b)/2 )) > tol)  %Conditia de oprire 
    c = (a+b)/2;
    P1 = ValoriPolinoame(d,s,a); 
    P2 = ValoriPolinoame(d,s,c);
    P3 = ValoriPolinoame(d,s,b);
    if( P1(length(P1)) *P2(length(P2)) < 0)
      b = c;
    elseif(P2(length(P2))*P3(length(P3)) < 0)
      a = c;
    endif
    pas = pas+1;
  endwhile
  
vp(i) = c;
 
endfor
endfunction