open Rat
open Compilateur
open Exceptions

exception ErreurNonDetectee

(****************************************)
(** Chemin d'accès aux fichiers de test *)
(****************************************)

let pathFichiersRat = "../../../../../tests/type/sans_fonction/fichiersRat/"

(**********)
(*  TESTS *)
(**********)


let%test_unit "testDeclaration1"= 
  let _ = compiler (pathFichiersRat^"testDeclaration1.rat") in ()

let%test_unit "testDeclaration2"= 
  let _ = compiler (pathFichiersRat^"testDeclaration2.rat") in ()

let%test_unit "testDeclaration3"= 
  let _ = compiler (pathFichiersRat^"testDeclaration3.rat") in ()

let%test_unit "testDeclaration4"= 
  try 
    let _ = compiler (pathFichiersRat^"testDeclaration4.rat")
    in  raise ErreurNonDetectee
  with
  | TypeInattendu(Bool,Int) -> ()

let%test_unit "testDeclaration5"= 
  try 
    let _ = compiler (pathFichiersRat^"testDeclaration5.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Bool,Rat) -> ()

let%test_unit "testDeclaration6"= 
  try 
    let _ = compiler (pathFichiersRat^"testDeclaration6.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Bool) -> ()

let%test_unit "testDeclaration7"= 
  try 
    let _ = compiler (pathFichiersRat^"testDeclaration7.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Rat) -> ()

let%test_unit "testDeclaration8"= 
  try 
    let _ = compiler (pathFichiersRat^"testDeclaration8.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Rat,Int) -> ()

let%test_unit "testDeclaration9"= 
  try 
    let _ = compiler (pathFichiersRat^"testDeclaration9.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Rat,Bool) -> ()

let%test_unit "testAffectation1"= 
  let _ = compiler (pathFichiersRat^"testAffectation1.rat") in ()

let%test_unit "testAffectation2"= 
  let _ = compiler (pathFichiersRat^"testAffectation2.rat") in ()

let%test_unit "testAffectation3"= 
  let _ = compiler (pathFichiersRat^"testAffectation3.rat") in ()

let%test_unit "testAffectation4"= 
  try 
    let _ = compiler (pathFichiersRat^"testAffectation4.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Rat) -> ()

let%test_unit "testAffectation5"= 
  try 
    let _ = compiler (pathFichiersRat^"testAffectation5.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Bool,Int) -> ()

let%test_unit "testAffectation6"= 
  try 
    let _ = compiler (pathFichiersRat^"testAffectation6.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Bool,Rat) -> ()

let%test_unit "testAffectation7"= 
  try 
    let _ = compiler (pathFichiersRat^"testAffectation7.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Rat,Int) -> ()

let%test_unit "testAffectation8"= 
  try 
    let _ = compiler (pathFichiersRat^"testAffectation8.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Rat,Bool) -> ()

let%test_unit "testAffectation9"= 
  try 
    let _ = compiler (pathFichiersRat^"testAffectation9.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Bool) -> ()

let%test_unit "testConditionnelle1"= 
  let _ = compiler (pathFichiersRat^"testConditionnelle1.rat") in ()

let%test_unit "testConditionnelle2"= 
  try 
    let _ = compiler (pathFichiersRat^"testConditionnelle2.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Bool) -> ()

let%test_unit "testConditionnelle3"= 
  try 
    let _ = compiler (pathFichiersRat^"testConditionnelle3.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Rat,Bool) -> ()

let%test_unit "testConditionnelle4"= 
  let _ = compiler (pathFichiersRat^"testConditionnelle4.rat") in ()

let%test_unit "testConditionnelle5"= 
  try 
    let _ = compiler (pathFichiersRat^"testConditionnelle5.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Bool) -> ()

let%test_unit "testConditionnelle6"= 
  try 
    let _ = compiler (pathFichiersRat^"testConditionnelle6.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Rat,Bool) -> ()

let%test_unit "testRepetition1"= 
  let _ = compiler (pathFichiersRat^"testRepetition1.rat") in ()

let%test_unit "testRepetition2"= 
  try 
    let _ = compiler (pathFichiersRat^"testRepetition2.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Bool) -> ()

let%test_unit "testRepetition3"= 
  try 
    let _ = compiler (pathFichiersRat^"testRepetition3.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Rat,Bool) -> ()

let%test_unit "testRepetition4"= 
  let _ = compiler (pathFichiersRat^"testRepetition4.rat") in ()

let%test_unit "testRepetition5"= 
  try 
    let _ = compiler (pathFichiersRat^"testRepetition5.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Bool) -> ()

let%test_unit "testRepetition6"= 
  try 
    let _ = compiler (pathFichiersRat^"testRepetition6.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Rat,Bool) -> ()

let%test_unit "testPrint1"= 
  let _ = compiler (pathFichiersRat^"testPrint1.rat") in ()

let%test_unit "testPrint2"= 
  let _ = compiler (pathFichiersRat^"testPrint2.rat") in ()

let%test_unit "testPrint3"= 
  let _ = compiler (pathFichiersRat^"testPrint3.rat") in ()

let%test_unit "testRationnel1"= 
  let _ = compiler (pathFichiersRat^"testRationnel1.rat") in ()

let%test_unit "testRationnel2"= 
  let _ = compiler (pathFichiersRat^"testRationnel2.rat") in ()

let%test_unit "testRationnel3"= 
  try 
    let _ = compiler (pathFichiersRat^"testRationnel3.rat")
    in raise ErreurNonDetectee
  with
  | TypeBinaireInattendu(_,Int,Rat) -> ()

let%test_unit "testRationnel4"= 
  try 
    let _ = compiler (pathFichiersRat^"testRationnel4.rat")
    in raise ErreurNonDetectee
  with
  | TypeBinaireInattendu(_,Bool,Int) -> ()

let%test_unit "testRationnel5"= 
  try 
    let _ = compiler (pathFichiersRat^"testRationnel5.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Rat,Int) -> ()

let%test_unit "testNumerateur1"= 
  let _ = compiler (pathFichiersRat^"testNumerateur1.rat") in ()

let%test_unit "testNumerateur2"= 
  let _ = compiler (pathFichiersRat^"testNumerateur2.rat") in ()

let%test_unit "testNumerateur3"= 
  try 
    let _ = compiler (pathFichiersRat^"testNumerateur3.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Bool,Rat) -> ()

let%test_unit "testNumerateur4"= 
  try 
    let _ = compiler (pathFichiersRat^"testNumerateur4.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Rat) -> ()

let%test_unit "testNumerateur5"= 
  try 
    let _ = compiler (pathFichiersRat^"testNumerateur5.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Bool) -> ()

let%test_unit "testDenominateur1"= 
  let _ = compiler (pathFichiersRat^"testDenominateur1.rat") in ()

let%test_unit "testDenominateur2"= 
  let _ = compiler (pathFichiersRat^"testDenominateur2.rat") in ()

let%test_unit "testDenominateur3"= 
  try 
    let _ = compiler (pathFichiersRat^"testDenominateur3.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Bool,Rat) -> ()

let%test_unit "testDenominateur4"= 
  try 
    let _ = compiler (pathFichiersRat^"testDenominateur4.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Rat) -> ()

let%test_unit "testDenominateur5"= 
  try 
    let _ = compiler (pathFichiersRat^"testDenominateur5.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Bool) -> ()

let%test_unit "testIdent1"= 
  let _ = compiler (pathFichiersRat^"testIdent1.rat") in ()

let%test_unit "testIdent2"= 
  let _ = compiler (pathFichiersRat^"testIdent2.rat") in ()

let%test_unit "testIdent3"= 
  let _ = compiler (pathFichiersRat^"testIdent3.rat") in ()

let%test_unit "testIdent4"= 
  try 
    let _ = compiler (pathFichiersRat^"testIdent4.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Rat,Int) -> ()

let%test_unit "testIdent5"= 
  try 
    let _ = compiler (pathFichiersRat^"testIdent5.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Rat,Bool) -> ()

let%test_unit "testIdent6"= 
  try 
    let _ = compiler (pathFichiersRat^"testIdent6.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Bool) -> ()

let%test_unit "testIdent7"= 
  try 
    let _ = compiler (pathFichiersRat^"testIdent7.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int,Rat) -> ()

let%test_unit "testIdent8"= 
  try 
    let _ = compiler (pathFichiersRat^"testIdent8.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Bool,Rat) -> ()

let%test_unit "testIdent9"= 
  try 
    let _ = compiler (pathFichiersRat^"testIdent9.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Bool,Int) -> ()

let%test_unit "testOperation1"= 
  let _ = compiler (pathFichiersRat^"testOperation1.rat") in ()

let%test_unit "testOperation2"= 
  let _ = compiler (pathFichiersRat^"testOperation2.rat") in ()

let%test_unit "testOperation3"= 
  try 
    let _ = compiler (pathFichiersRat^"testOperation3.rat")
    in raise ErreurNonDetectee
  with
  | TypeBinaireInattendu(Plus, Bool, Bool) -> ()

let%test_unit "testOperation4"= 
  try 
    let _ = compiler (pathFichiersRat^"testOperation4.rat")
    in raise ErreurNonDetectee
  with
  | TypeBinaireInattendu(Equ, Rat, Rat) -> ()

let%test_unit "testOperation5"= 
  let _ = compiler (pathFichiersRat^"testOperation5.rat") in ()

let%test_unit "testOperation6"= 
  let _ = compiler (pathFichiersRat^"testOperation6.rat") in ()

let%test_unit "testOperation7"= 
  let _ = compiler (pathFichiersRat^"testOperation7.rat") in ()

let%test_unit "testOperation8"= 
  let _ = compiler (pathFichiersRat^"testOperation8.rat") in ()

let%test_unit "testOperation9"= 
  try 
    let _ = compiler (pathFichiersRat^"testOperation9.rat")
    in raise ErreurNonDetectee
  with
  | TypeBinaireInattendu(Mult, Bool, Bool) -> ()

let%test_unit "testOperation10"= 
  try 
    let _ = compiler (pathFichiersRat^"testOperation10.rat")
    in raise ErreurNonDetectee
  with
  | TypeBinaireInattendu(Inf, Rat, Rat) -> ()

let%test_unit "testOperation11"= 
  try 
    let _ = compiler (pathFichiersRat^"testOperation11.rat")
    in raise ErreurNonDetectee
  with
  | TypeBinaireInattendu(Inf, Bool, Bool) -> ()

let%test_unit "testOperation12"= 
  let _ = compiler (pathFichiersRat^"testOperation12.rat") in ()

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
    | TypeInattendu(Pointeur Rat, Pointeur Int) -> ()

let%test_unit "testPointeur6" =
  try
    let _ = compiler (pathFichiersRat^"testPointeur6.rat")
    in raise ErreurNonDetectee
  with
    | TypeInattendu(Pointeur Bool, Pointeur Int) -> ()

let%test_unit "testPointeur7" =
  try
    let _ = compiler (pathFichiersRat^"testPointeur7.rat")
    in raise ErreurNonDetectee
  with
    | TypeInattendu(Pointeur Int, Pointeur Rat) -> ()    

let%test_unit "testPointeur8" =
  try
    let _ = compiler (pathFichiersRat^"testPointeur8.rat")
    in raise ErreurNonDetectee
  with
    | TypeNonPointeur(Int) -> ()    

let%test_unit "testPointeur9" =
  try
    let _ = compiler (pathFichiersRat^"testPointeur9.rat")
    in raise ErreurNonDetectee
  with
    | TypeInattendu(Pointeur(Undefined), Int) -> ()   

let%test_unit "testElseOptionnel" =
  let _ = compiler (pathFichiersRat^"testElseOptionnel.rat") in ()

let%test_unit "testConditionnelleTernaire" =
  let _ = compiler (pathFichiersRat^"testConditionnelleTernaire.rat") in ()

let%test_unit "testConditionnelleTernaire2" =
  let _ = compiler (pathFichiersRat^"testConditionnelleTernaire2.rat") in ()

let%test_unit "testConditionnelleTernaire3" =
  try 
    let _ = compiler (pathFichiersRat^"testConditionnelleTernaire3.rat")
    in raise ErreurNonDetectee
  with
  | TypeInattendu(Int, Bool) -> ()


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

let%test_unit "tes tLoopNonMasquage2" =
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