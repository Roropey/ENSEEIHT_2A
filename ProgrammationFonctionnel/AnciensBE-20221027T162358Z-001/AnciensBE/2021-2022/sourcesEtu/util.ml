(* pow2 : int -> int
 * Calcul la énième puissance de 2.
 *
 * Paramètres :
 *   n : int, exposant de la puissance
 * Retour :
 *   2^n; se base sur le left shift, donc assez rapide !
 *
 * Pré : n >= 0, n < 32 (64)
 *)
let pow2 e =
    1 lsl e

let%test "pow2-0" = pow2 0 = 1
let%test "pow2-1" = pow2 1 = 2
let%test "pow2-5" = pow2 5 = 32

(* _0 : char
 * Le nombre 0 sous forme de caractère.
 * En OCaml (conrairement à C ou Java, par exemple), les types char et int sont
 * incompatibles. On ne peut donc pas écrire "let (x : char) = 0"; on est obligé
 * de passer par une fonction du module Char, qui transforme les int en char.
 *)
let _0 = Char.chr 0
