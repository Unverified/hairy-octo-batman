-module(solution).
-export([main/0]).

fibonacci(1) -> 0;
fibonacci(2) -> 1;
fibonacci(N) -> fibonacci(N-2, 1, 0).

fibonacci(1, X, Y)   -> X + Y;
fibonacci(Acc, X, Y) -> fibonacci(Acc-1, X+Y, X).

main() ->
	{ok, [X]} = io:fread("", "~d"),
	io:format("~p~n", [fibonacci(X)]).
