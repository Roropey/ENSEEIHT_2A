open Tokens

(* Type du résultat d'une analyse syntaxique *)
type parseResult =
  | Success of inputStream
  | Failure
;;

(* acceptSymb : inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien un symbole *)
(* et avance dans l'analyse si c'est le cas *)
let acceptSymb stream =
  match (peekAtFirstToken stream) with
    | (UL_SYMBOLE name) -> (print_endline ("accept " ^ name));(Success (advanceInStream stream))
    | _ -> Failure
;;

(* acceptVar : inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien une variable *)
(* et avance dans l'analyse si c'est le cas *)
let acceptVar stream =
  match (peekAtFirstToken stream) with
    | (UL_VARIABLE name) -> (print_endline ("accept " ^ name));(Success (advanceInStream stream))
    | _ -> Failure
;;

(* accept : token -> inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien le token attendu *)
(* et avance dans l'analyse si c'est le cas *)
let accept expected stream =
  match (peekAtFirstToken stream) with
    | token when (token = expected) ->
      (Success (advanceInStream stream))
    | _ -> Failure
;;

(* Définition de la monade  qui est composée de : *)
(* - le type de donnée monadique : parseResult  *)
(* - la fonction : inject qui construit ce type à partir d'une liste de terminaux *)
(* - la fonction : bind (opérateur >>=) qui combine les fonctions d'analyse. *)

(* inject inputStream -> parseResult *)
(* Construit le type de la monade à partir d'une liste de terminaux *)
let inject s = Success s;;

(* bind : 'a m -> ('a -> 'b m) -> 'b m *)
(* bind (opérateur >>=) qui combine les fonctions d'analyse. *)
(* ici on utilise une version spécialisée de bind :
   'b  ->  inputStream
   'a  ->  inputStream
    m  ->  parseResult
*)
(* >>= : parseResult -> (inputStream -> parseResult) -> parseResult *)
let (>>=) result f =
  match result with
    | Success next -> f next
    | Failure -> Failure
;;


(* parseProgramme : inputStream -> parseResult *)
(* Analyse du non terminal Programme *)
let rec parseProgramme stream =
  (print_string "Programme -> ");
  (match (peekAtFirstToken stream) with
    | (UL_SYMBOLE _)-> (print_endline "R SR" );(match (parseR stream) with
      | (Success next1) -> parseSR next1
      | _ -> Failure)
    | _ -> Failure)

(* parseSR : inputStream -> parseResult *)
(* Analyse du non terminal SR *)
and parseSR stream =
  (print_string "SR -> ");
  (match (peekAtFirstToken stream) with
    | UL_FIN -> (print_endline "");(Success stream)
    | (UL_SYMBOLE _)-> (print_endline "R SR" );(match (parseR stream) with
      | (Success next1) -> parseSR next1
      | _ -> Failure)
    | _ -> Failure)
  

(* parseR : inputStream -> parseResult *)
(* Analyse du non terminal R *)
and parseR stream =
  (print_string "R -> ");
  (match (peekAtFirstToken stream) with
    | (UL_SYMBOLE _)-> (print_endline "P SP" );(match (parseP stream) with
      | (Success next1) -> (match (parseSP next1) with
        | (Success next2) -> accept UL_PT next2
        | _ -> Failure)
      | _ -> Failure)
    | _ -> Failure)


(* parseSP : inputStream -> parseResult *)
(* Analyse du non terminal SP *)
and parseSP stream =
  (print_string "SP -> ");
  (match (peekAtFirstToken stream) with
    | UL_PT -> (print_endline ".");(Success stream)
    | UL_DEDUC -> (print_endline ":- E SE" );(match (accept UL_DEDUC stream) with
      | (Success next1) -> (match (parseE next1) with
        | (Success next2) -> parseSE next2
        | _ -> Failure)
      | _ -> Failure)
    | _ -> Failure)


(* parseE : inputStream -> parseResult *)
(* Analyse du non terminal E *)
and parseE stream =
  (print_string "E -> ");
  (match (peekAtFirstToken stream) with
    | UL_ECHEC -> (print_endline "fail" );(accept UL_ECHEC stream)
    | UL_COUP -> (print_endline "!" );(accept UL_COUP stream)
    | UL_NEG -> (print_endline "-P" );(match (accept UL_NEG stream) with
      | (Success next1) -> parseP next1
      | _ -> Failure)
    | UL_SYMBOLE _-> (print_endline "P" );parseP stream
    | _ -> Failure)



(* parseSE : inputStream -> parseResult *)
(* Analyse du non terminal SE *)
and parseSE stream =
  (print_string "SE -> ");
  (match (peekAtFirstToken stream) with
    | UL_PT -> (print_endline ".");(Success stream)
    | UL_VIR -> (print_endline ", E SE" );(match (accept UL_VIR stream) with
      | (Success next1) -> (match (parseE next1) with
        | (Success next2) -> parseSE next2
        | _ -> Failure)
      | _ -> Failure)
    | _ -> Failure)

(* parseP : inputStream -> parseResult *)
(* Analyse du non terminal P *)
and  parseP stream =
  (print_string "P -> ");
  (match (peekAtFirstToken stream) with
    | UL_SYMBOLE _-> (print_endline "symbole (T ST)" );(match (acceptSymb stream) with
      | (Success next1) -> (match (accept UL_PAROUV next1) with
        | (Success next2) -> (match (parseT next2)  with
          | (Success next3) -> (match (parseST next3) with
            | (Success next4) -> accept UL_PARFER next4
            | _ -> Failure)
          | _ -> Failure)
        | _ -> Failure)
      | _ -> Failure)
    | _ -> Failure)


(* parseT : inputStream -> parseResult *)
(* Analyse du non terminal T *)
and parseT stream =
  (print_string "T -> ");
  (match (peekAtFirstToken stream) with
    | (UL_VARIABLE _)-> (print_endline "variable" );(acceptVar stream)
    | (UL_SYMBOLE _)-> (print_endline "symbole O" );(match (acceptSymb stream) with
      | (Success next1) -> parseO next1
      | _ -> Failure)
    | _ -> Failure)


(* parseST : inputStream -> parseResult *)
(* Analyse du non terminal ST *)
and parseST stream =
  (print_string "ST -> ");
  (match (peekAtFirstToken stream) with
    | UL_PT -> (print_endline ".");(Success stream)
    | UL_VIR -> (print_endline ", T ST" );(match (accept UL_VIR stream) with
      | (Success next1) -> (match (parseT next1) with
        | (Success next2) -> parseST next2
        | _ -> Failure)
      | _ -> Failure)
    | _ -> Failure)


(* parseO : inputStream -> parseResult *)
(* Analyse du non terminal O *)
and parseO stream =
  (print_string "O -> ");
  (match (peekAtFirstToken stream) with
    | UL_PT | UL_VIR -> (print_endline "");(Success stream)
    | UL_PAROUV -> (print_endline "(T ST)" );(match (parseT stream) with
      | (Success next1) -> (match (parseST next1) with
        | (Success next2) -> accept UL_PARFER next2
        | _ -> Failure)
      | _ -> Failure)
    | _ -> Failure)
;;