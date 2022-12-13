%------------------------------------------------------------------------------0
% MIEMBRO

:-op(50,fx,[miembro_de]).
:-op(100,fx,[el]).
:-op(400,xfy,[es]).


%miembro([Car|_],Car).
%miembro([_|Cdr],X) :- miembro(Cdr,X).

el miembro_de [Car|_] es Car.
el miembro_de [_|Cdr] es X :- el miembro_de Cdr es X.

%------------------------------------------------------------------------------0
% DIFERENCIA

% la gran diferencia entre el array X y el array Y es la del array R.


:-op(50,fx,[array]).
:-op(100,fx,[del]).
:-op(150,xfy,[y]).
%:-op(150,fx,[la]).
:-op(200,fx,[entre]).
:-op(250,fx,[diferencia]).
:-op(300,fx,[gran]).
:-op(350,fx,[la]).

la gran diferencia entre el array [] y el array X es la del array X.
la gran diferencia entre el array [Car|Cdr] y el array L es la del array [Car|R] :-	not(el miembro_de L es Car),
																!,
																la gran diferencia entre el array Cdr y el array L es la del array R.
la gran diferencia entre el array [Car|Cdr] y el array [Car|L] es la del array R :- 	la gran diferencia entre el array Cdr y el array L es la del array R.																













