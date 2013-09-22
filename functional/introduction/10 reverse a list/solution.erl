-module(solution).
-export([main/0]).

get_input() ->
	case io:fread("", "~d") of
		{ok, [X]} -> [X | get_input()];
		eof       -> []
	end.

main() ->
	List = get_input(),
	Rev = lists:foldl(fun(X, L) -> [X | L]  end, [], List),
	lists:foreach(fun(X) -> io:format("~p~n", [X]) end, Rev).
