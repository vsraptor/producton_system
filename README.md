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

?- [summing].
true.

?- g::buf(G).
G = _506{goal:init}.

?- w::buf(W).
W = _506{carry:0, col:1, num1:[1, 3], num2:[4, 9]}.

?- rules::run(env,4).
13 + 49 = 62
true.

?- g::buf(G).
G = _470{goal:done}.

?- w::buf(W).
W = _470{carry:0, col: -1, num1:[1, 3], num2:[4, 9], sum:[6, 2]}.

?- 

```