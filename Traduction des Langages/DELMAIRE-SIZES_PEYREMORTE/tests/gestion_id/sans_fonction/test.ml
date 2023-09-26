open Rat
open Compilateur
open Exceptions

exception ErreurNonDetectee

(****************************************)
(** Chemin d'accès aux fichiers de test *)
(****************************************)

let pathFichiersRat = "../../../../../tests/gestion_id/sans_fonction/fichiersRat/"

(**********)
(*  TESTS *)
(**********)

let%test_unit "testAffectation1" = 
  let _ = compiler (pathFichiersRat^"testAffectation1.rat") in ()

let%test_unit "testAffectation2"= 
  try 
    let _ = compiler (pathFichiersRat^"testAffectation2.rat") 
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("y") -> ()

let%test_unit "testAffectation3" = 
  let _ = compiler (pathFichiersRat^"testAffectation3.rat") in ()

let%test_unit "testAffectation4" = 
  try 
    let _ = compiler (pathFichiersRat^"testAffectation4.rat")
    in raise ErreurNonDetectee
  with
  | MauvaiseUtilisationIdentifiant("x") -> ()

let%test_unit "testUtilisation1" = 
  let _ = compiler (pathFichiersRat^"testUtilisation1.rat") in ()

let%test_unit "testUtilisation2" = 
  let _ = compiler (pathFichiersRat^"testUtilisation2.rat") in ()

let%test_unit "testUtilisation3" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation3.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("y") -> ()

let%test_unit "testUtilisation10" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation10.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("x") -> ()

let%test_unit "testUtilisation11" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation11.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("z") -> ()

let%test_unit "testUtilisation12" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation12.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("z") -> ()

let%test_unit "testUtilisation13" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation13.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("z") -> ()

let%test_unit "testUtilisation14" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation14.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("z") -> ()

let%test_unit "testUtilisation15" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation15.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("z") -> ()

let%test_unit "testUtilisation16" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation16.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("y") -> ()

let%test_unit "testUtilisation17" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation17.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("y") -> ()

let%test_unit "testUtilisation18" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation18.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("y") -> ()

let%test_unit "testUtilisation19" = 
  try 
    let _ = compiler (pathFichiersRat^"testUtilisation19.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("y") -> ()

let%test_unit "testRecursiviteVariable" = 
  try 
    let _ = compiler (pathFichiersRat^"testRecursiviteVariable.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("x") -> ()

let%test_unit "testPointeur1" =
    let _ = compiler (pathFichiersRat^"testPointeur1.rat") in ()

let%test_unit "testPointeur2" =
    let _ = compiler (pathFichiersRat^"testPointeur2.rat") in ()

let%test_unit "testPointeur3" =
    let _ = compiler (pathFichiersRat^"testPointeur3.rat") in ()

let%test_unit "testPointeur4" =
    let _ = compiler (pathFichiersRat^"testPointeur4.rat") in ()

let%test_unit "testPointeur5" =
  try 
    let _ = compiler (pathFichiersRat^"testPointeur5.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("x") -> ()

let%test_unit "testElseOptionnel" =
  let _ = compiler (pathFichiersRat^"testElseOptionnel.rat") in ()

let%test_unit "testConditionnelleTernaire" =
  let _ = compiler (pathFichiersRat^"testConditionnelleTernaire.rat") in ()

let%test_unit "testConditionnelleTernaire2" =
  let _ = compiler (pathFichiersRat^"testConditionnelleTernaire2.rat") in ()

let%test_unit "testConditionnelleTernaire3" =
  let _ = compiler (pathFichiersRat^"testConditionnelleTernaire3.rat") in ()

let%test_unit "testConditionnelleTernaire4" =
  try 
    let _ = compiler (pathFichiersRat^"testConditionnelleTernaire4.rat")
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("y") -> ()

let%test_unit "testLoop1" =
let _ = compiler (pathFichiersRat^"testLoop1.rat") in ()

let%test_unit "testLoopBreak" =
let _ = compiler (pathFichiersRat^"testLoopBreak.rat") in ()

let%test_unit "testLoopContinue" =
let _ = compiler (pathFichiersRat^"testLoopContinue.rat") in ()

let%test_unit "testLoopImbriques" =
let _ = compiler (pathFichiersRat^"testLoopImbriques.rat") in ()

let%test_unit "testLoopNonMasquage" =
let _ = compiler (pathFichiersRat^"testLoopNonMasquage.rat") in ()

let%test_unit "testLoopNonMasquage2" =
let _ = compiler (pathFichiersRat^"testLoopNonMasquage2.rat") in ()

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
  let p_tam = "../../../../../tests/tam/sans_fonction/fichiersRat/" in
  let d = opendir p_tam in
  test d p_tam
