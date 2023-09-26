(* Exception qui signifie que l'on essaye d'adresser la mémoire à un endroit
 * où elle n'est pas définie.
 *)
exception OutOfBound

(* Interface Memory, qui représente un système de mémoire avec adressage direct.
 *
 * On suppose que la mémoire stocke des octets (on peut le rendre type-generic
 * ceci dit).
 *)
module type Memory =
sig
    (* Le type qui contient la mémoire (e.g. list) *)
    type mem_type

    (* Un type qui contient la mémoire + la taille de son bus d'adressage *)
    type mem = int * mem_type

    (* Nom de l'implémentation (pour les tests) *)
    val name : string

    (* bussize : mem -> int
     * Retourne la taille du bus d'adressage de la mémoire, autrement dit le
     * nombre de bits sur lesquels les adresses d'accès peuvent être encodées.
     *
     * Paramètres :
     *   m : mem, mémoire à tester
     * Retour :
     *   avec m = (clear n), retourne n
     *)
    val bussize : mem -> int

    (* size : mem -> int
     * Calcule la taille de la mémoire, c'est à dire le nombre (potentiel)
     * d'emplacements accessibles.
     *
     * Paramètres :
     *   m : mem, mémoire à tester
     * Retour :
     *   nombre de "cases" exploitables dans la mémoire
     *)
    val size : mem -> int

    (* allocsize : mem -> int
     * Calcule le nombre de cases "physiquement" allouées pour la mémoire,
     * autrement dit la taille qu'elle prend dans la RAM physique de
     * l'ordinateur.
     *
     * Paramètres :
     *   m : mem, mémoire à tester
     * Retour :
     *   taille effective de la mémoire en mémoire
     *)
    val allocsize : mem -> int

    (* busyness : mem -> int
     * Calcule le nombre de valeurs stockées dans la mémoire. Pour simplifier,
     * on considère que les cases qui contiennent 0 sont vide.
     *
     * Paramètres :
     *   m : mem, mémoire à tester
     * Retour :
     *   nombre de cases non-vide de la mémoire
     *)
    val busyness : mem -> int

    (* clear : int -> mem
     * Initialise une mémoire avec un nombre de *bits d'adressage*, autrement
     * dit le nombre de bits sur lesquels une adresse d'accès peut être
     * exprimée.
     *
     * Paramètres :
     *   n : int, nombre de bits d'addressage
     * Retour :
     *   mémoire initialisée (contenu aléatoire, des 0 pour simplifier)
     *
     * Pré : n > 0, n < 32 (< 64)
     * Post : si m = clear n, alors toutes les opérations sur m qui se basent
     * sur une adresse codée sur n bits ne doivent pas lever OutOfBound.
     *)
    val clear : int -> mem

    (* read : mem -> int -> char
     * Réalise la lecture de la mémoire à l'adresse donnée, et retourne la
     * valeur correspondante.
     *
     * Paramètres :
     *   m : mem, mémoire à lire
     *   addr : int, adresse de lecture
     * Retour :
     *   valeur stockée dans m à l'adresse addr
     *
     * Exception : OutOfBound levée si addr n'est pas une adresse valide pour m
     *)
    val read : mem -> int -> char

    (* write : mem -> int -> char -> mem
     * Réalise l'écriture de la mémoire à l'adresse donnée et avec la valeur
     * donnée, puis retourne la mémoire ainsi modifiée.
     *
     * Paramètres :
     *   m : mem, mémoire à modifier
     *   addr : int, adresse d'écriture
     *   value : char, valeur à écrire
     * Retour :
     *   mémoire modifiée
     *
     * Post : si m' = write m addr c alors read m' addr == c
     * Excpetion : OutOfBound levée si addr ne rentre pas sur le nombre de bits
     * d'adressage spécifié dans m
     *)
    val write : mem -> int -> char -> mem

end
