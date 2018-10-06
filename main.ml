let main () =
    let game = Game.create () in
    let rec loop board player =
        match board with
        | [] -> ()
        | _ -> begin
            Board.display board;
            Game.display player;
            let coord = Parse.parse board in
            loop (Board.resolve (Board.place board player coord) coord) (Game.next game player)
        end
    in
    loop (Board.create ()) (Game.get_player game Game.Player1)


(* Application entry point *)
let () = main ()
