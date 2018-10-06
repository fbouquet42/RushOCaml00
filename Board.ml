type coord = int * int

type t = Grid.t list

let create () =
  let rec loop n =
    if n > 0 then Grid.create () :: loop (n - 1)
    else []
  in
  loop 9

let display board =
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
      loop board 0 0
  in
  lines board

let get_grid_id (y, x) = ((y / 3) * 3) + (x / 3)

let check board coord = false
(*    let rec loop lst n =
        match lst with
        | [] -> false
        | elem :: tail when n = get_grid_id coord -> Grid.check elem coord
        | elem :: tail -> loop tail (n + 1)
    in
    loop board 0
*)
let resolve (board: t) player coord : t =
    let rec loop lst n =
        match lst with
        | [] -> []
        | elem :: tail when n = get_grid_id coord -> (Grid.place elem coord player) :: tail
        | elem :: tail -> elem :: loop tail (n + 1)
    in
    loop board 0
