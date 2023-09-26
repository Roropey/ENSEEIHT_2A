(* Evaluation des expressions simples *)


(* Module abstrayant les expressions *)
module type ExprSimple =
sig
  type t
  val const : int -> t
  val plus : t -> t -> t
  val mult : t-> t -> t
end

(* Module réalisant l'évaluation d'une expression *)
module EvalSimple : ExprSimple with type t = int =
struct
  type t = int
  let const c = c
  let plus e1 e2 = e1 + e2
  let mult e1 e2 = e1 * e2
end


module PrintSimple : ExprSimple with type t = string =
struct
  type t = string
  let const c = string_of_int c
  let plus e1 e2 = String.cat (String.cat (String.cat (String.cat "(" e1) "+") e2) ")"
  let mult e1 e2 = String.cat (String.cat (String.cat (String.cat"(" e1) "*") e2) ")"
end


module CompteSimple : ExprSimple with type t = int =
struct
  type t = int
  let const _ = 0
  let plus e1 e2 = e1 + e2 + 1
  let mult e1 e2 = e1 + e2 + 1
end

module type ExprVar =
sig
  type t
  val def : string -> t -> t -> t
  val var : string -> t
end 

module type Expr =
sig
  include ExprSimple
  include (ExprVar with type t:= t) 
end 

module PrintVar : ExprVar with type t = string =
struct
  type t = string
  let def var expr1 expr2 = String.cat (String.cat (String.cat (String.cat (String.cat "let " var) " = ") expr1) " in ") expr2
  let var e = e
end

module Print : Expr with type t = string =
struct
include PrintSimple
include PrintVar
end

(* Solution 1 pour tester *)
(* A l'aide de foncteur *)

(* Définition des expressions *)
module ExemplesSimples (E:ExprSimple) =
struct
  (* 1+(2*3) *)
  let exemple1  = E.(plus (const 1) (mult (const 2) (const 3)) )
  (* (5+2)*(2*3) *)
  let exemple2 =  E.(mult (plus (const 5) (const 2)) (mult (const 2) (const 3)) )
end

module ExemplesExrp (E:Expr)=
struct
  let exemple1 = E.(def "x" (plus (const 1) (const 2)) (mult (var "x") (const 3)))
  let exemple2 = E.(def "x" (plus (const 1) (mult (const 2) (const 3))) (mult (plus (var "x") (const 2)) (mult (const 2) (var "x"))))
end
(* Module d'évaluation des exemples *)
module EvalExemples =  ExemplesSimples (EvalSimple)

let%test _ = (EvalExemples.exemple1 = 7)
let%test _ = (EvalExemples.exemple2 = 42)

module PrintSimpleExemples = ExemplesSimples (PrintSimple)

let%test _ = (PrintSimpleExemples.exemple1 = "(1+(2*3))")
let%test _ = (PrintSimpleExemples.exemple2 = "((5+2)*(2*3))")

module CompteSimpleExemples = ExemplesSimples (CompteSimple)

let%test _ = (CompteSimpleExemples.exemple1 = 2)
let%test _ = (CompteSimpleExemples.exemple2 = 3)

module PrintExemples = ExemplesExrp (Print)

let%test _ = (PrintExemples.exemple1 = "let x = (1+2) in (x*3)")
let%test _ = (PrintExemples.exemple2 = "let x = (1+(2*3)) in ((x+2)*(2*x))")
