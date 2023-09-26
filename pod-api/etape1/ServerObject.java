import java.io.*;
import java.util.*;

public class ServerObject implements Serializable, ServerObject_itf {
	
	private int id;
	private Object obj;
	private enum lock {NL,
					RL,
					WL
	}
	private List<Client_itf> clientUtilisateur;
	private lock lock_state;

	public ServerObject(int id, Object objet){
		this.id = id;
		this.obj = objet;
		this.lock_state = lock.NL;
	}

	public int getId() {
		return id;
	}

	public Object getObj() {
		return obj;
	}

	

	// invoked by the user program on the client node
	public void lock_read(Client_itf client) throws java.rmi.RemoteException{
		switch (this.lock_state){
			case WL :
				Client_itf ancienUtilisateur = clientUtilisateur.remove(0);
				Server.reduce_lock(id,ancienUtilisateur);
			case NL :
				this.lock_state = lock.RL;
			case RL :
				clientUtilisateur.add(client);
		}
	}

	// invoked by the user program on the client node
	public void lock_write(Client_itf client) throws java.rmi.RemoteException{
		switch (this.lock_state){
			case RL :
				while (!clientUtilisateur.isEmpty()) {
					Client_itf ancienUtilisateur = clientUtilisateur.remove(0);
					Server.invalidate_reader(id,ancienUtilisateur);	
				}							
			case NL :
				this.lock_state = lock.WL;	
				clientUtilisateur.add(client);
				break;
			case WL :
				Client_itf ancienUtilisateur = clientUtilisateur.remove(0);
				Server.invalidate_writer(id,ancienUtilisateur);
				clientUtilisateur.add(client);
		}
	}
}
