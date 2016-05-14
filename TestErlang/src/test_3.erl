%% @author Administrator
%% @doc @todo Add description to test.

-module(test_3).

%% ====================================================================
%% API functions
%% ====================================================================

-export([
		 sort_list_up/1,
		 format_tuple/1,
		 is_in_list/2
		]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% 难度3星	
%%	3、对[10,5,1,3,8,4,2]进行排序（升序）（谢绝++、--方法）
	
sort_list_up(L) ->
	sort_list(L,[]).
sort_list([],Result) ->
	Result;
sort_list(L,Result) ->
	MaK = get_list_maK(L),sort_list(lists:delete(MaK, L),[MaK|Result]).
get_list_maK([H|L]) when is_number(H) ->
	get_list_maK(H,L).
get_list_maK(MaK,[H|L]) -> 
	if MaK =< H ->
		get_list_maK(H,L);
	   MaK > H ->
		get_list_maK(MaK,L)
	end;
get_list_maK(MaK,[]) ->
	MaK.

%% 难度2星	
%%	6、将元组格式化[{moneV,200},{goods,1001,1},{moneV,150},{rmb,600},
%%    {goods,71143,1},{goods,1001,1},
%%	  {card,3001,281479271678954},{card,4001,281479271678955}]

format_tuple(L) ->
	format_tuple(L,[]).
format_tuple([],Result) ->
	Result;
format_tuple([H|L],Result) ->
	format_tuple(H,L,[],Result).
format_tuple(X,[], L, Result) ->
	format_tuple(L,lists:append(Result, [X]));
format_tuple({K1, V1}, [{K2, V2}|T], ListTemp, Result) ->
	case K1 =:= K2 of
			true -> 
				Element = {K1, V1 + V2},
				format_tuple([Element] ++ ListTemp ++ T, Result);
			false -> 
				format_tuple({K1, V1}, T, lists:append(ListTemp, [{K2, V2}]), Result)
	end;
format_tuple({K1,V11,V12},[{K2,V21,V22}|T],ListTemp, Result) ->
	case ((K1 =:= K2 ) and ( V11=:=V21)) of
		true -> 
			Element = {K1, V11,V12 + V22},
			format_tuple([Element] ++ ListTemp ++ T, Result);
		false -> 
			format_tuple({K1,V11,V12}, T, lists:append(ListTemp, [{K2,V21,V22}]), Result)
	end;
format_tuple(X,[H|T],ListTemp,Result) ->
	format_tuple(X, T, lists:append(ListTemp,[H]),Result).


%% 难度1星	
%%	9、判断A列表（[3,5,7,3]）是否在B列表（[8,3,5,3,5,7,3,9,3,5,6,3]）中出现，
%%    出现则输出在B列表第几位开
is_in_list([H1|L1],L2) ->
	is_in_list([H1|L1],L2,1).
is_in_list([H1|L1],L2,Index) ->
	is_in_list(H1,L1,L2,[H1|L1],Index).
is_in_list(_,[],_,L,Index)->
	{start,(Index - (length(L) + 1))};
is_in_list(_,_,[],_,_)->
	{not_in};
is_in_list(H,[H1|L1],[H2|L2],L,Index) ->
	case H =:= H2 of
		true ->  is_in_list(H1,L1,L2,L,Index + 1); 
		false -> is_in_list(L,L2,Index)
			%%is_in_list(H,{H1|L1},L2,L,Index + 1)
	end.


