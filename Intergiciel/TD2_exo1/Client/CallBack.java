import java.rmi.*;

public interface CallBack extends Remote {
    public void onMessage(Message message) throws RemoteException;
}
