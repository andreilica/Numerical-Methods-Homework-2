function [valp vecp] = PutereInv(d, s, h, y, maxIter, tol)
% Intrari:
% -> d: diagonala principala a matricei tridiagonale simetrice;
% -> s: supradiagonala matricei tridiagonale simetrice;
% -> y: aproximatia initiala a vectorului propriu;
% -> h: deplasare;
% -> maxIter: numarul maxim de iteratii;
% -> tol: precizia determinarii.
% Iesiri:
% -> [valp vecp]: valoarea proprie valp, respectiv vectorul propriu vecp.
n = length(d);

%Metoda puterii inverse

while(maxIter > 0)
  z = Thomas(s, d-h, s, y);
  y = z/norm(z);
  maxIter--;
  p(1) = d(1)*y(1) + s(1)*y(2);
  p(n) = s(n-1)*y(n-1) + d(n)*y(n);

  for i = 2 : n - 1
    p(i) = s(i-1)*y(i-1) + d(i)*y(i) + s(i)*y(i+1);
  endfor

  valp = p * y;
  h=valp;
  
  if norm(p' - valp*y) < tol
    break;
  endif
  
endwhile
vecp = y;
endfunction

%Algoritmul lui Thomas pentru o matrice tridiagonala simetrica

function x = Thomas(a, b, c, d)
	n = length(d);
  a = [0 a];
  
  %transform a astfel incat sa aiba n elemente, cu primul element 0

	% Operatiile la limita;
	c(1) = c(1)/b(1); 
	d(1) = d(1)/b(1);   
 	
 	% calculul coeficientilor pe caz general.
	for i = 2 : n - 1
		temp = b(i)-a(i)*c(i-1);
		c(i) = c(i)/temp;
		d(i) = (d(i)-a(i)*d(i-1))/temp;
	endfor
    d(n) = (d(n) - a(n)*d(n-1))/(b(n)-a(n)*c(n-1));
	% Substitutia inapoi pentru rezolvarea sistemului de ecuatii
	x(n) = d(n);
	for i = n-1 : -1 : 1
		x(i) = d(i)-c(i)*x(i+1);
	endfor
  x = x';
endfunction

