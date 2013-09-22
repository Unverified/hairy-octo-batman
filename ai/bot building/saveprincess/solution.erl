-module(solution).
-export([main/0]).

getInput(N) when N =< 0 -> [];
getInput(N) when N > 0 ->
	{ok, [X]} = io:fread("", "~s"),
	[X | getInput(N-1)].

findPerson(Matrix, Person) ->
	List = lists:map(fun(X) -> string:chr(X, Person) end, Matrix),
	createPoint(List, 0).

createPoint([X|_], Y) when X > 0 -> {X, Y};
createPoint([X|List], Y) when X =:= 0 -> createPoint(List, Y+1).

getDirections(X, Y) -> 
	printDirection(X, "LEFT\n", "RIGHT\n") ++ printDirection(Y, "UP\n", "DOWN\n").

printDirection(X, _, _) when X =:= 0 -> "";
printDirection(X, Pos, Neg) when X > 0 -> Pos ++ printDirection(X-1, Pos, Neg);
printDirection(X, Pos, Neg) when X < 0 -> Neg ++ printDirection(X+1, Pos, Neg).

main() ->
	{ok, [Size]} = io:fread("", "~d"),
	Map = getInput(Size),
	{X1, Y1} = findPerson(Map, $p),
	{X2, Y2} = findPerson(Map, $m),
	io:format("~s", [getDirections(X2-X1, Y2-Y1)]).
