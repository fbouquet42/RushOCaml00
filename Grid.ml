
type box = Default | Player of Game.players

type t = box list

let create = [ Default; Default; Default; Default; Default; Default; Default; Default; Default]


let get_box box =
    match box with
    | Default -> "-"
    | Player -> box

let display board =
    let rec loop lst n =
        match lst with
        | [] -> ()
        | x :: xs when n = 0 ->
            print_string get_box x;
            print_char '\n';
            loop xs 2
        | x :: xs -> begin
            print_string get_box x;
            print_char ' ';
            loop xs (n - 1)
    in
    loop board 2
