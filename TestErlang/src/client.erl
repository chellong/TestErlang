-module(client).
  -export([connect/1, request/2, quit/0]).
  connect(Pid) ->
      register(srv, Pid).
  request(A, B) ->
      srv ! {self(), A, B},
      receive
          Result ->
              io:format("~p", [Result])
      end.
  quit() ->
      srv ! {self(), quit},
      receive
          ok ->
              io:format("ok")
      end.