function numvp = NrValProprii(d, s, val_lambda)
% Intrari:
% -> d: diagonala principala a matricei tridiagonale simetrice;
% -> s: supradiagonala matricei tridiagonale simetrice;
% -> val_lambda: valoare pentru lambda.
% Iesiri:
% -> numvp: numarul de valori proprii mai mici decit val_lambda.

n = length(d);
P = ValoriPolinoame(d,s,val_lambda); %Crearea polinomului

numvp = 0;

%Calculul numarului de valori proprii

for i = 1 : n

  if( sign(P(i)) * sign(P(i+1)) < 0 || P(i) == 0 )   %Verificarea diferentei intre semne
    numvp++;
  endif
endfor