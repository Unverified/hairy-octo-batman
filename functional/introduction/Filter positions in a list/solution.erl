-module(solution).
-export([main/0]).

get_input(N) ->
	case io:fread("", "~d") of
		{ok, [X]} -> [{N, X} | get_input(N+1)];
		eof       -> []
	end.

main() ->
	List = get_input(0),
	Rev = lists:filter(fun({X,_}) -> X rem 2 =/= 0  end, List),
	lists:foreach(fun({_,X}) -> io:format("~p~n", [X]) end, Rev).
