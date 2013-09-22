-module(solution).
-export([main/0]).

printn(N) when N =:= 0 -> "ok";
printn(N) when N > 0 -> 
    io:format("Hello World~n"),
    printn(N-1).

main() ->
    {ok, [N]} = io:fread("", "~d"),
    printn(N).
