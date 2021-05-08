open TuringMachine

type symbol = int
type state = int * string

let repeat_0_1: (symbol, state) Data.transition = 
  fun _ state -> match state with
  | (10, _) -> None
  | (acc, "Write0") -> Some (0, (acc + 1, "Write1"), Tape.Right)
  | (acc, "Write1") -> Some (1, (acc + 1, "Write0"), Tape.Right)
  | _ -> None
;;

let machine: (symbol, state) Data.turingMachine =
  let blank = 0 in
  let input = [] in
  let init_state = (0, "Write0") in
  let end_states = [] in
  let transition = repeat_0_1 in
  (blank, input, init_state, end_states, transition)
;;

