:- object(buffer, instantiates(buffer)).

	:- public(buf/1).
	:- dynamic(buf/1).
	buf(_{}).

	:- public([clean/0, set/1, set/2, get/2, match/1, match/2, match/3, multi/1, add2lst/2]).
	:- public [g/2, s/1, s/2, m/1, m/2, m/3]. %shortcuts

	clean :- ::retractall(buf(_)), ::assertz(buf(_{})).
	set(KV) :- ::buf(B), put_dict(KV, B, NewBuf), ::retractall(buf(_)), ::assertz(buf(NewBuf)).
	set(K,V) :- set([K=V]).
	get(K,V) :- ::buf(B), get_dict(K, B, V).

	match(KV) :- ::buf(B), KV :< B.
	match(K, V) :- match([K=V]).
	match(K, Op, V) :- get(K, Curr), Cmp =.. [ Op, Curr, V], user::call(Cmp).

	s(KV) :- set(KV).
	s(K,V) :- set(K,V).
	g(K,V) :- get(K,V).
	m(KV) :- match(KV).
	m(K,V) :- match(K,V).
	m(K, Op, V) :- match(K, Op, V).

	multi([]).
	multi([[K,Op,V]|T]) :- match(K, Op, V), multi(T).

	add2lst(LstKey, Val) :- ( ::get(LstKey, Lst) -> ::set(LstKey, [Val | Lst]); ::set(LstKey, [Val]) ).

	init :- true.

:- end_object.

:- object(g, instantiates(buffer)).
:- end_object.

:- object(w, instantiates(buffer)).
:- end_object.

