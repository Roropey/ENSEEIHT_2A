import java.net.*;
import java.io.*;

public class UsagerServer_i {

    final static int nb = 3;
    static String document[] = new String[nb];

    public static void main(String[] args) {

        document[0] = "Début du document.";
        document[1] = "Milieu du document.";
        document[2] = "Fin du document.";

        try {
            int numero = Integer.parseInt(args[0]);
            System.out.println("Je suis UsagerServer_" + numero);

            ServerSocket ss = new ServerSocket(8080+numero);

            while (true) {
                Socket s = ss.accept();

                OutputStream os = s.getOutputStream();
                InputStream is = s.getInputStream();
                ObjectOutputStream oos = new ObjectOutputStream(os);
                ObjectInputStream ois = new ObjectInputStream(is);

                int fragment = (int)ois.readObject();
                System.out.println("Demande du fragment " + fragment + " reçue");
                oos.writeObject(document[fragment]);
                System.out.println("Fragment " + fragment + " envoyé");

                oos.close();
                ois.close();
                os.close();
                is.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
