open Rat
open Compilateur
open Passe

(* Return la liste des adresses des variables d'un programme RAT *)
let getListeDep ratfile =
  let input = open_in ratfile in
  let filebuf = Lexing.from_channel input in
  try
    let ast = Parser.main Lexer.token filebuf in
    let past = CompilateurRat.calculer_placement ast in
    let listeAdresses = VerifPlacement.analyser past in
    listeAdresses
  with
  | Lexer.Error _ as e ->
      report_error ratfile filebuf "lexical error (unexpected character).";
      raise e
  | Parser.Error as e->
      report_error ratfile filebuf "syntax error.";
      raise e

(* teste si dans le fichier fichier, dans la fonction fonction (main pour programme principal)
la occ occurence de la variable var a l'adresse dep[registre]
*)
let test fichier fonction (var,occ) (dep,registre) = 
  let l = getListeDep fichier in
  let lmain = List.assoc fonction l in
  let rec aux i lmain = 
    if i=1 
    then
      let (d,r) = List.assoc var lmain in
      (d=dep && r=registre)
    else 
      aux (i-1) (List.remove_assoc var lmain)
  in aux occ lmain

(****************************************)
(** Chemin d'accès aux fichiers de test *)
(****************************************)

let pathFichiersRat = "../../../../../tests/placement/avec_fonction/fichiersRat/"


let%test "test8_x_1" = 
  test (pathFichiersRat^"test8.rat")  "main" ("x",1)  (0, "SB")
    
let%test "test8_y_1" = 
  test (pathFichiersRat^"test8.rat")  "main" ("y",1)  (1, "SB")
    
let%test "test8_z_1" = 
  test (pathFichiersRat^"test8.rat")  "main" ("z",1)  (3, "SB")
  
let%test "test8_x_2" = 
  test (pathFichiersRat^"test8.rat")  "main" ("x",2)  (4, "SB")
    
let%test "test8_y_2" = 
  test (pathFichiersRat^"test8.rat")  "main" ("y",2)  (5, "SB")
    
let%test "test8_z_2" = 
  test (pathFichiersRat^"test8.rat")  "main" ("z",2)  (7, "SB")
  
let%test "test8_x1" = 
  test (pathFichiersRat^"test8.rat")  "main" ("x1",1)  (4, "SB")
    
let%test "test8_y1" = 
  test (pathFichiersRat^"test8.rat")  "main" ("y1",1)  (5, "SB")
    
let%test "test8_z1" = 
  test (pathFichiersRat^"test8.rat" ) "main" ("z1",1)  (7, "SB")

let%test "test8_f_x_1" = 
  test (pathFichiersRat^"test8.rat")  "f" ("x",1)  (3, "LB")
    
let%test "test8_f_y_1" = 
  test (pathFichiersRat^"test8.rat")  "f" ("y",1)  (4, "LB")
    
let%test "test8_f_z_1" = 
  test (pathFichiersRat^"test8.rat")  "f" ("z",1)  (6, "LB")
  
let%test "test8_f_x_2" = 
  test (pathFichiersRat^"test8.rat")  "f" ("x",2)  (7, "LB")
    
let%test "test8_f_y_2" = 
  test (pathFichiersRat^"test8.rat")  "f" ("y",2)  (8, "LB")
    
let%test "test8_f_z_2" = 
  test (pathFichiersRat^"test8.rat")  "f" ("z",2)  (10, "LB")
  
let%test "test8_f_x1" = 
  test (pathFichiersRat^"test8.rat")  "f" ("x1",1)  (7, "LB")
    
let%test "test8_f_y1" = 
  test (pathFichiersRat^"test8.rat")  "f" ("y1",1)  (8, "LB")
    
let%test "test8_f_z1" = 
  test (pathFichiersRat^"test8.rat")  "f" ("z1",1)  (10, "LB")
    
let%test "test8_f_a" = 
  test (pathFichiersRat^"test8.rat")  "f" ("a",1)  (-1, "LB")
    
let%test "test9_f_a" = 
  test (pathFichiersRat^"test9.rat")  "f" ("a",1)  (-1, "LB")

let%test "test10_f_a" = 
  test (pathFichiersRat^"test10.rat")  "f" ("a",1)  (-2, "LB")

let%test "test11_f_a" = 
  test (pathFichiersRat^"test11.rat")  "f" ("a",1)  (-1, "LB")
    
let%test "test12_f_b" = 
  test (pathFichiersRat^"test12.rat")  "f" ("b",1)  (-4, "LB")
    
let%test "test12_f_r" = 
  test (pathFichiersRat^"test12.rat")  "f" ("r",1)  (-3, "LB")
    
let%test "test12_f_i" = 
  test (pathFichiersRat^"test12.rat")  "f" ("i",1)  (-1, "LB")
  
let%test "testPointeur_p" = 
  test (pathFichiersRat^"testPointeur.rat")  "f" ("p",1)  (-3, "LB")

let%test "testPointeur_r" = 
  test (pathFichiersRat^"testPointeur.rat")  "f" ("r",1)  (-2, "LB")