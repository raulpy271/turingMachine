
type 'symbol 'state transition = 
  'state * 'symbol -> ('state * 'symbol * shiftSide) option
(**
 * This is a function that represent a transition of a turing machine. 
 *
 * The transition function can be not defined to all pairs or state-symbol,
 * to represent it, is used the type 'a option.
 * So, this function can return None,
 * to say that the given state and symbol isn't accepted. 
 * When it happens the machine halts.
 *)

