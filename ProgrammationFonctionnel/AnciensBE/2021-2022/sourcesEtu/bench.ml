open Be
open Mem
open Util
open Listmem
open Assocmem
open Treemem

(* Foncteur qui met en place un petit benchmark pour évaluer les performances
 * d'une implémentation.
 *)
module MemoryBench (M : Memory) =
struct
    open M

    (* Crée une mémoire avec un bus d'adressage de taille n et la rempli avec
     * (au plus) nval valeurs aléatoires.
     *
     * nval est une borne supérieure car on utilise le module Random pour
     * générer des adresses, qui peut (statistiquement) générer plusieurs fois
     * le même nombre.
     *)
    let randommem n nval =
        let rec write1 nval mem sm =
            if nval = 0 then
                mem
            else
                let raddr = Random.int sm in
                (* On évite le 0, qui dénote une case vide *)
                let rchar = Char.chr (1 + Random.int 255) in
                    write1 (nval - 1) (write mem raddr rchar) sm
        in let mem = clear n in
            write1 nval (clear n) (size mem)

    (* Effectue un ensemble de lectures sur une mémoire. *)
    let readatrandom nval mem =
        let sm = size mem in
        let rec read1 nval =
            let _ = read mem (Random.int sm) in
                if nval = 0 then () else read1 (nval - 1)
        in read1 nval

    (* Génère une mémoire saturée, c'est à dire une mémoire où toutes les cases
     * contiennent quelque chose.
     *)
    let saturatemem n =
        let rec write1 n mem =
            (* On évite le 0, qui dénote une case libre. *)
            let mem' = write mem n (Char.chr (1 + Random.int 255)) in
                if n = 0 then mem' else write1 (n - 1) mem'
        in write1 ((pow2 n) - 1) (clear n)

    (* Calcul le taux d'occupation de la mémoire (# cases occupées / # cases total) *)
    let busyrate busyness size =
        let fbus = float_of_int busyness in
        let fsiz = float_of_int size in
        100. *. (fbus /. fsiz)

    (* Calcul l'efficacité d'occupation, c'est à dire la quantité de mémoire
     * nécessaire en moyenne pour stocker chaque élément de la mémoire.
     *)
    let busyeff busyness allocated =
        let fbus = float_of_int busyness in
        let fall = float_of_int allocated in
        fall /. fbus

    (* Calcul l'efficacité à stocker du vide, autrement dit la quantité de
     * mémoire physique allouée pour stocker des cases vides.
     *)
    let emptyeff busyness allocated size =
        let fbus = float_of_int busyness in
        let fall = float_of_int allocated in
        let fsiz = float_of_int size in
        100. *. ((fall -. fbus) /. (fsiz -. fbus))

    (* Quelques paramètres pour le benchmark :
     *  - valnum : nombres de valeurs à lire et écrire
     *  - busiz  : taille du bus d'adressage pour la mémoire random
     *  - busiz2 : taille du bus d'adressage pour la mémoire saturée
     *)
    let valnum = 4000
    let busiz  = 16
    let busiz2 = 10

    (* Effectuer le benchmark et afficher les résultats obtenus. *)
    let dobench =
        Printf.printf "Implémentation '%s'\n" name;
        Printf.printf "Génération et lecture aléatoire de mémoire (%d valeurs, adresses sur %d bits)...\n" valnum busiz;
        (let t = Sys.time () in
         let mem = randommem busiz valnum in
         let t' = Sys.time () in
         let _ = readatrandom valnum mem in
         let t''= Sys.time () in
         let siz = size mem in
         let asi = allocsize mem in
         let bus = busyness mem in
         Printf.printf "Création : %fs, Lecture : %fs, Total : %fs\n" (t' -. t) (t'' -. t') (t'' -. t);
         Printf.printf "Taille max : %d\n" siz;
         Printf.printf "Taille occupée : %d (taux d'occupation : %.2f%%)\n" bus (busyrate bus siz);
         Printf.printf "Taille allouée : %d (mémoire moyenne par case : %.4f, taux mémoire allouée au vide : %.2f%%)\n" asi (busyeff bus asi) (emptyeff bus asi siz)
        );
        Printf.printf "Génération et lecture de mémoire saturée (%d valeurs, adresses sur %d bits)...\n" (pow2 busiz2) busiz2;
        (let t = Sys.time () in
         let mem = saturatemem busiz2 in
         let t' = Sys.time () in
         let _ = readatrandom valnum mem in
         let t''= Sys.time () in
         let siz = size mem in
         let asi = allocsize mem in
         let bus = busyness mem in
         Printf.printf "Création : %fs, Lecture : %fs, Total : %fs\n" (t' -. t) (t'' -. t') (t'' -. t);
         Printf.printf "Taille max : %d\n" siz;
         Printf.printf "Taille occupée : %d (taux d'occupation : %.2f%%)\n" bus (busyrate bus siz);
         Printf.printf "Taille allouée : %d (mémoire moyenne par case : %.4f)\n" asi (busyeff bus asi)
        );
        Printf.printf "==========================\n"
end

module LMBench = MemoryBench (ListMemory)
(*module AMBench = MemoryBench (AssocMemory)*)
(*module TMBench = MemoryBench (TreeMemory)*)

(* Fonction principales *)
let main =
    LMBench.dobench;
    (*AMBench.dobench;*)
    (*TMBench.dobench;*)
    ()
