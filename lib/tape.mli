
type 'symbol tape = 'symbol list * 'symbol * 'symbol list
(** 
 * Define a 3-tuple which represent a infinite tape.
 *
 * The first list represent the left side.
 * The second element represent the element of the head.
 * The third represent the right side.
 *
 * It's an infinite tape because the left and right side 
 * can grown as the user want, it's limited only because of the hardware.
 *)

type shiftSide = Left | Right

val shiftTape : shiftSide -> 'symbol -> 'symbol tape -> 'symbol tape
(**
 * This function move the head of the automata to left or right
 *)

val tape_of_list : 'symbol -> 'symbol list -> 'symbol tape
(**
 * Get a list and a element to represent an empty symbol,
 * and create a tape from these arguments.
 *)

val readHeadValue : 'symbol tape -> 'symbol

