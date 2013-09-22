-module(solution).
-export([main/0]).

get_input() ->
    case io:fread("", "~d") of
        {ok, [X]} -> [X | get_input()];
        eof -> []
    end.

main() ->
    List = lists:map(fun(X) -> abs(X) end, get_input()),
    lists:foreach(fun(X) -> io:format("~p~n", [X]) end, List).
