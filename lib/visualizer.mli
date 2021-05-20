
type 'symbol string_of = 'symbol -> string
(**
This is the signature of functions that convert elements of a tape to string.
 *)

val string_of_tape : 
  'symbol ->  'symbol string_of -> 'symbol Data.tape -> string
(**
This function will convert a tape to string. It will be usefull to show a tape in terminal.

@param empty This first parameter is the empty symbol of the tape.

@param string_of_symbol This is a function that will convert the elements of the tape to string.

@param tape This is the tape.
 *)


