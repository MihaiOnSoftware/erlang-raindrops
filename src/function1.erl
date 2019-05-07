-module(function1).

-export([compose/2, compose_all/1]).

compose_all([Head | Functions]) -> lists:foldl(fun compose/2, Head, Functions).
compose(Outer, Inner) -> fun(Argument) -> Outer(Inner(Argument)) end.