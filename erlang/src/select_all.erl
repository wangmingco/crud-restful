-module(select_all).

-export([init/2]).
-export([content_types_provided/2]).
-export([hello_to_html/2]).
-export([hello_to_json/2]).
-export([hello_to_text/2]).

init(Req, Opts) ->
	{cowboy_rest, Req, Opts}.

content_types_provided(Req, State) ->
	{[
		{<<"text/html">>, hello_to_html},
		{<<"application/json">>, hello_to_json},
		{<<"text/plain">>, hello_to_text}
	], Req, State}.


hello_to_html(Req, State) ->

	{ok, Pid} = mysql:start_link([{host, "localhost"}, 
								  {user, "root"},
								  {password, "root"}, 
								  {database, "helloworld"}
								  ]
								),
	
	%% Select
	{ok, ColumnNames, Rows} = mysql:query(Pid, <<"SELECT * FROM helloworld">>),

	io:format("ColumnNames: ~p~n", [ColumnNames]),
	io:format("Rows: ~p~n", [Rows]),
	
	mysql:stop(Pid),

	Body = <<"处理完成">>,
	{Body, Req, State}.

hello_to_json(Req, State) ->
	Body = <<"welcome application/json">>,
	{Body, Req, State}.

hello_to_text(Req, State) ->
	{<<"welcome text/plain">>, Req, State}.