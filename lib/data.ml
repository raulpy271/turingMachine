
type 'symbol tape = 'symbol list * 'symbol * 'symbol list;;

type shift_side = Left | Right;;

type ('symbol, 'state) transition = 
  'symbol -> 'state -> ('symbol * 'state * shift_side) option

type ('symbol, 'state) turingMachine = 
  'symbol * 'symbol list * 'state * 'state list * 
  ('symbol, 'state) transition

type ('symbol, 'state) turingMachineID = 'symbol tape * 'state

