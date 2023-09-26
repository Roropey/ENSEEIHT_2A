open Type 

(* Définition du type des informations associées aux identifiants *)
type info =
  (* Information associée à une constante : son nom (non indispensable mais aide au test et debbugage) et sa valeur *)
  | InfoConst of string * int
  (* Information associée à une variable : son nom (non indispensable mais aide au test et debbugage),
  son type, et son adresse ie son déplacement (int) par rapport à un registre (string) *)
  | InfoVar of string * typ * int * string
  (* Information associée à une fonction : son nom (utile pour l'appel), son type de retour et la liste des types des paramètres *)
  | InfoFun of string * typ * typ list
  
  | InfoLoop of string * string

(* Table des symboles *)
type tds 

(* Données stockées dans la tds et dans les AST : pointeur sur une information *)
type info_ast

(* Création d'une table des symboles à la racine *)
val creerTDSMere : unit -> tds 

(* Création d'une table des symboles fille *)
(* Le paramètre est la table mère *)
val creerTDSFille : tds -> tds 

(* Ajoute une information dans la table des symboles locale *)
(* tds : la tds courante *)
(* string : le nom de l'identificateur *)
(* info : l'information à associer à l'identificateur *)
(* Si l'identificateur est déjà présent dans TDS, l'information est écrasée *)
(* retour : unit *)
val ajouter : tds -> string -> info_ast -> unit 

(* Recherche les informations d'un identificateur dans la tds locale *)
(* Ne cherche que dans la tds de plus bas niveau *)
val chercherLocalement : tds -> string -> info_ast option 

(* Recherche les informations d'un identificateur dans la tds globale *)
(* Si l'identificateur n'est pas présent dans la tds de plus bas niveau *)
(* la recherche est effectuée dans sa table mère et ainsi de suite *)
(* jusqu'à trouver (ou pas) l'identificateur *)
val chercherGlobalement : tds -> string -> info_ast option 

(* Affiche la tds locale *)
val afficher_locale : tds -> unit 

(* Affiche la tds locale et récursivement *)
val afficher_globale : tds -> unit 

(* Créer une information à associer à l'AST à partir d'une info *)
val info_to_info_ast : info -> info_ast

(* Récupère l'information associée à un noeud *)
val info_ast_to_info : info_ast -> info

(* Modifie le type si c'est une InfoVar, ne fait rien sinon *)
val modifier_type_variable : typ -> info_ast -> unit

(* Modifie les types de retour et des paramètres si c'est une InfoFun, ne fait rien sinon *)
val modifier_type_fonction : typ -> typ list -> info_ast -> unit

(* Modifie l'emplacement (dépl, registre) si c'est une InfoVar, ne fait rien sinon *)
val modifier_adresse_variable : int -> string -> info_ast -> unit
