open TuringMachine


type symbol = char
type state = 
  { string_to_show  : string;
    steps_missing_to_stop : int;
  }


let write_msg: (symbol, state) Data.transition = 
  fun symbol state -> match state with
  | { string_to_show = ""; 
      steps_missing_to_stop = steps} -> 
      Some 
      ( symbol, 
        {string_to_show = ""; steps_missing_to_stop = steps - 1;}, 
        Data.Left
      )
  | { string_to_show = string_to_show;
      steps_missing_to_stop = steps} -> 
      let first = String.get string_to_show 0 in
      let remaining_str = 
        String.sub string_to_show 1 (String.length string_to_show - 1) in
      Some 
      ( first, 
        { string_to_show = remaining_str;
          steps_missing_to_stop = steps - 1;}, 
        Data.Right
      )
;;


let machine: (symbol, state) Data.turingMachine =
  let blank = ' ' in
  let input = [] in
  let msg = "Hello." in
  let init_state = 
    { string_to_show        = msg;
      steps_missing_to_stop = String.length msg * 2;
    } in
  let end_states = 
    [{ string_to_show        = "";
       steps_missing_to_stop = 0;
    }] in
  let transition = write_msg in
  (blank, input, init_state, end_states, transition)
;;


let print_step id _ =
  let _ = Utils.clear_term () in
  match id with
  | Some (tp, { steps_missing_to_stop = steps; _}) ->
    let tp_in_string = Visualizer.string_of_tape ' ' (String.make 1) tp in
    print_endline ("tape:    " ^ tp_in_string);
    print_endline ("state:   " ^ (string_of_int steps)^ "\n");
    Unix.sleep 1
  | None -> print_endline "HALT"
;;


