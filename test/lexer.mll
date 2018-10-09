{
  [@@@ocaml.warning "-39"]
}

rule test = parse
| 'a' 'b'* 'c' { true }
| 'a' { false }
| _ { failwith "Unrecognized input" }
