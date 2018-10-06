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

let resolve board coord = board

let check board coord = true
(*    let rec loop lst n =
        match lst with
        | [] -> false
        | elem :: tail when n = get_grid_id coord -> Grid.check elem coord
        | elem :: tail -> loop tail (n + 1)
    in
    loop board 0
*)
let place (board: t) player coord : t =
    let rec loop lst n =
        match lst with
        | [] -> []
        | elem :: tail when n = 0 -> (Grid.place elem coord player) :: tail
        | elem :: tail -> elem :: loop tail (n - 1)
    in
    loop board (get_grid_id coord)
