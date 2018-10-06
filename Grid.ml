
type box = Default | Player of string

type t = box list

let create () = [ Default; Default; Default; Default; Default; Default; Default; Default; Default]

let get_box box =
    match box with
    | Default -> "-"
    | Player box -> box

let display grid y =
    let rec loop lst i =
        match lst with
        | [] -> ()
        | x :: xs when y = 0 && i < 3 ->
            begin
                print_string (get_box x);
                print_char ' ';
                loop xs (i + 1)
            end
        | x :: xs when y = 1 && (i > 2 && i < 6) ->
            begin
                print_string (get_box x);
                print_char ' ';
                loop xs (i + 1)
            end
        | x :: xs when y = 2 && (i > 5 && i < 9) ->
            begin
                print_string (get_box x);
                print_char ' ';
                loop xs (i + 1)
            end
        | x :: xs -> loop xs (i + 1)
    in
    loop grid 0
