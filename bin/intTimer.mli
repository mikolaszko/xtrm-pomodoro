type status = Halted | Running | Done

type t =  {
    mutable status: status;
    mutable time: int;
    interval: int * int * int;
}

val run_timer : int -> Bogue.Widget.t
