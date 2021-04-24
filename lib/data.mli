
type ('symbol, 'state) transition = 
  'symbol -> 'state -> ('symbol * 'state * Tape.shiftSide) option
(**
This is a function that represent a transition of a turing machine. 

The transition function can be not defined to all pairs or state-symbol,
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

type ('symbol, 'state) turingMachineID = 'symbol Tape.tape * 'state
(**
This type give the instantaneous description (ID) 
of a turing machine.

The first element is a tape, which include the symbol in head.
The last element is the internal state in a given moment.
 *)

