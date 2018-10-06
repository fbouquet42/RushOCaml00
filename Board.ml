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
                      Grid.display elem x;
                      print_char '\n'
                  end
          | elem :: tail when y = 2 && x = 2 ->
                  begin
                      Grid.display elem x;
                      print_endline "\n---------------------";
                      lines tail
                  end
          | elem :: tail when x = 2 ->
                  begin
                      Grid.display elem x;
                      print_char '\n';
                      loop head (y + 1) 0
                  end
          | elem :: tail ->
                  begin
                      Grid.display elem x;
                      print_string " | ";
                      loop tail y (x + 1)
                  end
          | _ -> ()
      in
      loop board 0 0
  in
  lines board

let resolve board player coord = false

let check board coord = true
