(******************************************************************************)
(*                                                                            *)
(*      fonction de décomposition pour les chaînes de caractères              *)
(*                                                                            *)
(*   signature : decompose_chaine : string -> char list = <fun>               *)
(*                                                                            *)
(*   paramètre(s) : une chaîne de caractères                                  *)
(*   résultat     : la liste des caractères composant la chaîne paramètre     *)
(*                                                                            *)
(******************************************************************************)
let decompose_chaine s =
  let rec decompose i accu =
    if i < 0 then accu
    else decompose (i-1) (s.[i]::accu)
  in decompose (String.length s - 1) []

let%test _ = decompose_chaine "" = []
let%test _ = decompose_chaine "a" = ['a']
let%test _ = decompose_chaine "aa" = ['a';'a']
let%test _ = decompose_chaine "ab" = ['a';'b']
let%test _ = decompose_chaine "abcdef" = ['a'; 'b'; 'c'; 'd'; 'e'; 'f']

(******************************************************************************)
(*                                                                            *)
(*      fonction de recomposition pour les chaînes de caractères              *)
(*                                                                            *)
(*   signature : recompose_chaine : char list -> string = <fun>               *)
(*                                                                            *)
(*   paramètre(s) : une liste de caractères                                   *)
(*   résultat     : la chaîne des caractères composant la liste paramètre     *)
(*                                                                            *)
(******************************************************************************)
let rec recompose_chaine lc =
  List.fold_right (fun t q -> String.make 1 t ^ q) lc ""

let%test _ = recompose_chaine [] = ""
let%test _ = recompose_chaine ['a'] = "a"
let%test _ = recompose_chaine ['a';'a'] = "aa"
let%test _ = recompose_chaine ['a';'b'] = "ab"
let%test _ = recompose_chaine ['a'; 'b'; 'c'; 'd'; 'e'; 'f'] = "abcdef"


(******************************************************************************)
(*                                                                            *)
(*      fonction de décomposition pour les entiers                            *)
(*                                                                            *)
(*   signature : decompose_int : int -> int list = <fun>                      *)
(*                                                                            *)
(*   paramètre(s) : un entier                                                 *)
(*   résultat     : la liste des chiffres composant l'entier                  *)
(*                                                                            *)
(******************************************************************************)
let decompose_int i =
  List.map int_of_string (List.map (String.make 1)  (decompose_chaine (string_of_int i)))

let%test _ = decompose_int 258 = [2;5;8]
let%test _ = decompose_int 25 = [2;5]
let%test _ = decompose_int 2 = [2]



(******************************************************************************)
(*                                                                            *)
(*      fonction de recomposition pour les entiers                            *)
(*                                                                            *)
(*   signature : recompose_int : int list -> int = <fun>                      *)
(*                                                                            *)
(*   paramètre(s) : une liste de chiffres                                     *)
(*   résultat     : entier "valant" la liste paramètre                        *)
(*                                                                            *)
(******************************************************************************)
let recompose_int li =
  int_of_string (List.fold_right (^) (List.map string_of_int li) "" )

let%test _ = recompose_int [2;5;8] = 258
let%test _ = recompose_int [2;5] = 25
let%test _ = recompose_int [2] = 2
let%test _ = recompose_int [121;23;3] = 121233
