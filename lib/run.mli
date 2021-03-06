
val read_head : 'symbol Data.tape -> 'symbol

val write_head : 'symbol -> 'symbol Data.tape -> 'symbol Data.tape

val shift_tape : Data.shift_side -> 'symbol -> 'symbol Data.tape -> 'symbol Data.tape
(**
This function move the head of the automata to left or right.

@param side The side which it'll move.

@param empty The blank symbol

@param tp The tape
*)

val tape_of_list : 'symbol -> 'symbol list -> 'symbol Data.tape
(**
Get a list and a element to represent an empty symbol,
and create a tape from these arguments.
*)

val step : ('symbol, 'state) Data.turingMachineID ->
  ('symbol, 'state) Data.turingMachine ->
  ( 
    ('symbol, 'state) Data.turingMachineID option ->
    ('symbol, 'state) Data.turingMachine -> unit
  ) ->
  ('symbol, 'state) Data.turingMachineID option
(**
This function aims to represent the behavior of a given machine. So, it gives each step of the machine.

@param id This is the instantaneous description of a machine.

@param machine This is the machine which the id represents.

@param f This is a function that will be called in each call of [ step ], it can be used to show the machine in terminal in every step of the execution.

@return The return is the next ID of the machine, this ID is given by the transition function. Besides, the returned value is inside a [ option ] because when the machine halt in the next step, it return [ None ].
*)

val id_of_machine : ('symbol, 'state) Data.turingMachine ->
  ('symbol, 'state) Data.turingMachineID
(**
This function create the initial ID of a given machine
*)

val run_machine_with : 
  f:(('symbol, 'state) Data.turingMachineID option ->
    ('symbol, 'state) Data.turingMachine -> unit) ->
  machine:(('symbol, 'state) Data.turingMachine) -> 
  unit
(**
This function run the machine until it halt. In each step of the executation,
it's call the function [ f ] with the ID and the machine.
An example of usage, is to print each step of the executation, which is implemented in {{:https://github.com/raulpy271/turingMachine/blob/main/bin/turingMachineCli.ml} turingMachineCli} module.

@param f This function do something in each step of the machine, It's should return an [ unit ] value, and the ID is inside an [ option ] type, so, if the value is [ None ] the machine has halted.

@param machine The machine to be run.
*)

