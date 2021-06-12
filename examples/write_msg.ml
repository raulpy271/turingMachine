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


let string_of_symbol = String.make 1;;
let string_of_state _ = "Running";;



