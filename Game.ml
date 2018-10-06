type players = Player1 of string | Player2 of string

type t = {p1 : players; p2 : players }
 
let get_player game index =
    match index with
    | Player1 -> game.p1
    | Player2 -> game.p2


let create  = {p1 = Player1 "O", p2 = Player2 "X"}

let next game player =
    match player with
    | Player1 -> game.p2
    | Player2 -> game.p1

let display player =
    print_string player;
    print_endline "'s turn to play."
