
type box = Default | Player of string

type t = box list

let create () = [ Default; Default; Default; Default; Default; Default; Default; Default; Default]
(*let create () = [Player "00"; Player "01"; Player "02"; Player "10"; Player "11"; Player "12"; Player "20"; Player "21"; Player "22"]*)

let get_box box =
    match box with
    | Default -> "-"
    | Player box -> box

let get_index (y, x) = ((y mod 3) * 3) + (x mod 3)

let display grid y =
    let index = y * 3 in
    let rec loop lst n =
        match lst with
        | [] -> ()
        | elem :: tail when n = (index + 2) -> print_string (get_box elem)
        | elem :: tail when n >= index ->
               begin 
                   print_string (get_box elem);
                   print_char ' ';
                   loop tail (n + 1)
               end
        | elem :: tail -> loop tail (n + 1)
    in
    loop grid 0

let check grid coord =
    let rec loop lst n =
        match lst with
        | [] -> false
        | elem::tail when n = 0 -> (elem = Default)
        | elem::tail -> loop tail (n - 1)
    in
    loop grid (get_index coord)

let place (grid: t) coord player : t =
    let rec loop lst n =
        match lst with
        | [] -> []
        | elem :: tail when n = 0 -> Player player :: tail
        | elem :: tail -> elem :: loop tail (n - 1)
    in
    loop grid (get_index coord)

let resolve_y (grid: t) player =
    let rec loop lst count res =
        match lst with
        | [] -> false
        | elem :: tail when elem = Player player && count = 0 ->
            loop tail (count + 1) (res + 1)
        | elem :: tail when elem = Player player && res > 0 ->
            if res = 2 then true
            else loop tail (count + 1) (res + 1)
        | elem :: tail ->
            if count = 2 then loop tail 0 0
            else loop tail (count + 1) 0
    in
    loop grid 0 0

let resolve_x (grid: t) = false
let resolve_z (grid: t) = false

let resolve (grid: t) player =
    if resolve_y grid player = true then true
    else if resolve_x grid = true then true
    (*else if resolve_z grid = true then true*)
    else false