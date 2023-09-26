
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VOID
    | VIRG
    | VIDE
    | TYPEIDENT of (
# 16 "parserJava.mly"
       (string)
# 18 "parserJava.ml"
  )
    | TANTQUE
    | STRING
    | SINON
    | SI
    | RETOUR
    | PTVIRG
    | PAROUV
    | PARFER
    | OPSUPEG
    | OPSUP
    | OPPT
    | OPPLUS
    | OPOU
    | OPNONEG
    | OPNON
    | OPMULT
    | OPMOINS
    | OPMOD
    | OPINFEG
    | OPINF
    | OPET
    | OPEG
    | OPDIV
    | NOUVEAU
    | INT
    | IMPORT
    | IDENT of (
# 16 "parserJava.mly"
       (string)
# 49 "parserJava.ml"
  )
    | FLOTTANT of (
# 23 "parserJava.mly"
       (float)
# 54 "parserJava.ml"
  )
    | FLOAT
    | FIN
    | ENTIER of (
# 22 "parserJava.mly"
       (int)
# 61 "parserJava.ml"
  )
    | CROOUV
    | CROFER
    | CHAR
    | CHAINE of (
# 26 "parserJava.mly"
       (string)
# 69 "parserJava.ml"
  )
    | CARACTERE of (
# 25 "parserJava.mly"
       (char)
# 74 "parserJava.ml"
  )
    | BOOLEEN of (
# 24 "parserJava.mly"
       (bool)
# 79 "parserJava.ml"
  )
    | BOOL
    | ASSIGN
    | ACCOUV
    | ACCFER
  
end

include MenhirBasics

# 1 "parserJava.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

(* let nbrVariables = ref 0;; *)

let nbrFonctions = ref 0;;


