-module(solution).
-export([main/0]).

gcd(X, 0) -> X;
gcd(X, Y) -> gcd(Y, X rem Y).

main() ->
	{ok, [X|[Y|_]]} = io:fread("", "~d ~d"),
	io:format("~p~n", [gcd(X, Y)]).
