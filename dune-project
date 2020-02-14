(lang dune 1.11)
(generate_opam_files true)

(name ocamlilex)
(source (github let-def/ocamlilex))
(license LGPL)
(authors "Frédéric Bour, original ocamllex is from the OCaml authors")
(maintainers "fred@tarides.com")

(package
 (name ocamlilex)
 (synopsis "OCaml Incremental Lex")
 (description "A fork of OCamllex that can tell the last observed position in the input stream"))
