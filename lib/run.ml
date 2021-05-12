
let read_head (_, head, _) = head;;

let write_head new_value (left, _, right) = 
  (left, new_value, right)
;;

let left_swift empty tp = match tp with
  | ([], head, right_side) -> ([], empty, head :: right_side)
  | (left_side, head, right_side) -> 
      let left_side_with_last_in_front = 
        Utils.put_last_in_front left_side in
      let last_of_left_side = List.hd left_side_with_last_in_front in 
      let new_left_side = List.tl left_side_with_last_in_front in
      (new_left_side, last_of_left_side, head :: right_side)
;;

let right_shift empty tp = match tp with
  | (left_side, head, []) -> (left_side @ [head], empty, [])
  | (left_side, head, right_side) -> 
      let first_of_right_side = List.hd right_side in 
      let new_right_side = List.tl right_side in
      (left_side @ [head], first_of_right_side, new_right_side)
;;

let shift_tape side empty tp = match side with
  | Data.Left -> left_swift empty tp
  | Data.Right -> right_shift empty tp
;;

let tape_of_list empty l = 
  match l with
  | [] -> ([], empty, [])
  | head :: tail -> ([], head, tail)
;;

let step id machine =
  let (blank, _, _, end_states, transition) = machine in
  let (current_tape, current_state) = id in
  let head_value = read_head current_tape in
  match (transition head_value current_state) with 
  | Some (new_symbol, new_state, side) ->
      let is_end_state = List.mem new_state end_states in
      if not is_end_state then 
        let new_tape = current_tape
          |> write_head new_symbol
          |> shift_tape side blank in
        Some (new_tape, new_state)
      else None
  | None -> None
;;

let id_of_machine machine = 
  let (blank, input, init_state, _, _) = machine in
  let tape = tape_of_list blank input in
  (tape, init_state)
;;

let run_machine_with ~f ~machine =
  let rec run_helper id =
    let _ = f (Some id) machine in
    match step id machine with
    | None -> f None machine
    | Some new_id -> run_helper new_id 
  in
  id_of_machine machine |> run_helper
;;

