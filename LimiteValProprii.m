function [limita_inf, limita_sup] = LimiteValProprii(d, s)
% Intrari:
% -> d: diagonala principala a matricei tridiagonale simetrice;
% -> s: supradiagonala matricei tridiagonale simetrice.
% Iesiri:
% -> [limita_inf limita_sup]: limitele incadratoare pentru valorile proprii ale matricei tridiagonale simetrice.
n = length(d);

for i = 1 : n
  suma = 0;
  if i == 1 
    suma = abs(s(1)); %Calcul suma pentru prima linie
  else
    if i == n  %Calcul suma pentru ultima linie
      suma = abs(s(i - 1));
    else
      suma = abs(s(i-1)) + abs(s(i)); %Calcul suma pentru restul liniilor
    endif
  endif

  minimul(i) = d(i) - suma; 
  maximul(i) = d(i) + suma;
endfor

%Calcului limitelor inferioara si superioara

limita_inf = min(minimul);
limita_sup = max(maximul);

endfunction

