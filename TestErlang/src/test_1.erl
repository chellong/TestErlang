%% @author Administrator
%% @doc @todo Add description to test_catch.


-module(test_1).

%% ====================================================================
%% API functions
%% ====================================================================

-export([
		 combine/2,
		 random_tuple/1
		 ]).
%% ====================================================================
%% Internal functions
%% ====================================================================

%% 难度3星	
%%	1、合并列表, 相同key的，将值进行合并，
%%	[{a,1},{b,2},{c,3},{b,1}],[{b,4},{c,5},{d,6},{d,2}]

combine(L1, L2) -> 
	combine_list(lists:append(L1,L2), []).
combine_list([], List) -> 
	List;
combine_list([H|T], List) -> 
	combine_list(H, T,[], List).
combine_list(X, [], L, List) -> 
	combine_list(L, lists:append(List, [X]));
combine_list({K1, V1}, [{K2, V2}|T], ListTemp, List) -> 	
		case K1 =:= K2 of
			true -> 
				Element = {K1, V1 + V2},
				combine_list([Element] ++ ListTemp ++ T, List);
			false -> 
				combine_list({K1, V1}, T, lists:append(ListTemp, [{K2, V2}]), List)
		end.	

%% 难度2星	
%%	4、随机打乱元组，{a,b,c,b,4,5,6,7}
random_tuple(T) ->
	random_tuple(tuple_to_list(T),[]).
random_tuple([],Result) ->
	list_to_tuple(Result);
random_tuple(T,Result) ->
	Elem = get_index_list(T,random:uniform(length(T))),
	random_tuple(lists:delete(Elem, T),[Elem|Result]).

get_index_list([H|_],1) ->
 	 H;
get_index_list([_|T],N) when is_integer(N) ->
	get_index_list(T,N - 1).

%% 难度1星	
%%	7、{8,5,2,9,6,4,3,7,1} 将此元组中的奇数进行求和后除3的商（得值A），
%%	并将偶数求和后剩3（得值B），然后求A+B结果（谢绝一切API）












