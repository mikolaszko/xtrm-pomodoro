open Bogue

module W = Widget
module L = Layout
module T = Trigger

type status = 
| Halted 
| Running 
| Done

type t = {
  mutable status: status;
  mutable time: int;
  interval: int * int * int
}
let timerInstance = {
  status = Halted;
  time = 1500; 
  interval = (1500 , 300 , 600);
}


let rec run_timer time =  
  let text = W.text_display ~w:100 ~h:300 (Int.to_string time) in
  print_int time;

  match timerInstance.time with
    | 0 -> 
      timerInstance.status <- Halted;
      text
    | _ -> 
    match timerInstance.status with
      | Halted -> 
        timerInstance.time <- timerInstance.time - 1;
        timerInstance.status <- Running;
       run_timer  timerInstance.time
      | Running -> 
        timerInstance.time <- timerInstance.time - 1;
        run_timer (timerInstance.time)
      | Done -> 
        timerInstance.status <- Done;
      text