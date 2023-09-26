import java.rmi.*;
import java.rmi.server.*;

public class Subscriber extends UnicastRemoteObject implements CallBack {

    public Subscriber() throws RemoteException {
    }

    public void onMessage(Message message) throws RemoteException {
        System.out.println("Message reçu : " + message.text);
    }

    public static void main(String[] args) {
        try {
            MOMItf momItf = (MOMItf)Naming.lookup("//localhost:4000/MOM");
            momItf.subscribe(args[0], new Subscriber());
            System.out.println("Souscription effectuée sur le topic " + args[0]);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
