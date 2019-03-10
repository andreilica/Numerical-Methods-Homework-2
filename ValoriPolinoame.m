function P = ValoriPolinoame(d, s, val_lambda)
% Intrari:
% -> d: diagonala principala a matricei tridiagonale simetrice;
% -> s: supradiagonala matricei tridiagonale simetrice;
% -> val_lambda: valoare pentru lambda.
% Iesiri:
% -> P: vectorul P = [P0(val_lambda) P1(val_lambda), ..., Pn(val_lambda)].

n = length(d);

% Initializare

P(1) = 1;
P(2) = d(1) - val_lambda;

%Construirea polinomului 

for i = 3 : n + 1 

P(i) = ( d(i - 1) - val_lambda) * P(i-1) - (s(i-2)^2)*P(i-2);

endfor
endfunction
