open TuringMachine

let tp : int tape = ([], 1, [2; 3]);;
let tpId : (int, string) turingMachineID = (tp, "halt")
let (newTp, state) = tpId

let () = print_endline state
;;

