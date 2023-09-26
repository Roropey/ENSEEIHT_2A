import java.rmi.*;
import java.rmi.server.*;

public class Publisher {

    public Publisher() throws RemoteException {
    }

    public static void main(String[] args) {
        try {
            MOMItf momItf = (MOMItf)Naming.lookup("//localhost:4000/MOM");
            momItf.publish(args[0], new Message("Hello world"));
            System.out.println("Message publié sur le topic " + args[0]);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
