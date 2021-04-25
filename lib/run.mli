
val step : ('symbol, 'state) Data.turingMachineID ->
  ('symbol, 'state) Data.turingMachine ->
  ('symbol, 'state) Data.turingMachineID option
(**
This function aims to represent the behavior of a given machine. So, it gives each step of the machine.

@param id This is the instantaneous description of a machine.

@param machine This is the machine which the id represents.

@return The return is the next ID of the machine, this ID is given by the transition function. Besides, the returned value is inside a [ option ] because when the given machine-ID is in a halt state, it return [ None ].
*)

