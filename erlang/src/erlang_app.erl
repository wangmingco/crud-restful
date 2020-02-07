-module(erlang_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/helloworld", helloworld, []},
			{"/selectAll", select_all, []}
		]}
	]),
	{ok, _} = cowboy:start_clear(http, [{port, 8091}], #{
		env => #{dispatch => Dispatch}
	}),
	erlang_sup:start_link().

stop(_State) ->
	ok = cowboy:stop_listener(http).
