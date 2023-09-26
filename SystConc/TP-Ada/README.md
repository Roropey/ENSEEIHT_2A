TP Synchronisation en Ada : lecteurs/rédacteurs
==============================================

Objectif
--------
Réaliser une tâche Ada gérant les accès à un fichier partagé, en garantissant une cohérence des accès concurrents (accès exclusif pour les écritures) et en suivant différentes stratégies de service :

- priorité aux rédacteurs ou aux lecteurs ;
- FIFO ;
- équitable (absence de famine que ce soient des lecteurs ou des rédacteurs).

Les paquetages
--------------

LR  : vide, pour faire plaisir à gnat  
LR.Affic : tout ce qui concerne l'affichage  
LR.Main : pgm principal  
LR.Simu : simulateur temporel  
LR.Synchro : paquetage de redirection vers la stratégie choisie  
LR.Synchro.Exclusion : implantation par exclusion mutuelle  
LR.Synchro.Exclusion2 : implantation stupide par exclusion mutuelle  
LR.Synchro.Basique : 1er exercice, à compléter  
LR.Tasks : les tâches clientes (lecteurs et rédacteurs)  

Les paquetages à consulter et modifier sont `LR.Synchro.*`.

Le paquetage `LR.Tasks` contient la définition du comportement des lecteurs et des rédacteurs. On peut y changer les durées minimales et maximales pour modifier les fréquences relatives des lecteurs et des rédacteurs.

Par curiosité, on peut aussi consulter `LR.Main` (qui lance les tâches) et les interfaces de `LR.Simu` et `LR.Affic` mais ne surtout pas chercher à comprendre les implantations de ces deux derniers paquetages.

Principe de la synchronisation
------------------------------

Comme présenté en cours, deux approches sont possibles :

1. L'approche *automate* où l'on définit une tâche de synchronisation avec un état interne qui détermine quelles entrées sont ouvertes. L'interface (= les entrées) et leur implantation dépendent de la stratégie implantée. L'objectif des procédures `Demander_*` et `Terminer_*` est de masquer cette interface fluctuante pour les tâches définies dans `LR.Tasks`.

2. L'approche *conditions d'acceptation* (ou *service*) où l'on définit une tâche dont chaque entrée est ouverte ou pas selon une condition d'acceptation qui assure le maintien d'un état correct. La démarche de conception est similaire à celle des moniteurs, notamment pour déterminer les variables d'état nécessaires au codage des conditions d'acceptation.

À Faire
-------

1. Écrire dans `lr-synchro-basique.adb` une version basique autorisant
plusieurs lecteurs simultanés. Ne pas se préoccuper d'implanter une
stratégie particulière. Pour cela, utiliser un automate fini à états
déterminant les entrées ouvertes dans chaque état (approche 1).

2. Écrire une version avec des conditions d'acceptation (approche 2).

3. Modifier les versions précédentes pour implanter une stratégie de
type priorité aux rédacteurs.

4. Déterminer un automate pour une stratégie équitable, i.e. qui garantit
l'absence de famine des lecteurs et des rédacteurs, et implanter cette
stratégie.

5. Implanter une stratégie FIFO.

Pour ajouter une nouvelle stratégie
-----------------------------------

Soit la stratégie `Toto` que l'on souhaite implanter :

- Pour créer `lr-synchro-toto.ads` et `lr-synchro-toto.adb`, exécuter (on peut aussi dupliquer `lr-synchro-exclusion.ads` et `lr-synchro-exclusion.adb` et les éditer) :

        ./mkstrategie Toto

- Dans `lr-synchro.adb`, remplacer `LR.Synchro.Exclusion` par `LR.Synchro.Toto` (emplacements marqués par XXXX)
- Écrire l'implantation du paquetage `LR.Synchro.Toto` dans le fichier `lr-synchro-toto.adb`

Pour compiler
-------------
`make` ou `/usr/bin/gprbuild build.gpr`

Pour exécuter
-------------

    ./lr-main 5 4    (nb lecteurs, nb rédacteurs)

Rappel tâches Ada
-----------------

- Pour une entrée de rendez-vous `Rdv`, `Rdv'count` est le nombre de tâches
  clientes en attente de l'acceptation du rendez-vous.
