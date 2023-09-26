open List

type token = 
    | UL_PAROUV
    | UL_PARFER
    | UL_ECHEC
    | UL_FIN
    | UL_ERREUR
    | UL_SYMBOLE of string
    | UL_VARIABLE of string
    | UL_NEG
    | UL_PT
    | UL_VIR
    | UL_DEDUC
    | UL_COUP
  ;;

type inputStream = token list;;

(* string_of_token : token -> string *)
(* Converti un token en une chaîne de caractère*)
let string_of_token token =
     match token with
       | UL_PAROUV -> "{"
       | UL_PARFER -> "}"
       | UL_ECHEC -> "fail"
       | UL_FIN -> "EOF"
       | UL_SYMBOLE name -> name
       | UL_VARIABLE name -> name
       | UL_NEG -> "-"
       | UL_PT -> "."
       | UL_VIR -> ","
       | UL_DEDUC -> ":-"
       | UL_COUP -> "!"
       | UL_ERREUR -> "Erreur Lexicale";;

(* string_of_stream : inputStream -> string *)
(* Converti un inputStream (liste de token) en une chaîne de caractère *)
let string_of_stream stream =
  List.fold_right (fun t tq -> (string_of_token t) ^ " " ^ tq ) stream "";;


(* peekAtFirstToken : inputStream -> token *)
(* Renvoie le premier élément d'un inputStream *)
(* Erreur : si l'inputStream est vide *)
let peekAtFirstToken stream = 
  match stream with
  (* Normalement, ne doit jamais se produire sauf si la grammaire essaie de lire *)
  (* après la fin de l'inputStream. *)
  | [] -> failwith "Impossible d'acceder au premier element d'un inputStream vide"
   |t::_ -> t;;

(* advanceInStream : inputStream -> inputStream *)
(* Consomme le premier élément d'un inputStream *)
(* Erreur : si l'inputStream est vide *)
let advanceInStream stream =
  match stream with
  (* Normalement, ne doit jamais se produire sauf si la grammaire essaie de lire *)
  (* après la fin de l'inputStream. *)
  | [] -> failwith "Impossible de consommer le premier element d'un inputStream vide"
  | _::q -> q;;
