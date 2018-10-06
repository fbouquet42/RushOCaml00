type coord = int * int

type t = Grid.t list

let create () =
  let rec loop n =
    if n > 0 then Grid.create () :: loop (n - 1)
    else []
  in
  loop 9

let display board =
  let rec loop lst n =
    match lst with
    | [] -> ()
    | x :: xs when n = 0 -> begin
      (*print_string "TEST "; print_int n;*)
      Grid.display x n;
      print_string "\n";
      loop xs 2
    end
    | x :: xs -> begin
      (*print_string "TEST "; print_int n;*)
      Grid.display x n;
      print_string " | ";
      loop xs (n - 1)
    end
  in
  loop board 2

let resolve board player coord = false

let check board coord = true
