
module type Regle =
sig
  (* Type de l'indentifiant *)
  type tid = int
  (* Type des termes appliquer *)
  type td
  (* Identifiant de la règle *)
  val id : tid
  (* Fonction appliquant la règle au paramètre et renvoyant la liste des résultats
   * Type : td -> td list
   * Paramètre : terme auquel on applique la règle
   * Résultat : liste des résultats de la règle
   *  *)
  val appliquer : td -> td list
end


module Regle1 : Regle with type td = char list = 
struct
  type td = char list
  let tid = 1
  let rec appliquer terme =
    match terme with
    | 'O'::tl -> 
    | _::tl -> appliquer tl
    | [] -> []
end



module type ArbreReecriture =
sig
  (*
  type tid = int
  type td
  type arbre_reecriture = ...

  val creer_noeud : ...

  val racine : ...
  val fils : ..

  val appartient : td -> arbre_reecriture -> bool
  *)
end