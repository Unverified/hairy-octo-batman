-module(solution).
-export([main/0]).

generate_list(N) when N =< 0 -> [];
generate_list(N) when N > 0 -> [N | generate_list(N-1)].

main() -> 
	{ok, [Size]} = io:fread("", "~d"),
	io:format("~p", [Size]),
	generate_list(Size).
