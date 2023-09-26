%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

(* A COMPLETER *)

/* Defini le type des donnees associees a l'unite lexicale */

(* A COMPLETER *)

/* Unite lexicale particuliere qui represente la fin du fichier */

%token UL_FIN

/* Type renvoye pour le nom terminal document */
%type <unit> record

/* Le non terminal document est l'axiome */
%start record

%% /* Regles de productions */

record : valeur UL_FIN { (print_endline "record : valeur UL_FIN") }

valeur : { (* A COMPLETER *) }

%%
