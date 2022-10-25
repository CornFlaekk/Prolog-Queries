%Eres mortal si eres persona.
mortal(P) :- persona(P).
persona(maria).
persona("Juan").

%Números naturales, desde 0 en adelante (los siguientes).
nat(0).
nat(s(X)) :- nat(X).

%Números negativos, desde -1 hacia atrás (los anteriores).
neg(a(0)).
neg(a(X)) :- neg(X).

%Suma en 2 partes
sumaa(0,X,X).
sumaa(s(X),Y,s(Z)) :- sumaa(X,Y,Z).

sumab(X,0,X).
sumab(X,s(Y),s(Z)) :- sumab(X,Y,Z).

%Suma todo junto.
suma(0,X,X).
suma(s(0),Y,s(Y)).
suma(s(X),Y,s(Z)) :- suma(X,Y,Z).

%------------ · · MÍO · · ----------------
% Resta
resta(X,X,0).
resta(s(X),Y,s(Z)) :- resta(X,Y,Z).
%-----------------------------------------


%Par e Impar
par(0).
par(s(s(X))) :- par(X).

impar(s(0)).
impar(s(s(X))) :- impar(X).

%Multiplicación
mult(0,X,0).
%mult(s(0),X,X). No es necesario
mult(s(X),Y,E) :- mult(X,Y,Z),
			  suma(Z,Y,E).
			  
%------------ · · MÍO · · ----------------
% Exponencial
exp(X,0,s(0)).
exp(X,s(Y),E) :- exp(X,Y,Z),
			 mult(Z,X,E).
%-----------------------------------------
