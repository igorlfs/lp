parent(kim,holly).
parent(margaret,kim).
parent(margaret,kent).
parent(esther,margaret).
parent(herbert,margaret).
parent(herbert,jean).
greatGrandParent(GGP,GGC) :- parent(GGP,GP), parent(GP,P), parent(P,GGC).
sibling(X,Y) :- parent(P,X), parent(P, Y), not(X=Y).

firstCousin(X, Y) :-
  parent(P1, X),
  parent(P2, Y),
  not(P1=P2),
  not(sibling(X, Y)).

descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- parent(Z, X), descendant(Z, Y).

third(X, Y) :- X = [_, _, Y|_].

dupList([], []).
dupList([H|T], [H, H|X]) :- dupList(T, X).

isEqual([], []).
isEqual(X, Y) :- permutation(X, Y).

isDifference([], _, []).
isDifference([X|Xs], Y, Z) :-
  member(X, Y),
  isDifference(Xs, Y, Z).
isDifference([X|Xs], Y, [X|Z]) :-
  not_member(X, Y),
  isDifference(Xs, Y, Z).

not_member(_, []).
not_member(X, [Y|Ys]) :-
  not(X=Y),
  not_member(X, Ys).

maxList([X], X).
maxList([X|Xs], M) :-
  maxList(Xs, Max),
  (X > Max -> M = X ; M = Max).

nqueens(N, X) :-
  length(X, N),
  numlist(1, N, Domain),
  permutation(Domain, X),
  safe_queens(X).

safe_queens([]).
safe_queens([Q|Queens]) :-
  safe_queens(Queens, Q, 1),
  safe_queens(Queens).

safe_queens([], _, _).
safe_queens([Q|Queens], Q0, D0) :-
  Q0 =\= Q,
  abs(Q0 - Q) =\= D0,
  D1 is D0 + 1,
  safe_queens(Queens, Q0, D1).
