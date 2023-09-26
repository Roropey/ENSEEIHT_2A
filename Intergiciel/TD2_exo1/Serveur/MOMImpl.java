import java.rmi.*;
import java.rmi.server.*;
import java.rmi.registry.*;
import java.util.*;

public class MOMImpl extends UnicastRemoteObject implements MOMItf {

    public HashMap<String, Vector<CallBack>> subscribers;

    public MOMImpl() throws RemoteException {
        subscribers = new HashMap<String, Vector<CallBack>>();
    }

    public void publish(String topic, Message message) throws RemoteException {
        Vector<CallBack> vect = subscribers.get(topic);
        Enumeration<CallBack> enu = vect.elements();
        while (enu.hasMoreElements()) {
            enu.nextElement().onMessage(message);
        }
    }

    public void subscribe(String topic, CallBack cb) throws RemoteException {
        Vector<CallBack> vect = subscribers.get(topic);
        vect.add(cb);
    }

    public static void main(String[] args) {
        try {
            MOMImpl momImpl = new MOMImpl();
            Registry registry = LocateRegistry.createRegistry(4000);
            Naming.rebind("//localhost:4000/MOM", momImpl);
            for (int i = 0; i < args.length; i++) {
                System.out.println("Ajout du topic " + args[i]);
                momImpl.subscribers.put(args[i], new Vector<CallBack>());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
