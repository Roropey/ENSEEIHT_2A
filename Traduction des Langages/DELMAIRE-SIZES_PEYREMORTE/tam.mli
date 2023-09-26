(* Fonctions de service pour générer des instructions TAM. *)

(*
LOAD (int) int[reg]
LOADA int[reg]
LOADA label
LOADI (int)
LOADL int
LOADL "chaîne"
LOADL 'caractère'
STORE (int) int[reg]
STOREI (int)
CALL (reg) int[reg]
CALL (reg) label
CALLI
RETURN (int) int
SUBR label
PUSH int
POP (int) int
JUMP int[reg]
JUMP label
JUMPI
JUMPIF (int) int[reg]
JUMPIF (int) label
HALT
label
*)

(* LOAD (int) int[reg] *)
val load : int -> int -> string -> string

(* LOADA int[reg] *)
val loada : int -> string -> string

(* LOADA label *)
val loada_label : string -> string

(* LOADI (int) *)
val loadi : int -> string

(* LOADL int *)
val loadl_int : int -> string

(* LOADL string *)
val loadl_string : string -> string

(* LOADL char *)
val loadl_char : char -> string

(* STORE (int) int[reg] *)
val store : int -> int -> string -> string

(* STOREI (int) *)
val storei : int -> string

(* CALL (reg) int[reg] *)
val call_adr : string -> int -> string -> string

(* CALL (reg) label *)
val call : string -> string -> string

(* CALLI *)
val calli : string

(* RETURN (int) int *)
val return : int -> int -> string

(* SUBR label *)
val subr : string -> string

(* PUSH int *)
val push : int -> string

(* POP (int) int *)
val pop : int -> int -> string

(* JUMP int[reg] *)
val jump_adr : int -> string -> string

(* JUMP label *)
val jump : string -> string

(* JUMPI *)
val jumpi : string

(* JUMPIF (int) int[reg] *)
val jumpif_adr : int -> int -> string -> string

(* JUMPIF (int) label *)
val jumpif : int -> string -> string

(* HALT *)
val halt : string

(* label *)
val label : string -> string
