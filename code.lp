% The domain for ixj rectangle from input
row(1..R) :- numrows(R).
col(1..C) :- numcols(C).

% choose exactly N queens to put 
N { queen(X,Y) : col(X), row(Y) } N :- numqueens(N).

% a square is full if it contains a queen
full(X,Y) :- queen(X,Y).

% if there is a queen in the same row it is attacked
attacked(X,Y) :- queen(XQ,Y), col(X), X != XQ.

% if there is a queen in the same column it is attacked
attacked(X,Y) :- queen(X,YQ), row(Y), Y != YQ.

% if there is a queen in the same diagnal it is attacked
attacked(X,Y) :- queen(XQ,YQ), col(X), row(Y), X != XQ, Y != YQ, |X - XQ| = |Y - YQ|.

% every square must be attacked or have a queen
:- col(X), row(Y), not attacked(X,Y), not full(X,Y).



