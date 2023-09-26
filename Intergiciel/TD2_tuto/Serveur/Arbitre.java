import java.rmi.*;
import java.rmi.registry.*;

public class Arbitre {

    public static void main(String[] args) {

        try {
            DeImpl deImpl = new DeImpl();
            Registry registry = LocateRegistry.createRegistry(4000);
            Naming.rebind("//localhost:4000/michel", deImpl);
            System.out.println("L'objet dé a été publié sur le registre.");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
