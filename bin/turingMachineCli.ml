open TuringMachine;;
open Examples;;

let machine = Repeat_0_1.machine;;

let id = Run.id_of_machine machine;;

let print_step id _ =
  let _ = Utils.clear_term () in
  match id with
  | Some (tp, (_, new_state)) ->
    let tp_in_string = Visualizer.string_of_tape 0 string_of_int tp in
    print_endline ("tape:    " ^ tp_in_string);
    print_endline ("state:   " ^ new_state ^ "\n");
    Unix.sleep 1
  | None -> print_endline "HALT"
;;

let () = Run.run_machine_with ~f:print_step ~machine;;

