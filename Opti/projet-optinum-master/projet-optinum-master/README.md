# Projet d'optimisation numérique

Pour récupérer les sources, il faut cloner ce dépot git : 

```bash
git clone https://gitlab.irit.fr/toc/mathn7/optimisation-numerique/projet-optinum.git
```

Les sujets liés au projet se trouvent dans les notebooks du répertoire `src`. Voici l'ordre des sujets :

* Newton
* Régions de confiance
* Lagrangien augmenté

Pour réaliser le projet vous aurez besoin de cette [documentation](doc-projet.pdf) qui décrit les différents algorithmes à implémenter. 

**Attention**, seuls les fichiers dans le répertoire `src` sont à modifier !

## Utilisation de `julia`dans les salles d'enseignement

* On utilisera `VS Code`.
* Installer les extensions `julia` et `jupyter` dans `VS Code`.
* Ouvrir les préférences `File -> Preferences -> Settings` et faire la recherche `julia path`. Dans l'option `Julia: Executable Path`, écrire `/mnt/n7fs/cimi/julia-1.8.2/bin/julia`. 
* Fermer et réouvrir `VS Code`.
* Ouvrir le dossier du projet et exécuter (SHIFT + ENTER ou CTRL + ENTER) la première cellule de code du fichier `src/algo_newton.ipynb`. Vous devez alors sélectionner le code `Julia` qui sera utilisé, choisissez la version `1.8.2`.

