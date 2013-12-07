-module(solution).
-export([main/0]).

get_input() ->
        case io:fread("", "~d") of
                {ok, [X]} -> [X | get_input()];
                eof       -> []
        end.

main() ->
        List = get_input(),
        io:fwrite("~p~n", [lists:foldl(fun(X, Sum) -> Sum + abs((X rem 2))*X  end, 0, List)]).
