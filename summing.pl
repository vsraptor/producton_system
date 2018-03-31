reset_sum(N1, N2) :-
	g::clean, w::clean, g::set(goal, init),
	length(N1,L), L1 is L - 1, w::set(_{col: L1, num1: N1, num2: N2, carry: 0}).
reset_sum :- reset_sum([1,3], [4,9]).

:- reset_sum.

:-	rule g::m(goal, init) ==> g::s(goal, sum).

:- rule g::m(goal, sum) and w::m(col, >=, 0) ==>
	w::g(col, Col), w::g(carry, Carry),
	w::g(num1, L1), w::g(num2, L2), nth0(Col,L1,V1), nth0(Col,L2,V2),
	Sum is V1 + V2 + Carry, Digit is Sum mod 10,
	C1 is Col - 1, NewCarry is Sum div 10,
	w::s(_{ col: C1, carry: NewCarry }), w::add2lst(sum, Digit).

:- rule w::m(col, -1) ==>
	w::g(num1, L1), w::g(num2, L2), w::g(sum, LSum),
	atomic_list_concat(L1,'', N1), atomic_list_concat(L2,'', N2), atomic_list_concat(LSum,'', Sum),
	format('~w + ~w = ~w', [N1, N2, Sum]), g::s(goal, done).

