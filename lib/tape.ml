
type 'symbol tape = 'symbol list * 'symbol * 'symbol list;;

type shift_side = Left | Right;;

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
  | Left -> left_swift empty tp
  | Right -> right_shift empty tp
;;

let tape_of_list empty l : 'symbol tape = 
  match l with
  | [] -> ([], empty, [])
  | head :: tail -> ([], head, tail)
;;

let read_head (tp : 'symbol tape) = 
  match tp with | (_, head, _) -> head
;;

