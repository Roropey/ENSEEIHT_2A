# Proposition BE OCaml

Objectif : implémenter un mécanisme de mémoire associative (adresse -> valeur)
de différentes manières.

## 1. Spécification des mémoires

Une mémoire est spécifiée par l'interface de module `Memory` (dans `mem.ml`).
Cet objet est associé à plusieurs fonctionnalités :
 * Le type qui sert à stocker la mémoire
 * Le nom de l'implémentation (c'est surtout pour le benchmark)
 * `clear` : permet de créer une mémoire vide en précisant une _taille de bus
   d'addressage_, autrement dit le nombre de bits sur lesquels une adresse peut
   être exprimée.
 * `bussize` : taille du bus d'adressage
 * `size` : taille maximale de la mémoire (nombre de "cases")
 * `allocsize` : quantité d'espace que la mémoire prend en RAM (permet de donner
   une idée de l'efficacité de l'implémentation, c.f. benchmark)
 * `busyness` : nombre de valeurs stockées dans la mémoire
 * `read` : permet d'accéder au contenu d'une case mémoire
 * `write` : permet d'écrire dans une case mémoire

Les contrats détaillés de chacune de ces fonctionnalités sont données dans le
code de `mem.ml`.

À noter que les adresses sont exprimées en entier (type `int`), ce qui laisse la
possibilité de définir des tailles de bus d'adressage assez intéressantes
(jusqu'à 63 car les entiers sont signés). Les valeurs stockées dans la mémoire
sont des `char`, pour simuler le stockage d'octets.

On considère que la valeur par défaut dans la mémoire est 0 (`_0` dans le code,
car sinon il faut écrire `'\x000'` partout car la mémoire stocke des caractères).

Typiquement, pour déterminer l'occupation, on compte le nombre de "cases" qui ne
contiennent pas 0.


## 2. Mémoire à base de listes indexées

Une implémentation des mémoires à base de listes est données dans le fichier
`listmem.ml`.

Une mémoire avec un bus d'adressage _n_ est représentée par une liste de _2^n_
éléments.

L'adressage se fait en parcourant la liste récursivement (on pourrait utiliser
la fonction `List.nth` directement mais c'est un peu trop facile !).


### Efficacité

Cette implémentation est très simple à mettre en place mais assez peu efficace,
et surtout a un très mauvais de "taux d'allocation pour le vide" : on a plein de
cases vides qui ne servent à rien...

Autre petit soucis : toutes les opérations sont en _O(size(mem))_ (pas
catastrophique en soit mais quand même).


## 3. Mémoire à base de listes associatives

Une implémentation des mémoires à base de listes associatives est donnée dans le
fichier `assocmem.ml`.

Le principe est de stocker directement les couples clef-valeur dans une liste et
d'utiliser (entres autres) `List.assoc_opt`.

À noter que cette implémentation stocke les valeurs "en vrac", on pourrait sans
doutes gagner pas mal en complexité amortie en se basant sur des clefs triées.


### Efficacité

Cette implémentation est très raisonnable en mémoire (une case par valeur), mais
pour une mémoire très remplie et un espace d'adressage important, peut s'avérer
assez inefficace (complexité en _O(2^n) = O(size(mem))_ dans le pire cas, comme
avec la liste simple).


## 4. Mémoire à base de _bit tree_

Une implémentation des mémoires avec bit tree est donnée dans le fichier
`treemem.ml`.

Un _bit tree_ est un arbre binaire dont les feuilles contiennent des valeurs et les
noeuds ne contiennent rien. Le chemin d'une racine vers une feuille correspond à
une séquence de directions (gauche/droite) qui peut être convertie en nombre
binaire (par ex : gauche = 0, droite = 1).

L'idée est donc de se servir d'un bit tree pour représenter la mémoire : une
adresse correspond à un chemin, au bout duquel se trouve la valeur
correspondante.

On considère, en particulier, que le chemin est donné en lisant l'adresse du bit
de poids faible vers le bit de poids fort (de droite à gauche).

Exemple :
```
      |
      .
    /   \
  .       .
 / \     / \
0   .   0   .
   / \     / \
  5   0   3   1
```

Dans l'arbre ci-dessus, les valeurs suivantes son stockées :
 * 5, à l'adresse 010 (gauche puis droite puis gauche)
 * 3, à l'adresse 011 (droite puis droite puis gauche)
 * 1, à l'adresse 111 (droite puis droite puis droite)

Partout ailleurs, on a des 0. On remarque qu'il n'y a que trois 0 dans l'arbre,
mais qu'ils en représentent en réalité 5 !


### Efficacité

Les opérations de lecture et d'accès sont généralement _O(n)_ où _n_ est la
taille du bus d'adressage, et également lié à la profondeur de l'arbre.

Comme la taille maximale de la mémoire est _s = 2^n_, on peut aussi considérer
que la complexité est en _O(ln(s))_.

L'arbre est assez efficace en mémoire grâce à ce phénomène de "clusterisation",
mais cela dépend énormément des données qui y sont stockées. Notamment, en cas
de mémoire saturée (aucune case vide), l'arbre doit normalement contenir _2^n_
(ou _s_) feuilles, tout en aillant une profondeur de _n_, ce qui donne un poids
en mémoire de _2^(n + 1) - 1_, soit pratiquement le double par rapport à
l'utilisation de listes.

Un des pires cas possible pour la mémoire advient lorsqu'on a des valeurs
stockées à toutes les adresses paires (ou impaires) : on a alors un taux
d'occupation de 50% mais une taille de l'arbre maximale !

On en déduit que les bit trees sont plutôt adaptés à la mémoire "creuse", avec
un faible taux d'occupation, et surtout des _clusters_ (des "grappes" de 0).


# 5. Module `Util`

Le module `Util` (`util.ml`) contient deux utilitaires simples pour aider
l'écriture des implémentations :
 * `pow2 n` : élève le nombre 2 à la puissance _n_ (indispensable pour calculer
   `size`). On note que, sans cela, OCaml ne dispose que de l'opérateur `**` qui
   ne marche que sur les float
 * `_0` : le nombre 0 en type `char` (plus pratique que `'\x000'`)


# 6. Module de tests

Le module de tests (`test.ml`) comprend une batterie de tests de spécification,
qui couvrent une bonne partie des erreurs qu'on peut faire en écrivant les
divers modules.

À noter qu'il faudrait ajouter des tests d'implémentation (notamment pour
`allocsize`).


# 7. Benchmark

Un petit benchmark est proposé (`bench.ml`). On peut le compiler et l'exécuter
avec :
```
> dune build bench.exe
> _build/default/bench.exe
```

Il met un peu de temps à terminer, c'est normal !

Le benchmark, pour chaque implémentation, va :
 * créer une mémoire
 * effectuer quelques milliers d'écritures
 * effectuer quelques milliers de lecture
 * chronométrer les écritures et les lectures
 * calculer des taux d'occupation et d'allocation pour le vide
 * refaire la même chose mais avec une mémoire "saturée" (sans case vide)


# Remarques et idées en vrac

 * L'implémentation à base de bit tree est peut être un peu dure, il faudrait
   peut être la découper, ou alors guider son élaboration dans le sujet (surtout
   `write`, qui est un peu subtile je trouve)
 * J'ai décidé de stocker des `char` en mémoire, mais on pourrait très bien
   stocker des `int` pour simplifier. C'est juste qu'en stockant des `char` on
   fait bien la différence entre adresses et valeurs
 * Inversement, on pourrait rendre le module `Memory` beaucoup plus
   polymorphique, en abstrayant le type pour les adresse et/ou le type pour les
   valeurs. Ça rajoute peut être de la complexité pour pas grand chose
   (notamment, gestion d'une valeur par défaut) mais ça permet de voir si les
   étudiants savent écrire une en-tête de module correctement, par ex:
```ocaml
module IntCharListMemory : Memory with type taddr = int and tval = char = ...
```
 * Le type dans les modules est toujours `(int * t)` avec `t` le type "support"
   pour la mémoire; à la base je me disais que ce n'était pas très intuitif et
   qu'on l'oubliait souvent, mais c'est peut être bien que ça soit l'étudiant
   qui l'écrive. Dans tous les cas, les modules se basent sur un type synonyme
   (on pourrait faire un type avec constructeur, mais ça n'apporte pas grand
   chose, si ce n'est peut être un peu de clarté ?)
 * Concernant ce qui serait donné aux étudiants, je pense qu'on aurait :
   - Le module de tests et le benchmark
   - Le module `Mem` avec l'interface `Memory` tel quel (avec les contrats donc)
   - Le module `Listmem`, avec l'en-tête, le type et le nom donnés, et qu'il
     faut compléter
   - Le module `Treemem`, vide (avec juste les open et `module TreeMemory` pour
     simplifier les tests)
 * Petit soucis : le type bit tree est un peu particulier, car on ne stock rien
   dans les nodes (c'est assez différent de ce qu'on voit en TD/TP, mais d'un
   autre côté c'est plus simple)
 * Autre petit soucis : on ne fait pas écrire de fonction auxiliaire (mais on
   pourrait découper `write` pour les bit tree, peut-être)
 * Difficile d'estimer le temps; je pense honnêtement que tout le BE sauf `read`
   et `write` prennent 1h de réflexion/écriture/correction/test, `read` ça doit
   prendre 30-45 minutes, et `write` peut-être 1h (oui j'exagère un peu mais
   j'essaye de me caler sur les performances des étudiants sur les BE des années
   précédentes); sans `read` et `write` pour le bit tree, j'ai peur que ça soit
   un peu trop simple... D'où l'idée peut être de rajouter l'implémentation à
   base de listes associatives... À voir.
