type coord = int * int

type t = Grid.t list

let create () =
  let rec loop n =
    if n > 0 then Grid.create () :: loop (n - 1)
    else []
  in
  loop 9

let display main =
  let rec lines head =
      let rec loop board y x =
          match board with
          | [elem] when y = 2 && x = 2 ->
                  begin
                      Grid.display elem y;
                      print_char '\n'
                  end
          | elem :: tail when y = 2 && x = 2 ->
                  begin
                      Grid.display elem y;
                      print_endline "\n---------------------";
                      lines tail
                  end
          | elem :: tail when x = 2 ->
                  begin
                      Grid.display elem y;
                      print_char '\n';
                      loop head (y + 1) 0
                  end
          | elem :: tail ->
                  begin
                      Grid.display elem y;
                      print_string " | ";
                      loop tail y (x + 1)
                  end
          | _ -> ()
      in
      loop head 0 0
  in
  lines main

let get_grid_id (y, x) = ((y / 3) * 3) + (x / 3)

let resolve_grids board coord player =
    let rec loop lst n =
        match lst with
        | [] -> []
        | elem :: tail when n = 0 && Grid.resolve elem = true ->
            if player = "X" then Grid.x_wins () :: tail
            else Grid.o_wins () :: tail
        | elem :: tail -> elem :: loop tail (n - 1)
    in
    loop board (get_grid_id coord)
(*
let resolve_x (board: t) = board
    let rec in_check = function
        | 
        | 
        | _ -> false

let resolve_y (board: t) = false
let resolve_z (board: t) = false

let resolve board =
    (resolve_x board || resolve_y board || resolve_z board)
*)
let check board coord =
    let rec loop lst n =
        match lst with
        | [] -> false
        | elem :: tail when n = 0 -> Grid.check elem coord
        | elem :: tail -> loop tail (n - 1)
    in
    loop board (get_grid_id coord)

let place (board: t) player coord : t =
    let rec loop lst n =
        match lst with
        | [] -> []
        | elem :: tail when n = 0 -> (Grid.place elem coord player) :: tail
        | elem :: tail -> elem :: loop tail (n - 1)
    in
    loop board (get_grid_id coord)
