%% @author Administrator
%% @doc @todo Add description to test.

-module(test).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 print/0,
		 sum/1,
		 for/3,
		 fibo/1,
		 m_list_to_string/1,
		 odds_and_evens_acc/1,
		 get_index_for_list/2,
		 get_index_for_list_2/2,
		 get_index_for_tuple/2,
		 get_tuple_element_use_key/2,
		 print_stacktrace/0,
		 reverse_list/1,
		 is_list_start/2,
		 get_list_max/1,
		 get_list_min/1,
		 get_index_from_list/2,
		 qsort/1,
		 spilt_string/2
		]).

-import(lists,[reverse/1,member/2]).
%% ====================================================================
%% Internal functions
%% ====================================================================

%% Hello world
print() ->
	io:format("Hello World").
%% 計算列表的总和
sum([]) ->
	0;

sum([H|L]) when is_number(H) ->
	H + sum(L).
%% for循環
for(Max,Max,F) ->
	[F(Max)];
for(Min,Max,F) ->
	[F(Min)|for(Min + 1,Max,F)].
%% fibo函数
fibo(0) -> 0 ; 
fibo(1) -> 1 ; 
fibo(N) when N > 0 -> fibo(N-1) + fibo(N-2) .

%% 1、将列表中的integer,float,atom转成字符串并合并成一个字符串：[1,a,4.9,"sdfds"]	
%% 结果："1a4.9sdfds"（禁用++ -- append concat实现）
m_list_to_string(L) ->
	m_list_to_string(L,[]).
m_list_to_string([H|L],Result) ->
	m_list_to_string(L,[m_to_string(H)|Result]);	  
m_list_to_string([],Result) ->
	binary_to_list(list_to_binary(reverse_list(Result))).

m_to_string(H) when is_integer(H) -> integer_to_list(H);
m_to_string(H) when	is_float(H) -> string:substr(float_to_list(H),1,3);
m_to_string(H) when	is_atom(H) -> atom_to_list(H);
m_to_string(H) when	is_list(H) -> H.


%%  2.1> 得到列表或元组中的指定位的元素
%%	   {a,g,c,e}第1位a
%%     [a,g,c,e]第1位a（禁用erlang lists API实现）

get_index_for_tuple(T,N) ->
	get_index_for_list(tuple_to_list(T),N).

%% m_tuple_to_list() -> [term()].
%% 2. 2> 得到列表或元组中的指定位的元素
%%{a,g,c,e}第1位a [a,g,c,e]第1位a（禁用erlang lists API实现）

get_index_for_list(L,N) when is_list(L),is_integer(N) ->
	get_index_for_list(L,N,1).
get_index_for_list([H|_],MAX,MAX) ->
	H;
get_index_for_list([_|L],MAX,N) ->
  get_index_for_list(L,MAX,N + 1).

%% 2. 2 第二種
get_index_for_list_2([H|T],1) ->
 	 H;
get_index_for_list_2([_|T],N) when is_integer(N) ->
	get_index_for_list_2(T,N - 1).

%% 3. 将元素按奇偶分开

odds_and_evens_acc(L) ->
	odds_and_evens_acc(L,[],[]).
odds_and_evens_acc([H|T],Odds,Evens) ->
	case (H rem 2) of
		1 -> odds_and_evens_acc(T,[H|Odds],Evens);
		0 -> odds_and_evens_acc(T,Odds,[H|Evens])
	end;
odds_and_evens_acc([],Odds,Evens) ->
	{Odds,Evens}.

%% 4、合并多个列表
merge_list(L1,L2) ->
	lists:append(L1, L2).

%% 5、删除或查询元组中第N个位置的值等于Key的tuple（禁用lists API实现）
get_tuple_element_use_key(T,Key) when is_tuple(T) ->
	get_tuple_element_use_key(T,Key,tuple_size(T)).
get_tuple_element_use_key(T,Key,1) ->
	case element(1,T) =:= Key of
		false -> false; 
		true  -> {element(1,T),1}
	end;
get_tuple_element_use_key(T,Key,N) ->
	case element(N,T) =:= Key of
		false -> get_tuple_element_use_key(T,Key,N - 1); 
		true  -> {element(N,T),N}
	end.
%% 6、查询List1是为List2的前缀（禁用string API实现）
is_list_start([H1|L1],[H2|L2]) when H1 =:= H2 ->
	is_list_start(L1,L2);
is_list_start([],_) ->
	[yes];
is_list_start(_,_) ->
	[no].

%% 7、逆转列表或元组（禁用lists API实现）

reverse_list([H|L]) ->
	reverse_list(L,[H]).
reverse_list([H|L],Result) ->
	reverse_list(L,[H|Result]);
reverse_list([],Result) ->
	Result.

%% 8、对列表进行排序
%% 快速排序

qsort([]) ->
	[];
qsort([Pivot|T]) ->
	qsort([X || X <- T,X < Pivot])
	++ [Pivot] ++
	qsort([X || X <- T,X >= Pivot]).

%% 9、对一个字符串按指定字符劈分（禁用string API实现)
spilt_string(String,C) ->
	spilt_string(String,C,[],[]).
spilt_string([H|String],C,Before,After) ->
	case member(H,C) of
		false ->
			spilt_string(String,C,[ H | Before ], String);
		true ->
			spilt_string([],C,Before, String)
	end;
spilt_string([],_,Before,After)	->
	[reverse(Before),After].


%% 10、获得当前的堆栈
print_stacktrace()->
	throw("throw any +++++++++++") + io:format(erlang:get_stacktrace()).

%% 11、获得列表组中的最大最小值（禁用API实现）
%% 最大值
get_list_max([H|L]) when is_number(H) ->
	get_list_max(H,L).
get_list_max(Max,[H|L]) -> 
	if Max =< H ->
		get_list_max(H,L);
	   Max > H ->
		get_list_max(Max,L)
	end;
get_list_max(Max,[]) ->
	Max.

%% 最小值
get_list_min([H|L]) when  is_number(H)->
	get_list_min(H,L).
get_list_min(Min,[H|L]) ->
	if Min =< H ->
		get_list_min(Min,L);
	   Min > H ->
		get_list_min(H,L)
	end;
get_list_min(Min,_) ->
	Min.
 
%% 12、查找元素在元组或列表中的位置
get_index_from_list(L,Char) ->
	get_index_from_list(L,Char,1).
get_index_from_list([H|L],Char,Index) ->
	if
		H =:= Char ->
			get_index_from_list([],Char,Index);
		true ->
			get_index_from_list(L,Char,Index + 1)
	end;
get_index_from_list([],Char,Index) ->
	Index.
	



















