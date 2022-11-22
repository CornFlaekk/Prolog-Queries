:- op(600,xfy,[\]).

%Ultimo c/ DL
ultimo(L,R) :- ultimo_dl(L,R\[]).
ultimo_dl([U],U\_).
ultimo_dl([_|Cdr], R\C) :- ultimo_dl(Cdr,R\C).

%Penultimo c/ DL
penultimo(L,R) :- penultimo_dl(L,R\[]).
penultimo_dl([Cdr|[_]],Cdr\_).
penultimo_dl([_|Cdr],R\C) :- penultimo_dl(Cdr,R\C).

%Miembro c/ DL
miembro(E,L) :- miembro_dl(E,L\[]).
miembro_dl(Car,[Car|_]\_).
miembro_dl(E,[_|Cdr]\C) :- miembro_dl(E,Cdr\C).

%Concat c/ DL
concat(L,U,R) :- concat_dl(L,U,R\[]).
concat_dl([],L,L\_).
concat_dl([Car|Cdr],U,[Car|R]\C) :- concat_dl(Cdr,U,R\C).

%Invertir c/ DL
inv(L,I) :- inv_dl(L,I\[]).
inv_dl([],X\X).
inv_dl([Car|Cdr],R\C) :- inv_dl(Cdr,R\[Car|C]).

%Intercalar c/ DL
intercalar(L,U,R) :- intercalar_dl(L,U,R\[]).
intercalar_dl([],_,X\X).
intercalar_dl([Car],[],[Car]\_).
intercalar_dl([Car1|Cdr1],[Car2|Cdr2],[Car1,Car2|R]\C) :- intercalar_dl(Cdr1,Cdr2,R\C).

%Adyacentes c/ DL
ady(X,Y,L) :- ady_dl(X,Y,L\[]).
ady_dl(X,Y,[X,Y,_]\_).
ady_dl(Y,X,[X,Y,_]\_).
ady_dl(X,Y,[_|Cdr]\C) :- ady_dl(X,Y,Cdr\C).

%Subconjunto c/ DL
subconj(S,L) :- subconj_dl(S,L\[]).
subconj_dl([],_\_).
subconj_dl([Car|Cdr],L\C) :- miembro(Car,L),
						subconj_dl(Cdr,L\C).
						
%Linea c/ DL
linea(E,L,R) :- linea_dl(E,L,R\[]).
linea_dl(_,[],X\X).
linea_dl(E,[Car|Cdr],[[E,Car]|R]\C) :- linea_dl(E,Cdr,R\C).

%Producto Cartesiano c/ DL
pc(L,U,R) :- pc_dl(L,U,R\[]).
pc_dl([],_,X\X).
pc_dl([Car|Cdr],L,R\C) :- linea_dl(Car,L,R\S),
					pc_dl(Cdr,L,S\C).
					
%Select c/ DL
select(E,L,R) :- select_dl(E,L,R\[]).
select_dl(Car,[Car|Cdr],Cdr\_).
select_dl(E,[Car|Cdr],[Car|R]\C) :- select_dl(E,Cdr,R\C).

%Union c/ DL
union(L,U,R) :- union_dl(L,U,R\[]).
union_dl([],U,U\_).
union_dl([Car|Cdr],U,R\C) :-	miembro(Car,U),
						!,
						union_dl(Cdr,U,R\C).
union_dl([Car|Cdr],U,[Car|R]\C) :- union_dl(Cdr,U,R\C).

%Interseccion c/ DL
int(L,U,R) :- int_dl(L,U,R\[]).
int_dl([],_,X\X).
int_dl([Car|Cdr],U,[Car|R]\C) :- 	miembro(Car,U),
							!,
							int_dl(Cdr,U,R\C).
int_dl([_|Cdr],U,R\C) :- int_dl(Cdr,U,R\C).

%Conjunto c/ DL
conjunto(X) :- conjunto_dl(X\[]).
conjunto_dl(X\X).
conjunto_dl([Car|Cdr]\C) :- miembro_dl(Car,Cdr\C),
						!,
						fail.
conjunto_dl([_|Cdr]\C) :- conjunto_dl(Cdr\C).

% Partir --- SIN DL ---
partir(_,[],[],[]).
partir(P,[Car|Cdr],[Car|Men],May):- 	Car<P,
							!,
							partir(P,Cdr,Men,May).
					
partir(P,[Car|Cdr],Men,[Car|May]):-	partir(P,Cdr,Men,May).

%Partir c/ DL
partir2(P,L,Men,May) :- partir_dl(P,L,Men\[],May\[]).
partir_dl(_,[],X\X,Y\Y).
partir_dl(P,[Car|Cdr],[Car|X]\C,Y\S) :- 	Car<P,
								!,
								partir_dl(P,Cdr,X\C,Y\S).
partir_dl(P,[Car|Cdr],X\C,[Car|Y]\S) :-  partir_dl(P,Cdr,X\C,Y\S).

%Quicksort c/ DL
quick(L,R) :- quick_dl(L,R\[]).
quick_dl([],X\X).
quick_dl([Car|Cdr],R\C) :-	partir2(Car,Cdr,Izq,Der),
					quick_dl(Izq,R\[Car|S]),
					quick_dl(Der,S\C).
