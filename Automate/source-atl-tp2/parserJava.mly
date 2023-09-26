%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

(* let nbrVariables = ref 0;; *)

let nbrFonctions = ref 0;;

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

%token IMPORT
%token <string> IDENT TYPEIDENT
%token INT FLOAT BOOL CHAR VOID STRING
%token ACCOUV ACCFER PAROUV PARFER CROOUV CROFER
%token PTVIRG VIRG
%token SI SINON TANTQUE RETOUR
/* Defini le type des donnees associees a l'unite lexicale */
%token <int> ENTIER
%token <float> FLOTTANT
%token <bool> BOOLEEN
%token <char> CARACTERE
%token <string> CHAINE
%token VIDE
%token NOUVEAU
%token ASSIGN
%token OPINF OPSUP OPINFEG OPSUPEG OPEG OPNONEG
%token OPPLUS OPMOINS OPOU
%token OPMULT OPMOD OPDIV OPET
%token OPNON
%token OPPT
/* Unite lexicale particuliere qui represente la fin du fichier */
%token FIN

/* Declarations des regles d'associative et de priorite pour les operateurs */
/* La priorite est croissante de haut en bas */
/* Associatif a droite */
%right ASSIGN /* Priorite la plus faible */
/* Non associatif */
%nonassoc OPINF OPSUP OPINFEG OPSUPEG OPEG OPNONEG
/* Associatif a gauche */
%left OPPLUS OPMOINS OPOU
%left OPMULT OPMOD OPDIV OPET
%right OPNON
%left OPPT PAROUV CROOUV /* Priorite la plus forte */

/* Type renvoye pour le nom terminal fichier */
%type <unit> fichier
%type <int> variables

/* Le non terminal fichier est l'axiome */
%start fichier

%% /* Regles de productions */

fichier : programme FIN { (print_endline "fichier : programme FIN");(print_string "Nombre de fonctions : ");(print_int !nbrFonctions);(print_newline()) }

programme : /* Lambda, mot vide */ { (nbrFonctions := 0); (print_endline "programme : /* Lambda, mot vide */") }
          | fonction programme { (nbrFonctions := !nbrFonctions + 1);(print_endline "programme : fonction programme") }

typeStruct : typeBase declTab { (print_endline "typeStruct : typeBase declTab") }

typeBase : INT { (print_endline "typeBase : INT") }
         | FLOAT { (print_endline "typeBase : FLOAT") }
         | BOOL { (print_endline "typeBase : BOOL") }
         | CHAR { (print_endline "typeBase : CHAR") }
         | STRING { (print_endline "typeBase : STRING") }
         | TYPEIDENT { (print_endline "typeBase : TYPEIDENT") }

declTab : /* Lambda, mot vide */ { (print_endline "declTab : /* Lambda, mot vide */") }
        | CROOUV CROFER { (print_endline "declTab : CROOUV CROFER") }

fonction : entete bloc  { (print_endline "fonction : entete bloc") }

entete : typeStruct IDENT PAROUV parsFormels PARFER { (print_endline "entete : typeStruct IDENT PAROUV parsFormels PARFER") }
       | VOID IDENT PAROUV parsFormels PARFER { (print_endline "entete : VOID IDENT PAROUV parsFormels PARFER") }

parsFormels : /* Lambda, mot vide */ { (print_endline "parsFormels : /* Lambda, mot vide */") }
            | typeStruct IDENT suiteParsFormels { (print_endline "parsFormels : typeStruct IDENT suiteParsFormels") }

suiteParsFormels : /* Lambda, mot vide */ { (print_endline "suiteParsFormels : /* Lambda, mot vide */") }
                 | VIRG typeStruct IDENT suiteParsFormels { (print_endline "suiteParsFormels : VIRG typeStruct IDENT suiteParsFormels") }

bloc : ACCOUV /* $1 */ variables /* $2 */ instructions /* $3 */ ACCFER /* $4 */
     {
	(print_endline "bloc : ACCOUV variables instructions ACCFER");
	(print_string "Nombre de variables = ");
	(print_int $2);
	(print_newline ())
	}

variables : /* Lambda, mot vide */
	  {
		(print_endline "variables : /* Lambda, mot vide */");
		0
		}
          | variable /* $1 */ variables /* $2 */
	  {
		(print_endline "variables : variable variables");
		($2 + 1)
		}

variable : typeStruct IDENT PTVIRG { (print_endline "variable : typeStruct IDENT PTVIRG") }

/* A FAIRE : Completer pour decrire une liste d'instructions eventuellement vide */
instructions : /* Lambda, mot vide */
	  {
		(print_endline "instructions : /* Lambda, mot vide */");
		} | instruction { (print_endline "instructions : instruction") }

