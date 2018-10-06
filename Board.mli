type t = Grid.t list

type coord = int * int

val create : unit -> t

val display : t -> unit

val resolve : t -> string -> (int * int) -> t

val check : t -> coord -> bool

val get_grid_id : (int * int) -> int