
let main () =
    let board = Board.create () in
    let game = Game.create () in

    let rec loop player =
        Board.display board;
        Game.display player;
        if (Board.resolve board player (Parse.parse board)) then
            ()
        else
            loop (Game.next game player)
    in
    loop (Game.get_player game Game.Player1)


(* Application entry point *)
let () = main ()
