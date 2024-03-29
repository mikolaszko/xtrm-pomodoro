(* internal layout module *)
open Bogue
module L = Layout


let create_timer_page label timer = 
  L.tower[ 
    L.resident ~w:100 ~h:10 label;
    L.resident ~w:100 ~h:200 timer
  ] ~background:(L.color_bg (7, 24, 109, 100))

let create_settings_page label settings = 
  L.tower[ 
    L.resident ~w:100 ~h:10 label;
    L.resident ~w:100 ~h:200 settings
  ] ~background:(L.color_bg (7, 24, 109, 100))