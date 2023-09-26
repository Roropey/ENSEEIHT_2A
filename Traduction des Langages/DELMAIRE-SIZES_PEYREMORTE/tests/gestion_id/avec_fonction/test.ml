open Rat
open Compilateur
open Exceptions

exception ErreurNonDetectee

(****************************************)
(** Chemin d'accès aux fichiers de test *)
(****************************************)

let pathFichiersRat = "../../../../../tests/gestion_id/avec_fonction/fichiersRat/"

(**********)
(*  TESTS *)
(**********)

let%test_unit "testDoubleDeclarationVariable1" = 
  try 
    let _ = compiler (pathFichiersRat^"testDoubleDeclarationVariable1.rat")
    in raise ErreurNonDetectee
  with
  | DoubleDeclaration("x") -> ()  

let%test_unit "testDoubleDeclarationVariable2" = 
  let _ = compiler (pathFichiersRat^"testDoubleDeclarationVariable2.rat") in ()

let%test_unit "testDoubleDeclarationVariable3" = 
  let _ = compiler (pathFichiersRat^"testDoubleDeclarationVariable3.rat") in ()
	  
let%test_unit "testDoubleDeclarationVariable4" = 
  try 
    let _ = compiler (pathFichiersRat^"testDoubleDeclarationVariable4.rat") 
    in raise ErreurNonDetectee
  with
  | DoubleDeclaration("x") -> ()

let%test_unit "testDoubleDeclarationVariable5" = 
  try 
    let _ = compiler (pathFichiersRat^"testDoubleDeclarationVariable5.rat")
    in raise ErreurNonDetectee
  with
  | DoubleDeclaration("x") -> ()

let%test_unit "testDoubleDeclarationVariable6" = 
  try 
    let _ = compiler (pathFichiersRat^"testDoubleDeclarationVariable6.rat") 
    in raise ErreurNonDetectee
  with
  | DoubleDeclaration("x") -> ()

let%test_unit "testDoubleDeclarationVariable7" = 
  try 
    let _ = compiler (pathFichiersRat^"testDoubleDeclarationVariable7.rat") 
    in raise ErreurNonDetectee
  with
  | DoubleDeclaration("x") -> ()

let%test_unit "testAffectation5" = 
  try 
    let _ = compiler (pathFichiersRat^"testAffectation5.rat")
    in raise ErreurNonDetectee
  with
  | MauvaiseUtilisationIdentifiant("add") -> ()
  | MauvaiseUtilisationIdentifiant("add2") -> ()

let%test_unit "testUtilisation4" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation4.rat")
    in raise ErreurNonDetectee
  with
  | MauvaiseUtilisationIdentifiant("add") -> ()

let%test_unit "testUtilisation5" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation5.rat")
    in raise ErreurNonDetectee
  with
  | MauvaiseUtilisationIdentifiant("add") -> ()

let%test_unit "testUtilisation6" = 
  let _ = compiler (pathFichiersRat^"testUtilisation6.rat") in ()

let%test_unit "testUtilisation7" = 
  let _ = compiler (pathFichiersRat^"testUtilisation7.rat") in ()

let%test_unit "testUtilisation8" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation8.rat")
    in raise ErreurNonDetectee
  with
  | MauvaiseUtilisationIdentifiant("x") -> ()

let%test_unit "testUtilisation9" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation9.rat")
    in raise ErreurNonDetectee
  with
  | MauvaiseUtilisationIdentifiant("z") -> ()

let%test_unit "testUtilisation20" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation20.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("y") -> ()

let%test_unit "testUtilisation21" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation21.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("y") -> ()

let%test_unit "testUtilisation22" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation22.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("y") -> ()

let%test_unit "testUtilisation23" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation23.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("x") -> ()

let%test_unit "testUtilisation24" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation24.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("x") -> ()

let%test_unit "testUtilisation25" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation25.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("a") -> ()

let%test_unit "testUtilisation26" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation26.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("a") -> ()

let%test_unit "testUtilisation27" = 
  let _ = compiler (pathFichiersRat^"testUtilisation27.rat") in ()

let%test_unit "testDeclarationFonction" = 
  let _ = compiler (pathFichiersRat^"testDeclarationFonction.rat") in ()

let%test_unit "testDoubleDeclarationFonction" = 
try 
  let _ = compiler (pathFichiersRat^"testDoubleDeclarationFonction.rat")
  in raise ErreurNonDetectee
with
| DoubleDeclaration("add") -> ()

let%test_unit "testDoubleDeclarationParametre1" = 
try 
  let _ = compiler (pathFichiersRat^"testDoubleDeclarationParametre1.rat")
  in raise ErreurNonDetectee
with
| DoubleDeclaration("a") -> ()

let%test_unit "testDoubleDeclarationParametre2" = 
try 
  let _ = compiler (pathFichiersRat^"testDoubleDeclarationParametre2.rat")
  in raise ErreurNonDetectee
with
| DoubleDeclaration("a") -> ()

let%test_unit "testRecursiviteFonction" = 
let _ = compiler (pathFichiersRat^"testRecursiviteFonction.rat") in ()

let%test_unit "test"= 
  let _ = compiler (pathFichiersRat^"test.rat") in ()

let%test_unit "test2" = 
  let _ = compiler (pathFichiersRat^"test2.rat") in ()

let%test_unit "testRetourFonction"=
  try
    let _ = compiler (pathFichiersRat^"testRetourFonction.rat")
    in raise ErreurNonDetectee
  with
  | RetourDansMain -> ()

let%test_unit "testPointeur"=
  let _ = compiler (pathFichiersRat^"testPointeur.rat") in ()


let%test_unit "testConditionnelleTernaire"=
  let _ = compiler (pathFichiersRat^"testConditionnelleTernaire.rat") in ()

let%test_unit "testCombinaisonsConstructions"=
  let _ = compiler (pathFichiersRat^"testCombinaisonsConstructions.rat") in ()

  
(* Fichiers de tests de la génération de code -> doivent passer la TDS *)
open Unix
open Filename

let rec test d p_tam = 
  try 
    let file = readdir d in
    if (check_suffix file ".rat") 
    then
    (
     try
       let _ = compiler  (p_tam^file) in (); 
     with e -> print_string (p_tam^file); print_newline(); raise e;
    )
    else ();
    test d p_tam
  with End_of_file -> ()

let%test_unit "all_tam" =
  let p_tam = "../../../../../tests/tam/avec_fonction/fichiersRat/" in
  let d = opendir p_tam in
  test d p_tam