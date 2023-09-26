TPs sur les moniteurs Java
==========================

Ce dépôt contient deux sujets concernant les moniteurs Java :

* [Philosophes](Philosophes) contient un exemple de résolution du problème des philosophes avec un
  moniteur ;

* [Lecteurs/Redacteurs](LectRed) qui porte sur le problème des lecteurs et des rédacteurs.

* [Allocateur](Allocateur) qui porte sur l'allocation de ressources multiples ;

## Moniteur en Java

- Créer un verrou de type `java.util.concurrent.locks.Lock`
   (à partir de `java.util.concurrent.locks.ReentrantLock`) :
   
        mon_moniteur = new java.util.concurrent.locks.ReentrantLock();

   Cet object réalise le moniteur en fournissant, par son utilisation
   explicite, l'exclusion mutuelle et permet de créer des
   variables-conditions associées au verrou.

 - Créer une ou des variables-conditions (`java.util.concurrent.locks.Condition`)
   à partir du verrou précédemment créé :
   
       ma_var_condition = mon_moniteur.newCondition();

 - Les procédures doivent explicitement manipuler le verrou pour obtenir
   l'exclusion mutuelle :
   
       ma_procédure() {
           mon_moniteur.lock();
           ...
           mon_moniteur.unlock();
       }

 - Les variables-conditions s'utilisent avec
 
       ma_var_condition.await();
       
   et
   
       ma_var_condition.signal();
       ma_var_condition.signalAll();
   
 - La sémantique est celle de « priorité au signaleur » (= pas de priorité
   au signalé = pas de transfert de l'accès exclusif au processus débloqué).
   Il faut donc penser aux boucles "while".