/* A FAIRE : Completer pour ajouter les autres formes d'instructions */
instruction : expression PTVIRG { (print_endline "instruction : expression PTVIRG") }
				| RETOUR expression PTVIRG  { (print_endline "instruction : RETURN expression PTVIRG") }
				| TANTQUE PAROUV expression PARFER bloc { (print_endline "instruction : TANTQUE expression corps") }
				| SI PAROUV expression PARFER bloc elseCorps { (print_endline "instruction : SI expression corps ELSE") }

elseCorps : /* Lambda, mot vide */
	  {
		(print_endline "elseCorps : /* Lambda, mot vide */");
		} | SINON bloc {
		(print_endline "elseCorps : SINON corps");
		
		}
					

/* A FAIRE : Completer pour ajouter les autres formes d'expressions 
expression : ENTIER { (print_endline "expression : ENTIER") }
	   | expression OPPLUS expression {(print_endline "expression : expression OPPLUS expression")}
	   
	   | expression OPMULT expression {}
	   
	   | OPPLUS expression %prec OPNON {}
*/
binaire : ASSIGN {(print_endline "binaire : assign")}
		| OPPT {(print_endline "binaire : oppt")}
		| OPPLUS {(print_endline "binaire : opplus")}
		| OPMOINS {(print_endline "binaire : opmoins")}
		|  OPMULT {(print_endline "binaire : opmult")}
		| OPDIV {(print_endline "binaire : opdiv")}
		| OPMOD {(print_endline "binaire : opmod")}
		| OPOU {(print_endline "binaire : opou")}
		| OPET {(print_endline "binaire : opet")}
		| OPEG {(print_endline "binaire : opeg")}
		| OPNONEG {(print_endline "binaire : opnoneg")}
		| OPINF {(print_endline "binaire : opinf")}
		| OPSUP {(print_endline "binaire : opsup")}
		| OPINFEG {(print_endline "binaire : opinfeg")}
		| OPSUPEG {(print_endline "binaire : opsupeg")}

binaires : /* Lambda, mot vide */
	  {
		(print_endline "binaires : /* Lambda, mot vide */");
		} | binaire binaires {
		(print_endline "binaire : variable binaires");
		
		}

unaire : unaireType
		| OPSUP {(print_endline "unaire : opplus")}
		| OPMOINS {(print_endline "unaire : opmoins")}
		| OPNON {(print_endline "unaire : opnon")}

unaireType : PAROUV typeStruct PARFER {(print_endline "unaireType : typeStruct")}

unaires : /* Lambda, mot vide */
	  {
		(print_endline "unaires : /* Lambda, mot vide */");
		} | unaire unaires {
		(print_endline "unaires : unaire unaires");
		
		}

suffixe : CROOUV expression CROFER {(print_endline "suffixe : croouv expression crofer")}
		| PAROUV suffixeExpression PARFER  {(print_endline "suffixe : expression")}

suffixeExpression : {
		(print_endline "suffixeExpression : /* Lambda, mot vide */");
		} | expression expressionsVir {
		(print_endline "suffixeExpression : expression expressionsVir");
		}

expressionsVir : /* Lambda, mot vide */
	  {
		(print_endline "expressionsVir : /* Lambda, mot vide */");
		} | VIRG expression expressionsVir {
		(print_endline "expressionsVir : virg expression expressions");
		}

expressions : /* Lambda, mot vide */
	  {
		(print_endline "expressions : /* Lambda, mot vide */");
		} | expression expressions {
		(print_endline "expressions : expression expressions");
		}

suffixes : /* Lambda, mot vide */
	  {
		(print_endline "suffixes : /* Lambda, mot vide */");
		} | suffixe suffixes {
		(print_endline "suffixes : suffixe suffixes");
		}

expression : binaires unaires expressionDetail  {(print_endline "expression : expressionDetail")}

expressionDetail : ENTIER {(print_endline "expression : entier")}
				| FLOTTANT {(print_endline "expression : flottant")}
				| CARACTERE {(print_endline "expression : caractère")}
				| BOOLEEN {(print_endline "expression : booléen")}
				| VIDE {(print_endline "expression : vide")}
				| nouveauIndentExpression  {(print_endline "expressionDetail : nouveauIndentExpression")}
				| identExpSuff {(print_endline "expressionDetail : identExpSuff")}

nouveauIndentExpression : NOUVEAU IDENT parOuExpression {(print_endline "nouveauIndentExpression : parOuExpression")}

parOuExpression : PAROUV PARFER {(print_endline "parOuExpression : parouv parfer")}
				| CROOUV expression CROFER {(print_endline "parOuExpression : expression")}

identExpSuff : identOuExpr suffixes {(print_endline "identExpSuff : suffixes")}

identOuExpr : IDENT {(print_endline "identOuExpr : ident")}
			| PAROUV expression PARFER {(print_endline "identOuExpr : expression")}

%%
