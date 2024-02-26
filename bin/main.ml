(* xtrm-pomodor - Mikołaj Sodzawiczny 2024*)

open Bogue
module W = Widget
module T = Trigger
module Av = Avar
module L = IntLayout

let main () = 
  let label_main = W.label ~size:10 "Timer!" in
  let dummy_timer = IntTimer.run_timer 1500 in
  let dummy_settings = W.label ~size:10 "Timer!" in

  let label_settings = W.label ~size:10 "Settings!" in
  Unix.sleep 1;
  let timer_page =  IntLayout.create_timer_page label_main dummy_timer in
  let settings_page =  IntLayout.create_settings_page label_settings dummy_settings in

  let nav_tabs = Tabs.create ["Timer", timer_page; "Settings", settings_page] in

  let board = Bogue.of_layouts [nav_tabs] in
  Bogue.run board


let () = main(); 
