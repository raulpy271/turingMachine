
type 'symbol string_of = 'symbol -> string
(**
This is the signature of functions that convert elements of a tape to string.
 *)


val view_of_machine :
  ('symbol, 'state) Data.turingMachineID ->
  'symbol ->
  'symbol string_of ->
  'state string_of -> string
(**
This function will convert a tape to string. It will be usefull to show a tape in terminal.

@param id The ID of the machine in an instant.

@param empty this is the empty symbol.

@param string_of_symbol This is a function that will convert the elements of the tape to string.

@param string_of_state This is a function that will convert a state to a string.

@return The string representing the machine, this string will be printed in the screen.
 *)


