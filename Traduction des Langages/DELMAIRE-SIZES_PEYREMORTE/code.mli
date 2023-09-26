(* getEtiquette : unit -> string *)
(* Renvoie une étiquette TAM *)
(* Chaque appel donne une étiquette différente *)
val getEtiquette : unit -> string

(* getEntete : unit -> string *)
(* Renvoie ce qui doit être mis en entête du fichier TAM *)
val getEntete : unit -> string

(* ecrireFichier : string -> string -> unit *)
(* écrit une chaîne de caractère dans un fichier *)
(* Premier paramètre : le nom du fichier *)
(* Second paramètre : le texte à écrire *)
(* Erreur si le fichier ne peut pas être écrit (nom invalide, permissions insuffisantes) *)
val ecrireFichier : string -> string -> unit
