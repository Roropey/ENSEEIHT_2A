open Util
open Mem

(* get_assoc: TODO
 *)
let rec get_assoc e l def = failwith "TODO"

(* Tests unitaires : TODO *)

(* set_assoc : TODO
 *)
let rec set_assoc e l x = failwith "TODO"

(* Tests unitaires : TODO *)


module AssocMemory : Memory =
struct
    (* Type = liste qui associe des adresses (entiers) à des valeurs (caractères) *)
    type mem_type = unit (* TODO *)

    (* Un type qui contient la mémoire + la taille de son bus d'adressage *)
    type mem = int * mem_type

    (* Nom de l'implémentation *)
    let name = "assoc"

    (* Taille du bus d'adressage *)
    let bussize (bs, _) = bs

    (* Taille maximale de la mémoire *)
    let size (bs, _) = pow2 bs

    (* Taille de la mémoire en mémoire *)
    let allocsize (bs, m) = failwith "TODO"

    (* Nombre de cases utilisées *)
    let busyness (bs, m) = failwith "TODO"

    (* Construire une mémoire vide *)
    let clear bs = failwith "TODO"

    (* Lire une valeur *)
    let read (bs, m) addr = failwith "TODO"

    (* Écrire une valeur *)
    let write (bs, m) addr x = failwith "TODO"
end
