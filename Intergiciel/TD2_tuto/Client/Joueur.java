import java.rmi.*;

public class Joueur {

    public static void main(String[] args) {

        try {
            DeItf deItf = (DeItf)Naming.lookup("//localhost:4000/michel");
            int nb1 = deItf.getRandom();
            int nb2 = deItf.getRandom();
            int nbCalls = deItf.getNbCalls();
            System.out.println("Vous avez tiré " + nb1 + " et " + nb2 + ". Le nombre total de lancers est actuellement de " + nbCalls);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
