(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Exceptions
open Ast
open Stack

type t1 = Ast.AstSyntax.programme
type t2 = Ast.AstTds.programme

(* analyse_tds_affectable : tds -> AstSyntax.affectable -> AstTds.affectable *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre af : l'affectable à analyser *)
(* Paramètre modif : booléen indiquant si l'affectable est modifié ou non *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'affectable
en une affectable de type AstTds.affectable *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_affectable tds af modif =
  match af with  
  | AstSyntax.Deref affectee -> AstTds.Deref(analyse_tds_affectable tds affectee false)
  | AstSyntax.Ident n -> 
    begin
      match chercherGlobalement tds n  with
      | Some info -> 
        begin
          match info_ast_to_info info with          
          | InfoVar _ -> AstTds.Ident(info)
          | InfoConst _ -> 
            begin
              if modif then raise(MauvaiseUtilisationIdentifiant n)
              else AstTds.Ident(info)
            end
          | _ -> raise(MauvaiseUtilisationIdentifiant n)
        end
      | None -> raise(IdentifiantNonDeclare n)
    end



(* analyse_tds_expression : tds -> AstSyntax.expression -> AstTds.expression *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre e : l'expression à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'expression
en une expression de type AstTds.expression *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_expression tds e = 
  match e with
    | AstSyntax.Affectable af -> 
      AstTds.Affectable(analyse_tds_affectable tds af false)
    | AstSyntax.Booleen b ->
      AstTds.Booleen(b)
    | AstSyntax.Entier e ->
      AstTds.Entier(e)
    | AstSyntax.Unaire (unaire,e) ->      
      let ne = analyse_tds_expression tds e in
      AstTds.Unaire (unaire,ne);      
    | AstSyntax.Binaire (binaire, e1, e2) ->    
      let ne2 = analyse_tds_expression tds e2 in
      let ne1 = analyse_tds_expression tds e1 in
      AstTds.Binaire(binaire,ne1,ne2);      
    | AstSyntax.AppelFonction (n,liste)-> 
      begin
        match chercherGlobalement tds n  with
        | Some info -> 
          begin
            match info_ast_to_info info with
            | InfoFun _ -> let listne = List.map (analyse_tds_expression tds) liste in
                              AstTds.AppelFonction(info,listne)
            | _ -> raise(MauvaiseUtilisationIdentifiant n)
          end
        | None -> raise(IdentifiantNonDeclare n)
      end
    | AstSyntax.Null -> AstTds.Null
    | AstSyntax.New t -> AstTds.New(t)
    | AstSyntax.Adresse n -> 
      begin
        match chercherGlobalement tds n  with
        | Some info -> 
          begin
            match info_ast_to_info info with
            | InfoVar _ -> AstTds.Adresse(info)
            | _ -> raise(MauvaiseUtilisationIdentifiant n)
          end           
        | None -> raise(IdentifiantNonDeclare n)
      end
    | AstSyntax.Ternaire (eC,e1,e2) ->
      let ne2 = analyse_tds_expression tds e2 in
      let ne1 = analyse_tds_expression tds e1 in
      let neC = analyse_tds_expression tds eC in
      AstTds.Ternaire(neC,ne1,ne2)

(* getNomLoop : unit -> string *)
(* Génération de nom de loop à l'aide d'un compteur *)
let getNomLoop = 
  let num = ref 0 in
  fun () ->
    num := (!num)+1 ;
    "loop"^((string_of_int (!num)))

(* Gestion de la pile *)
(* remove_pile : info_ast t -> unit *)
(* Paramètre pile : la pile dont on veut enlever le sommet *)
(* Enlève le sommet de la pile sans le renvoyer *)
let remove_pile pile =
  let _ = pop_opt pile in
  ()

let%test _ =
  let pile = Stack.create() in
  push 1 pile;
  remove_pile pile;
  (pop_opt pile) = None

let%test _ =
  let pile = Stack.create() in
  push 1 pile;
  push 2 pile;
  remove_pile pile;
  Some 1 = (pop_opt pile)

(* ajouter_pile : info_ast t -> info_ast -> info_ast list*)
(* Paramètre pile : la pile dans laquelle on veut ajouter l'info *)
(* Paramètre info : info à ajouter *)
(* Renvoie la pile avec à son sommet l'information *)
let ajouter_pile pile info =
  begin
    match info_ast_to_info info with
    | InfoLoop _ -> push info pile
    | _ -> failwith "Internal Error"
  end

let%test _ =
  let pile = Stack.create() in
  let info_ast = info_to_info_ast (InfoLoop("loop1","x")) in
  ajouter_pile pile info_ast;
  true

(* id_present_pile : info_ast t -> string -> info_ast *)
(* Paramètre pile : la pile dans laquelle on cherche le nom *)
(* Paramètre n : l'identifiant de la boucle à chercher *)
(* Renvoie la première info_ast correspondant *)
let rec id_present_pile pile n =
  if is_empty pile then None
  else
    let ia = pop pile in
    match info_ast_to_info ia with
    | InfoLoop (_,ninfo) -> 
      begin
        if ninfo = n then Some ia
        else id_present_pile pile n
      end
    | _ -> failwith "Internal Error"



(* analyse_tds_instruction : tds -> info_ast -> option -> info_ast t -> AstSyntax.instruction -> AstTds.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si l'instruction i est dans le bloc principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est l'instruction i sinon *)
(* Paramètre pileLoop : pile contenant les informations des loops*)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'instruction
en une instruction de type AstTds.instruction *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_instruction tds oia pileLoop i =
  match i with
  | AstSyntax.Declaration (t, n, e) ->
      begin
        match chercherLocalement tds n with
        | None ->
            (* L'identifiant n'est pas trouvé dans la tds locale,
            il n'a donc pas été déclaré dans le bloc courant *)
            (* Vérification de la bonne utilisation des identifiants dans l'expression *)
            (* et obtention de l'expression transformée *)
            let ne = analyse_tds_expression tds e in
            (* Création de l'information associée à l'identfiant *)
            let info = InfoVar (n,Undefined, 0, "") in
            (* Création du pointeur sur l'information *)
            let ia = info_to_info_ast info in
            (* Ajout de l'information (pointeur) dans la tds *)
            ajouter tds n ia;
            (* Renvoie de la nouvelle déclaration où le nom a été remplacé par l'information
            et l'expression remplacée par l'expression issue de l'analyse *)
            AstTds.Declaration (t, ia, ne)
        | Some _ ->
            (* L'identifiant est trouvé dans la tds locale,
            il a donc déjà été déclaré dans le bloc courant *)
            raise (DoubleDeclaration n)
      end
  | AstSyntax.Affectation (af,e) ->
        let naf = analyse_tds_affectable tds af true in
        let ne = analyse_tds_expression tds e in
        AstTds.Affectation (naf, ne)
        (*
      begin
        match chercherGlobalement tds n with
        | None ->
          (* L'identifiant n'est pas trouvé dans la tds globale. *)
          raise (IdentifiantNonDeclare n)
        | Some info ->
          (* L'identifiant est trouvé dans la tds globale,
          il a donc déjà été déclaré. L'information associée est récupérée. *)
          begin
            match info_ast_to_info info with
            | InfoVar _ ->
              (* Vérification de la bonne utilisation des identifiants dans l'expression *)
              (* et obtention de l'expression transformée *)
              let ne = analyse_tds_expression tds e in
              (* Renvoie de la nouvelle affectation où le nom a été remplacé par l'information
                 et l'expression remplacée par l'expression issue de l'analyse *)
              
            |  _ ->
              (* Modification d'une constante ou d'une fonction *)
              raise (MauvaiseUtilisationIdentifiant n)
          end
      end*)
  | AstSyntax.Constante (n,v) ->
      begin
        match chercherLocalement tds n with
        | None ->
          (* L'identifiant n'est pas trouvé dans la tds locale,
             il n'a donc pas été déclaré dans le bloc courant *)
          (* Ajout dans la tds de la constante *)
          ajouter tds n (info_to_info_ast (InfoConst (n,v)));
          (* Suppression du noeud de déclaration des constantes devenu inutile *)
          AstTds.Empty
        | Some _ ->
          (* L'identifiant est trouvé dans la tds locale,
          il a donc déjà été déclaré dans le bloc courant *)
          raise (DoubleDeclaration n)
      end
  | AstSyntax.Affichage e ->
      (* Vérification de la bonne utilisation des identifiants dans l'expression *)
      (* et obtention de l'expression transformée *)
      let ne = analyse_tds_expression tds e in
      (* Renvoie du nouvel affichage où l'expression remplacée par l'expression issue de l'analyse *)
      AstTds.Affichage (ne)
  | AstSyntax.Conditionnelle (c,t,e) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc then *)
      let tast = analyse_tds_bloc tds oia pileLoop t  in
      (* Analyse du bloc else *)
      let east = analyse_tds_bloc tds oia pileLoop e  in
      (* Renvoie la nouvelle structure de la conditionnelle *)
      AstTds.Conditionnelle (nc, tast, east)
  | AstSyntax.TantQue (c,b) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc *)
      let bast = analyse_tds_bloc tds oia pileLoop b in
      (* Renvoie la nouvelle structure de la boucle *)
      AstTds.TantQue (nc, bast)
  | AstSyntax.Retour (e) ->
      begin
      (* On récupère l'information associée à la fonction à laquelle le return est associée *)
      match oia with
        (* Il n'y a pas d'information -> l'instruction est dans le bloc principal : erreur *)
      | None -> raise RetourDansMain
        (* Il y a une information -> l'instruction est dans une fonction *)
      | Some ia ->
        (* Analyse de l'expression *)
        let ne = analyse_tds_expression tds e in
        AstTds.Retour (ne,ia)
      end
  | AstSyntax.Loop (li) ->
    let nomLoop = getNomLoop () in
    let info = InfoLoop (nomLoop,"") in
    let ia = info_to_info_ast info in
    ajouter tds nomLoop ia;
    ajouter_pile pileLoop ia;
    let nli = analyse_tds_bloc tds oia pileLoop li in
    remove_pile pileLoop;
    AstTds.Loop(nli,ia)
  | AstSyntax.IdLoop (n,b) ->    
      let nomLoop = getNomLoop () in
      let info = InfoLoop (nomLoop,n) in
      let ia = info_to_info_ast info in
      ajouter tds nomLoop ia;
      ajouter_pile pileLoop ia;
      let nb = analyse_tds_bloc tds oia pileLoop b  in
      remove_pile pileLoop;
      if (id_present_pile (copy pileLoop) n) != None then Printf.eprintf "Warning : Identifiant loop déjà existant";
      AstTds.Loop(nb,ia)
  | AstSyntax.Break -> 
    begin
      match top_opt pileLoop with
      | Some info -> AstTds.Break(info)
      | None -> raise(LoopNonDeclare)
    end
  | AstSyntax.IdBreak (n) ->
    begin
      match id_present_pile pileLoop n with
      | Some info -> 
        AstTds.Break(info) 
      | None ->
        raise (IdentifiantNonDeclare n)
    end
  | AstSyntax.Continue ->
    begin
      match top_opt pileLoop with
      | Some info -> AstTds.Continue(info)
      | None -> raise(LoopNonDeclare)
    end
  | AstSyntax.IdContinue (n) ->
    begin
      match id_present_pile pileLoop n with
      | Some info ->
        AstTds.Continue(info)
      | None ->
        raise (IdentifiantNonDeclare n)
    end


(* analyse_tds_bloc : tds -> info_ast option -> info_ast t -> AstSyntax.bloc -> AstTds.bloc *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si le bloc li est dans le programme principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est le bloc li sinon *)
(* Paramètre pileLoop : pile contenant les informations des loops*)
(* Paramètre li : liste d'instructions à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le bloc en un bloc de type AstTds.bloc *)
(* Erreur si mauvaise utilisation des identifiants *)
and analyse_tds_bloc tds oia pileLoop li  =
  (* Entrée dans un nouveau bloc, donc création d'une nouvelle tds locale
  pointant sur la table du bloc parent *)
  let tdsbloc = creerTDSFille tds in
  (* Copie de la pile d'information de loop *)
  let pile = copy pileLoop in
  (* Analyse des instructions du bloc avec la tds du nouveau bloc.
  Cette tds est modifiée par effet de bord *)
  let nli = List.map (analyse_tds_instruction tdsbloc oia pile) li in
  (* afficher_locale tdsbloc ; *) (* décommenter pour afficher la table locale *)
  nli

let analyse_tds_typ_string tds (t,n) =
match chercherLocalement tds n with
| Some _ -> raise (DoubleDeclaration n)
| _ -> let newinfo = info_to_info_ast (InfoVar (n,Undefined,0,"")) in
        ajouter tds n newinfo;
        (t,newinfo)

(* analyse_tds_fonction : tds -> info_ast t  -> AstSyntax.fonction -> AstTds.fonction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre pileLoop : pile contenant les infos correspondant aux loops *)
(* Paramètre : la fonction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme la fonction
en une fonction de type AstTds.fonction *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyse_tds_fonction maintds pileLoop (AstSyntax.Fonction(t,n,lp,li))   =
    
  match chercherLocalement maintds n with
  | Some _ -> raise (DoubleDeclaration n)
  | None -> let newinfo = info_to_info_ast (InfoFun (n,Undefined,[])) in
            ajouter maintds n newinfo;
            let newtds = creerTDSFille maintds in
            let pileFonc = copy pileLoop in
            let listinfo = List.map (analyse_tds_typ_string newtds) lp in  
            let tdsbloc = analyse_tds_bloc newtds (Some newinfo) pileFonc li in         
            AstTds.Fonction (t,newinfo,listinfo,tdsbloc)
            
            
             



        


(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstSyntax.Programme (fonctions,prog)) =
  let tds = creerTDSMere () in
  let pile = Stack.create () in
  let nf = List.map (analyse_tds_fonction tds pile) fonctions in
  let nb = analyse_tds_bloc tds None pile prog  in
  AstTds.Programme (nf,nb)
