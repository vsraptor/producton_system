# producton_system
Simple Production System in less than 150 lines of code (UNFINISHED).


Using : SWI-Prolog and logtalk OOP

```prolog

$ swipl
Welcome to SWI-Prolog (threaded, 64 bits, version 7.6.4)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit http://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

?- [init].
% [ /my/dev/github/producton_system/buffer.lgt loaded ]
% (0 warnings)
% [ /my/dev/github/producton_system/rules.lgt loaded ]
% (0 warnings)
% [ /my/dev/github/producton_system/env.lgt loaded ]
% (0 warnings)
true.

% simple rules to sum two numbers
?- [summing].
true.

% GOAL buffer content
?- g::buf(G).
G = _506{goal:init}.

%WORK buffer content
?- w::buf(W).
W = _506{carry:0, col:1, num1:[1, 3], num2:[4, 9]}.

% run the system  for four steps
?- rules::run(env,4).
13 + 49 = 62
true.

?- g::buf(G).
G = _470{goal:done}.

?- w::buf(W).
W = _470{carry:0, col: -1, num1:[1, 3], num2:[4, 9], sum:[6, 2]}.




?- rules::list.

1:0.10| g::m(goal, init) :-
 g::s(goal, sum).
2:0.21| g::m(goal, sum)and w::m(col, >=, 0) :-
 w::g(col, A),
 w::g(carry, F),
 w::g(num1, B),
 w::g(num2, C),
 nth0(A, B, D),
 nth0(A, C, E),
 G is D+E+F,
 J is G mod 10,
 H is A+ -1,
 I is G div 10,
 w::s(_{carry:I, col:H}),
 w::add2lst(sum, J).
3:0.12| w::m(col, -1) :-
 w::g(num1, A),
 w::g(num2, B),
 w::g(sum, C),
 atomic_list_concat(A, '', D),
 atomic_list_concat(B, '', E),
 atomic_list_concat(C, '', F),
 format('~w + ~w = ~w', [D, E, F]),
 g::s(goal, done).
true.



% rules are split in cond(COND, Q-value, Index) and act(Index) clause/facts.
% ... where Q-value comes from Reinforcment learning.
?- listing(cond).
:- dynamic cond/3.

cond(g::m(goal, init), 0.1, 1).
cond(g::m(goal, sum)and w::m(col, >=, 0), 0.20791000000000004, 2).
cond(w::m(col, -1), 0.11871190000000001, 3).

true.

?- listing(act).
:- dynamic act/1.

act(1) :-
 g::s(goal, sum).
act(2) :-
 w::g(col, A),
 w::g(carry, F),
 w::g(num1, B),
 w::g(num2, C),
 nth0(A, B, D),
 nth0(A, C, E),
 G is D+E+F,
 J is G mod 10,
 H is A+ -1,
 I is G div 10,
 w::s(_{carry:I, col:H}),
 w::add2lst(sum, J).
act(3) :-
 w::g(num1, A),
 w::g(num2, B),
 w::g(sum, C),
 atomic_list_concat(A, '', D),
 atomic_list_concat(B, '', E),
 atomic_list_concat(C, '', F),
 format('~w + ~w = ~w', [D, E, F]),
 g::s(goal, done).

true.

?- 

```