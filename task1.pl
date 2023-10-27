% Length of list
mylen([],0).
mylen([X|T],N) :- mylen(T,N1), N is N1+1.

% Is X member of list
mymember(X, [X|_]).
mymember(X, [_|T]) :- mymember(X, T).

% Out argument is two appended lists
myappend([], L, L).
myappend([X|T], L, [X|R]) :- myappend(T, L, R).  

% Out argument is list without one entry of given element
myremove([X|T], X, T).
myremove([H|T], X, [H|R]) :- myremove(H, X, R).

% Two lists are permutations of each other
mypermute([], []).
mypermute(L, [X|T]) :-
    myremove(L, X, R),
    mypermute(L, R).

% R is sublist of L
mysublist(R, L) :- myappend(_, T, L), myappend(R, _, T).
