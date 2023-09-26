{
  open Parser
  open Lexing

  exception Error of string

  (* lève l'exception avec des informations de positions *)
  let error lexbuf =
    raise (Error ("Unexpected char: " ^ lexeme lexbuf ^ " at "
                  ^ string_of_int (lexeme_start lexbuf) ^ "-"
                  ^ string_of_int (lexeme_end lexbuf)))

  (* on utilise une table pour les mots-clefs de façon à éviter l'ajout *)
  (*  d'états à l'automate résultant *)
  let ident =
    let kws = Hashtbl.create 16 in
    List.iter (fun (kw, token) -> Hashtbl.add kws kw token)
      [
        "const",   CONST;
        "print",   PRINT;
        "if",      IF;
        "else",    ELSE;
        "while",   WHILE;
        "bool",    BOOL;
        "int",     INT;
        "rat",     RAT;
        "call",    CALL;
        "num",     NUM;
        "denom",   DENOM;
        "true",    TRUE;
        "false",   FALSE;        
        "return",  RETURN;
        "new",     NEW;
        "null",    NULL;
        "loop",    LOOP;
        "break",   BREAK;
        "continue",CONTINUE
      ];
    fun id ->
      match Hashtbl.find_opt kws id with
      | Some kw -> kw
      | None -> ID id
}

rule token = parse
  (* ignore les sauts de lignes mais les compte quand même *)
| '\n'         { new_line lexbuf; token lexbuf }
  (* ignore les espaces et tabulations *)
| [' ' '\t']   { token lexbuf }
  (* ignore les commentaires *)
| "//"[^'\n']* { token lexbuf }

(* caractères spéciaux de RAT *)
| ";"          { PV }
| "{"          { AO }
| "}"          { AF }
| "("          { PO }
| ")"          { PF }
| "="          { EQUAL }
| "["          { CO }
| "]"          { CF }
| "/"          { SLASH }
| "+"          { PLUS }
| "*"          { MULT }
| "<"          { INF }
| ":"          { DP }
| "?"          { PI }
| "&"          { ADRESSE }

(* constantes entières *)
| ("-")?['0'-'9']+ as i
               { ENTIER (int_of_string i) }
(* identifiants et mots-clefs *)
| ['a'-'z'](['A'-'Z''a'-'z''0'-'9']|"-"|"_")* as n
               { ident n }

(* fin de lecture *)
| eof          { EOF }
(* entrée non reconnue *)
| _            { error lexbuf }
