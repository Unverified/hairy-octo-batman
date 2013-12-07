-module(solution).
-export([main/0]).

get_input() ->
	case io:fread("", "~d") of
		{ok, [X]} -> [X | get_input()];
		eof       -> []
    end.

main() ->
	List = get_input(),
	Count = lists:foldl(fun(_, Sum) -> Sum + 1  end, 0, List),
	io:format("~p~n", [Count]).
