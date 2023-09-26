%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

%token UL_PAROUV UL_PARFER
%token UL_PT UL_VIRG
%token UL_COUPURE 
%token UL_NEGATION 
%token UL_DEDUCTION
%token UL_FAIL

/* Defini le type des donnees associees a l'unite lexicale */

%token <string> UL_SYMBOLE
%token <string> UL_VARIABLE

/* Unite lexicale particuliere qui represente la fin du fichier */

%token UL_FIN

/* Type renvoye pour le nom terminal document */
%type <unit> programme

/* Le non terminal document est l'axiome */
%start programme

%% /* Regles de productions */

programme : regle suite_regle UL_FIN { (print_endline "programme : regle suite_regle FIN ") }

regle : axiome { (print_endline "regle : axiome") }
        | deduction { (print_endline "regle : deduction") }

suite_regle : {(print_endline "suite_regle : /* Lambda, mot vide */")}
             | regle { (print_endline "suite_regle : regle") }


terme : UL_SYMBOLE termeVideOuAutre { (print_endline "terme : symbole termeVideOuAutre ")}

termeVideOuAutre : {(print_endline "termeVideOuAutre : /* Lambda, mot vide */")}
                    | UL_PAROUV termeOuVar termeOuVarVir UL_PARFER {(print_endline "termeVideOuAutre : parouv termeOuVar termeOuVarVir parfer")}

termeOuVar : UL_VARIABLE {(print_endline "termeOuVar : variable")} 
            | terme {(print_endline "termeOuVar : terme")}

termeOuVarVir : {(print_endline "termeOuVarVir : /* Lambda, mot vide */")}
                | UL_VIRG termeOuVar termeOuVarVir {(print_endline "termeOuVarVir : virg termeOuVar termeOuVarVir")}

predicat : UL_SYMBOLE UL_PAROUV UL_PAROUV termeOuVar termeOuVarVir UL_PARFER {(print_endline "predicat : parouv termeOuVar termeOuVarVir parfer")}

deduction : predicat UL_DEDUCTION deductionMultiple deductionMultipleVir UL_PT {(print_endline "deducation : predicat symboleDeduction deductionMultiple deductionMultipleVir pt")}

deductionMultiple : negationOuVide predicat {(print_endline "deductionMultiple : negationOuVide predicat")}
                    | UL_FAIL  {(print_endline "deductionMultiple : fail")}
                    | UL_COUPURE {(print_endline "deductionMultiple : coupure")}

negationOuVide : {(print_endline "negationOuVide : /* Lambda, mot vide */")}
                | UL_NEGATION {(print_endline "negationOuVide : negation")}

deductionMultipleVir : {(print_endline "deductionMultipleVir : /* Lambda, mot vide */")}
                | UL_VIRG deductionMultiple deductionMultipleVir {(print_endline "deductionMultipleVir : virg deductionMultiple deductionMultipleVir")}

axiome : predicat UL_PT {(print_endline "axiome : predicat pt")}
%%
