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
mult(0,_,0).
%mult(s(0),X,X). No es necesario
mult(s(X),Y,E) :- mult(X,Y,Z),
			  suma(Z,Y,E).
			  
%------------ · · MÍO · · ----------------
% Exponencial
exp(_,0,s(0)).
exp(X,s(Y),E) :- exp(X,Y,Z),
			 mult(Z,X,E).
%-----------------------------------------


%-----------------------------------------
%PRÁCTICA 2
%-----------------------------------------


% Primero 
primero([Car|_],Car).

% Segundo
segundo([_|[Seg|_]],Seg).

% Ultimo
ultimo([Cdr],Cdr).
ultimo([_|Cdr],X) :- ultimo(Cdr,X).

% Penúltimo
penultimo([Car|[_]],Car).
penultimo([_|Cdr],X) :- penultimo(Cdr,X).


% Miembro
miembro([Car|_],Car).
miembro([_|Cdr],X) :- miembro(Cdr,X).

% Concatenar
concat([],L,L).
concat([Car|Cdr],L,[Car|R]) :- concat(Cdr,L,R).

% Inversa
inv([],[]).
inv([Car|Cdr],R) :- inv(Cdr,I),
				concat(I,[Car],R).
				
% Intercalar
int([],[],[]).
int([Car1|Cdr1],[Car2|Cdr2],X) :- 	int(Cdr1,Cdr2,R),
							concat([Car1],[Car2|R],X).
							
							
% Intercalar SIN CONCAT
int2([],[],[]).
int2([Car1|Cdr1],[Car2|Cdr2],[Car1,Car2|R]) :- 	int2(Cdr1,Cdr2,R).
