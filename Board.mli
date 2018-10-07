type t = Grid.t list

type coord = int * int

val create : unit -> t

val display : t -> unit

val resolve_grids : t -> coord -> string -> t

(*val resolve : t -> t*)

val place : t -> string -> coord -> t

val check : t -> coord -> bool

val get_grid_id : coord -> int
