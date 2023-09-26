
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | UL_VIRG
    | UL_VARIABLE of (
# 21 "Parser.mly"
       (string)
# 16 "Parser.ml"
  )
    | UL_SYMBOLE of (
# 20 "Parser.mly"
       (string)
# 21 "Parser.ml"
  )
    | UL_PT
    | UL_PAROUV
    | UL_PARFER
    | UL_NEGATION
    | UL_FIN
    | UL_FAIL
    | UL_DEDUCTION
    | UL_COUPURE
  
end

include MenhirBasics

# 1 "Parser.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 44 "Parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_programme) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: programme. *)

  | MenhirState03 : (('s, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE, _menhir_box_programme) _menhir_state
    (** State 03.
        Stack shape : UL_SYMBOLE.
        Start symbol: programme. *)

  | MenhirState06 : (('s, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE, _menhir_box_programme) _menhir_state
    (** State 06.
        Stack shape : UL_SYMBOLE.
        Start symbol: programme. *)

  | MenhirState07 : ((('s, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE, _menhir_box_programme) _menhir_cell1_termeOuVar, _menhir_box_programme) _menhir_state
    (** State 07.
        Stack shape : UL_SYMBOLE termeOuVar.
        Start symbol: programme. *)

  | MenhirState08 : ((('s, _menhir_box_programme) _menhir_cell1_termeOuVar, _menhir_box_programme) _menhir_cell1_UL_VIRG, _menhir_box_programme) _menhir_state
    (** State 08.
        Stack shape : termeOuVar UL_VIRG.
        Start symbol: programme. *)

  | MenhirState09 : (((('s, _menhir_box_programme) _menhir_cell1_termeOuVar, _menhir_box_programme) _menhir_cell1_UL_VIRG, _menhir_box_programme) _menhir_cell1_termeOuVar, _menhir_box_programme) _menhir_state
    (** State 09.
        Stack shape : termeOuVar UL_VIRG termeOuVar.
        Start symbol: programme. *)

  | MenhirState15 : ((('s, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE, _menhir_box_programme) _menhir_cell1_termeOuVar, _menhir_box_programme) _menhir_state
    (** State 15.
        Stack shape : UL_SYMBOLE termeOuVar.
        Start symbol: programme. *)

  | MenhirState18 : (('s, _menhir_box_programme) _menhir_cell1_regle, _menhir_box_programme) _menhir_state
    (** State 18.
        Stack shape : regle.
        Start symbol: programme. *)

  | MenhirState24 : (('s, _menhir_box_programme) _menhir_cell1_predicat, _menhir_box_programme) _menhir_state
    (** State 24.
        Stack shape : predicat.
        Start symbol: programme. *)

  | MenhirState28 : (('s, _menhir_box_programme) _menhir_cell1_negationOuVide, _menhir_box_programme) _menhir_state
    (** State 28.
        Stack shape : negationOuVide.
        Start symbol: programme. *)

  | MenhirState30 : ((('s, _menhir_box_programme) _menhir_cell1_predicat, _menhir_box_programme) _menhir_cell1_deductionMultiple, _menhir_box_programme) _menhir_state
    (** State 30.
        Stack shape : predicat deductionMultiple.
        Start symbol: programme. *)

  | MenhirState31 : ((('s, _menhir_box_programme) _menhir_cell1_deductionMultiple, _menhir_box_programme) _menhir_cell1_UL_VIRG, _menhir_box_programme) _menhir_state
    (** State 31.
        Stack shape : deductionMultiple UL_VIRG.
        Start symbol: programme. *)

  | MenhirState32 : (((('s, _menhir_box_programme) _menhir_cell1_deductionMultiple, _menhir_box_programme) _menhir_cell1_UL_VIRG, _menhir_box_programme) _menhir_cell1_deductionMultiple, _menhir_box_programme) _menhir_state
    (** State 32.
        Stack shape : deductionMultiple UL_VIRG deductionMultiple.
        Start symbol: programme. *)


and ('s, 'r) _menhir_cell1_deductionMultiple = 
  | MenhirCell1_deductionMultiple of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_negationOuVide = 
  | MenhirCell1_negationOuVide of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_predicat = 
  | MenhirCell1_predicat of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_regle = 
  | MenhirCell1_regle of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_termeOuVar = 
  | MenhirCell1_termeOuVar of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_UL_SYMBOLE = 
  | MenhirCell1_UL_SYMBOLE of 's * ('s, 'r) _menhir_state * (
# 20 "Parser.mly"
       (string)
# 132 "Parser.ml"
)

and ('s, 'r) _menhir_cell1_UL_VIRG = 
  | MenhirCell1_UL_VIRG of 's * ('s, 'r) _menhir_state

and _menhir_box_programme = 
  | MenhirBox_programme of (unit) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 69 "Parser.mly"
                        ((print_endline "axiome : predicat pt"))
# 146 "Parser.ml"
     : (unit))

let _menhir_action_02 =
  fun () ->
    (
# 57 "Parser.mly"
                                                                               ((print_endline "deducation : predicat symboleDeduction deductionMultiple deductionMultipleVir pt"))
# 154 "Parser.ml"
     : (unit))

let _menhir_action_03 =
  fun () ->
    (
# 59 "Parser.mly"
                                            ((print_endline "deductionMultiple : negationOuVide predicat"))
# 162 "Parser.ml"
     : (unit))

let _menhir_action_04 =
  fun () ->
    (
# 60 "Parser.mly"
                               ((print_endline "deductionMultiple : fail"))
# 170 "Parser.ml"
     : (unit))

let _menhir_action_05 =
  fun () ->
    (
# 61 "Parser.mly"
                                 ((print_endline "deductionMultiple : coupure"))
# 178 "Parser.ml"
     : (unit))

let _menhir_action_06 =
  fun () ->
    (
# 66 "Parser.mly"
                       ((print_endline "deductionMultipleVir : /* Lambda, mot vide */"))
# 186 "Parser.ml"
     : (unit))

let _menhir_action_07 =
  fun () ->
    (
# 67 "Parser.mly"
                                                                 ((print_endline "deductionMultipleVir : virg deductionMultiple deductionMultipleVir"))
# 194 "Parser.ml"
     : (unit))

let _menhir_action_08 =
  fun () ->
    (
# 63 "Parser.mly"
                 ((print_endline "negationOuVide : /* Lambda, mot vide */"))
# 202 "Parser.ml"
     : (unit))

let _menhir_action_09 =
  fun () ->
    (
# 64 "Parser.mly"
                              ((print_endline "negationOuVide : negation"))
# 210 "Parser.ml"
     : (unit))

let _menhir_action_10 =
  fun () ->
    (
# 55 "Parser.mly"
                                                                             ((print_endline "predicat : parouv termeOuVar termeOuVarVir parfer"))
# 218 "Parser.ml"
     : (unit))

let _menhir_action_11 =
  fun () ->
    (
# 35 "Parser.mly"
                                     ( (print_endline "programme : regle suite_regle FIN ") )
# 226 "Parser.ml"
     : (unit))

let _menhir_action_12 =
  fun () ->
    (
# 37 "Parser.mly"
               ( (print_endline "regle : axiome") )
# 234 "Parser.ml"
     : (unit))

let _menhir_action_13 =
  fun () ->
    (
# 38 "Parser.mly"
                    ( (print_endline "regle : deduction") )
# 242 "Parser.ml"
     : (unit))

let _menhir_action_14 =
  fun () ->
    (
# 40 "Parser.mly"
              ((print_endline "suite_regle : /* Lambda, mot vide */"))
# 250 "Parser.ml"
     : (unit))

let _menhir_action_15 =
  fun () ->
    (
# 41 "Parser.mly"
                     ( (print_endline "suite_regle : regle") )
# 258 "Parser.ml"
     : (unit))

let _menhir_action_16 =
  fun () ->
    (
# 44 "Parser.mly"
                                    ( (print_endline "terme : symbole termeVideOuAutre "))
# 266 "Parser.ml"
     : (unit))

let _menhir_action_17 =
  fun () ->
    (
# 49 "Parser.mly"
                         ((print_endline "termeOuVar : variable"))
# 274 "Parser.ml"
     : (unit))

let _menhir_action_18 =
  fun () ->
    (
# 50 "Parser.mly"
                    ((print_endline "termeOuVar : terme"))
# 282 "Parser.ml"
     : (unit))

let _menhir_action_19 =
  fun () ->
    (
# 52 "Parser.mly"
                ((print_endline "termeOuVarVir : /* Lambda, mot vide */"))
# 290 "Parser.ml"
     : (unit))

let _menhir_action_20 =
  fun () ->
    (
# 53 "Parser.mly"
                                                   ((print_endline "termeOuVarVir : virg termeOuVar termeOuVarVir"))
# 298 "Parser.ml"
     : (unit))

let _menhir_action_21 =
  fun () ->
    (
# 46 "Parser.mly"
                   ((print_endline "termeVideOuAutre : /* Lambda, mot vide */"))
# 306 "Parser.ml"
     : (unit))

let _menhir_action_22 =
  fun () ->
    (
# 47 "Parser.mly"
                                                                   ((print_endline "termeVideOuAutre : parouv termeOuVar termeOuVarVir parfer"))
# 314 "Parser.ml"
     : (unit))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | UL_COUPURE ->
        "UL_COUPURE"
    | UL_DEDUCTION ->
        "UL_DEDUCTION"
    | UL_FAIL ->
        "UL_FAIL"
    | UL_FIN ->
        "UL_FIN"
    | UL_NEGATION ->
        "UL_NEGATION"
    | UL_PARFER ->
        "UL_PARFER"
    | UL_PAROUV ->
        "UL_PAROUV"
    | UL_PT ->
        "UL_PT"
    | UL_SYMBOLE _ ->
        "UL_SYMBOLE"
    | UL_VARIABLE _ ->
        "UL_VARIABLE"
    | UL_VIRG ->
        "UL_VIRG"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_19 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_regle -> _ -> _menhir_box_programme =
    fun _menhir_stack _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_FIN ->
          let MenhirCell1_regle (_menhir_stack, _, _) = _menhir_stack in
          let _v = _menhir_action_11 () in
          MenhirBox_programme _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_21_spec_18 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_regle -> _ -> _menhir_box_programme =
    fun _menhir_stack _tok ->
      let _ = _menhir_action_15 () in
      _menhir_run_19 _menhir_stack _tok
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_SYMBOLE (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_PAROUV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_PAROUV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_VARIABLE _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_17 () in
                  _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
              | UL_SYMBOLE _v_2 ->
                  _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState03
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_termeOuVar (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | UL_PARFER ->
          let _ = _menhir_action_19 () in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_termeOuVar as 'stack) -> _ -> _ -> ('stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_VIRG (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_VARIABLE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
      | UL_SYMBOLE _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. (((ttv_stack, _menhir_box_programme) _menhir_cell1_termeOuVar, _menhir_box_programme) _menhir_cell1_UL_VIRG as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_termeOuVar (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | UL_PARFER ->
          let _ = _menhir_action_19 () in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. (((ttv_stack, _menhir_box_programme) _menhir_cell1_termeOuVar, _menhir_box_programme) _menhir_cell1_UL_VIRG, _menhir_box_programme) _menhir_cell1_termeOuVar -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_termeOuVar (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_UL_VIRG (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_20 () in
      _menhir_goto_termeOuVarVir _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_termeOuVarVir : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_termeOuVar as 'stack) -> _ -> _ -> ('stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState15 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState07 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_16 : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE, _menhir_box_programme) _menhir_cell1_termeOuVar -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_termeOuVar (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_UL_SYMBOLE (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_10 () in
      _menhir_goto_predicat _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_predicat : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState28 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState00 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState18 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_29 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_negationOuVide -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_negationOuVide (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_03 () in
      _menhir_goto_deductionMultiple _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_deductionMultiple : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState31 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState24 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_32 : type  ttv_stack. (((ttv_stack, _menhir_box_programme) _menhir_cell1_deductionMultiple, _menhir_box_programme) _menhir_cell1_UL_VIRG as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_deductionMultiple (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | UL_PT ->
          let _ = _menhir_action_06 () in
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_deductionMultiple as 'stack) -> _ -> _ -> ('stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_VIRG (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_NEGATION ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | UL_FAIL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | UL_COUPURE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | UL_SYMBOLE _ ->
          let _v = _menhir_action_08 () in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_28 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_negationOuVide (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_SYMBOLE _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState28
      | _ ->
          _eRR ()
  
  and _menhir_run_33 : type  ttv_stack. (((ttv_stack, _menhir_box_programme) _menhir_cell1_deductionMultiple, _menhir_box_programme) _menhir_cell1_UL_VIRG, _menhir_box_programme) _menhir_cell1_deductionMultiple -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_deductionMultiple (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_UL_VIRG (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_07 () in
      _menhir_goto_deductionMultipleVir _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_deductionMultipleVir : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_deductionMultiple as 'stack) -> _ -> _ -> ('stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState30 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_34 : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_predicat, _menhir_box_programme) _menhir_cell1_deductionMultiple -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_deductionMultiple (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_predicat (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_02 () in
      let _v = _menhir_action_13 () in
      _menhir_goto_regle _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_regle : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState18 ->
          _menhir_run_21_spec_18 _menhir_stack _tok
      | MenhirState00 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_18 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_regle (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_SYMBOLE _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState18
      | UL_FIN ->
          let _ = _menhir_action_14 () in
          _menhir_run_19 _menhir_stack _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_predicat as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_deductionMultiple (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | UL_PT ->
          let _ = _menhir_action_06 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_PT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_01 () in
          let _v = _menhir_action_12 () in
          _menhir_goto_regle _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | UL_DEDUCTION ->
          let _menhir_stack = MenhirCell1_predicat (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_NEGATION ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_09 () in
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | UL_FAIL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | UL_COUPURE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | UL_SYMBOLE _ ->
              let _v = _menhir_action_08 () in
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE, _menhir_box_programme) _menhir_cell1_termeOuVar -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_termeOuVar (_menhir_stack, _, _) = _menhir_stack in
      let _ = _menhir_action_22 () in
      _menhir_goto_termeVideOuAutre _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_goto_termeVideOuAutre : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_UL_SYMBOLE (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_16 () in
      let _v = _menhir_action_18 () in
      _menhir_goto_termeOuVar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_termeOuVar : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState03 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState08 ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_07 : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_termeOuVar (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | UL_PARFER ->
          let _ = _menhir_action_19 () in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_SYMBOLE (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_PAROUV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_VARIABLE _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_17 () in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
          | UL_SYMBOLE _v_2 ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState06
          | _ ->
              _eRR ())
      | UL_PARFER | UL_VIRG ->
          let _ = _menhir_action_21 () in
          _menhir_goto_termeVideOuAutre _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_SYMBOLE _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | _ ->
          _eRR ()
  
end

let programme =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_programme v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 70 "Parser.mly"
  

# 700 "Parser.ml"
