# Turing Machine Visualizer

![Image showing the execution](running_write_msg_machine.gif)

To visualize turing machines there the app turingmachine.io, on it, to create machines you should use a `yml` file, which is'nt a programming language. So, I created this app to visualize turing machines, which are created in a programming language, this give to you the power to do whathaver machine you want.

Now, the machines is visualized throught the terminal, but, it can be extend to others interfaces. Besides, the language that is used to program is Ocaml, but I have the goal to execute in javascript using [js_of_ocaml](https://ocsigen.org/js_of_ocaml/3.1.0/manual/overview) module, feels free to make these features.  

# Usage

This package use [dune](https://dune.readthedocs.io/en/stable/) as build system. So before run the app, install dune and the dependecies using:

```
$ opam install .
```

Now, build the package and run it:

```
$ dune build

$ dune exec turing
```

# Documentation

.

