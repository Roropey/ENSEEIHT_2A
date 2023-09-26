import java.rmi.*;
import java.rmi.server.*;
import java.rmi.registry.*;

public class DaemonImpl extends UnicastRemoteObject implements DaemonItf {

    public DaemonImpl() throws RemoteException {
    }

    private void localExec(String cmd) {
        System.out.println("La commande " + cmd + " a été lancée.");
    }

    public void invoke(String cmd) throws RemoteException {
        localExec(cmd);
    }

    public static void main(String[] args) {
        try {
            Registry registry = LocateRegistry.createRegistry(Integer.parseInt(args[0]));
            Naming.rebind("//localhost:" + args[0] + "/" + args[1], new DaemonImpl());
            System.out.println("L'objet Daemon a bien été publié sur le registre.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
