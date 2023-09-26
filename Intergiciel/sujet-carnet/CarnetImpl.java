import java.rmi.Naming;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.server.UnicastRemoteObject;
import java.util.HashMap;
import java.math.*;


public class CarnetImpl extends UnicastRemoteObject implements Carnet {
    HashMap<String, RFiche> carnet = new HashMap<>();
    int num;
    private CarnetImpl(int arg) throws RemoteException {
        carnet = new HashMap<String,RFiche>();
        num = arg;
    }

    @Override
    public void Ajouter(SFiche sf) throws RemoteException {
    
        carnet.put(sf.getNom(), new RFicheImpl(sf.getNom(), sf.getEmail()));

    }

    @Override
    public RFiche Consulter(String n, boolean forward) throws RemoteException {
        if (carnet.containsKey(n)) {
        return carnet.get(n);
        } else if (forward) {
            int servSuiv = num%2 + 1;
            

        }
    }

    public static void main(String[] args) {
        try {
            LocateRegistry.createRegistry(1234+Integer.valueOf(args[0]));
            Carnet c = new CarnetImpl(Integer.valueOf(args[0]));
            Naming.bind("//localhost:1234/carnet"+args[0],c);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
