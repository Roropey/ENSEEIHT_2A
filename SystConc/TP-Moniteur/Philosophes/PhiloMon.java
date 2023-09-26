// Time-stamp: <02 Apr 2008 16:06 queinnec@enseeiht.fr>

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Condition;

/** Solution au problème des philosophes avec un moniteur (java 5),
 * en gérant l'état (solution à parallélisme optimale mais à risque de famine). */
public class PhiloMon implements StrategiePhilo {

    // Protection des variables partagées
    private Lock moniteur;

    // Pour bloquer un philosophe
    // tableau [nbPhilosophes]
    private Condition[] acces;

    // État d'un philosophe : pense, mange, demande ?
    // tableau [nbPhilosophes]
    private EtatPhilosophe[] etat;

    /****************************************************************/

    public PhiloMon (int nbPhilosophes) {
        this.moniteur = new ReentrantLock();
        this.acces = new Condition[nbPhilosophes];
        this.etat = new EtatPhilosophe[nbPhilosophes];
        for (int i = 0; i < nbPhilosophes; i++) {
            acces[i] = moniteur.newCondition ();
            etat[i] = EtatPhilosophe.Pense;
        }
    }

    /* renvoie vrai le philosophe no peut manger, ie si il a demandé à manger
     * et aucun des ses voisins ne mange. */
    private boolean accessible (int no)
    {
        return (etat[no] == EtatPhilosophe.Demande)
          && (etat[Main.PhiloGauche(no)] != EtatPhilosophe.Mange)
          && (etat[Main.PhiloDroite(no)] != EtatPhilosophe.Mange);
    }

    public void demanderFourchettes (int no) throws InterruptedException
    {
        moniteur.lock();
        etat[no] = EtatPhilosophe.Demande;
        while (! accessible(no)) {
            acces[no].await();
        }
        etat[no] = EtatPhilosophe.Mange;
        moniteur.unlock();
        
        // j'ai les fourchette G et D
        IHMPhilo.poser (Main.FourchetteGauche(no), EtatFourchette.AssietteDroite);
        IHMPhilo.poser (Main.FourchetteDroite(no), EtatFourchette.AssietteGauche);
    }

    public void libererFourchettes (int no)
    {
        int pg = Main.PhiloGauche (no);
        int pd = Main.PhiloDroite (no);

        IHMPhilo.poser (Main.FourchetteGauche(no), EtatFourchette.Table);
        IHMPhilo.poser (Main.FourchetteDroite(no), EtatFourchette.Table);

        moniteur.lock();
        etat[no] = EtatPhilosophe.Pense;
        if (accessible(pg)) {
            acces[pg].signal();
        }
        if (accessible(pd)) {
            acces[pd].signal();
        }
        moniteur.unlock();
    }

    public String nom() {
        return "Moniteur, stratégie optimale";
    }

}

