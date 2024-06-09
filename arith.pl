% isnumber(X) is true if X is a isnumber

isnumber(0).
isnumber(s(X)) :- isnumber(X).

% plus(X,Y,Z) is true if X + Y = Z

plus(0,X,X) :- isnumber(X).
plus(s(X),Y,s(Z)) :- plus(X,Y,Z).

% minus(X,Y,Z) is true if X - Y =Z

minus(X,0,X) :- isnumber(X).
minus(s(X),s(Y),Z) :- minus(X,Y,Z).

% times(X,Y,Z) is true if X * Y = Z

times(X,0,0) :- isnumber(X).
times(X,s(Y),Z) :- times(X,Y,Z1), plus(X,Z1,Z).

% even(N) is true if N is 0 or even

even(0).
even(s(s(X))) :- even(X).	


% N is odd if it differs by 1 with an even number

odd(s(X)) :- even(X).


% div2(N, D) is true if integer division N / 2 = D.

div2(0, 0).
div2(s(0), 0).
div2(s(s(N)), s(D)) :- div2(N, D).


% log is true if B^N == X
log(X, B, N) :- pow(B, N, X).


% pow(X,Y,Z) is true if X^Y = Z

pow(X,0,s(0)) :- isnumber(X).
pow(X,s(Y),Z) :- pow(X,Y,Z1), times(X,Z1,Z).


% member(X, L) is true if X is a member of list L
member(X, [X|_]). 

member(X, [_|T]) :- member(X, T).

% concat(L, X, Y) is true if L is the concatenation of lists X and Y
concat([], X, X).
concat([H|T], X, [H|Result]) :- concat(T, X, Result).

% reverse(L, R) is true if R is the reversal of the list L
reverse([], []).
reverse([H|T], R) :- reverse(T, RevT), concat(RevT, [H], R).

% palindrome(L) is true if L is a palindrome
palindrome(L) :- reverse(L, L).


% Example queries:
% Isnumbers are represented as successors of 0. For example, 2 is s(s(0)).
% 2+2=4 is plus(s(s(0)), s(s(0)), s(s(s(s(0)))))
% 3*2=? is times(s(s(s(0))), s(s(0)), X)
