
type 'symbol tape = 'symbol list * 'symbol * 'symbol list;;

type shiftSide = Left | Right;;

let leftSwift 
  (empty : 'symbol) 
    (tp : 'symbol tape) = 
  match tp with
  | ([], head, rightSide) -> ([], empty, head :: rightSide)
  | (leftSide, head, rightSide) -> 
      let leftSwiftWithLastInFront = Utils.putLastInFront leftSide in
      let lastOfLeftSide = List.hd leftSwiftWithLastInFront in 
      let newLeftSide = List.tl leftSwiftWithLastInFront in
      (newLeftSide, lastOfLeftSide, head :: rightSide)
;;

let rightShift
  (empty : 'symbol) 
    (tp : 'symbol tape) =
  match tp with
  | (leftSide, head, []) -> (leftSide @ [head], empty, [])
  | (leftSide, head, rightSide) -> 
      let firstOfRightSide = List.hd rightSide in 
      let newRightSide = List.tl rightSide in
      (leftSide @ [head], firstOfRightSide, newRightSide)
;;

let shiftTape side empty (tp : 'symbol tape) = 
  match side with
  | Left -> leftSwift empty tp
  | Right -> rightShift empty tp
;;

let tape_of_list empty l : 'symbol tape = 
  match l with
  | [] -> ([], empty, [])
  | head :: tail -> ([], head, tail)
;;

let readHeadValue (tp : 'symbol tape) = 
  match tp with | (_, head, _) -> head
;;

