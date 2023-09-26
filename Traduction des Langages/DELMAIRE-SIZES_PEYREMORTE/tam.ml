(* Fonctions de service pour générer des instructions TAM. *)

(* LOAD (int) int[reg] *)
(* val load : int -> int -> string -> string *)
let load taille dep reg = "LOAD (" ^ (string_of_int taille) ^ ") " ^ (string_of_int dep) ^ "[" ^ reg ^ "]\n"

(* LOADA int[reg] *)
(* val loada : int -> string -> string *)
let loada dep reg = "LOADA " ^ (string_of_int dep) ^ "[" ^ reg ^ "]\n"

(* LOADA label *)
(* val loada_label : string -> string *)
let loada_label label = "LOADA " ^ label ^ "\n"

(* LOADI (int) *)
(* val loadi : int -> string *)
let loadi taille = "LOADI (" ^ (string_of_int taille) ^ ")\n"

(* LOADL int *)
(* val loadl_int : int -> string *)
let loadl_int v = "LOADL " ^ (string_of_int v) ^ "\n"

(* LOADL string *)
(* val loadl_string : string -> string *)
let loadl_string v = "LOADL \"" ^ v ^ "\"\n"

(* LOADL char *)
(* val loadl_char : char -> string *)
let loadl_char c = "LOADL '" ^ (String.make 1 c) ^ "'\n"

(* STORE (int) int[reg] *)
(* val store : int -> int -> string -> string *)
let store taille dep reg = "STORE (" ^ (string_of_int taille) ^ ") " ^ (string_of_int dep) ^ "[" ^ reg ^ "]\n"

(* STOREI (int) *)
(* val storei : int -> string *)
let storei taille = "STOREI (" ^ (string_of_int taille) ^ ")\n"

(* CALL (reg) int[reg] *)
(* val call_adr : string -> int -> string -> string *)
let call_adr link dep reg = "CALL (" ^ link ^ ") " ^ (string_of_int dep) ^ "[" ^ reg ^ "]\n"

(* CALL (reg) label *)
(* val call : string -> string -> string *)
let call link label = "CALL (" ^ link ^ ") " ^ label ^ "\n"

(* CALLI *)
(* val calli : string *)
let calli = "CALLI\n"

(* RETURN (int) int *)
(* val return : int -> int -> string *)
let return tret tparam = "RETURN (" ^ (string_of_int tret) ^ ") " ^ (string_of_int tparam) ^ "\n"

(* SUBR label *)
(* val subr : string -> string *)
let subr label = "SUBR " ^ label ^ "\n"

(* PUSH int *)
(* val push : int -> string *)
let push n = "PUSH " ^ (string_of_int n) ^ "\n"

(* POP (int) int *)
(* val pop : int -> int -> string *)
let pop tret tloc = "POP (" ^ (string_of_int tret) ^ ") " ^ (string_of_int tloc) ^ "\n"

(* JUMP int[reg] *)
(* val jump_adr : int -> string -> string *)
let jump_adr dep reg = "JUMP " ^ (string_of_int dep) ^ "[" ^ reg ^ "]\n"

(* JUMP label *)
(* val jump : string -> string *)
let jump label = "JUMP " ^ label ^ "\n"

(* JUMPI *)
(* val jumpi : string *)
let jumpi = "JUMPI\n"

(* JUMPIF (int) int[reg] *)
(* val jumpif_adr : int -> int -> string -> string *)
let jumpif_adr v dep reg = "JUMPIF (" ^ (string_of_int v) ^ ") " ^ (string_of_int dep) ^ "[" ^ reg ^ "]\n"

(* JUMPIF (int) label *)
(* val jumpif : int -> string -> string *)
let jumpif v label = "JUMPIF (" ^ (string_of_int v) ^ ") " ^ label ^ "\n"

(* HALT *)
(* val halt : string *)
let halt = "HALT\n"

(* label *)
(* val label : string -> string *)
let label l = l ^ "\n"
