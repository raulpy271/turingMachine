
type 'symbol tape = 'symbol list * 'symbol * 'symbol list;;

type shift_side = Left | Right;;

let left_swift empty tp = match tp with
  | ([], head, rightSide) -> ([], empty, head :: rightSide)
  | (leftSide, head, rightSide) -> 
      let leftSwiftWithLastInFront = Utils.putLastInFront leftSide in
      let lastOfLeftSide = List.hd leftSwiftWithLastInFront in 
      let newLeftSide = List.tl leftSwiftWithLastInFront in
      (newLeftSide, lastOfLeftSide, head :: rightSide)
;;

let right_shift empty tp = match tp with
  | (leftSide, head, []) -> (leftSide @ [head], empty, [])
  | (leftSide, head, rightSide) -> 
      let firstOfRightSide = List.hd rightSide in 
      let newRightSide = List.tl rightSide in
      (leftSide @ [head], firstOfRightSide, newRightSide)
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

