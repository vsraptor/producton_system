
say(S,P) :- string_concat(S, '~n', S1), format(S1,P).
say(S)   :- say(S,[]).

