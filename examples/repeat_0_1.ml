open TuringMachine

type symbol = int
type state = int * string


let repeat_0_1: (symbol, state) Data.transition = fun _ state -> 
  let stop_in = 10 in
  match state with
  | (acc, _) when acc == stop_in -> None
  | (acc, "Write0") -> Some (0, (acc + 1, "Write1"), Data.Right)
  | (acc, "Write1") -> Some (1, (acc + 1, "Write0"), Data.Right)
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


let string_of_state (acc, state) = 
  let acc_in_string = string_of_int acc in
  "(" ^ "Acumulator: " ^ acc_in_string ^ ", " ^ "doing: " ^ state ^ ")"
;;


let string_of_symbol = string_of_int;;


