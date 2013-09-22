-module(solution).
-export([main/0]).

get_input() ->
    case io:fread("", "~d") of
        {ok, [X]} -> [X | get_input()];
        eof -> []
    end.

main() ->
    [R|List] = get_input(),
    NewList = lists:foldl(fun(X, L) -> L ++ lists:duplicate(R, X)  end, [], List),
    lists:foreach(fun(X) -> io:format("~p~n", [X]) end, NewList).
