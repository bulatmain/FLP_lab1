% Task 2: Relational Data

% The line below imports the data
:- ['three.pl'].

member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

append([], L, L).
append([X|T], L, [X|R]) :- append(T, L, R).  

len([],0).
len([X|T],N) :- len(T,N1), N is N1+1.

sum([], 0).
sum([H|T], S) :-
    sum(T, S1),
    S is H + S1.

average(L, A) :-
    sum(L, S),
    len(L, N),
    A is S / N.


% Point 1
average_grade() :-
    subject(Subj, _),
    grade_subj_list(Subj, L),
    average(L, S),
    write(Subj),
    write(': '),
    write(S), nl.


grade_subj_list(Subj, L) :-
    findall(G, (student(_, _, R), member(grade(Subj, G), R)), L).

% Point 2

count_failed_in_groups() :-
    findall(G, (student(G, _, _)), _Groups),
    sort(_Groups, Groups),
    write_failed_in_groups(Groups).


write_failed_in_groups([]).
write_failed_in_groups([H|T]) :-
    count_failed_in_group(H, S),
    write(H),
    write(': '),
    write(S), nl,
    write_failed_in_groups(T).


count_failed_in_group(G, S) :-
    findall(N, (student(G, _, L), count_failed(L, N)), _N),
    sum(_N, S).


count_failed([], 0).
count_failed([H|T], N) :-
    count_failed(T, N1),
    check_failed(H, C),
    N is C + N1.

check_failed(grade(_, 2), 1) :- !.
check_failed(_, 0).

% Point 3
count_failed_in_mark_list([], 0).
count_failed_in_mark_list([H|T], S) :-
    count_failed_in_mark_list(T, S1),
    check_failed_mark(H, C),
    S is C + S1.


check_failed_mark(2, 1) :- !.
check_failed_mark(_, 0).


count_failed_by_subjects() :-
    subject(Subj, _),
    grade_subj_list(Subj, L),
    count_failed_in_mark_list(L, S),
    write(Subj),
    write(': '),
    write(S), nl.