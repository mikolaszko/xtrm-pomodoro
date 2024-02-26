open Bogue

module W = Widget
module L = Layout
module T = Trigger

type status = 
| Halted 
| Running 
| Done

type timer = {
  mutable status: status;
  mutable time: int;
  interval: int * int * int
}
let timerInstance = {
  status = Halted;
  time = 1500 ; 
  interval = (1500 , 300 , 600);
}


let rec run_timer time =  
  match timerInstance.status with
    | Halted -> 
      timerInstance.time <- timerInstance.time - 1;
      timerInstance.status <- Running;
      let _ = (run_timer  timerInstance.time) in
      W.text_display ~w:100 ~h:300 (Int.to_string time)
    | Running -> 
      timerInstance.time <- timerInstance.time - 1;
      let _ = (run_timer  timerInstance.time) in
      W.text_display ~w:100 ~h:300 (Int.to_string time)
    | Done -> 
      timerInstance.status <- Done;

  
let create_timer  = 
  let timerCompInstance = run_timer timerInstance.time in
  timerCompInstance