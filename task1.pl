% Point 3

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

% Point 4

% First option
remove_last_three(R, L) :- 
    myappend(L, T, R),
    mylen(T, N),
    N = 3.

% Second option
len_is_three(L) :-
    mylen(L, N),
    N = 3.

just_is(A, A). 

rm_last_three(R, []) :-
    len_is_three(R), !.
rm_last_three([H|T], [H]) :-
    len_is_three(T), !.
rm_last_three([H|T], L) :-
    rm_last_three(T, L1),
    just_is(L, [H|L1]).

% Point 5

sum([], 0).
sum([H|T], S) :-
    sum(T, S1),
    S is H + S1.

average(L, A) :-
    sum(L, S),
    mylen(L, N),
    A is S / N.
