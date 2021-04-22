
let putLastInFront list =
  let rec putLastInFrontTailRecursive list newList = match list with
    | [] -> Failure "List is empty" |> raise
    | [last] -> last :: newList
    | h :: t -> putLastInFrontTailRecursive t (newList @ [h])
  in putLastInFrontTailRecursive list []
;;

