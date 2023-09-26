(* Type des opérateurs binaires *)
type binary = 
  | Add 
  | Substract 
  | Or 
  | Multiply 
  | Divide 
  | And 
  | Equal 
  | Different 
  | Lesser 
  | LesserEqual 
  | Greater 
  | GreaterEqual

(*Type des opérateurs unaires *)
type unary = 
  | Negate

(*Type pour la construction de l'arbre abstrait (Abstract Syntaxic Tree) *)
type ast =
  | FunctionNode of string * ast
  | CallNode of ast * ast
  | IfthenelseNode of ast * ast * ast
  | LetNode of string * ast * ast
  | LetrecNode of string * ast * ast
  | AccessNode of string
  | IntegerNode of int
  | BinaryNode of binary * ast * ast
  | UnaryNode of unary * ast
  | TrueNode
  | FalseNode

(* string_of_binary : binary -> string *)
(* Convertit un opérateur binaire en une chaine de caractères en vue de son affichage *)
let string_of_binary op = match op with
  | Equal -> " = "
  | Different -> " != "
  | Lesser -> " < "
  | Greater -> " > "
  | LesserEqual -> " <= "
  | GreaterEqual -> " => "
  | Add -> " + "
  | Substract -> " - "
  | Or -> " || "
  | Multiply -> " * "
  | Divide -> " / "
  | And -> " && "

(* string_of_unary : unary -> string *)
(* Convertit un opérateur unaire en une chaine de caractères en vue de son affichage *)
let string_of_unary op = match op with
  | Negate -> "- "

(* paren : string -> string *)
(* Met une chaîne de charactères entre parenthèses *)
let paren s = "(" ^ s ^ ")"

(* string_of_ast : ast -> string *)
(* Convertit un ast en une chaine de caractères en vue de son affichage *)
let rec string_of_ast tree =
  match tree with
  | FunctionNode (par, body) ->
    paren ("fun " ^ par ^ " -> " ^ string_of_ast body)
  | CallNode (func, par) ->
    paren (string_of_ast func ^ " " ^ string_of_ast par)
  | IfthenelseNode (cond, bthen, belse) ->
    paren ("if " ^ string_of_ast cond
           ^ " then " ^ string_of_ast bthen
           ^ " else " ^ string_of_ast belse)
  | LetNode (id, blet, bin) ->
    paren ("let " ^ id ^ " = " ^ string_of_ast blet ^ " in " ^ string_of_ast bin)
  | LetrecNode (id, blet, bin) ->
    paren ("let rec " ^ id ^ " = " ^ string_of_ast blet ^ " in " ^ string_of_ast bin)
  | AccessNode name -> name
  | IntegerNode value -> string_of_int value
  | BinaryNode (op, left, right) ->
     paren (string_of_ast left ^ string_of_binary op ^ string_of_ast right)
  | UnaryNode (op, expr) ->
     paren (string_of_unary op ^ string_of_ast expr)
  | TrueNode -> "true"
  | FalseNode -> "false"
