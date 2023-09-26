import java.net.*;
import java.io.*;

public class UsagerClient extends Thread {

    final static int nb = 3;
    static String document[] = new String[nb];
    final static String hosts[] = {"localhost", "localhost", "localhost"};

    int fragment;

    public UsagerClient(int i) {
        this.fragment = i;
    }

    public void run() {
        try {
            System.out.println("Début du thread " + this.fragment);
            Socket s = new Socket(hosts[this.fragment], 8080+this.fragment);

            OutputStream os = s.getOutputStream();
            InputStream is = s.getInputStream();
            ObjectOutputStream oos = new ObjectOutputStream(os);
            ObjectInputStream ois = new ObjectInputStream(is);

            oos.writeObject(this.fragment);
            document[this.fragment] = (String)ois.readObject();
            System.out.println("Fragment " + this.fragment + " bien reçu");

            oos.close();
            ois.close();
            os.close();
            is.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        try {
            Thread t[] = new Thread[nb];
            for (int i = 0; i < nb; i++) {
                t[i] = new UsagerClient(i);
                t[i].start();
            }

            for (int i = 0; i < nb; i++) {
                t[i].join();
                System.out.println("Fin du thread " + i);
            }

            for (int i = 0; i < nb; i++) {
                System.out.println(document[i]);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

