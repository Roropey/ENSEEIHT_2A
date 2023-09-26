(* Module de la passe de gestion des types *)
(* doit être conforme à l'interface Passe *)
open Tds
open Type
open Exceptions
open Ast

type t1 = Ast.AstTds.programme
type t2 = Ast.AstType.programme

(* analyse_type_affectable : AstTds.affectable -> AstType.affectable *)
(* Paramètre af : l'affectable à analyser *)
(* Vérifie la bonne utilisation des types et tranforme l'affectable
en une affectable de type AstType.affectable *)
(* Erreur si mauvaise utilisation des types *)
let rec analyse_type_affectable af =
  match af with
  | AstTds.Deref aff ->
    begin
      match analyse_type_affectable aff with
      | (Pointeur t, naff) -> (t,AstType.Deref(naff))
      | (t,_) -> raise (TypeNonPointeur t)
    end
  | AstTds.Ident info ->
    begin
      match info_ast_to_info info with
      | InfoVar (_,t,_,_) -> (t,AstType.Ident(info))      
      | InfoConst _ -> (Int,AstType.Ident(info))
      | _ -> failwith "Internal Error"
    end
  

(* analyse_type_expression : AstTds.expression -> AstType.expression *)
(* Paramètre e : l'expression à analyser *)
(* Vérifie la bonne utilisation des types et tranforme l'expression
en une expression de type AstType.expression *)
(* Erreur si mauvaise utilisation des types *)
let rec analyse_type_expression e = 
  match e with
   | AstTds.Affectable af -> 
    let (ta,na) = analyse_type_affectable af in
    (ta,AstType.Affectable(na))     
     
  | AstTds.Booleen b -> 
      (Bool,AstType.Booleen (b))
  | AstTds.Entier e ->
      (Int,AstType.Entier(e))
  | AstTds.Unaire (unaire,e) -> 
    begin    
    let (te, ne) = analyse_type_expression e in
    match te with
    | Rat -> 
      begin
      match unaire with
      | Numerateur -> (Int,AstType.Unaire (Numerateur,ne))
      | Denominateur -> (Int,AstType.Unaire (Denominateur,ne))
    end
    | _ -> raise(TypeInattendu (te,Rat))
    end    
  | AstTds.Binaire (binaire, e1, e2) ->  
    begin  
      let (te2,ne2) = analyse_type_expression e2 in
      let (te1,ne1) = analyse_type_expression e1 in
      if (est_compatible te1 te2) then
        begin
        match (te1,binaire) with        
        | Int, Fraction -> (Rat,AstType.Binaire(Fraction,ne1,ne2))
        | Int, Plus -> (Int,AstType.Binaire(PlusInt,ne1,ne2))
        | Rat, Plus -> (Rat,AstType.Binaire(PlusRat,ne1,ne2))
        | Int, Mult -> (Int,AstType.Binaire(MultInt,ne1,ne2))
        | Rat, Mult -> (Rat,AstType.Binaire(MultRat,ne1,ne2))
        | Int, Equ -> (Bool,AstType.Binaire(EquInt,ne1,ne2))
        | Bool, Equ -> (Bool,AstType.Binaire(EquBool,ne1,ne2))
        | Int, Inf -> (Bool,AstType.Binaire(Inf,ne1,ne2))
        | _ -> raise (TypeBinaireInattendu (binaire, te1, te2))
        end
      else raise(TypeBinaireInattendu (binaire,te1,te2))
  
    end
    
  
  | AstTds.AppelFonction (info,eliste) -> 
    let sepExpr = fun  (_,e) -> e in
    let sepTyp = fun  (t,_) -> t in
    let teneliste = List.map analyse_type_expression eliste in
    let neliste = List.map sepExpr teneliste in
    let teliste = List.map sepTyp teneliste in
    begin
    match info_ast_to_info info with    
    | InfoFun (_,t,tl) -> 
      begin
        if (est_compatible_list tl teliste) then
          (t,AstType.AppelFonction(info,neliste))
        else
          raise (TypesParametresInattendus(teliste,tl))
        end
    | _ -> failwith "Internal error"
      end
  | AstTds.Null -> (Pointeur(Undefined),AstType.Null)
  | AstTds.New t -> (Pointeur t, AstType.New(t))
  | AstTds.Adresse info ->  
    begin
    match info_ast_to_info info with          
      | InfoVar(_,t,_,_) -> (Pointeur t, AstType.Adresse(info))
      | _ -> failwith "Internal Error"
    end
  | AstTds.Ternaire (eC,e1,e2) ->
    begin
      let (tec,nec) = analyse_type_expression eC in
        if (est_compatible tec Bool) then
          begin
          let (te1,ne1) = analyse_type_expression e1 in
          let (te2,ne2) = analyse_type_expression e2 in
          if (est_compatible te1 te2) then 
            (te1,AstType.Ternaire (nec, ne1, ne2))            
          else 
            raise(TypeInattendu (te1,te2))
          end
        else
          raise(TypeInattendu (tec,Bool))
      end


(* analyse_type_instruction : AstTds.instruction -> AstType.instruction *)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des types et tranforme l'instruction
en une instruction de type AstType.instruction *)
(* Erreur si mauvaise utilisation des types *)
let rec analyse_type_instruction i =
  match i with
  | AstTds.Declaration (t,info,e) ->
    begin
      let (te,ne) = analyse_type_expression e in
      if (est_compatible t te) then
        begin 
        modifier_type_variable t info;
        AstType.Declaration(info,ne)
        end
      else 
        raise (TypeInattendu (te,t))
    end
    
  | AstTds.Affectation (af,e) ->
    begin
      let (ta,na) = analyse_type_affectable af in
      let (te,ne) = analyse_type_expression e in
      if (est_compatible ta te) then
        AstType.Affectation(na,ne)          
      else
        raise (TypeInattendu (te,ta))
      
      
    end
  | AstTds.Empty ->
      AstType.Empty
       
  | AstTds.Affichage e ->
    begin
    let (te,ne) = analyse_type_expression e in
    match te with
    | Int -> AstType.AffichageInt(ne)
    | Rat -> AstType.AffichageRat(ne)
    | Bool -> AstType.AffichageBool(ne)
    | _ -> failwith "Internal error"
    end
  | AstTds.Conditionnelle (ec,b1,b2) ->
    begin
      let (te,ne) = analyse_type_expression ec in
        if (est_compatible te Bool) then
          begin
          let nb1 = analyse_type_bloc b1 in
          let nb2 = analyse_type_bloc b2 in
          AstType.Conditionnelle (ne, nb1, nb2)
          end
        else
          raise(TypeInattendu (te,Bool))
      end
| AstTds.TantQue (ec,b) ->
    begin
    let (te,ne) = analyse_type_expression ec in
      if (est_compatible te Bool) then
        begin
        let nb = analyse_type_bloc b in
        AstType.TantQue (ne, nb)
          end
      else
        raise(TypeInattendu(te,Bool))
    end
  | AstTds.Retour (e,info) ->
    begin
      let (te,ne) = analyse_type_expression e in
      match info_ast_to_info info with
      | InfoFun (_,t,_) ->
        begin
          if (est_compatible t te) then
            AstType.Retour (ne,info)
          else
            raise (TypeInattendu(te,t))
        end
      | _ -> failwith "Internal error"
      end
  | AstTds.Loop (b,info) ->
    let nb = analyse_type_bloc b in
    AstType.Loop(nb,info)
  | AstTds.Break info -> AstType.Break info
  | AstTds.Continue info -> AstType.Continue (info)
  


(* analyse_type_bloc :  AstTds.bloc -> AstType.bloc *)
(* Paramètre li : liste d'instructions à analyser *)
(* Vérifie la bonne utilisation des types et tranforme le bloc en un bloc de type AstType.bloc *)
and analyse_type_bloc li =  
   List.map (analyse_type_instruction) li

(* modif_param_fun : (typ * info_ast) list -> info_ast list *)
(* Paramètre liste : liste de couple typ info des paramètres *)
(* Transforme la liste de couples des paramètres en une liste d'info_ast *)
let rec modif_param_fun liste =
  match liste with
  | [] -> []
  | (t,info)::tl ->
    begin
      modifier_type_variable t info;
      info::(modif_param_fun tl)
    end

(* recup_list_param : (typ * info_ast) list -> typ list *)
(* Paramètre liste : liste de couple typ info des paramètres *)
(* Récupère la liste des typ des paramètres à partir de la liste des couples typ info *) 
let rec recup_list_param liste =
  match liste with
  | [] -> []
  | (t,_)::tl ->
    t::(recup_list_param tl)

(* analyse_tds_fonction : tds -> AstTds.fonction -> AstType.fonction *)
(* Paramètre() AstTds.Fonction(t,info,lp,b)) : la fonction à analyser *)
(* Vérifie la bonne utilisation des types et tranforme la fonction
en une fonction de type AstType.fonction *)
(* Erreur si mauvaise utilisation des types *)
let analyse_type_fonction (AstTds.Fonction(t,info,lp,b))  =
  let tp = recup_list_param lp in
  modifier_type_fonction t tp info;
  let nlp = modif_param_fun lp in
  let nb = analyse_type_bloc b in
  AstType.Fonction(info,nlp,nb)          

(* analyser : AstTds.programme -> AstType.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des types et tranforme le programme
en un programme de type AstType.programme *)
(* Erreur si mauvaise utilisation des types *)
let analyser (AstTds.Programme (fonctions,prog)) =
  
  let nf = List.map (analyse_type_fonction) fonctions in
  let nb = analyse_type_bloc prog in
  AstType.Programme (nf,nb)
