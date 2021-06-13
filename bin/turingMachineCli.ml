open TuringMachine;;
open Examples;;


module Machine = struct
  include Write_msg
end;;


let machine          = Machine.machine;;
let string_of_state  = Machine.string_of_state;;
let string_of_symbol = Machine.string_of_symbol;;


let print_step id machine =
  let _ = Utils.clear_term () in
  let (empty, _, _, _, _) = machine in
  match id with
  | Some id_without_option ->
    let machine_in_string = 
      Visualizer.view_of_machine
        id_without_option empty string_of_symbol string_of_state in
    print_endline machine_in_string;
    Unix.sleepf 0.3
  | None -> print_endline "HALT"
;;


let () = 
  Run.run_machine_with ~f:print_step ~machine
;;


