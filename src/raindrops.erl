-module(raindrops).

-export([convert/1, test_version/0]).

-define(Quiet, "").
-define(Pling, "Pling").
-define(Plang, "Plang").
-define(Plong, "Plong").

convert(Number) -> extract_sound_for_number(function1:compose_all(sounds()), Number).

extract_sound_for_number(Sounds, Number) ->
  Extract = fun({_, Sound}) -> Sound end,
  Extract(Sounds(Number)).

sounds() -> [quiet(), factor_sound(3, ?Pling), factor_sound(5, ?Plang), factor_sound(7, ?Plong), default()].

quiet() -> fun(Number) -> {Number, ?Quiet} end.

default() ->
  sound(
    fun(Number, Sound) ->
      case Sound of
        ?Quiet -> integer_to_list(Number);
        _ -> Sound
      end
    end
  ).

factor_sound(Factor, NewSound) ->
  sound(
    fun(Number, Sound) ->
      case divisible_by(Number, Factor) of
        true -> string:concat(Sound, NewSound);
        _ -> Sound
      end
    end
  ).

divisible_by(Number, Factor) -> Number rem Factor =:= 0.

sound(SoundRule) -> fun({Number, Sound}) -> {Number, SoundRule(Number, Sound)} end.

test_version() -> 1.
