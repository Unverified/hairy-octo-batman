-module(solution).
-export([main/0]).

get_input() ->
	case io:fread("", "~d") of
		{ok, [X]} -> [X | get_input()];
		eof       -> []
	end.

main() ->
	[M|List] = get_input(),
	Filter = lists:filter(fun(X) -> X < M end, List),
	lists:foreach(fun(X) -> io:format("~p~n", [X]) end, Filter).
