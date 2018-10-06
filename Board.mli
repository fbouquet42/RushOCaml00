type t = Grid.t list

type coord = int * int

val create : unit -> t

val display : t -> unit

val resolve : t -> string -> coord -> bool

val check : t -> coord -> bool
