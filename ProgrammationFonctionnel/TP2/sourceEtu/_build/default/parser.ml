
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | XXXX
    | NAME of (
# 2 "parser.mly"
       (string)
# 16 "parser.ml"
  )
    | INT of (
# 1 "parser.mly"
       (int)
# 21 "parser.ml"
  )
    | EOF
  
end

include MenhirBasics

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState08 : (('s, _menhir_box_main) _menhir_cell1_ligne, _menhir_box_main) _menhir_state
    (** State 08.
        Stack shape : ligne.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_ligne = 
  | MenhirCell1_ligne of 's * ('s, 'r) _menhir_state * (int * string * int * int)

and _menhir_box_main = 
  | MenhirBox_main of ((int * string * int * int) list) [@@unboxed]

let _menhir_action_1 =
  fun annee nb prenom sexe ->
    (
# 19 "parser.mly"
                                                ((sexe,prenom,annee,nb))
# 52 "parser.ml"
     : (int * string * int * int))

let _menhir_action_2 =
  fun nb prenom sexe ->
    (
# 20 "parser.mly"
                                         ((sexe,prenom,-1,nb))
# 60 "parser.ml"
     : (int * string * int * int))

let _menhir_action_3 =
  fun stat ->
    (
# 15 "parser.mly"
                   ( [stat] )
# 68 "parser.ml"
     : ((int * string * int * int) list))

let _menhir_action_4 =
  fun m stat ->
    (
# 16 "parser.mly"
                        ( stat :: m)
# 76 "parser.ml"
     : ((int * string * int * int) list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | EOF ->
        "EOF"
    | INT _ ->
        "INT"
    | NAME _ ->
        "NAME"
    | XXXX ->
        "XXXX"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_07_spec_00 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_main =
    fun _menhir_stack _v ->
      MenhirBox_main _v
  
  let rec _menhir_goto_main : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState08 ->
          _menhir_run_10 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_07_spec_00 _menhir_stack _v
  
  and _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ligne -> _ -> _menhir_box_main =
    fun _menhir_stack _v ->
      let MenhirCell1_ligne (_menhir_stack, _menhir_s, stat) = _menhir_stack in
      let m = _v in
      let _v = _menhir_action_4 m stat in
      _menhir_goto_main _menhir_stack _v _menhir_s
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NAME _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | XXXX ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (nb, prenom, sexe) = (_v_1, _v_0, _v) in
                  let _v = _menhir_action_2 nb prenom sexe in
                  _menhir_goto_ligne _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | INT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (nb, prenom, sexe, annee) = (_v_3, _v_0, _v, _v_2) in
                  let _v = _menhir_action_1 annee nb prenom sexe in
                  _menhir_goto_ligne _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_ligne : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | INT _v_0 ->
          let _menhir_stack = MenhirCell1_ligne (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState08
      | EOF ->
          let stat = _v in
          let _v = _menhir_action_3 stat in
          _menhir_goto_main _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
