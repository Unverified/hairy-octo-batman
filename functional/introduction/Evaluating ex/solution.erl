-module(solution).
-export([main/0]).

get_input(N) ->
	case io:fread("", "~s") of
		{ok, [X]} -> [string_to_numeric(X) | get_input(N+1)];
		eof       -> []
	end.

string_to_numeric(S) ->
	case string:to_float(S) of
		{error, _} ->
			{Val, _} = string:to_integer(S),
			Val;
		{X, _} -> X
    end.

factorial(1) -> 1;
factorial(N) when N > 1 -> N * factorial(N-1).

series_expand(1, _) -> 1;
series_expand(N, X) when N > 1 ->
	M = N-1,
	math:pow(X, M) / factorial(M) + series_expand(M, X).
    
main() ->
	[_|List] = get_input(0),
	Transform = lists:map(fun(X) -> round(series_expand(10, X) * 10000)/10000 end, List),
	lists:foreach(fun(X) -> io:format("~p~n", [X]) end, Transform).
