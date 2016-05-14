-module(server).
  -export([start/0, daemon/0]).
  start() ->
      spawn(server, daemon, []).
  daemon() ->
      receive
          {Pid, A, B} ->
              Pid ! A + B,
              daemon();
          {Pid, quit} ->
              Pid ! ok
      end.