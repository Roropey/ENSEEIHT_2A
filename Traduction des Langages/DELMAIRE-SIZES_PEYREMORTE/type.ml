type typ = Bool | Int | Rat | Undefined | Pointeur of typ 

let rec string_of_type t = 
  match t with
  | Bool ->  "Bool"
  | Int  ->  "Int"
  | Rat  ->  "Rat"
  | Undefined -> "Undefined"
  | Pointeur t  -> "Pointeur "^(string_of_type t)


let rec est_compatible t1 t2 =
  match t1, t2 with
  | Bool, Bool -> true
  | Int, Int -> true
  | Rat, Rat -> true
  | Undefined, Undefined -> true  
  | Pointeur _, Pointeur Undefined -> true
  | Pointeur Undefined, Pointeur _ -> true
  | Pointeur pt1, Pointeur pt2 -> est_compatible pt1 pt2 
  | _ -> false 

let%test _ = est_compatible Bool Bool
let%test _ = est_compatible Int Int
let%test _ = est_compatible Rat Rat
let%test _ = est_compatible (Pointeur Int) (Pointeur Int)
let%test _ = est_compatible (Pointeur Bool) (Pointeur Bool)
let%test _ = est_compatible (Pointeur Rat) (Pointeur Rat)
let%test _ = est_compatible (Pointeur Undefined) (Pointeur Undefined)
let%test _ = est_compatible (Pointeur (Pointeur Int)) (Pointeur (Pointeur Int))
let%test _ = not (est_compatible Int Bool)
let%test _ = not (est_compatible Bool Int)
let%test _ = not (est_compatible Int Rat)
let%test _ = not (est_compatible Rat Int)
let%test _ = not (est_compatible Bool Rat)
let%test _ = not (est_compatible Rat Bool)
let%test _ = not (est_compatible Undefined Int)
let%test _ = not (est_compatible Int Undefined)
let%test _ = not (est_compatible Rat Undefined)
let%test _ = not (est_compatible Bool Undefined)
let%test _ = not (est_compatible Undefined Int)
let%test _ = not (est_compatible Undefined Rat)
let%test _ = not (est_compatible Undefined Bool)
let%test _ = not (est_compatible (Pointeur Int) Int)
let%test _ = not (est_compatible (Pointeur Int) Rat)
let%test _ = not (est_compatible (Pointeur Int) Bool)
let%test _ = not (est_compatible (Pointeur Int) (Pointeur Rat))
let%test _ = not (est_compatible (Pointeur (Pointeur Int)) (Pointeur Int))
let%test _ = est_compatible (Pointeur Undefined) (Pointeur Bool)
let%test _ = est_compatible (Pointeur Undefined) (Pointeur Int)
let%test _ = est_compatible (Pointeur Undefined) (Pointeur Rat)
let%test _ = est_compatible (Pointeur Bool) (Pointeur Undefined)
let%test _ = est_compatible (Pointeur Int) (Pointeur Undefined)
let%test _ = est_compatible (Pointeur Rat) (Pointeur Undefined)


let est_compatible_list lt1 lt2 =
  try
    List.for_all2 est_compatible lt1 lt2
  with Invalid_argument _ -> false

let%test _ = est_compatible_list [] []
let%test _ = est_compatible_list [Int ; Rat] [Int ; Rat]
let%test _ = est_compatible_list [Bool ; Rat ; Bool] [Bool ; Rat ; Bool]
let%test _ = not (est_compatible_list [Int] [Int ; Rat])
let%test _ = not (est_compatible_list [Int] [Rat ; Int])
let%test _ = not (est_compatible_list [Int ; Rat] [Rat ; Int])
let%test _ = not (est_compatible_list [Bool ; Rat ; Bool] [Bool ; Rat ; Bool ; Int])

let getTaille t =
  match t with
  | Int -> 1
  | Bool -> 1
  | Rat -> 2
  | Undefined -> 0
  | Pointeur _ -> 1
  
let%test _ = getTaille Int = 1
let%test _ = getTaille Bool = 1
let%test _ = getTaille Rat = 2
let%test _ = getTaille (Pointeur Rat) = 1
let%test _ = getTaille (Pointeur Int) = 1
