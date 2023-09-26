import java.rmi.*;

public class RE {

    public static void main(String[] args) {
        try {
            DaemonItf d = (DaemonItf)Naming.lookup(args[0]);
            d.invoke(args[1]);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
