
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


let is_even num = num mod 2 == 0;;


let fill_list_in_right list_to_fill final_len empty_symbol = 
  let len_of_list_to_fill = List.length list_to_fill in
  if final_len > len_of_list_to_fill
  then
    let list_with_empty_symbols = 
      List.init (final_len - len_of_list_to_fill) (fun _ -> empty_symbol) in
    list_to_fill @ list_with_empty_symbols
  else 
    let list_cutted = 
      List.filteri (fun i _ -> i < final_len) list_to_fill in
    list_cutted
;;


let fill_list_in_left list_to_fill final_len empty_symbol = 
  let len_of_list_to_fill = List.length list_to_fill in
  if final_len > len_of_list_to_fill
  then
    let list_with_empty_symbols = 
      List.init (final_len - len_of_list_to_fill) (fun _ -> empty_symbol) in
    list_with_empty_symbols @ list_to_fill 
  else 
    let list_cutted = 
      List.filteri 
        (fun i _ -> i >= len_of_list_to_fill - final_len) list_to_fill in
    list_cutted
;;


let get_len_of_higher_size l = 
  List.fold_left (
    fun current_higher str -> 
      String.length str
      |> max current_higher 
  ) 0 l
;;


let get_len_of_higher_size_in_tape tape =
  match tape with
  | (left_side, head, right_side) -> 
      get_len_of_higher_size ( left_side @ [head] @ right_side)
;;


