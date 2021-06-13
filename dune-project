(lang dune 2.5)
(name turingMachine)
(version 0.0.1)

(generate_opam_files true)

(license MIT)
(authors "raulpy271, raulrufino0@gmail.com")
(maintainers "raulpy271, raulrufino0@gmail.com")
(source (github "raulpy271/turingMachine"))
(homepage "https://github.com/raulpy271/turingMachine")

(package
  (name turingMachine)
  (synopsis "The library that export function and datatypes to show turing machine working")
  (depends ocaml dune unix terminal_size))

