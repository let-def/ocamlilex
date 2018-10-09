let () =
  for i = 1 to Array.length Sys.argv - 1 do
    let input = Sys.argv.(i) in
    let buf = Lexing.from_string input in
    Lexer.observed_pos := 0;
    let result =
      match Lexer.test buf with
      | result -> string_of_bool result
      | exception exn -> Printexc.to_string exn
    in
    let curr = buf.Lexing.lex_curr_pos in
    let observed =
      (* Lexer.observed_pos is updated only when backtracking *)
      max !Lexer.observed_pos curr
    in
    Printf.printf "input:%S\n  length:%d result:%s buffer_pos:%d observed_pos:%d\n%!"
      input (String.length input) result curr observed
  done
