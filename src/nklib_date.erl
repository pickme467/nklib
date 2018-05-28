%% -------------------------------------------------------------------
%%
%% Copyright (c) 2018 Carlos Gonzalez Florido.  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -------------------------------------------------------------------

%% @doc NetComposer Standard Library
-module(nklib_date).
-author('Carlos Gonzalez <carlosj.gf@gmail.com>').
-export([to_3339/1]).

-include("nklib.hrl").


%% ===================================================================
%% Public
%% ===================================================================

%% @doc Normalizes any incoming value (see tests)
to_3339(Val) when is_integer(Val) ->
    Precision = case byte_size(integer_to_binary(abs(Val))) of
        Size when Size =< 10 ->
            0;
        Size when Size >= 11, Size =< 13 ->
            3;
        _ ->
            6
    end,
    D = jam:from_epoch(Val, Precision),
    {ok, list_to_binary(jam_iso8601:to_string(D))};

to_3339(Val) when is_binary(Val); is_list(Val) ->
    case catch jam_iso8601:parse(re_cache(), Val) of
        undefined ->
            error;
        {'EXIT, _'} ->
            error;
        List ->
            D = jam:normalize(jam:compile(List)),
            {ok, list_to_binary(jam_iso8601:to_string(D))}
    end.



%% Generated from jam_iso8601:init().
re_cache() ->
    [{time,
{re_pattern,14,0,0,
<<69,82,67,80,158,1,0,0,16,0,0,0,1,0,0,0,255,255,255,
255,255,255,255,255,0,0,0,0,0,0,14,0,3,0,64,0,13,0,8,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
9,70,82,65,67,84,73,79,78,65,76,0,0,1,72,79,85,82,0,
73,79,78,65,76,0,0,4,77,73,78,85,84,69,0,78,65,76,0,
0,6,83,69,67,79,78,68,0,78,65,76,0,0,3,84,83,69,80,0,
73,79,78,65,76,0,0,10,84,90,0,84,72,0,79,78,65,76,0,
0,12,84,90,72,0,78,68,0,78,65,76,0,0,14,84,90,77,0,0,
73,79,78,65,76,0,131,0,228,27,94,9,44,84,133,0,9,0,1,
93,0,2,7,120,0,9,146,133,0,27,0,2,133,0,7,0,3,44,58,
120,0,7,133,0,9,0,4,93,0,2,7,120,0,9,120,0,27,146,
133,0,20,0,5,113,0,3,133,0,9,0,6,93,0,2,7,120,0,9,
120,0,20,146,133,0,56,0,7,133,0,38,0,8,110,0,0,0,0,0,
80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,120,0,38,133,0,7,0,9,95,7,120,0,7,120,0,56,146,133,
0,86,0,10,133,0,7,0,11,29,90,119,0,71,133,0,42,0,12,
110,0,0,0,0,0,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,93,0,2,7,120,0,42,146,133,0,19,0,13,
44,58,133,0,9,0,14,93,0,2,7,120,0,9,120,0,19,120,0,
78,120,0,86,85,9,25,120,0,228,0,133,0,38,0,14,110,0,
0,0,0,0,80,0,0>>}},
{ordinal_date,
{re_pattern,3,0,0,
<<69,82,67,80,132,0,0,0,16,0,0,0,1,0,0,0,255,255,255,
255,255,255,255,255,0,0,0,0,0,0,3,0,0,0,64,0,7,0,3,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,
68,65,89,0,0,0,2,68,83,69,80,0,0,1,89,69,65,82,0,131,
0,43,27,94,9,133,0,9,0,1,93,0,4,7,120,0,9,133,0,7,0,
2,44,45,120,0,7,133,0,9,0,3,93,0,3,7,120,0,9,85,9,25,
120,0,43,0>>}},
{calendar_date,
{re_pattern,6,0,0,
<<69,82,67,80,190,0,0,0,16,0,0,0,1,0,0,0,255,255,255,
255,255,255,255,255,0,0,0,0,0,0,6,0,3,0,64,0,8,0,4,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,
68,65,89,0,0,0,0,3,68,83,69,80,0,0,0,4,77,79,78,84,
72,0,0,1,89,69,65,82,0,0,131,0,76,27,94,9,133,0,9,0,
1,93,0,4,7,120,0,9,146,133,0,27,0,2,133,0,7,0,3,44,
45,120,0,7,133,0,9,0,4,93,0,2,7,120,0,9,120,0,27,146,
133,0,20,0,5,113,0,3,133,0,9,0,6,93,0,2,7,120,0,9,
120,0,20,85,9,25,120,0,76,0,0,0,0,0,112,0,0,0,0,0,0,
0,0,0>>}},
{week_date,
{re_pattern,7,0,0,
<<69,82,67,80,192,0,0,0,16,0,0,0,65,0,0,0,255,255,255,
255,255,255,255,255,0,0,87,0,0,0,7,0,3,0,64,0,7,0,4,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
7,68,65,89,0,0,0,3,68,83,69,80,0,0,5,87,69,69,75,0,0,
1,89,69,65,82,0,131,0,82,27,94,9,133,0,9,0,1,93,0,4,
7,120,0,9,133,0,37,0,2,133,0,7,0,3,44,45,120,0,7,133,
0,19,0,4,29,87,133,0,9,0,5,93,0,2,7,120,0,9,120,0,19,
120,0,37,146,133,0,17,0,6,113,0,3,133,0,6,0,7,7,120,
0,6,120,0,17,85,9,25,120,0,82,0,0,0,112,0,0,0,0,0,0,
0,0,0,0,0>>}},
{ordinal_datetime,
{re_pattern,17,0,0,
<<69,82,67,80,12,2,0,0,16,0,0,0,1,0,0,0,255,255,255,
255,255,255,255,255,0,0,0,0,0,0,17,0,6,0,64,0,13,0,
11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,3,68,65,89,0,0,73,79,78,65,76,0,0,2,68,83,69,80,0,
73,79,78,65,76,0,0,12,70,82,65,67,84,73,79,78,65,76,
0,0,4,72,79,85,82,0,73,79,78,65,76,0,0,7,77,73,78,85,
84,69,0,78,65,76,0,0,9,83,69,67,79,78,68,0,78,65,76,
0,0,6,84,83,69,80,0,73,79,78,65,76,0,0,13,84,90,0,82,
0,73,79,78,65,76,0,0,15,84,90,72,0,0,73,79,78,65,76,
0,0,17,84,90,77,0,0,73,79,78,65,76,0,0,1,89,69,65,82,
0,73,79,78,65,76,0,131,1,43,27,85,9,27,94,9,133,0,9,
0,1,93,0,4,7,120,0,9,133,0,7,0,2,44,45,120,0,7,133,0,
9,0,3,93,0,3,7,120,0,9,110,0,0,0,0,1,0,0,0,0,0,16,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,133,0,9,0,4,
93,0,2,7,120,0,9,146,133,0,27,0,5,133,0,7,0,6,44,58,
120,0,7,133,0,9,0,7,93,0,2,7,120,0,9,120,0,27,146,
133,0,20,0,8,113,0,6,133,0,9,0,9,93,0,2,7,120,0,9,
120,0,20,146,133,0,56,0,10,133,0,38,0,11,110,0,0,0,0,
0,80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,120,0,38,133,0,7,0,12,95,7,120,0,7,120,0,56,146,
133,0,86,0,13,133,0,7,0,14,29,90,119,0,71,133,0,42,0,
15,110,0,0,0,0,0,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,93,0,2,7,120,0,42,146,133,0,19,0,
16,44,58,133,0,9,0,17,93,0,2,7,120,0,9,120,0,19,120,
0,78,120,0,86,85,9,25,85,9,25,120,1,43,0,2,7,120,0,
42,146,133,0,19,0,19,44,58,133>>}},
{week_datetime,
{re_pattern,21,0,0,
<<69,82,67,80,77,2,0,0,16,0,0,0,65,0,0,0,255,255,255,
255,255,255,255,255,0,0,87,0,0,0,21,0,10,0,64,0,13,0,
12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,7,68,65,89,0,0,73,79,78,65,76,0,0,3,68,83,69,80,0,
73,79,78,65,76,0,0,16,70,82,65,67,84,73,79,78,65,76,
0,0,8,72,79,85,82,0,73,79,78,65,76,0,0,11,77,73,78,
85,84,69,0,78,65,76,0,0,13,83,69,67,79,78,68,0,78,65,
76,0,0,10,84,83,69,80,0,73,79,78,65,76,0,0,17,84,90,
0,75,0,73,79,78,65,76,0,0,19,84,90,72,0,0,73,79,78,
65,76,0,0,21,84,90,77,0,0,73,79,78,65,76,0,0,5,87,69,
69,75,0,73,79,78,65,76,0,0,1,89,69,65,82,0,73,79,78,
65,76,0,131,1,81,27,85,9,27,94,9,133,0,9,0,1,93,0,4,
7,120,0,9,133,0,37,0,2,133,0,7,0,3,44,45,120,0,7,133,
0,19,0,4,29,87,133,0,9,0,5,93,0,2,7,120,0,9,120,0,19,
120,0,37,133,0,17,0,6,113,0,3,133,0,6,0,7,7,120,0,6,
120,0,17,110,0,0,0,0,1,0,0,0,0,0,16,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,133,0,9,0,8,93,0,2,7,120,0,
9,146,133,0,27,0,9,133,0,7,0,10,44,58,120,0,7,133,0,
9,0,11,93,0,2,7,120,0,9,120,0,27,146,133,0,20,0,12,
113,0,10,133,0,9,0,13,93,0,2,7,120,0,9,120,0,20,146,
133,0,56,0,14,133,0,38,0,15,110,0,0,0,0,0,80,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,120,0,38,
133,0,7,0,16,95,7,120,0,7,120,0,56,146,133,0,86,0,17,
133,0,7,0,18,29,90,119,0,71,133,0,42,0,19,110,0,0,0,
0,0,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,93,0,2,7,120,0,42,146,133,0,19,0,20,44,58,133,
0,9,0,21,93,0,2,7,120,0,9,120,0,19,120,0,78,120,0,86,
85,9,25,85,9,25,120,1,81,0,0,0,0,0,0,0,0,3,0,0,0,144,
3,0,0,0,0,0,0,0,0,0,0,89,3,0,0,0>>}},
{calendar_datetime,
{re_pattern,20,0,0,
<<69,82,67,80,70,2,0,0,16,0,0,0,1,0,0,0,255,255,255,
255,255,255,255,255,0,0,0,0,0,0,20,0,9,0,64,0,13,0,
12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,6,68,65,89,0,0,73,79,78,65,76,0,0,3,68,83,69,80,0,
73,79,78,65,76,0,0,15,70,82,65,67,84,73,79,78,65,76,
0,0,7,72,79,85,82,0,0,79,78,65,76,0,0,10,77,73,78,85,
84,69,0,78,65,76,0,0,4,77,79,78,84,72,0,79,78,65,76,
0,0,12,83,69,67,79,78,68,0,78,65,76,0,0,9,84,83,69,
80,0,73,79,78,65,76,0,0,16,84,90,0,82,0,73,79,78,65,
76,0,0,18,84,90,72,0,0,73,79,78,65,76,0,0,20,84,90,
77,0,0,73,79,78,65,76,0,0,1,89,69,65,82,0,73,79,78,
65,76,0,131,1,74,27,85,9,27,94,9,133,0,9,0,1,93,0,4,
7,120,0,9,133,0,27,0,2,133,0,7,0,3,44,45,120,0,7,133,
0,9,0,4,93,0,2,7,120,0,9,120,0,27,133,0,20,0,5,113,0,
3,133,0,9,0,6,93,0,2,7,120,0,9,120,0,20,110,0,0,0,0,
1,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,133,0,9,0,7,93,0,2,7,120,0,9,146,133,0,27,0,8,
133,0,7,0,9,44,58,120,0,7,133,0,9,0,10,93,0,2,7,120,
0,9,120,0,27,146,133,0,20,0,11,113,0,9,133,0,9,0,12,
93,0,2,7,120,0,9,120,0,20,146,133,0,56,0,13,133,0,38,
0,14,110,0,0,0,0,0,80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,120,0,38,133,0,7,0,15,95,7,120,
0,7,120,0,56,146,133,0,86,0,16,133,0,7,0,17,29,90,
119,0,71,133,0,42,0,18,110,0,0,0,0,0,40,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,93,0,2,7,120,
0,42,146,133,0,19,0,19,44,58,133,0,9,0,20,93,0,2,7,
120,0,9,120,0,19,120,0,78,120,0,86,85,9,25,85,9,25,
120,1,74,0,85,9,25,120,1,81,0,0,0,0,0,0,0,0,3,0,0,0,
144,3,0,0,0,0,0,0,0,0>>}},
{timezone,
{re_pattern,5,0,0,
<<69,82,67,80,184,0,0,0,16,0,0,0,1,0,0,0,255,255,255,
255,255,255,255,255,0,0,0,0,0,0,5,0,0,0,64,0,6,0,3,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
1,84,90,0,0,0,3,84,90,72,0,0,5,84,90,77,0,131,0,98,
27,94,9,133,0,86,0,1,133,0,7,0,2,29,90,119,0,71,133,
0,42,0,3,110,0,0,0,0,0,40,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,93,0,2,7,120,0,42,146,133,
0,19,0,4,44,58,133,0,9,0,5,93,0,2,7,120,0,9,120,0,
19,120,0,78,120,0,86,85,9,25,120,0,98,0>>}}].



