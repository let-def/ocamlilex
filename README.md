This version of OCamllex lets you access the latest character observed by the
lexer before backtracking.

It works only in ml output mode (with `-ml`) and store this position in the
`observed_pos` reference.

The position is changed only if backtracking occurred.

## Usage

1) compile the lexer with `-ml`:

```shell
$ ocamlilex -ml lexer.mll
```

2) before lexing, reset the `observed_pos` variable:
```ocaml
Lexer.observed_pos := 0`
```

3) Call the lexing function as usual:
```ocaml
let result = Lexer.entry_point lexbuf
```

4) The last observed character in the stream is:
```ocaml
let last_pos = max !Lexer.observed_pos lexbuf.Lexing.lex_curr_pos
```

If backtracking was used, `Lexer.observed_pos` has been set.
Otherwise, the current lexer position is the last one that was observed.

5) The lexbuf only stores positions relative to the current buffer (which acts
as a window over a streamed input).
To compute the absolute position, add `lexbuf.Lexing.lex_abs_pos`:

```
let observed_pos = lexbuf.Lexing.lex_abs_pos + last_pos
```

## Why?

This information is necessary if one wants to safely incrementalize an OCamllex
lexer.

If no side-effects are used in the semantic actions, the lexer should be a
deterministic function from the characters ranging from `lex_abs_pos +
lex_start_pos` to `observed_pos`.

Thus, if this range did not change in the input, it is not necessary to relex
it.
