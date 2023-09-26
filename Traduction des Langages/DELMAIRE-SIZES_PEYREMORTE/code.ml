(* Génération d'étiquette à l'aide d'un compteur *)
let getEtiquette = 
  let num = ref 0 in
  fun () ->
    num := (!num)+1 ;
    "label"^((string_of_int (!num)))

let pgcd = 
"pgcd
LOADL 0
LOAD (1) -2[LB]
LOAD (1) -1[LB]
boucle
LOAD (1) 5[LB]
JUMPIF (0) fin
LOAD (1) 4[LB]
LOAD (1) 5 [LB]
SUBR IMod
STORE (1) 3[LB]
LOAD (1) 5[LB]
STORE (1) 4[LB]
LOAD (1) 3[LB]
STORE(1) 5[LB]
JUMP boucle
fin
LOAD (1) 4[LB]
RETURN (1) 2\n\n"

let norm =
"norm
LOAD (1) -2[LB]
LOAD (1) -1[LB]
CALL (LB) pgcd
LOAD (1) -2[LB]
LOAD (1) 3[LB]
SUBR IDiv
LOAD (1) -1[LB]
LOAD (1) 3[LB]
SUBR IDiv
RETURN (2) 2\n\n"

let rout =
"ROut
LOADL '['
SUBR COut
LOAD (1) -2[LB]
SUBR IOut
LOADL '/'
SUBR COut
LOAD (1) -1[LB]
SUBR IOut
LOADL ']'
SUBR COut
RETURN (0) 2\n\n"

let radd =
"RAdd
LOAD (1) -4[LB]
LOAD (1) -1[LB]
SUBR IMul
LOAD (1) -2[LB]
LOAD (1) -3[LB]
SUBR IMul
SUBR IAdd
LOAD (1) -3[LB]
LOAD (1) -1[LB]
SUBR IMul
CALL (ST) norm
RETURN (2) 4\n\n"

let rmul =
"RMul
LOAD (1) -4[LB]
LOAD (1) -2[LB]
SUBR IMul
LOAD (1) -3[LB]
LOAD (1) -1[LB]
SUBR IMul
CALL (ST) norm
RETURN (2) 4\n\n"

(* Entête des fichiers Rat  contenant :
- un saut vers le programme principal
- la fonction pgcd nécessaire à la normalisation des rationnels
- une fonction de normalisation des rationnels
- les fonctions d'affichage (ROut), d'addition (RAdd) et de multiplication (RMult) de rationnel
*)
let getEntete () =
  "JUMP main\n\n"
  ^pgcd
  ^norm
  ^rout
  ^radd
  ^rmul

(*Ecriture dans un fichier *)
let ecrireFichier nom texte =
  let fich = open_out nom in
  output_string fich texte ;
  close_out fich
