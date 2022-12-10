% Producto Cartesiano
% el cartesiano_del Conj_1 por Conj_2 es Conj_3

:-op(100,xfx,[por]).
:-op(200,xfx,[es]).
:-op(300,fx,[cartesiano_del]).
:-op(400,fx,[el]).
:-op(400,fx,[la]).
:-op(300,fx,[linea_de]).
:-op(300,fx,[concatenado_de]).
:-op(300,fx,[miembro_de]).
:-op(300,fx,[interseccion_de]).

el cartesiano_del [] por _ es [].
el cartesiano_del [Car|Cdr] por C es R :-  la linea_de Car por C es W,
								el cartesiano_del Cdr por C es Z,
								el concatenado_de W por Z es R.
								
%Concat								
el concatenado_de [] por L es L.
el concatenado_de [Car|Cdr] por L es [Car|R] :- el concatenado_de Cdr por L es R.

% Línea
la linea_de _ por [] es [].
la linea_de E por [Car|Cdr] es [[E,Car]|R] :- la linea_de E por Cdr es R.






% Intersección
%interseccion([],_,[]).
%interseccion([Car|Cdr],Y,[Car|Z]) :- miembro(Y,Car),
%					!,
%					interseccion(Cdr,Y,Z).
%interseccion([_|Cdr],Y,Z) :- interseccion(Cdr,Y,Z).

la interseccion_de [] por _ es [].
la interseccion_de [Car|Cdr] por Y es [Car|Z] :- el miembro_de Y es Car,
									!,
									la interseccion_de Cdr por Y es Z.
la interseccion_de [_|Cdr] por Y es Z :- la interseccion_de Cdr por Y es Z.



% Miembro
%miembro([Car|_],Car).
%miembro([_|Cdr],X) :- miembro(Cdr,X).

el miembro_de [Car|_] es Car.
el miembro_de [_|Cdr] es X :- el miembro_de Cdr es X.