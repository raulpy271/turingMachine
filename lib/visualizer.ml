
type 'symbol string_of = 'symbol -> string


let use_correct_length len str =
  let char_missing = len - String.length str in
  let rec add_spaces str quantity =
    if quantity == 0 then str else
    if quantity == 1 then str ^ " " 
    else add_spaces (" " ^ str ^ " ") (quantity - 2) in
  add_spaces str char_missing
;;


let get_max_cell_length len_of_higher_item =
  let border_len = 3 in
  let columns = Option.get (Terminal_size.get_columns ()) in 
  let columns_per_cell = len_of_higher_item + border_len in
  let cells_supported = (columns - border_len) / columns_per_cell in
  cells_supported
;;


let use_correct_length_in_all str_list =
  let bigger = Utils.get_len_of_higher_size str_list in
  List.map (use_correct_length bigger) str_list
;;


let concatenate_symbols str_list =
  let border = " | " in
  List.fold_left (fun first_symbols next_symbol ->
    first_symbols ^ next_symbol ^ border
  ) border str_list
;;


let create_tape_view str_list =
  let all_string_with_correct_len = use_correct_length_in_all str_list in
  let concatenated_symbols = concatenate_symbols all_string_with_correct_len in
  let len = String.length concatenated_symbols in
  let top_border = "\n +" ^ (String.make (len - 4) '-') ^ "+\n" in
  top_border ^ concatenated_symbols ^ top_border 
;;


let list_of_string_from_tape_side
  (side: 'symbol list) 
    (string_of_symbol: 'symbol string_of) : string list =
  List.map string_of_symbol side
;;


let tape_in_string_of_tape 
  (tp: 'symbol Data.tape)
    (string_of_symbol: 'symbol string_of) : string Data.tape =
  match tp with (left, head, right) ->
    let left_side_in_string = 
      list_of_string_from_tape_side left string_of_symbol in
    let right_side_in_string = 
      list_of_string_from_tape_side right string_of_symbol in
    (left_side_in_string, string_of_symbol head, right_side_in_string)
;;


let get_list_with_size_of_screen_of_tape
  (tp: string Data.tape) 
    (empty: string) : string list =
  match tp with (left, head, right) -> 
    let max_size_in_tape = Utils.get_len_of_higher_size 
      (left @ [head] @ right) in
    let supported_cells_length = get_max_cell_length max_size_in_tape in
    let left_side_cutted = 
      Utils.fill_list_in_left left
        (supported_cells_length/2) empty in
    let right_side_cutted =
      Utils.fill_list_in_right right
        (if Utils.is_even supported_cells_length
          then (supported_cells_length/2) - 1
          else supported_cells_length / 2
        ) empty in
    (left_side_cutted @ [head] @ right_side_cutted)
;;


let string_of_tape
  (empty: 'symbol) (string_of_symbol: 'symbol string_of)
    (tp : 'symbol Data.tape) : string = 
  let empty_in_string = string_of_symbol empty in
  let tp_in_string = tape_in_string_of_tape tp string_of_symbol in
  let tape_in_list_of_strings = 
    get_list_with_size_of_screen_of_tape tp_in_string empty_in_string in
  let tape_view = create_tape_view tape_in_list_of_strings in
  tape_view
;;

