import java.rmi.*;
import java.rmi.server.UnicastRemoteObject;
import java.rmi.registry.*;
import java.net.*;
import java.util.*;

public class Client extends UnicastRemoteObject implements Client_itf {

	private static HashMap<Integer,SharedObject> MapIntegerToSObject = new HashMap<>();
	//private static HashMap<SharedObject,Integer> DictionnaireSharedObjectInteger = new HashMap<>();
	//private static Server_itf serveur;
	private static Client clientActuel = null;

	public Client() throws RemoteException {
		super();
	}

	

///////////////////////////////////////////////////
//         Interface to be used by applications
///////////////////////////////////////////////////

	// initialization of the client layer
	public static void init() {
		try {
			//Server_itf serveur = (Server_itf) Naming.lookup("//localhost:4000/serveur");
			if (clientActuel == null){
				clientActuel = new Client();
				System.out.println("Création client");
			}
		} catch (Exception e){
			;;
		}
		

	}
	
	// lookup in the name server
	public static SharedObject lookup(String name) {
		try {
			Server_itf serveur = (Server_itf) Naming.lookup("//localhost:4000/serveur");
			int id = serveur.lookup(name);
			System.out.println("Lookup id reçu "+Integer.toString(id));
			if( MapIntegerToSObject.get(id) == null){
				SharedObject sharedObject = new SharedObject(id, null);
				MapIntegerToSObject.put(id,sharedObject);
				return sharedObject;
			} else{
				return MapIntegerToSObject.get(id);
			} 
			/*
			System.out.println("Reussite lookup, id reçu "+Integer.toString(id));
			if (MapIntegerToSObject.containsKey(id)) {
				System.out.println("Id présent");
			} else {
				System.out.println("Id non présent");
			}
			return MapIntegerToSObject.get(id);*/
		} catch (Exception e){
			//e.printStackTrace();
			System.out.println("Echec lookup");
			return null;
		}
		
	}		
	
	// binding in the name server
	public static void register(String name, SharedObject_itf so_itf) {
		try {
			Server_itf serveur = (Server_itf) Naming.lookup("//localhost:4000/serveur");
			SharedObject so = (SharedObject) so_itf;
			System.out.println ("Passage so");
			serveur.register(name,so.getId());
			System.out.println("Reussite register");
		} catch (Exception e){
			System.out.println("Echec register");
			//e.printStackTrace();
		}
	}

	// creation of a shared object
	public static SharedObject create(Object o) {
		try {
			Server_itf serveur = (Server_itf) Naming.lookup("//localhost:4000/serveur");
			int id = serveur.create(o);
			System.out.println("Client id reçu "+Integer.toString(id));
			SharedObject sharedObject = new SharedObject(id, o);
			/*
			DictionnaireSharedObjectInteger.put(sharedObject,id);		
			MapIntegerToSObject.put(id,sharedObject);*/
			MapIntegerToSObject.put(id,sharedObject);
			if (MapIntegerToSObject.containsKey(id)) {
				System.out.println("Ajout id dans l'association id -> objet");
			} else {
				System.out.println("Id non présent");
			}

			return sharedObject;
		} catch (Exception e){
			//e.printStackTrace();
			return null;
		}
	}
	
/////////////////////////////////////////////////////////////
//    Interface to be used by the consistency protocol
////////////////////////////////////////////////////////////

	// request a read lock from the server
	public static Object lock_read(int id) {
		try {
			Server_itf serveur = (Server_itf) Naming.lookup("//localhost:4000/serveur");
			Object objet = serveur.lock_read(id,clientActuel);
			return objet;
		} catch (Exception e){
			//e.printStackTrace();
			return null;
		}
	}

	// request a write lock from the server
	public static Object lock_write (int id) {
		try {
			Server_itf serveur = (Server_itf) Naming.lookup("//localhost:4000/serveur");
			Object objet = serveur.lock_write(id,clientActuel);		
			return objet;
		} catch (Exception e){
			//e.printStackTrace();
			return null;
		}
	}

	// receive a lock reduction request from the server
	public Object reduce_lock(int id) throws java.rmi.RemoteException {
		SharedObject sharedObject = MapIntegerToSObject.get(id);
		sharedObject.reduce_lock();
		return sharedObject.getObj();
	}


	// receive a reader invalidation request from the server
	public void invalidate_reader(int id) throws java.rmi.RemoteException {
		SharedObject sharedObject = MapIntegerToSObject.get(id);
		sharedObject.invalidate_reader();
	}


	// receive a writer invalidation request from the server
	public Object invalidate_writer(int id) throws java.rmi.RemoteException {
		SharedObject sharedObject = MapIntegerToSObject.get(id);
		sharedObject.invalidate_reader();
		return sharedObject.getObj();
	}
}
