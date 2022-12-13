% PRODUCTO CARTESIANO
% el cartesiano_del Conj_1 por Conj_2 es Conj_3

:-op(100,xfx,[por]).
:-op(200,xfx,[es]).
:-op(300,fx,[cartesiano_del]).
:-op(400,fx,[el]).
:-op(400,fx,[la]).
:-op(300,fx,[linea_de]).
:-op(300,fx,[concatenado_de]).
:-op(300,fx,[interseccion_de]).

el cartesiano_del [] por _ es [].
el cartesiano_del [Car|Cdr] por C es R :-  la linea_de Car por C es W,
								el cartesiano_del Cdr por C es Z,
								el concatenado_de W por Z es R.
								
%------------------------------------------------------------------------------								
% CONCAT	

el concatenado_de [] por L es L.
el concatenado_de [Car|Cdr] por L es [Car|R] :- el concatenado_de Cdr por L es R.

%------------------------------------------------------------------------------
% LÍNEA

la linea_de _ por [] es [].
la linea_de E por [Car|Cdr] es [[E,Car]|R] :- la linea_de E por Cdr es R.

%------------------------------------------------------------------------------
% INTERSECCIÓN

:-op(300,fx,[miembro_de]).

la interseccion_de [] por _ es [].
la interseccion_de [Car|Cdr] por Y es [Car|Z] :- el miembro_de Y es Car,
									!,
									la interseccion_de Cdr por Y es Z.
la interseccion_de [_|Cdr] por Y es Z :- la interseccion_de Cdr por Y es Z.




%-----------------------------------------------------------------------------\
%-----------------------------------------------------------------------------|
%-   ||||||||||||||||||||||| PRACTICA PARA EXAMEN |||||||||||||||||||||||     |
%-----------------------------------------------------------------------------|
%-----------------------------------------------------------------------------/



%------------------------------------------------------------------------------
% MIEMBRO

%miembro([Car|_],Car).
%miembro([_|Cdr],X) :- miembro(Cdr,X).

el miembro_de [Car|_] es Car.
el miembro_de [_|Cdr] es X :- el miembro_de Cdr es X.

%------------------------------------------------------------------------------
% NATURAL

:-op(300,xf,[es_natural]).

0 es_natural.
s(X) es_natural :- X es_natural.

%------------------------------------------------------------------------------
% PAR

:-op(300,xf,[es_par]).

0 es_par.
s(s(X)) es_par :- X es_par.

%------------------------------------------------------------------------------
% SUMA

:-op(300,fx,[suma_de]).
:-op(100,xfy,[mas]).

la suma_de 0 mas X es X.
la suma_de s(0) mas Y es s(Y).
la suma_de s(X) mas Y es s(Z) :- la suma_de X mas Y es Z.

%------------------------------------------------------------------------------
% MULTIPLICACION

:-op(300,fx,[multiplicacion_de]).

la multiplicacion_de 0 por _ es 0.
la multiplicacion_de s(X) por Y es E :- la multiplicacion_de X por Y es Z,
								la suma_de Z mas Y es E.

%------------------------------------------------------------------------------
% PRIMERO

:-op(300,fx,[primero_de]).

el primero_de [Car|_] es Car.

%------------------------------------------------------------------------------
% INVERSA

inv([],[]).
inv([Car|Cdr],R) :- inv(Cdr,I),
				concat(I,[Car],R).

:-op(300,fx,[inversa_de]).

la inversa_de [] es [].
la inversa_de [Car|Cdr] es R :- la inversa_de Cdr es I,
						el concatenado_de I por [Car] es R.

%------------------------------------------------------------------------------
% ADYACENTES NO FUCA BIEN

:-op(300,fx,[son_adyacentes]).
:-op(100,xfy,[y]).
:-op(200,xfy,[en]).

son_adyacentes X y Y en [X,Y,_].
son_adyacentes X y Y en [Y,X,_].
son_adyacentes X y Y en [_,Cdr|Z] :- son_adyacentes X y Y en [Cdr|Z].

%------------------------------------------------------------------------------
% SUBCONJUNTO NO FUCA BIEN

subconj([],_).
subconj([Car|Cdr],L) :- miembro(L,Car),
				   subconj(Cdr,L).

:-op(300,fx,[es_subconjunto]).

es_subconjunto [] en _.
es_subconjunto [Car|Cdr] en L :- el miembro_de L es Car,
						es_subconjunto Cdr en L.

%------------------------------------------------------------------------------
% UNION

:-op(300,fx,[union_de]).
:-op(200,xfy,[con]).

la union_de [] con X es X.
la union_de [Car|Cdr] con Y es Z :- 	el miembro_de Y es Car,
							!,
							la union_de Cdr con Y es Z.
la union_de [Car|Cdr] con Y es [Car|Z] :- la union_de Cdr con Y es Z.

%------------------------------------------------------------------------------
% CONJUNTO (irreducible)

:-op(300,fx,[es_conjunto]).

es_conjunto [].
es_conjunto [Car|Cdr] :- 	el miembro_de Cdr es Car,
					!,
					fail.
es_conjunto [_|Cdr] :- es_conjunto Cdr.

%------------------------------------------------------------------------------
% PARTIR

:-op(300,fx,[partido_de]).

el partido_de _ y [] es [] y [].
el partido_de P y [Car|Cdr] es [Car|Men] y May :- 	Car<P,
										!,
										el partido_de P y Cdr es Men y May.
el partido_de P y [Car|Cdr] es Men y [Car|May] :- el partido_de P y Cdr es Men y May.


% QUICKSORT
quick([],[]).
quick([Car|Cdr],R) :- 	partir(Car,Cdr,Men,May),
					quick(Men,M1),
					quick(May,M2),
					concat(M1,[Car|M2],R).

:-op(300,fx,[quicksort_de]).

el quicksort_de [] es [].
el quicksort_de [Car|Cdr] es R :-	el partido_de Car y Cdr es Men y May,
							el quicksort_de Men es M1,
							el quicksort_de May es M2,
							el concatenado_de M1 por [Car|M2] es R.

%------------------------------------------------------------------------------
% PREFIJO

:-op(300,fx,[prefijo_de]).

el prefijo_de _  es [].
el prefijo_de [Car|L] es [Car|Cdr] :- el prefijo_de L es Cdr.

%------------------------------------------------------------------------------0
% DIFERENCIA

gran
diferencia


