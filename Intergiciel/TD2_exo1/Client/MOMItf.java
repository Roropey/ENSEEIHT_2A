import java.rmi.*;

public interface MOMItf extends Remote {
    public void publish(String topic, Message message) throws RemoteException;
    public void subscribe(String topic, CallBack cb) throws RemoteException;
}
