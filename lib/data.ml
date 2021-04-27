
type ('symbol, 'state) transition = 
  'symbol -> 'state -> ('symbol * 'state * Tape.shift_side) option

type ('symbol, 'state) turingMachine = 
  'symbol * 'symbol list * 'state * 'state list * 
  ('symbol, 'state) transition

type ('symbol, 'state) turingMachineID = 'symbol Tape.tape * 'state

