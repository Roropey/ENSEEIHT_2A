{
type token = ID of string | AUTO  | IFACE | INET | EOF (* A COMPLETER *)

exception Error of string
}

(* Définitions de macro pour les expressions régulières *)
let blanc = [' ' '\t' '\n']
 (* À compléter éventuellement *)


(* Règles léxicales *)
rule interface = parse
|  blanc (* On ignore les blancs *)
    { interface lexbuf }
| "auto"
    { AUTO }
| "iface"
    { IFACE }
| "inet"
    { INET }
(* A COMPLETER *)
| eof
    { EOF }
| _
{ raise (Error ("Unexpected char: "^(Lexing.lexeme lexbuf)^" at "^(string_of_int (Lexing.lexeme_start
lexbuf))^"-"^(string_of_int (Lexing.lexeme_end lexbuf)))) }
