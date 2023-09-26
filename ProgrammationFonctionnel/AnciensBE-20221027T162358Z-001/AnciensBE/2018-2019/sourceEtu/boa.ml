
module type Regle =
sig
  type tid = int
  type td
  val id : tid
  
  val appliquer : td -> td list
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