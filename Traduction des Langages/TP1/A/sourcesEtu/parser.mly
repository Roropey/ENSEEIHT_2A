%{
 (* type interface = Auto of string | Iface of string *)
%}


%token <string> ID
%token AUTO
%token IFACE
%token INET
%token EOF
(* A COMPLETER *)

(* Exercice 2 *)
(* Déclarations du type de l'attribut associé à un non terminal *)
(* Dans un premier temps on ignore cet attribut -> type unit *)
%type <unit> i
(*  A COMPLETER *)

(* Indication de l'axiom et du type de l'attribut associé à l'axiom *)
(* Dans un premier temps on ignore cet attribut -> type unit *)
%start <unit> is

%%

(*
IS -> I IS
IS -> $

I -> ...
*)

is :
| i is {()} (* action sémantique associée à une règle de prodution -> dans un premier temps () *)
| EOF  {()}


i : 
| (* A COMPLETER *)

%%
