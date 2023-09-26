open Util
open Mem

(* get_assoc: TODO
 *)
let rec get_assoc e l def = 
    match l with
    | []-> def
    | (clef,element)::tl -> if e = clef then element else get_assoc e tl def

(* Tests unitaires : TODO *)

(* set_assoc : TODO
 *)
let rec set_assoc e l x = 
    match l with
    | [] -> (e,x)::[]
    | (clef,element)::tl -> if clef = e then (e,x)::tl else (clef,element)::(set_assoc e tl x)

(* Tests unitaires : TODO *)


module AssocMemory : Memory =
struct
    (* Type = liste qui associe des adresses (entiers) à des valeurs (caractères) *)
    type mem_type = (int*char) list

    (* Un type qui contient la mémoire + la taille de son bus d'adressage *)
    type mem = int * mem_type

    (* Nom de l'implémentation *)
    let name = "assoc"

    (* Taille du bus d'adressage *)
    let bussize (bs, _) = bs

    (* Taille maximale de la mémoire *)
    let size (bs, _) = pow2 bs

    (* Taille de la mémoire en mémoire *)
    let allocsize (_, m) = 2*(List.length m)

    (* Nombre de cases utilisées *)
    let busyness (_, m) = (List.length (List.filter (fun (_,element) -> element != _0) m))

    (* Construire une mémoire vide *)
    let clear bs = (bs,[])(*
        let rec clear_construct nb = 
            if nb = 1 then [] 
            else (0,_0)::(clear_construct (nb-1)) 
        in (bs,clear_construct (pow2 bs))*)

    (* Lire une valeur *)
    let read (bs, m) addr = if addr >= (pow2 bs) then raise OutOfBound else get_assoc addr m _0
    

    (* Écrire une valeur *)
    let write (bs, m) addr x = if addr >= (pow2 bs) then raise OutOfBound else (bs,set_assoc addr m x)
end
