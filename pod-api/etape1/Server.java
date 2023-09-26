import java.rmi.*;
import java.rmi.server.UnicastRemoteObject;
import java.rmi.registry.*;
import java.net.*;
import java.util.*;

public class Server extends UnicastRemoteObject implements Server_itf {

	private static HashMap<Object,Integer> MapObjectToId = new HashMap<>();
	private static HashMap<Integer,ServerObject> DictionnaireServerObject = new HashMap<>();
	private static HashMap<Integer,Client_itf> UtilisationServerObject = new HashMap<>();
	private HashMap<String,Integer> NamesIds;
	private static Integer nbObj = 0;

	public Server() throws RemoteException {
		super();
		this.NamesIds = new HashMap<>();
	}


///////////////////////////////////////////////////
//         Interface to be used by applications
///////////////////////////////////////////////////

	// initialization of the server layer
	public static void init() {
		try {
			Registry registry = LocateRegistry.createRegistry(4000);
			Naming.rebind("//localhost:4000/serveur",new Server());
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	// lookup in the name server
	public int lookup(String name) {
		System.out.println("Lookup serveur "+name);
		int id = NamesIds.get(name);
		System.out.println("Serveur renvoie "+Integer.toString(id));
		return id;

	}		
	
	// binding in the name server
	public void register(String name, int id) {
		
		if (NamesIds.get(name) == null){
			NamesIds.put(name,id);
			if (DictionnaireServerObject.get(id)==null){
				System.out.println("Ajout name -> id sans id -> serverobject");
			}
		} else {
			int id_existant = NamesIds.get(name);
			ServerObject serverObject = DictionnaireServerObject.get(id);
			DictionnaireServerObject.put(id_existant,serverObject);
			NamesIds.put(name,id);
			System.out.println("Remplacement serverObject");
		}
		

	}

	// creation of a shared object
	public int create(Object o) {
		
		if (MapObjectToId.get(o) == null) {
			nbObj +=1;
			ServerObject serverObject = new ServerObject(nbObj, o);
			MapObjectToId.put(o,nbObj);
			DictionnaireServerObject.put(nbObj,serverObject);
		}
		
		return MapObjectToId.get(o);
	}

	//Get object from id
	public Object getObject (int id){
		return DictionnaireServerObject.get(id).getObj();
	}
	
/////////////////////////////////////////////////////////////
//    Interface to be used by the consistency protocol
////////////////////////////////////////////////////////////

	// request a read lock from the client
	public Object lock_read(int id, Client_itf client) throws java.rmi.RemoteException{
		ServerObject serverObject = DictionnaireServerObject.get(id);
		//Client client_non_itf = (Client) client;
		//UtilisationServerObject.put(id,client_non_itf);	
		serverObject.lock_read(client);
		return serverObject.getObj();
			
	}

	// request a write lock from the client
	public Object lock_write (int id, Client_itf client) throws java.rmi.RemoteException{
		
		
		ServerObject serverObject = DictionnaireServerObject.get(id);
		//Client client_non_itf = (Client) client;
		//UtilisationServerObject.put(id,client_non_itf);			
		serverObject.lock_write(client);
		return serverObject.getObj();
		
	}

	public static void reduce_lock(int id, Client_itf client) throws java.rmi.RemoteException{
		//Client clientUtilisateur = UtilisationServerObject.get(id);
		client.reduce_lock(id);
	}

	public static void invalidate_reader(int id, Client_itf client) throws java.rmi.RemoteException{
		//Client clientUtilisateur = UtilisationServerObject.get(id);
		client.invalidate_reader(id);
	}

	public static void invalidate_writer(int id, Client_itf client) throws java.rmi.RemoteException{
		//Client clientUtilisateur = UtilisationServerObject.get(id);
		client.invalidate_writer(id);
	}

	public static void main(String args[]) {
		Server.init();
		System.out.println("Serveur initialisé.");
		//Server.start();
		//System.out.println("Serveur tourne.");
	}

}