%% ===================================================================
%% EUnit tests
%% ===================================================================

%-define(TEST, 1).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").


dates_test() ->
    G1971 = nklib_util:gmt_to_timestamp({{1971, 1, 1}, {0,0,0}}),
    G1980 = nklib_util:gmt_to_timestamp({{1980, 1, 1}, {0,0,0}}),
    G2018 = nklib_util:gmt_to_timestamp({{2018, 1, 1}, {0,0,0}}),
    G2100 = nklib_util:gmt_to_timestamp({{2100, 1, 1}, {0,0,0}}),

    {ok, <<"1971-01-01T00:00:00Z">>} = to_3339(G1971),
    {ok, <<"1971-01-01T00:00:00.001Z">>} = to_3339(G1971 * 1000 + 1),
    {ok, <<"1971-01-01T00:00:00.000001Z">>} = to_3339(G1971 * 1000 * 1000 + 1),

    {ok, <<"1980-01-01T00:00:00Z">>} = to_3339(G1980),
    {ok, <<"1980-01-01T00:00:00.001Z">>} = to_3339(G1980 * 1000 + 1),
    {ok, <<"1980-01-01T00:00:00.000001Z">>} = to_3339(G1980 * 1000 * 1000 + 1),

    {ok, <<"2018-01-01T00:00:00Z">>} = to_3339(G2018),
    {ok, <<"2018-01-01T00:00:00.001Z">>} = to_3339(G2018 * 1000 +  1),
    {ok, <<"2018-01-01T00:00:00.000001Z">>} = to_3339(G2018 * 1000 * 1000 + 1),

    {ok, <<"2100-01-01T00:00:00Z">>} = to_3339(G2100),
    {ok, <<"2100-01-01T00:00:00.001Z">>} = to_3339(G2100 * 1000 + 1),
    {ok, <<"2100-01-01T00:00:00.000001Z">>} = to_3339(G2100 * 1000 * 1000 + 1),

    {ok, <<"1980-01-01T00:00:00Z">>} = to_3339("1980-01-01T00:00:00Z"),
    {ok, <<"1980-01-01T00:00:00.001Z">>} = to_3339("1980-01-01T00:00:00.001Z"),
    {ok, <<"1980-01-01T00:00:00.000001Z">>} = to_3339("1980-01-01T00:00:00.000001Z"),
    ok.


-endif.




