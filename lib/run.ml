
let step id machine =
  let (blank, _, _, end_states, transition) = machine in
  let (current_tape, current_state) = id in
  let head_value = Tape.read_head current_tape in
  match (transition head_value current_state) with 
  | Some (new_symbol, new_state, side) ->
      let is_end_state = List.mem new_state end_states in
      if not is_end_state then 
        let new_tape = current_tape
          |> Tape.write_head new_symbol
          |> Tape.shift_tape side blank in
        Some (new_tape, new_state)
      else None
  | None -> None
;;

let id_of_machine machine = 
  let (blank, input, init_state, _, _) = machine in
  let tape = Tape.tape_of_list blank input in
  (tape, init_state)
;;

