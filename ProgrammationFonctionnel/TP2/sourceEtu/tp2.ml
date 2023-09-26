(******* TRIS ******)

(*  Tri par insertion **)

(*CONTRAT
Fonction qui ajoute un élément dans une liste triée, selon un ordre donné
Type : ('a->'a->bool)->'a->'a list -> 'a list
Paramètre : ordre  ('a->'a->bool), un ordre sur les éléments de la liste
Paramètre : elt, l'élement à ajouter
Paramètre : l, la liste triée dans laquelle ajouter elt
Résultat : une liste triée avec les éléments de l, plus elt
*)

let rec insert ordre elt l =
  match l with
  | [] -> [elt]
  | hd::tl -> if (ordre elt hd) then elt::l else hd::(insert ordre elt tl)


(* TESTS *)
let%test _ = insert (fun x y -> x<y) 3 []=[3]
let%test _ = insert (fun x y -> x<y) 3 [2;4;5]=[2;3;4;5]
let%test _ = insert (fun x y -> x > y) 6 [3;2;1]=[6;3;2;1]



(*CONTRAT
Fonction qui trie une liste, selon un ordre donné
Type : ('a->'a->bool)->'a list -> 'a list
Paramètre : ordre  ('a->'a->bool), un ordre sur les éléments de la liste
Paramètre : l, la liste à trier
Résultat : une liste triée avec les éléments de l
*)

let rec tri_insertion ordre l = 
  match l with
  | [] -> []
  | hd::tl -> insert ordre hd (tri_insertion ordre tl)

(* TESTS *)
let%test _ = tri_insertion (fun x y -> x<y) [] =[]
let%test _ = tri_insertion (fun x y -> x<y) [4;2;4;3;1] =[1;2;3;4;4]
let%test _ = tri_insertion (fun x y -> x > y) [4;7;2;4;1;2;2;7]=[7;7;4;4;2;2;2;1]


(*  Tri fusion **)

(* CONTRAT
Fonction qui décompose une liste en deux listes de tailles égales à plus ou moins un élément
Paramètre : l, la liste à couper en deux
Retour : deux listes
*)

let rec scinde l =
  match l with
  | [] -> ([],[])
  | [_] -> (l,[])
  | hd::bd::tl -> let (l1,l2) = scinde tl in (hd::l1,bd::l2)

(* TESTS *)
(* Peuvent être modifiés selon l'algorithme choisi *)
let%test _ = scinde [1;2;3;4] = ([1;3],[2;4])
let%test _ = scinde [1;2;3] = ([1;3],[2])
let%test _ = scinde [1] = ([1],[])
let%test _ = scinde [] = ([],[])


(* Fusionne deux listes triées pour en faire une seule triée
Paramètre : ordre  ('a->'a->bool), un ordre sur les éléments de la liste
Paramètre : l1 et l2, les deux listes triées
Résultat : une liste triée avec les éléments de l1 et l2
*)

let rec fusionne ordre l1 l2 = 
  match l1,l2 with
  | [],_->l2
  | _,[]->l1
  | hd1::tl1,hd2::tl2-> if ordre hd1 hd2 then hd1::fusionne ordre tl1 l2 else hd2::fusionne ordre tl2 l1

(*TESTS*)
let%test _ = fusionne (fun x y -> x<y) [1;2;4;5;6] [3;4] = [1;2;3;4;4;5;6]
let%test _ = fusionne (fun x y -> x<y) [1;2;4] [3;4] = [1;2;3;4;4]
let%test _ = fusionne (fun x y -> x<y) [1;2;4] [3;4;8;9;10] = [1;2;3;4;4;8;9;10]
let%test _ = fusionne (fun x y -> x<y) [] [] = []
let%test _ = fusionne (fun x y -> x<y) [1] [] = [1]
let%test _ = fusionne (fun x y -> x<y) [] [1] = [1]
let%test _ = fusionne (fun x y -> x<y) [1] [2] = [1;2]
let%test _ = fusionne (fun x y -> x>y) [1] [2] = [2;1]


(* CONTRAT
Fonction qui trie une liste, selon un ordre donné
Type : ('a->'a->bool)->'a list -> 'a list
Paramètre : ordre  ('a->'a->bool), un ordre sur les éléments de la liste
Paramètre : l, la liste à trier
Résultat : une liste triée avec les éléments de l
*)

let rec tri_fusion ordre l =
  match l with
  | [] -> []
  | [_] -> l
  | _ -> let (l1,l2) = (scinde l) in fusionne ordre (tri_fusion ordre l1) (tri_fusion ordre l2)


(* TESTS *)
let%test _ = tri_fusion (fun x y -> x<y) [] =[]
let%test _ = tri_fusion (fun x y -> x<y) [4;2;4;3;1] =[1;2;3;4;4]
let%test _ = tri_fusion (fun x y -> x > y) [4;7;2;4;1;2;2;7]=[7;7;4;4;2;2;2;1]


(*  Parsing du fichier *)
open Lexing

(* Affiche un quadruplet composé 
- du sexe des personnes ayant reçu ce prénom : 1 pour les hommes, 2 pour les femmes
- du prénom
- de l'année
- du nombre de fois où ce prénom a été donné cette année là
*)
let print_stat (sexe,nom,annee,nb) =
  Printf.eprintf "%s,%s,%d,%d%!\n" (if (sexe=1) then "M" else "F") nom annee nb

(* Analyse le fichier nat2016.txt (stratistique des prénoms entre 1900 et 2016) 
 et construit une liste de quadruplet (sexe,prénom,année,nombre d'affectation)
*)
let listStat = 
  let input = open_in "/home/romai/Enseeiht/S7/ProgrammationFonctionnel/TP2/sourceEtu/nat2016.txt" in 
  let filebuf = Lexing.from_channel input in
  Parser.main Lexer.token filebuf
  

(* Analyse le fichier nathomme2016.txt (stratistique des prénoms d'homme commençant par un A ou un B entre 1900 et 2016) 
 et construit une liste de quadruplets (sexe,prénom,année,nombre d'affectations)
*)
let listStatHomme = 
  let input = open_in "/home/romai/Enseeiht/S7/ProgrammationFonctionnel/TP2/sourceEtu/nathomme2016.txt" in
  let filebuf = Lexing.from_channel input in
  Parser.main Lexer.token filebuf
  
let t1 = Sys.time () 
let _ = tri_insertion (fun x y -> let (sx,nx,ax,nbx) = x in let (sy,ny,ay,nby) = y in nbx>nby) listStatHomme
let t2 = Sys.time() 
let _ = Printf.eprintf "Tri insertion : %f\n" (t2-.t1) 

let t1 = Sys.time () 
let _ = tri_fusion (fun x y -> let (sx,nx,ax,nbx) = x in let (sy,ny,ay,nby) = y in nbx>nby) listStatHomme
let t2 = Sys.time() 
let _ = Printf.eprintf "Tri fusion : %f\n" (t2-.t1) 


let t1 = Sys.time () 
let _ = tri_fusion (fun x y -> let (sx,nx,ax,nbx) = x in let (sy,ny,ay,nby) = y in nbx>nby) listStat
let t2 = Sys.time() 
let _ = Printf.eprintf "Tri fusion stat : %f\n" (t2-.t1) 

let t1 = Sys.time () 
let _ = List.sort (fun x y -> let (sx,nx,ax,nbx) = x in let (sy,ny,ay,nby) = y in nbx-nby) listStat
let t2 = Sys.time() 
let _ = Printf.eprintf "Tri sort : %f\n" (t2-.t1) 

(*  Les contrats et les tests des fonctions suivantes sont à écrire *)
