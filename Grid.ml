
type box = Default | Player of string

type t = box list

let create () = [ Default; Default; Default; Default; Default; Default; Default; Default; Default]


let get_box box =
    match box with
    | Default -> "-"
    | Player box -> box

let display board =
    let rec loop lst n =
        match lst with
        | [] -> ()
        | x :: xs when n = 0 -> begin
            print_string (get_box x);
            print_char '\n';
            loop xs 2
        end
        | x :: xs -> begin
            print_string (get_box x);
            print_char ' ';
            loop xs (n - 1)
        end
    in
    loop board 2
