-module(solution).
-export([main/0]).

get_pascal(Row, Col) when Col =:= Row ; Col =:= 1 -> 1;
get_pascal(Row, Col) -> get_pascal(Row-1, Col-1) + get_pascal(Row-1, Col).
    
get_triangle(1) -> get_row(1, 1);
get_triangle(Size) when Size > 1 ->
	get_triangle(Size-1) ++ "~n" ++ get_row(Size, 1).
    
get_row(N, N) -> integer_to_list(1);
get_row(N, M) -> integer_to_list(get_pascal(N, M)) ++ " " ++ get_row(N, M+1).

main() ->
	{ok, [X]} = io:fread("", "~d"), 
	io:format(get_triangle(X)).
