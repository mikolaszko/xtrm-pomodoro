(* xtrm-pomodor - Mikołaj Sodzawiczny 2024*)

open Bogue
module W = Widget
module L = Layout
module T = Trigger

let main () = 
  let input = W.text_input ~max_size:200 ~prompt:"Enter Your Name" () in
  let label = W.label ~size:40 "Hello!" in
  let layout = L.flat[ 
    L.resident ~w:400 input;
    L.resident ~w:400 ~h:200 label
  ] ~background: L.theme_bg in
  let action ti l _ =
    let text = W.get_text ti in
    W.set_text l ("Hello " ^ text ^ "!") in
  let c = W.connect input label action Trigger.[text_input; key_down] in 

  let board = Bogue.of_layouts ~connections:[c] [layout] in
  Bogue.run board


let () = main();
  Draw.quit()
