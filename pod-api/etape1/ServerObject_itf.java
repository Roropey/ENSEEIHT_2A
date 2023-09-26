public interface ServerObject_itf {
	public void lock_read(Client_itf client) throws java.rmi.RemoteException;
	public void lock_write(Client_itf client) throws java.rmi.RemoteException;
}