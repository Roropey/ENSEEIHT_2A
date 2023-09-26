open Mem
open Util

(* generate: int -> 'a -> 'a list
 * Créer une liste de taille fixe qui contient un élément particulier.
 * Paramètres :
 *   n : int, taille de la liste
 *   x : 'a, élément dont la est remplie
 * Retour :
 *   liste de taille n et qui contient des x
 *)
let rec generate n x =
    if n <= 0 then []
    else x::(generate (n - 1) x)

let%test "generate-0" = generate 0 5 = []
let%test "generate-1" = generate 5 'a' = ['a';'a';'a';'a';'a']
let%test "generate-2" = generate 3 1 = [1;1;1]

(* get: 'a list -> int -> 'a
 * Récupère l'élément en n-ième position d'une liste
 * Paramètres :
 *   l : 'a list, liste à parcourir
 *   n : int, position de l'élément à récupérer
 * Retour :
 *   élément à la position n de l
 * Exception :
 *   OutOfBound si la position souhaitée n'est pas dans la liste
 *)
let rec get l n =
    match l,n with
    | t::_, 0 -> t
    | _::q, n -> get q (n - 1)
    | [], _   -> raise OutOfBound

(* Autre version avec List :
 * let get l n =
 *     if n >= List.length l then
 *         raise OutOfBound
 *     else
 *         List.nth l n
 *)

let%test "get-1" = get [5;7;9] 2 = 9
let%test "get-2" = get ['o';'c';'a';'m';'l'] 3 = 'm'
let%test "get-3" =
    try let _ = get [1;2;3] 5 in false with OutOfBound -> true

(* set: 'a list -> int -> 'a -> 'a list
 * Modifie l'élement en n-ième position d'une liste
 * Paramètres :
 *   l : 'a list, liste à modifier
 *   n : int, position de l'élément à changer
 *   x : 'a, nouvelle valeur de l'élément
 * Retour l
 *   liste modifiée (telle que l[n] = x)
 * Exception l
 *   OutOfBound si la position souhaitée n'est pas dans la liste
 *)
let rec set l n x =
    match l,n with
    | _::q, 0 -> x::q
    | t::q, n -> t::(set q (n - 1) x)
    | [], _ -> raise OutOfBound

let%test "set-1" = set [5;7;9] 2 3 = [5;7;3]
let%test "set-2" = set ['o';'c';'a';'m';'l'] 3 'b' = ['o';'c';'a';'b';'l']
let%test "set-3" =
    try let _ = set [1;2;3] 5 0 in false with OutOfBound -> true

(* Implémentation simpliste et peu efficace d'une mémoire à base de listes.
 *
 * En OCaml, on pourrait utiliser des vecteurs (non vu en cours), mais les
 * listes sont bien pour mettre en évidence les problèmes de complexité
 * temporelle et surtout spatiale !
 *)
module ListMemory : Memory =
struct
    (* Le type "support" est une liste *)
    type mem_type = char list

    (* Un type qui contient la mémoire + la taille de son bus d'adressage *)
    type mem = int * mem_type

    let name = "list"

    (* Obtenir la taille du bus d'adressage *)
    let bussize (bs, _) = bs

    (* Obtenir la taille de la mémoire *)
    let size (bs, _) = pow2 bs

    (* Obtenir la taille effective de la mémoire.
     * On a alloué une liste de 2^bs éléments...
     *)
    let allocsize (_, l) = List.length l

    (* Obtenir le nombre de valeurs stockées en mémoire. *)
    let busyness (_, l) =
        List.fold_left (fun acc t -> if t = _0 then acc else acc + 1) 0 l
        (* List.length (List.filter (fun i -> i <> _0) l) *)

    (* Lire une valeur *)
    (* Obtenir une mémoire vide avec adressage sur n bits *)
    (* À essayer : clear 20 => stack overflow ! *)
    let clear bs = (bs, generate (pow2 bs) _0)

    (* Complexité : O(2^bs) *)
    let read (_, l) addr = get l addr

    (* Écrire une valeur. *)
    (* Complexité : O(2^bs) *)
    let write (bs, l) addr value =
        (bs, set l addr value)
end
