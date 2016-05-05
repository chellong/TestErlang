%% @author Administrator
%% @doc @todo Add description to test_catch.


-module(test_3).

%% ====================================================================
%% API functions
%% ====================================================================

-export([asc_list/1 , min/1]).
%% ====================================================================
%% Internal functions
%% ====================================================================

asc_list(L) -> asc_list(L,[]).
	
asc_list([], Newlist) -> lists:reverse(Newlist);
asc_list(L, Newlist) -> X = min(L),
			case X =:= [] of
				true -> asc_list([], Newlist);
				false -> Templist = lists:delete(X, L),
					 asc_list(Templist, [X|Newlist])
			end.

min([]) -> [];
min([H|T]) -> minTo(T, H).

minTo([H|T], M) -> 
	case H < M of
		true -> minTo(T, H);
		false -> minTo(T, M)
	end;
minTo([], M) -> M.