import java.rmi.*;
import java.rmi.server.*;
import java.util.*;

public class DeImpl extends UnicastRemoteObject implements DeItf {

    private Random alea;
    private int nbCalls;

    public DeImpl() throws RemoteException {
        alea = new Random();
        nbCalls = 0;
    }

    public int getRandom() throws RemoteException {
        nbCalls += 1;
        return 1+alea.nextInt(6);
    }

    public int getNbCalls() throws RemoteException {
        return nbCalls;
    }
}
