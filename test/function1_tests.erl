-module(function1_tests).

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").

identity(Thing) -> Thing.
add_two(Number) -> Number + 2.
multiply_by_two(Number) -> Number * 2.

compose_identity_with_identity_test() ->
  Thing = "Something",
  Composed = function1:compose(fun identity/1, fun identity/1),
  ?assertEqual(Thing, Composed(Thing)).

second_function_is_the_inner_first_is_the_outer_test() ->
  Composed = function1:compose(fun multiply_by_two/1, fun add_two/1),
  ?assertEqual(10, Composed(3)).

compose_identity_list_test() ->
  Thing = "Something",
  Identities = [fun identity/1, fun identity/1, fun identity/1],
  Composed = function1:compose_all(Identities),
  ?assertEqual(Thing, Composed(Thing)).

composed_list_preserves_order_test() ->
  AdditionsAndMultiplications = [fun add_two/1, fun multiply_by_two/1, fun add_two/1, fun multiply_by_two/1],
  Composed = function1:compose_all(AdditionsAndMultiplications),
  ?assertEqual(24, Composed(3)).