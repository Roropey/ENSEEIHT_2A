open Mem
open Treemem
open Listmem
open Assocmem
open Util

(* Foncteur pour factoriser les tests.
 * Les tests sont sommaires et ne se basent que sur la spécification,
 * pas sur l'implémentation.
 *)
module MemoryTest (M : Memory) =
struct
    open M

    (* writeall : mem -> (int * char) list -> mem
     * Écrit un ensemble de valeurs dans une mémoire, aux addresses données.
     *
     * Paramètres :
     *   mem : M.mem, mémoire à impacter
     *   l : (int * char) list, liste de couples (adresse, valeur) à écrire
     * Retour :
     *   mémoire mise à jour
     *
     * Exceptions : OutOfBound si une des adresses est en dehors de la zone
     * autorisée.
     *)
    let rec writeall mem l =
        match l with
        | [] -> mem
        | (addr,v)::q -> writeall (write mem addr v) q

    (* Une mémoire de taille raisonnable avec des choses dedans *)
    let mem1 =
        writeall (clear 10) [
            (   0, 'a');
            (  12, 'b');
            ( 131, 'r');
            (1001, 'a');
            ( 981, 'c');
            (  15, 'a');
            (  19, 'd');
            ( 451, 'a');
            ( 222, 'b');
            ( 223, 'r');
            ( 682, 'a')
        ]

    (* Tester le stockage correct de la taille du bus d'adressage. *)
    let%test "bussize-1" =
        bussize (clear 5) = 5
    let%test "bussize-2" =
        bussize mem1 = 10

    (* Tester le calcul correct de la taille de la mémoire. *)
    let%test "size-1" =
        size (clear 5) = 32
    let%test "size-2" =
        size mem1 = 1024

    (* Tester la cohérence du retour de allocsize.
     * Note : on ne peut pas tester la valeur exacte car cela dépend complètement
     * de l'implémentation !
     *)
    let%test "allocsize-consistency-1" =
        allocsize (clear 5) <= 32 &&
        allocsize (clear 5) >=  0

    (* Tester le retour de busyness. *)
    let%test "busyness-0" =
        busyness (clear 2) = 0
    let%test "busyness-1" =
        busyness mem1 = 11

    (* Tester la validité de read *)
    let%test "read-0" =
        read mem1 0 = 'a'
    let%test "read-1" =
        read mem1 451 = 'a'
    let%test "read-2" =
        read mem1 221 = _0

    (* Tester la validité de read et write.
     * On est obligé de procéder ainsi (read ET write) car formellement, write
     * n'a pas de résultat que l'on peu examiner, puisque les types sont
     * abstraits (= effets de bord).
     *)
    let%test "read-write-0" =
        let m' = write mem1 0 'z' in
            read m' 0 = 'z'
    let%test "read-write-1" =
        let m' = write mem1 31 'a' in
            read m' 31 = 'a'
    let%test "read-write-2" =
        let m' = write mem1 27 'a' in
        let m''= write m' 27 'b' in
            read m'' 27 = 'b'

    (* Tester la bonne levée d'exception. *)
    let%test "read-except" =
        try let _ = read mem1 10000 in false with OutOfBound -> true
    let%test "write-except" =
        try let _ = write mem1 10000 '0' in false with OutOfBound -> true
end

module ListMemoryTest = MemoryTest (ListMemory)
(*module AssocMemoryTest = MemoryTest (AssocMemory)*)
(*module TreeMemoryTest = MemoryTest (TreeMemory)*)
