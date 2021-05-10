
type 'symbol tape = 'symbol list * 'symbol * 'symbol list
(** 
Define a 3-tuple which represent a infinite tape.

The first list represent the left side.
The second element represent the element of the head.
The third represent the right side.

It's an infinite tape because the left and right side 
can grown as the user want, it's limited only because of the hardware.
*)

type shift_side = Left | Right

type ('symbol, 'state) transition = 
  'symbol -> 'state -> ('symbol * 'state * shift_side) option
(**
This is a function that represent a transition of a turing machine. 

The transition function can be not defined to all pairs of state-symbol,
to represent it, is used the type [ 'a option ].
So, this function can return [ None ],
to say that the given state and symbol isn't accepted. 
When it happens the machine halts.
*)

type ('symbol, 'state) turingMachine = 
  'symbol * 'symbol list * 'state * 'state list * 
  ('symbol, 'state) transition
(**
This 5-tuple represent a turing machine.

The first element is the blank symbol.
The second element is a list of input symbols.
The third is the initial state.
The fourth element is a list of final states.
The last element is the function of transition.
*)

type ('symbol, 'state) turingMachineID = 'symbol tape * 'state
(**
This type gives the instantaneous description (ID) 
of a turing machine.

The first element is a tape, which includes the symbol in the head.
The last element is the internal state in a given moment.
*)