# 102 "parserJava.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_fichier) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: fichier. *)

  | MenhirState003 : (('s, _menhir_box_fichier) _menhir_cell1_VOID _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_state
    (** State 003.
        Stack shape : VOID IDENT.
        Start symbol: fichier. *)

  | MenhirState011 : (('s _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_state
    (** State 011.
        Stack shape : IDENT typeStruct IDENT.
        Start symbol: fichier. *)

  | MenhirState012 : ((('s, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_cell1_VIRG, _menhir_box_fichier) _menhir_state
    (** State 012.
        Stack shape : typeStruct IDENT VIRG.
        Start symbol: fichier. *)

  | MenhirState014 : (((('s, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_cell1_VIRG, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_state
    (** State 014.
        Stack shape : typeStruct IDENT VIRG typeStruct IDENT.
        Start symbol: fichier. *)

  | MenhirState025 : (('s, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_state
    (** State 025.
        Stack shape : typeStruct IDENT.
        Start symbol: fichier. *)

  | MenhirState030 : (('s, _menhir_box_fichier) _menhir_cell1_fonction, _menhir_box_fichier) _menhir_state
    (** State 030.
        Stack shape : fonction.
        Start symbol: fichier. *)

  | MenhirState032 : (('s, _menhir_box_fichier) _menhir_cell1_entete, _menhir_box_fichier) _menhir_state
    (** State 032.
        Stack shape : entete.
        Start symbol: fichier. *)

  | MenhirState033 : (('s, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_state
    (** State 033.
        Stack shape : ACCOUV.
        Start symbol: fichier. *)

  | MenhirState034 : ((('s, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_state
    (** State 034.
        Stack shape : ACCOUV variables.
        Start symbol: fichier. *)

  | MenhirState036 : (((('s, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_TANTQUE, _menhir_box_fichier) _menhir_state
    (** State 036.
        Stack shape : ACCOUV variables TANTQUE.
        Start symbol: fichier. *)

  | MenhirState053 : ((((('s, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_TANTQUE, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_state
    (** State 053.
        Stack shape : ACCOUV variables TANTQUE expression.
        Start symbol: fichier. *)

  | MenhirState055 : (('s, _menhir_box_fichier) _menhir_cell1_binaires, _menhir_box_fichier) _menhir_state
    (** State 055.
        Stack shape : binaires.
        Start symbol: fichier. *)

  | MenhirState056 : (('s, _menhir_box_fichier) _menhir_cell1_PAROUV, _menhir_box_fichier) _menhir_state
    (** State 056.
        Stack shape : PAROUV.
        Start symbol: fichier. *)

  | MenhirState064 : ((('s, _menhir_box_fichier) _menhir_cell1_binaires, _menhir_box_fichier) _menhir_cell1_unaires, _menhir_box_fichier) _menhir_state
    (** State 064.
        Stack shape : binaires unaires.
        Start symbol: fichier. *)

  | MenhirState067 : (('s, _menhir_box_fichier) _menhir_cell1_binaire, _menhir_box_fichier) _menhir_state
    (** State 067.
        Stack shape : binaire.
        Start symbol: fichier. *)

  | MenhirState073 : ((('s, _menhir_box_fichier) _menhir_cell1_binaires, _menhir_box_fichier) _menhir_cell1_unaires _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_state
    (** State 073.
        Stack shape : binaires unaires IDENT.
        Start symbol: fichier. *)

  | MenhirState083 : ((('s, _menhir_box_fichier) _menhir_cell1_binaires, _menhir_box_fichier) _menhir_cell1_unaires _menhir_cell0_identOuExpr, _menhir_box_fichier) _menhir_state
    (** State 083.
        Stack shape : binaires unaires identOuExpr.
        Start symbol: fichier. *)

  | MenhirState084 : (('s, _menhir_box_fichier) _menhir_cell1_PAROUV, _menhir_box_fichier) _menhir_state
    (** State 084.
        Stack shape : PAROUV.
        Start symbol: fichier. *)

  | MenhirState087 : ((('s, _menhir_box_fichier) _menhir_cell1_PAROUV, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_state
    (** State 087.
        Stack shape : PAROUV expression.
        Start symbol: fichier. *)

  | MenhirState088 : ((('s, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_cell1_VIRG, _menhir_box_fichier) _menhir_state
    (** State 088.
        Stack shape : expression VIRG.
        Start symbol: fichier. *)

  | MenhirState089 : (((('s, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_cell1_VIRG, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_state
    (** State 089.
        Stack shape : expression VIRG expression.
        Start symbol: fichier. *)

  | MenhirState092 : (('s, _menhir_box_fichier) _menhir_cell1_CROOUV, _menhir_box_fichier) _menhir_state
    (** State 092.
        Stack shape : CROOUV.
        Start symbol: fichier. *)

  | MenhirState096 : (('s, _menhir_box_fichier) _menhir_cell1_suffixe, _menhir_box_fichier) _menhir_state
    (** State 096.
        Stack shape : suffixe.
        Start symbol: fichier. *)

  | MenhirState101 : (('s, _menhir_box_fichier) _menhir_cell1_unaire, _menhir_box_fichier) _menhir_state
    (** State 101.
        Stack shape : unaire.
        Start symbol: fichier. *)

  | MenhirState104 : (((('s, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_SI, _menhir_box_fichier) _menhir_state
    (** State 104.
        Stack shape : ACCOUV variables SI.
        Start symbol: fichier. *)

  | MenhirState106 : ((((('s, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_SI, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_state
    (** State 106.
        Stack shape : ACCOUV variables SI expression.
        Start symbol: fichier. *)

  | MenhirState108 : (((((('s, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_SI, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_cell1_bloc, _menhir_box_fichier) _menhir_state
    (** State 108.
        Stack shape : ACCOUV variables SI expression bloc.
        Start symbol: fichier. *)

  | MenhirState111 : (((('s, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_RETOUR, _menhir_box_fichier) _menhir_state
    (** State 111.
        Stack shape : ACCOUV variables RETOUR.
        Start symbol: fichier. *)

  | MenhirState119 : (('s, _menhir_box_fichier) _menhir_cell1_variable, _menhir_box_fichier) _menhir_state
    (** State 119.
        Stack shape : variable.
        Start symbol: fichier. *)


and ('s, 'r) _menhir_cell1_binaire = 
  | MenhirCell1_binaire of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_binaires = 
  | MenhirCell1_binaires of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_bloc = 
  | MenhirCell1_bloc of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_entete = 
  | MenhirCell1_entete of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_fonction = 
  | MenhirCell1_fonction of 's * ('s, 'r) _menhir_state * (unit)

and 's _menhir_cell0_identOuExpr = 
  | MenhirCell0_identOuExpr of 's * (unit)

and ('s, 'r) _menhir_cell1_suffixe = 
  | MenhirCell1_suffixe of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_typeBase = 
  | MenhirCell1_typeBase of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_typeStruct = 
  | MenhirCell1_typeStruct of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_unaire = 
  | MenhirCell1_unaire of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_unaires = 
  | MenhirCell1_unaires of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_variable = 
  | MenhirCell1_variable of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_variables = 
  | MenhirCell1_variables of 's * ('s, 'r) _menhir_state * (int)

and ('s, 'r) _menhir_cell1_ACCOUV = 
  | MenhirCell1_ACCOUV of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CROOUV = 
  | MenhirCell1_CROOUV of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 16 "parserJava.mly"
       (string)
# 308 "parserJava.ml"
)

and ('s, 'r) _menhir_cell1_PAROUV = 
  | MenhirCell1_PAROUV of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RETOUR = 
  | MenhirCell1_RETOUR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SI = 
  | MenhirCell1_SI of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TANTQUE = 
  | MenhirCell1_TANTQUE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VIRG = 
  | MenhirCell1_VIRG of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VOID = 
  | MenhirCell1_VOID of 's * ('s, 'r) _menhir_state

and _menhir_box_fichier = 
  | MenhirBox_fichier of (unit) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 137 "parserJava.mly"
                 ((print_endline "binaire : assign"))
# 337 "parserJava.ml"
     : (unit))

let _menhir_action_02 =
  fun () ->
    (
# 138 "parserJava.mly"
         ((print_endline "binaire : oppt"))
# 345 "parserJava.ml"
     : (unit))

let _menhir_action_03 =
  fun () ->
    (
# 139 "parserJava.mly"
           ((print_endline "binaire : opplus"))
# 353 "parserJava.ml"
     : (unit))

let _menhir_action_04 =
  fun () ->
    (
# 140 "parserJava.mly"
            ((print_endline "binaire : opmoins"))
# 361 "parserJava.ml"
     : (unit))

let _menhir_action_05 =
  fun () ->
    (
# 141 "parserJava.mly"
            ((print_endline "binaire : opmult"))
# 369 "parserJava.ml"
     : (unit))

let _menhir_action_06 =
  fun () ->
    (
# 142 "parserJava.mly"
          ((print_endline "binaire : opdiv"))
# 377 "parserJava.ml"
     : (unit))

let _menhir_action_07 =
  fun () ->
    (
# 143 "parserJava.mly"
          ((print_endline "binaire : opmod"))
# 385 "parserJava.ml"
     : (unit))

let _menhir_action_08 =
  fun () ->
    (
# 144 "parserJava.mly"
         ((print_endline "binaire : opou"))
# 393 "parserJava.ml"
     : (unit))

let _menhir_action_09 =
  fun () ->
    (
# 145 "parserJava.mly"
         ((print_endline "binaire : opet"))
# 401 "parserJava.ml"
     : (unit))

let _menhir_action_10 =
  fun () ->
    (
# 146 "parserJava.mly"
         ((print_endline "binaire : opeg"))
# 409 "parserJava.ml"
     : (unit))

let _menhir_action_11 =
  fun () ->
    (
# 147 "parserJava.mly"
            ((print_endline "binaire : opnoneg"))
# 417 "parserJava.ml"
     : (unit))

let _menhir_action_12 =
  fun () ->
    (
# 148 "parserJava.mly"
          ((print_endline "binaire : opinf"))
# 425 "parserJava.ml"
     : (unit))

let _menhir_action_13 =
  fun () ->
    (
# 149 "parserJava.mly"
          ((print_endline "binaire : opsup"))
# 433 "parserJava.ml"
     : (unit))

let _menhir_action_14 =
  fun () ->
    (
# 150 "parserJava.mly"
            ((print_endline "binaire : opinfeg"))
# 441 "parserJava.ml"
     : (unit))

let _menhir_action_15 =
  fun () ->
    (
# 151 "parserJava.mly"
            ((print_endline "binaire : opsupeg"))
# 449 "parserJava.ml"
     : (unit))

let _menhir_action_16 =
  fun () ->
    (
# 154 "parserJava.mly"
   (
		(print_endline "binaires : /* Lambda, mot vide */");
		)
# 459 "parserJava.ml"
     : (unit))

let _menhir_action_17 =
  fun () ->
    (
# 156 "parserJava.mly"
                       (
		(print_endline "binaire : variable binaires");
		
		)
# 470 "parserJava.ml"
     : (unit))

let _menhir_action_18 =
  fun _2 ->
    (
# 88 "parserJava.mly"
     (
	(print_endline "bloc : ACCOUV variables instructions ACCFER");
	(print_string "Nombre de variables = ");
	(print_int _2);
	(print_newline ())
	)
# 483 "parserJava.ml"
     : (unit))

let _menhir_action_19 =
  fun () ->
    (
# 73 "parserJava.mly"
                                 ( (print_endline "declTab : /* Lambda, mot vide */") )
# 491 "parserJava.ml"
     : (unit))

let _menhir_action_20 =
  fun () ->
    (
# 74 "parserJava.mly"
                        ( (print_endline "declTab : CROOUV CROFER") )
# 499 "parserJava.ml"
     : (unit))

let _menhir_action_21 =
  fun () ->
    (
# 121 "parserJava.mly"
   (
		(print_endline "elseCorps : /* Lambda, mot vide */");
		)
# 509 "parserJava.ml"
     : (unit))

let _menhir_action_22 =
  fun () ->
    (
# 123 "parserJava.mly"
                 (
		(print_endline "elseCorps : SINON corps");
		
		)
# 520 "parserJava.ml"
     : (unit))

let _menhir_action_23 =
  fun () ->
    (
# 78 "parserJava.mly"
                                                    ( (print_endline "entete : typeStruct IDENT PAROUV parsFormels PARFER") )
# 528 "parserJava.ml"
     : (unit))

let _menhir_action_24 =
  fun () ->
    (
# 79 "parserJava.mly"
                                              ( (print_endline "entete : VOID IDENT PAROUV parsFormels PARFER") )
# 536 "parserJava.ml"
     : (unit))

let _menhir_action_25 =
  fun () ->
    (
# 206 "parserJava.mly"
                                                ((print_endline "expression : expressionDetail"))
# 544 "parserJava.ml"
     : (unit))

let _menhir_action_26 =
  fun () ->
    (
# 208 "parserJava.mly"
                          ((print_endline "expression : entier"))
# 552 "parserJava.ml"
     : (unit))

let _menhir_action_27 =
  fun () ->
    (
# 209 "parserJava.mly"
               ((print_endline "expression : flottant"))
# 560 "parserJava.ml"
     : (unit))

let _menhir_action_28 =
  fun () ->
    (
# 210 "parserJava.mly"
                ((print_endline "expression : caractère"))
# 568 "parserJava.ml"
     : (unit))

let _menhir_action_29 =
  fun () ->
    (
# 211 "parserJava.mly"
              ((print_endline "expression : booléen"))
# 576 "parserJava.ml"
     : (unit))

let _menhir_action_30 =
  fun () ->
    (
# 212 "parserJava.mly"
           ((print_endline "expression : vide"))
# 584 "parserJava.ml"
     : (unit))

let _menhir_action_31 =
  fun () ->
    (
# 213 "parserJava.mly"
                               ((print_endline "expressionDetail : nouveauIndentExpression"))
# 592 "parserJava.ml"
     : (unit))

let _menhir_action_32 =
  fun () ->
    (
# 214 "parserJava.mly"
                   ((print_endline "expressionDetail : identExpSuff"))
# 600 "parserJava.ml"
     : (unit))

let _menhir_action_33 =
  fun () ->
    (
# 186 "parserJava.mly"
   (
		(print_endline "expressionsVir : /* Lambda, mot vide */");
		)
# 610 "parserJava.ml"
     : (unit))

let _menhir_action_34 =
  fun () ->
    (
# 188 "parserJava.mly"
                                     (
		(print_endline "expressionsVir : virg expression expressions");
		)
# 620 "parserJava.ml"
     : (unit))

let _menhir_action_35 =
  fun () ->
    (
# 59 "parserJava.mly"
                        ( (print_endline "fichier : programme FIN");(print_string "Nombre de fonctions : ");(print_int !nbrFonctions);(print_newline()) )
# 628 "parserJava.ml"
     : (unit))

let _menhir_action_36 =
  fun () ->
    (
# 76 "parserJava.mly"
                        ( (print_endline "fonction : entete bloc") )
# 636 "parserJava.ml"
     : (unit))

let _menhir_action_37 =
  fun () ->
    (
# 221 "parserJava.mly"
                                    ((print_endline "identExpSuff : suffixes"))
# 644 "parserJava.ml"
     : (unit))

let _menhir_action_38 =
  fun () ->
    (
# 223 "parserJava.mly"
                    ((print_endline "identOuExpr : ident"))
# 652 "parserJava.ml"
     : (unit))

let _menhir_action_39 =
  fun () ->
    (
# 224 "parserJava.mly"
                              ((print_endline "identOuExpr : expression"))
# 660 "parserJava.ml"
     : (unit))

let _menhir_action_40 =
  fun () ->
    (
# 115 "parserJava.mly"
                                ( (print_endline "instruction : expression PTVIRG") )
# 668 "parserJava.ml"
     : (unit))

let _menhir_action_41 =
  fun () ->
    (
# 116 "parserJava.mly"
                                ( (print_endline "instruction : RETURN expression PTVIRG") )
# 676 "parserJava.ml"
     : (unit))

let _menhir_action_42 =
  fun () ->
    (
# 117 "parserJava.mly"
                                            ( (print_endline "instruction : TANTQUE expression corps") )
# 684 "parserJava.ml"
     : (unit))

let _menhir_action_43 =
  fun () ->
    (
# 118 "parserJava.mly"
                                                 ( (print_endline "instruction : SI expression corps ELSE") )
# 692 "parserJava.ml"
     : (unit))

let _menhir_action_44 =
  fun () ->
    (
# 110 "parserJava.mly"
   (
		(print_endline "instructions : /* Lambda, mot vide */");
		)
# 702 "parserJava.ml"
     : (unit))

let _menhir_action_45 =
  fun () ->
    (
# 112 "parserJava.mly"
                  ( (print_endline "instructions : instruction") )
# 710 "parserJava.ml"
     : (unit))

let _menhir_action_46 =
  fun () ->
    (
# 216 "parserJava.mly"
                                                        ((print_endline "nouveauIndentExpression : parOuExpression"))
# 718 "parserJava.ml"
     : (unit))

let _menhir_action_47 =
  fun () ->
    (
# 218 "parserJava.mly"
                                ((print_endline "parOuExpression : parouv parfer"))
# 726 "parserJava.ml"
     : (unit))

let _menhir_action_48 =
  fun () ->
    (
# 219 "parserJava.mly"
                               ((print_endline "parOuExpression : expression"))
# 734 "parserJava.ml"
     : (unit))

let _menhir_action_49 =
  fun () ->
    (
# 81 "parserJava.mly"
                                     ( (print_endline "parsFormels : /* Lambda, mot vide */") )
# 742 "parserJava.ml"
     : (unit))

let _menhir_action_50 =
  fun () ->
    (
# 82 "parserJava.mly"
                                                ( (print_endline "parsFormels : typeStruct IDENT suiteParsFormels") )
# 750 "parserJava.ml"
     : (unit))

let _menhir_action_51 =
  fun () ->
    (
# 61 "parserJava.mly"
                                   ( (nbrFonctions := 0); (print_endline "programme : /* Lambda, mot vide */") )
# 758 "parserJava.ml"
     : (unit))

let _menhir_action_52 =
  fun () ->
    (
# 62 "parserJava.mly"
                               ( (nbrFonctions := !nbrFonctions + 1);(print_endline "programme : fonction programme") )
# 766 "parserJava.ml"
     : (unit))

let _menhir_action_53 =
  fun () ->
    (
# 176 "parserJava.mly"
                                   ((print_endline "suffixe : croouv expression crofer"))
# 774 "parserJava.ml"
     : (unit))

let _menhir_action_54 =
  fun () ->
    (
# 177 "parserJava.mly"
                                     ((print_endline "suffixe : expression"))
# 782 "parserJava.ml"
     : (unit))

let _menhir_action_55 =
  fun () ->
    (
# 179 "parserJava.mly"
                    (
		(print_endline "suffixeExpression : /* Lambda, mot vide */");
		)
# 792 "parserJava.ml"
     : (unit))

let _menhir_action_56 =
  fun () ->
    (
# 181 "parserJava.mly"
                                (
		(print_endline "suffixeExpression : expression expressionsVir");
		)
# 802 "parserJava.ml"
     : (unit))

let _menhir_action_57 =
  fun () ->
    (
# 200 "parserJava.mly"
   (
		(print_endline "suffixes : /* Lambda, mot vide */");
		)
# 812 "parserJava.ml"
     : (unit))

let _menhir_action_58 =
  fun () ->
    (
# 202 "parserJava.mly"
                       (
		(print_endline "suffixes : suffixe suffixes");
		)
# 822 "parserJava.ml"
     : (unit))

let _menhir_action_59 =
  fun () ->
    (
# 84 "parserJava.mly"
                                          ( (print_endline "suiteParsFormels : /* Lambda, mot vide */") )
# 830 "parserJava.ml"
     : (unit))

let _menhir_action_60 =
  fun () ->
    (
# 85 "parserJava.mly"
                                                          ( (print_endline "suiteParsFormels : VIRG typeStruct IDENT suiteParsFormels") )
# 838 "parserJava.ml"
     : (unit))

let _menhir_action_61 =
  fun () ->
    (
# 66 "parserJava.mly"
               ( (print_endline "typeBase : INT") )
# 846 "parserJava.ml"
     : (unit))

let _menhir_action_62 =
  fun () ->
    (
# 67 "parserJava.mly"
                 ( (print_endline "typeBase : FLOAT") )
# 854 "parserJava.ml"
     : (unit))

let _menhir_action_63 =
  fun () ->
    (
# 68 "parserJava.mly"
                ( (print_endline "typeBase : BOOL") )
# 862 "parserJava.ml"
     : (unit))

let _menhir_action_64 =
  fun () ->
    (
# 69 "parserJava.mly"
                ( (print_endline "typeBase : CHAR") )
# 870 "parserJava.ml"
     : (unit))

let _menhir_action_65 =
  fun () ->
    (
# 70 "parserJava.mly"
                  ( (print_endline "typeBase : STRING") )
# 878 "parserJava.ml"
     : (unit))

let _menhir_action_66 =
  fun () ->
    (
# 71 "parserJava.mly"
                     ( (print_endline "typeBase : TYPEIDENT") )
# 886 "parserJava.ml"
     : (unit))

let _menhir_action_67 =
  fun () ->
    (
# 64 "parserJava.mly"
                              ( (print_endline "typeStruct : typeBase declTab") )
# 894 "parserJava.ml"
     : (unit))

let _menhir_action_68 =
  fun () ->
    (
# 162 "parserJava.mly"
          ((print_endline "unaire : opplus"))
# 902 "parserJava.ml"
     : (unit))

let _menhir_action_69 =
  fun () ->
    (
# 162 "parserJava.mly"
          ((print_endline "unaire : opplus"))
# 910 "parserJava.ml"
     : (unit))

let _menhir_action_70 =
  fun () ->
    (
# 163 "parserJava.mly"
            ((print_endline "unaire : opmoins"))
# 918 "parserJava.ml"
     : (unit))

let _menhir_action_71 =
  fun () ->
    (
# 164 "parserJava.mly"
          ((print_endline "unaire : opnon"))
# 926 "parserJava.ml"
     : (unit))

let _menhir_action_72 =
  fun () ->
    (
# 166 "parserJava.mly"
                                      ((print_endline "unaireType : typeStruct"))
# 934 "parserJava.ml"
     : (unit))

let _menhir_action_73 =
  fun () ->
    (
# 169 "parserJava.mly"
   (
		(print_endline "unaires : /* Lambda, mot vide */");
		)
# 944 "parserJava.ml"
     : (unit))

let _menhir_action_74 =
  fun () ->
    (
# 171 "parserJava.mly"
                     (
		(print_endline "unaires : unaire unaires");
		
		)
# 955 "parserJava.ml"
     : (unit))

let _menhir_action_75 =
  fun () ->
    (
# 106 "parserJava.mly"
                                   ( (print_endline "variable : typeStruct IDENT PTVIRG") )
# 963 "parserJava.ml"
     : (unit))

let _menhir_action_76 =
  fun () ->
    (
# 96 "parserJava.mly"
   (
		(print_endline "variables : /* Lambda, mot vide */");
		0
		)
# 974 "parserJava.ml"
     : (int))

let _menhir_action_77 =
  fun _2 ->
    (
# 101 "parserJava.mly"
   (
		(print_endline "variables : variable variables");
		(_2 + 1)
		)
# 985 "parserJava.ml"
     : (int))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ACCFER ->
        "ACCFER"
    | ACCOUV ->
        "ACCOUV"
    | ASSIGN ->
        "ASSIGN"
    | BOOL ->
        "BOOL"
    | BOOLEEN _ ->
        "BOOLEEN"
    | CARACTERE _ ->
        "CARACTERE"
    | CHAINE _ ->
        "CHAINE"
    | CHAR ->
        "CHAR"
    | CROFER ->
        "CROFER"
    | CROOUV ->
        "CROOUV"
    | ENTIER _ ->
        "ENTIER"
    | FIN ->
        "FIN"
    | FLOAT ->
        "FLOAT"
    | FLOTTANT _ ->
        "FLOTTANT"
    | IDENT _ ->
        "IDENT"
    | IMPORT ->
        "IMPORT"
    | INT ->
        "INT"
    | NOUVEAU ->
        "NOUVEAU"
    | OPDIV ->
        "OPDIV"
    | OPEG ->
        "OPEG"
    | OPET ->
        "OPET"
    | OPINF ->
        "OPINF"
    | OPINFEG ->
        "OPINFEG"
    | OPMOD ->
        "OPMOD"
    | OPMOINS ->
        "OPMOINS"
    | OPMULT ->
        "OPMULT"
    | OPNON ->
        "OPNON"
    | OPNONEG ->
        "OPNONEG"
    | OPOU ->
        "OPOU"
    | OPPLUS ->
        "OPPLUS"
    | OPPT ->
        "OPPT"
    | OPSUP ->
        "OPSUP"
    | OPSUPEG ->
        "OPSUPEG"
    | PARFER ->
        "PARFER"
    | PAROUV ->
        "PAROUV"
    | PTVIRG ->
        "PTVIRG"
    | RETOUR ->
        "RETOUR"
    | SI ->
        "SI"
    | SINON ->
        "SINON"
    | STRING ->
        "STRING"
    | TANTQUE ->
        "TANTQUE"
    | TYPEIDENT _ ->
        "TYPEIDENT"
    | VIDE ->
        "VIDE"
    | VIRG ->
        "VIRG"
    | VOID ->
        "VOID"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_028 : type  ttv_stack. ttv_stack -> _menhir_box_fichier =
    fun _menhir_stack ->
      let _v = _menhir_action_35 () in
      MenhirBox_fichier _v
  
  let rec _menhir_run_031 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_fonction -> _menhir_box_fichier =
    fun _menhir_stack ->
      let MenhirCell1_fonction (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_52 () in
      _menhir_goto_programme _menhir_stack _menhir_s
  
  and _menhir_goto_programme : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_s ->
      match _menhir_s with
      | MenhirState030 ->
          _menhir_run_031 _menhir_stack
      | MenhirState000 ->
          _menhir_run_028 _menhir_stack
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VOID (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PAROUV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TYPEIDENT _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_66 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
              | STRING ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_65 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_61 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
              | FLOAT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_62 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
              | CHAR ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_64 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
              | BOOL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_63 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
              | PARFER ->
                  let _ = _menhir_action_49 () in
                  _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_016 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typeBase (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | CROOUV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | CROFER ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_20 () in
              _menhir_goto_declTab _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | _ ->
              _eRR ())
      | IDENT _ | PARFER ->
          let _ = _menhir_action_19 () in
          _menhir_goto_declTab _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_declTab : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_typeBase -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_typeBase (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_67 () in
      _menhir_goto_typeStruct _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typeStruct : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState033 ->
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState030 ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState012 ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState025 ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_121 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PTVIRG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_75 () in
              let _menhir_stack = MenhirCell1_variable (_menhir_stack, _menhir_s, _v) in
              (match (_tok : MenhirBasics.token) with
              | TYPEIDENT _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_66 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState119 _tok
              | STRING ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_65 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState119 _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_61 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState119 _tok
              | FLOAT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_62 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState119 _tok
              | CHAR ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_64 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState119 _tok
              | BOOL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_63 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState119 _tok
              | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
                  let _v = _menhir_action_76 () in
                  _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_120 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_variable -> _ -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_variable (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_77 _2 in
      _menhir_goto_variables _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_variables : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState119 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState033 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_034 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_variables (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TANTQUE ->
          let _menhir_stack = MenhirCell1_TANTQUE (_menhir_stack, MenhirState034) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PAROUV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | OPSUPEG ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_15 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPSUP ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_13 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPPT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_02 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPPLUS ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_03 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPOU ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_08 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPNONEG ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_11 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPMULT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_05 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPMOINS ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_04 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPMOD ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_07 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPINFEG ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_14 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPINF ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_12 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPET ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_09 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPEG ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_10 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | OPDIV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_06 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | ASSIGN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_01 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPNON | PAROUV | VIDE ->
                  let _v = _menhir_action_16 () in
                  _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | SI ->
          let _menhir_stack = MenhirCell1_SI (_menhir_stack, MenhirState034) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PAROUV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | OPSUPEG ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_15 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPSUP ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_13 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPPT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_02 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPPLUS ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_03 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPOU ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_08 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPNONEG ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_11 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPMULT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_05 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPMOINS ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_04 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPMOD ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_07 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPINFEG ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_14 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPINF ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_12 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPET ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_09 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPEG ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_10 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | OPDIV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_06 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | ASSIGN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_01 () in
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPNON | PAROUV | VIDE ->
                  let _v = _menhir_action_16 () in
                  _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | RETOUR ->
          let _menhir_stack = MenhirCell1_RETOUR (_menhir_stack, MenhirState034) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | OPSUPEG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_15 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPSUP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_13 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPPT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPPLUS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_03 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPOU ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_08 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPNONEG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_11 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPMULT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPMOINS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPMOD ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPINFEG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_14 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPINF ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_12 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPET ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_09 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPEG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_10 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | OPDIV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | ASSIGN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_01 () in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPNON | PAROUV | VIDE ->
              let _v = _menhir_action_16 () in
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | _ ->
              _eRR ())
      | OPSUPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPSUP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_13 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPPT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPPLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPOU ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPNONEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPMULT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPMOINS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPMOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPINFEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_14 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPINF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_12 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | OPDIV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | ASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPNON | PAROUV | VIDE ->
          let _v = _menhir_action_16 () in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
      | ACCFER ->
          let _ = _menhir_action_44 () in
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_067 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_binaire (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | OPSUPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPSUP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_13 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPPT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPPLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPOU ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPNONEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPMULT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPMOINS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPMOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPINFEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_14 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPINF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_12 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | OPDIV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | ASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
      | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPNON | PAROUV | VIDE ->
          let _ = _menhir_action_16 () in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_068 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_binaire -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_binaire (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_17 () in
      _menhir_goto_binaires _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_binaires : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState067 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState034 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState104 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState092 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState088 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_055 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_binaires (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PAROUV ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | OPNON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_71 () in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055 _tok
      | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | VIDE ->
          let _v = _menhir_action_73 () in
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_056 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PAROUV (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TYPEIDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_66 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState056 _tok
      | STRING ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_65 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState056 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_61 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState056 _tok
      | FLOAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_62 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState056 _tok
      | CHAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_64 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState056 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_63 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState056 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_101 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_unaire (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PAROUV ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | OPSUP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_69 () in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState101 _tok
      | OPNON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_71 () in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState101 _tok
      | OPMOINS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_70 () in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState101 _tok
      | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | VIDE ->
          let _ = _menhir_action_73 () in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_unaire -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_unaire (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_74 () in
      _menhir_goto_unaires _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_unaires : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState101 ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState055 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_062 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_binaires as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_unaires (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VIDE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_30 () in
          _menhir_goto_expressionDetail _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | NOUVEAU ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_17 ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_17) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | PAROUV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | PARFER ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _ = _menhir_action_47 () in
                      _menhir_goto_parOuExpression _menhir_stack _menhir_lexbuf _menhir_lexer _tok
                  | _ ->
                      _eRR ())
              | CROOUV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | OPSUPEG ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_15 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPSUP ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_13 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPPT ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_02 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPPLUS ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_03 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPOU ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_08 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPNONEG ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_11 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPMULT ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_05 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPMOINS ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_04 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPMOD ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_07 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPINFEG ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_14 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPINF ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_12 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPET ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_09 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPEG ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_10 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | OPDIV ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_06 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | ASSIGN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_01 () in
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPNON | PAROUV | VIDE ->
                      let _v = _menhir_action_16 () in
                      _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState073 _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | IDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_38 () in
          _menhir_goto_identOuExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FLOTTANT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_27 () in
          _menhir_goto_expressionDetail _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | ENTIER _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_26 () in
          _menhir_goto_expressionDetail _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | CARACTERE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_28 () in
          _menhir_goto_expressionDetail _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | BOOLEEN _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_29 () in
          _menhir_goto_expressionDetail _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_expressionDetail : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_binaires, _menhir_box_fichier) _menhir_cell1_unaires -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_unaires (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_binaires (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_25 () in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState034 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState111 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState104 ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState092 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState088 ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState064 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState036 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_117 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | PTVIRG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_40 () in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_instruction : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _ = _menhir_action_45 () in
      _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_114 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | ACCFER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_variables (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_ACCOUV (_menhir_stack, _menhir_s) = _menhir_stack in
          let _v = _menhir_action_18 _2 in
          _menhir_goto_bloc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_bloc : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState032 ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState108 ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState106 ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_124 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_entete -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_entete (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_36 () in
      let _menhir_stack = MenhirCell1_fonction (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | TYPEIDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_66 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
      | STRING ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_65 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_61 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
      | FLOAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_62 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
      | CHAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_64 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_63 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
      | FIN ->
          let _ = _menhir_action_51 () in
          _menhir_run_031 _menhir_stack
      | _ ->
          _eRR ()
  
  and _menhir_run_109 : type  ttv_stack. (((((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_SI, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_cell1_bloc -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _ = _menhir_action_22 () in
      _menhir_goto_elseCorps _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_goto_elseCorps : type  ttv_stack. (((((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_SI, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_cell1_bloc -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_bloc (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_SI (_menhir_stack, _) = _menhir_stack in
      let _ = _menhir_action_43 () in
      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_107 : type  ttv_stack. (((((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_SI, _menhir_box_fichier) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bloc (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SINON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ACCOUV ->
              _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
          | _ ->
              _eRR ())
      | ACCFER ->
          let _ = _menhir_action_21 () in
          _menhir_goto_elseCorps _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_033 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ACCOUV (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TYPEIDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_66 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
      | STRING ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_65 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_61 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
      | FLOAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_62 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
      | CHAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_64 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_63 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
      | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
          let _v = _menhir_action_76 () in
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_054 : type  ttv_stack. ((((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_TANTQUE, _menhir_box_fichier) _menhir_cell1_expression -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_expression (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_TANTQUE (_menhir_stack, _) = _menhir_stack in
      let _ = _menhir_action_42 () in
      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_112 : type  ttv_stack. (((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_RETOUR -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | PTVIRG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RETOUR (_menhir_stack, _) = _menhir_stack in
          let _ = _menhir_action_41 () in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_105 : type  ttv_stack. ((((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_SI as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PARFER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ACCOUV ->
              _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_093 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_CROOUV -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | CROFER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_CROOUV (_menhir_stack, _menhir_s) = _menhir_stack in
          let _v = _menhir_action_53 () in
          _menhir_goto_suffixe _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_suffixe : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_suffixe (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PAROUV ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | CROOUV ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | CROFER | PARFER | PTVIRG | VIRG ->
          let _ = _menhir_action_57 () in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_084 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PAROUV (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | OPSUPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPSUP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_13 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPPT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPPLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPOU ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPNONEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPMULT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPMOINS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPMOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPINFEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_14 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPINF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_12 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | OPDIV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | ASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPNON | PAROUV | VIDE ->
          let _v = _menhir_action_16 () in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
      | PARFER ->
          let _ = _menhir_action_55 () in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_PAROUV -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_PAROUV (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_54 () in
      _menhir_goto_suffixe _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_092 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CROOUV (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | OPSUPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPSUP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_13 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPPT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPPLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPOU ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPNONEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPMULT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPMOINS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPMOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPINFEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_14 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPINF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_12 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | OPDIV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | ASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPNON | PAROUV | VIDE ->
          let _v = _menhir_action_16 () in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_suffixe -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_suffixe (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_58 () in
      _menhir_goto_suffixes _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
  
  and _menhir_goto_suffixes : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match _menhir_s with
      | MenhirState096 ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState083 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_095 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_binaires, _menhir_box_fichier) _menhir_cell1_unaires _menhir_cell0_identOuExpr -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell0_identOuExpr (_menhir_stack, _) = _menhir_stack in
      let _ = _menhir_action_37 () in
      let _ = _menhir_action_32 () in
      _menhir_goto_expressionDetail _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_089 : type  ttv_stack. (((ttv_stack, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_cell1_VIRG as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VIRG ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
      | PARFER ->
          let _ = _menhir_action_33 () in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_088 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VIRG (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | OPSUPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPSUP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_13 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPPT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPPLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPOU ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPNONEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPMULT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPMOINS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPMOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPINFEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_14 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPINF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_12 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | OPDIV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | ASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPNON | PAROUV | VIDE ->
          let _v = _menhir_action_16 () in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. (((ttv_stack, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_cell1_VIRG, _menhir_box_fichier) _menhir_cell1_expression -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_expression (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_VIRG (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_34 () in
      _menhir_goto_expressionsVir _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_expressionsVir : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState087 ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState089 ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_091 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_PAROUV, _menhir_box_fichier) _menhir_cell1_expression -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_expression (_menhir_stack, _, _) = _menhir_stack in
      let _ = _menhir_action_56 () in
      _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
  
  and _menhir_run_087 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_PAROUV as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VIRG ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
      | PARFER ->
          let _ = _menhir_action_33 () in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_074 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_binaires, _menhir_box_fichier) _menhir_cell1_unaires _menhir_cell0_IDENT -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | CROFER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_48 () in
          _menhir_goto_parOuExpression _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_parOuExpression : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_binaires, _menhir_box_fichier) _menhir_cell1_unaires _menhir_cell0_IDENT -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell0_IDENT (_menhir_stack, _) = _menhir_stack in
      let _ = _menhir_action_46 () in
      let _ = _menhir_action_31 () in
      _menhir_goto_expressionDetail _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_065 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_binaires, _menhir_box_fichier) _menhir_cell1_unaires -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | PARFER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_goto_identOuExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_identOuExpr : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_binaires, _menhir_box_fichier) _menhir_cell1_unaires -> _ -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_identOuExpr (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | PAROUV ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | CROOUV ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | CROFER | PARFER | PTVIRG | VIRG ->
          let _ = _menhir_action_57 () in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_052 : type  ttv_stack. ((((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_cell1_TANTQUE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PARFER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ACCOUV ->
              _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_057 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_PAROUV -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | PARFER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PAROUV (_menhir_stack, _menhir_s) = _menhir_stack in
          let _ = _menhir_action_72 () in
          let _v = _menhir_action_68 () in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_023 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typeStruct (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PAROUV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TYPEIDENT _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_66 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState025 _tok
              | STRING ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_65 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState025 _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_61 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState025 _tok
              | FLOAT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_62 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState025 _tok
              | CHAR ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_64 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState025 _tok
              | BOOL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_63 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState025 _tok
              | PARFER ->
                  let _ = _menhir_action_49 () in
                  _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_026 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_typeStruct (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_23 () in
      _menhir_goto_entete _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_entete : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_entete (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ACCOUV ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | _ ->
          _eRR ()
  
  and _menhir_run_013 : type  ttv_stack. (((ttv_stack, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_cell1_VIRG as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typeStruct (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VIRG ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | PARFER ->
              let _ = _menhir_action_59 () in
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_012 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT as 'stack) -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VIRG (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TYPEIDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_66 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState012 _tok
      | STRING ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_65 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState012 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_61 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState012 _tok
      | FLOAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_62 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState012 _tok
      | CHAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_64 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState012 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_63 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState012 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_015 : type  ttv_stack. (((ttv_stack, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_cell1_VIRG, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell0_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_typeStruct (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_VIRG (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_60 () in
      _menhir_goto_suiteParsFormels _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_suiteParsFormels : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT as 'stack) -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState011 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState014 ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_020 : type  ttv_stack. (ttv_stack _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell0_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_typeStruct (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_50 () in
      _menhir_goto_parsFormels _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_parsFormels : type  ttv_stack. (ttv_stack _menhir_cell0_IDENT as 'stack) -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState025 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState003 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_021 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_VOID _menhir_cell0_IDENT -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_VOID (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_24 () in
      _menhir_goto_entete _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_010 : type  ttv_stack. (ttv_stack _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typeStruct (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VIRG ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState011
          | PARFER ->
              let _ = _menhir_action_59 () in
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | TYPEIDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_66 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | STRING ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_65 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_61 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | FLOAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_62 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | CHAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_64 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_63 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | FIN ->
          let _ = _menhir_action_51 () in
          _menhir_run_028 _menhir_stack
      | _ ->
          _eRR ()
  
end

let fichier =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_fichier v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 226 "parserJava.mly"
  

# 2678 "parserJava.ml"
