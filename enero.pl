%union(C1,C2,R).

union([],X,X).
union([Car|Cdr],X,[Car|R]) :- union(Cdr,X,R).

%borrar(E,L,R).

borrar(_,[],[]).
borrar(E,[E|Cdr],Cdr) :- borrar(E,Cdr,Cdr),!.
borrar(E,[Car|Cdr],[Car|R]) :- borrar(E,Cdr,R).

%miembro(E,L).

%miembro(_,[]) :- fail. NO HACE FALTA 
miembro(E,[E|_]).
miembro(E,[_|Cdr]) :- miembro(E,Cdr).

%bpp(L,R). - Borrar posiciones pares

bpp([],[]).
bpp([_],[]).
bpp([_,Car2|Cdr],[Car2|R]) :- bpp(Cdr,R).

%bhp(L,N,R). - Borrar hasta posición

bhp(X,0,X).
bhp([_|Cdr],N,R) :- N1 is N-1,
				bhp(Cdr,N1,R).
				
%mpp(). - multiplicar posiciones pares

mpp([],[]).
mpp([X],[X]).
mpp([Car1,Car2|Cdr],[Car1,CarR|R]) :- CarR is Car2*2,
						mpp(Cdr,R).
						
%tamaño(L,N). - tamaño de una lista

tamano([],0).
%tamano([_],1).
tamano([_|Cdr],N) :- tamano(Cdr,M),
				N is M+1.

%sc(L,R). - todos los posibles subconjuntos de una lista

sc([X],X).
sc([Car|Cdr],[Cdr|R]):- sc(Cdr,R).