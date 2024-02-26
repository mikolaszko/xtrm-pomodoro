type status = Halted | Running | Done

type t =  {
    mutable status: status;
    mutable time: int;
    interval: int * int * int;
}

val run_timer : string -> Bogue.Widget.t

val create_timer : Bogue.Widget.t