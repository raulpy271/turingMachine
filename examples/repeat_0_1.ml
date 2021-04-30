open TuringMachine

let repeat_0_1: (int, string) Data.transition = 
  fun _ state -> match state with
  | "Write0" -> Some (0, "Write1", Tape.Right)
  | "Write1" -> Some (1, "Write0", Tape.Right)
  | _ -> None
;;

let machine: (int, string) Data.turingMachine =
  let blank = 0 in
  let input = [] in
  let end_states = [] in
  let init_state = "Write0" in
  let transition = repeat_0_1 in
  (blank, input, init_state, end_states, transition)
;;

