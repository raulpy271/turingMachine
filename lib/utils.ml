
let put_last_in_front list =
  let rec put_last_in_front_tail_recursive list new_list = match list with
    | [] -> Failure "List is empty" |> raise
    | [last] -> last :: new_list
    | h :: t -> put_last_in_front_tail_recursive t (new_list @ [h])
  in put_last_in_front_tail_recursive list []
;;

let clear_term () = 
  match Sys.os_type with
  | "Unix" -> Sys.command "clear"
  | _ -> Sys.command "cls"
;; 

