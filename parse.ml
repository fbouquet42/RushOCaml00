let get_coord s = ((int_of_char s.[0]) - 0x30, (int_of_char s.[2]) - 0x30)

let is_valid c = (c >= '0' && c <= '8')

let valid_length s = (String.length s = 3)

let valid_values s = (is_valid s.[0] && s.[1] = ' ' && is_valid s.[2])

let valid_board board s = (Board.check board (get_coord s))

let parse board =
    let rec loop () =
        let input = read_line () in
        if ((valid_length input) && (valid_values input) && (valid_board board input)) then
            get_coord input
        else
            begin
                print_endline ("Illegal move.");
                loop ()
            end
    in
    loop ()

