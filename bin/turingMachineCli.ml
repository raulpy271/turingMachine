open TuringMachine;;
open Examples;;

let machine = Repeat_0_1.machine;;

let id = Run.id_of_machine machine;;

let rec print_step machine id acc = 
  if (acc > 10) then () 
  else 
    match Run.step id machine with
    | Some (new_tp, new_state) ->
      let tp_in_string = Visualizer.string_of_tape 0 string_of_int new_tp in
      print_endline tp_in_string;
      print_endline new_state;
      print_endline "";
      print_step machine (new_tp, new_state) (acc + 1)
    | None -> print_endline "HALT"
;;

let () = 
  let (new_tp, new_state) = id in
  let tp_in_string = Visualizer.string_of_tape 0 string_of_int new_tp in
  print_endline tp_in_string;
  print_endline new_state;
  print_endline "\n";
  print_step machine id 0
;;

