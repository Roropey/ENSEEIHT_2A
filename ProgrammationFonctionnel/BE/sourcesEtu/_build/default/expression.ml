(* Exercice 3 *)
module type Expression = sig
  (* Type pour représenter les expressions *)
  type exp

  (* eval : exp -> int *)
  (* Calcule l'expression en une valeur*)
  (* Paramètre exp : expression à évaluée*)
  (* Résulat int : évaluation de l'expression en la valeur donnée dans l'expression*)
  val eval : exp -> int
end

(* Exercice 4 *)
module ExpAvecArbreBinaire : Expression =
struct
(* Type pour représenter les expressions binaires *)
  type op = Moins | Plus | Mult | Div
  type exp = Binaire of exp * op * exp | Entier of int

  (* eval *)
  let rec eval expression =
    match expression with
    | Binaire(exp1,operation,exp2) -> (match operation with
      | Moins -> (eval exp1) - (eval exp2)
      | Plus -> (eval exp1) + (eval exp2)
      | Mult -> (eval exp1) * (eval exp2)
      | Div -> (eval exp1) / (eval exp2))
    | Entier(entier) -> entier

    (* Tests :*)
      (* Initialisations des expressions *)
    let exp1 = Entier 1
    let exp2 = Binaire(Entier 90, Plus, Entier 10)
    let exp3 = Binaire(Entier 180, Moins, Entier 190)
    let exp4 = Binaire(Entier 18,Mult,Entier 4)
    let exp5 = Binaire(Entier 5, Div, Entier 5)
    let exp6 = Binaire(Entier 7,Div, Entier 3)
    let exp7 = Binaire(Binaire(Entier 2000,Plus,Entier (-100)),Mult,Binaire(Entier 1, Moins, Entier (-4)))
    let exp8 = Binaire(Entier 1, Div, Entier 0)
    let exp9 = Binaire(Binaire(Entier 8000,Mult,Entier 200),Moins,Binaire(Entier 1,Div,Entier 20391039402010))
    let exp10 = Binaire(Entier 0, Mult, Entier 100)
    let exp11 = Binaire(Binaire(Binaire(Binaire(Binaire(Entier 1023,Mult,Entier 1982),Div,Entier 112323342923379),Moins,Entier(-124937)),Plus,Entier 19329890),Mult,Entier 0)
    let exp12 = Binaire(Entier 1929858839219,Mult, Entier 284829)
    let expSujet = Binaire(Binaire(Entier 3,Plus,Entier 4),Moins,Entier 12)
     (* Réalisation des tests *)
    let%test _ = eval exp1 = 1
    let%test _ = eval exp2 = 100
    let%test _ = eval exp3 = (-10)
    let%test _ = eval exp4 = 72
    let%test _ = eval exp5 = 1
    let%test _ = eval exp6 = 2
    let%test _ = eval exp7 = 9500
    let%test _ = try let _ = eval exp8 in false with Division_by_zero -> true
    let%test _ = eval exp9 = 1600000
    let%test _ = eval exp10 = 0
    let%test _ = eval exp11 = 0
    let%test _ = eval exp12 = 549679763315908551
    let%test _ = eval expSujet = -5

end

(* Exercice 5 *)
module ExpAvecArbreNaire : Expression =
struct
  (* Linéarisation des opérateurs binaire associatif gauche et droit *)
  type op = Moins | Plus | Mult | Div
  type exp = Naire of op * exp list | Valeur of int

  
(* bienformee : exp -> bool *)
(* Vérifie qu'un arbre n-aire représente bien une expression n-aire *)
(* c'est-à-dire que les opérateurs d'addition et multiplication ont au moins deux opérandes *)
(* et que les opérateurs de division et soustraction ont exactement deux opérandes.*)
(* Paramètre : l'arbre n-aire dont ont veut vérifier si il correspond à une expression *)
  let rec bienformee expression = 
    match expression with
    | Naire(Plus,expressions) -> (List.length expressions)>=2 && List.for_all bienformee expressions
    | Naire(Mult,expressions) -> (List.length expressions)>=2 && List.for_all bienformee expressions
    | Naire(Moins,expressions) -> (List.length expressions)=2 && List.for_all bienformee expressions
    | Naire(Div,expressions) -> (List.length expressions)=2 && List.for_all bienformee expressions
    | Valeur(_) -> true
  
  let en1 = Naire (Plus, [ Valeur 3; Valeur 4; Valeur 12 ])
  let en2 = Naire (Moins, [ en1; Valeur 5 ])
  let en3 = Naire (Mult, [ en1; en2; en1 ])
  let en4 = Naire (Div, [ en3; Valeur 2 ])
  let en1err = Naire (Plus, [ Valeur 3 ])
  let en2err = Naire (Moins, [ en1; Valeur 5; Valeur 4 ])
  let en3err = Naire (Mult, [ en1 ])
  let en4err = Naire (Div, [ en3; Valeur 2; Valeur 3 ])

  let%test _ = bienformee en1
  let%test _ = bienformee en2
  let%test _ = bienformee en3
  let%test _ = bienformee en4
  let%test _ = not (bienformee en1err)
  let%test _ = not (bienformee en2err)
  let%test _ = not (bienformee en3err)
  let%test _ = not (bienformee en4err)
  
  (* eval_bienformee : exp-> int *)
  (* Calcule la valeur d'une expression n-aire *)
  (* Paramètre : l'expression dont on veut calculer la valeur *)
  (* Précondition : l'expression est bien formée *)
  (* Résultat : la valeur de l'expression *)
  let rec eval_bienformee expression = 
    match expression with
    | Naire(operation,expressions) -> (match operation with
        | Moins -> List.fold_right (fun exp1 exp2 -> (eval_bienformee exp1) - exp2) expressions 0
        | Plus -> List.fold_left (fun exp1 exp2 -> exp1 + (eval_bienformee exp2)) 0 expressions
        | Mult -> List.fold_left (fun exp1 exp2 -> exp1 * (eval_bienformee exp2)) 1 expressions
        | Div -> List.fold_right (fun exp1 exp2 -> (eval_bienformee exp1) / exp2) expressions 1)  
    | Valeur(entier) -> entier

  let%test _ = eval_bienformee en1 = 19
  let%test _ = eval_bienformee en2 = 14
  let%test _ = eval_bienformee en3 = 5054
  let%test _ = eval_bienformee en4 = 2527

  (* Définition de l'exception Malformee *)
  exception Malformee

  (* eval : exp-> int *)
  (* Calcule la valeur d'une expression n-aire *)
  (* Paramètre : l'expression dont on veut calculer la valeur *)
  (* Résultat : la valeur de l'expression *)
  (* Exception  Malformee si le paramètre est mal formé *)
  let eval expression =
    if bienformee expression then eval_bienformee expression
    else raise Malformee

    let%test _ = eval en1 = 19
    let%test _ = eval en2 = 14
    let%test _ = eval en3 = 5054
    let%test _ = eval en4 = 2527
    
    let%test _ =
      try
        let _ = eval en1err in
        false
      with Malformee -> true
    
    let%test _ =
      try
        let _ = eval en2err in
        false
      with Malformee -> true
    
    let%test _ =
      try
        let _ = eval en3err in
        false
      with Malformee -> true
    
    let%test _ =
      try
        let _ = eval en4err in
        false
      with Malformee -> true   
    
end

