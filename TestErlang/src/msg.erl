%% @author Administrator
%% @doc @todo Add description to msg.


-module(msg).

-export([start/0, daemon/0]).
  
start() ->
    spawn(demo, daemon, []).
  
daemon() ->
    receive
      ok ->
         io:format("ok, exit.");
      Msg ->
      	 io:format("~p\n", [Msg])
	
	after 5000 ->
         io:format("timeout\n")
    end.
