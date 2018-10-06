type t = {
  id: string
}

let createNew id = { id = id }
let getId t = t.id
let switch = function
  | "0" -> "1"
  | _ -> "0"