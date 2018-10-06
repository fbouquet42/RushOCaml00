type t = Grid.t list

type coord = int * int

val create : unit -> t

val display : t -> unit

val resolve : t -> coord -> t

val place : t -> string -> coord -> t

val check : t -> coord -> bool

val get_grid_id : coord -> int
