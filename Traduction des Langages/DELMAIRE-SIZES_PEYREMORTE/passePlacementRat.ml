(* Module de la passe de gestion des types *)
(* doit être conforme à l'interface Passe *)
open Tds
open Type
(*open Exceptions*)
open Ast

type t1 = Ast.AstType.programme
type t2 = Ast.AstPlacement.programme

(* analyse_placement_instruction : AstType.instruction -> int -> String -> AstPlacement.instruction *)
(* Paramètre i : l'instruction à analyser *)
(* Paramètre dep : le déplacement actuel au début de l'instruction pour le placement *)
(* Paramètre reg : règle où est placée l'instruction *)
(* Tranforme l'instruction en une instruction de type AstPlacement.instruction et
 renvoie la place occupée par l'instruction *)
let rec analyse_placement_instruction i dep reg =
  match i with
  | AstType.Declaration (info,e) ->
    begin
      match info_ast_to_info info with
      | InfoVar(_,t,_,_) -> 
        begin
        modifier_adresse_variable dep reg info;
        (AstPlacement.Declaration(info,e),getTaille(t))
        end
      | _ -> failwith "Internal error"
    end
    
  | AstType.Affectation (af,e) ->
      (AstPlacement.Affectation(af,e),0)
    
  | AstType.Empty ->
      (AstPlacement.Empty,0)
       
  | AstType.AffichageInt e ->
    (AstPlacement.AffichageInt(e),0)
  | AstType.AffichageBool e ->
    (AstPlacement.AffichageBool(e),0)
  | AstType.AffichageRat e ->
    (AstPlacement.AffichageRat(e),0)
  | AstType.Conditionnelle (ec,b1,b2) ->
    begin
      let nb1 = analyse_placement_bloc b1 dep reg in
      let nb2 = analyse_placement_bloc b2 dep reg in
      (AstPlacement.Conditionnelle(ec,nb1,nb2),0)
    end
| AstType.TantQue (ec,b) ->
  begin
    let nb = analyse_placement_bloc b dep reg in
    (AstPlacement.TantQue(ec,nb),0)
  end
  | AstType.Retour (e,info) ->
    begin
      match info_ast_to_info info with
      |InfoFun(_,t,lp) -> 
        let tailleType = getTaille t in
        let tailleList = List.fold_left (fun init tl -> init + (getTaille tl)) 0 lp in
        (AstPlacement.Retour(e,tailleType,tailleList),0)
      | _ -> failwith "Internal error"
      end
  | AstType.Loop (b,info) ->
    let nb = analyse_placement_bloc b dep reg in
    (AstPlacement.Loop(nb,info),0)
  | AstType.Break info -> (AstPlacement.Break(info),0)
  | AstType.Continue info -> (AstPlacement.Continue(info),0)


(* analyse_placement_bloc :  AstType.bloc -> int -> String -> AstPlacement.bloc *)
(* Paramètre li : liste d'instructions à analyser *)
(* Paramètre dep : le déplacement actuel au début de le bloc pour le placement *)
(* Paramètre reg : règle où est placée le bloc *)
(* Tranforme le bloc en un bloc de type AstPlacement.bloc *)
and analyse_placement_bloc li dep reg =
  match li with
  | [] -> ([],0)
  | hd::tl -> 
    begin
      let (nhd,thd) = analyse_placement_instruction hd dep reg in
      let (ntl,ttl) = analyse_placement_bloc tl (dep+thd) reg in
      (nhd::ntl,thd+ttl)
    end


(* placement_list_param_fun : info_ast list -> String -> int -> info_ast list*)
(* Paramètre liste : liste des paramètres à placer *)
(* Paramètre reg : règle où placer les paramiètres *)
(* Paramètre dep : déplacement actuel dans le placement dans la règle *)
(* Place les infos des paramètres d'une fonction dans la règle *)
let rec placement_list_param_fun liste reg dep =
  match liste with
  | [] -> []
  | hd::tl -> 
    begin 
      match info_ast_to_info hd with
      | InfoVar (_,t,_,_) ->
        let depVar = dep-getTaille(t) in
        modifier_adresse_variable depVar reg hd;
        hd::(placement_list_param_fun tl reg depVar)
      | _ -> failwith "Internal error"
    end


(* analyse_placement_fonction : tds -> AstSyntax.fonction -> AstPlacement.fonction *)
(* Paramètre reg : règle où est placée la fonction *)
(* Paramètre (AstType.Fonction(info,lp,b)) : la fonction à analyser *)
(* Tranforme la fonction en une instruction de type AstPlacement.fonction *)
let analyse_placement_fonction reg (AstType.Fonction(info,lp,b))  =
    
  let nb = analyse_placement_bloc b 3 reg in
  let nlp = placement_list_param_fun (List.rev lp) reg 0 in
  AstPlacement.Fonction(info,(List.rev nlp),nb)
            
             



        


(* analyser : AstType.programme -> AstPlacement.programme *)
(* Paramètre : le programme à analyser *)
(* Réalise le placement des informations et tranforme le programme
en un programme de type AstPlacement.programme *)
let analyser (AstType.Programme (fonctions,prog)) =
  
  let nf = List.map (analyse_placement_fonction "LB") fonctions in
  let nb = analyse_placement_bloc prog 0 "SB" in
  AstPlacement.Programme (nf,nb)
