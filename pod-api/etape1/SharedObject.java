import java.io.*;

public class SharedObject implements Serializable, SharedObject_itf {
	
	private int id;
	public Object obj;
	private enum lock {NL,
					RLC,
					WLC,
					RLT,
					WLT,
					RLT_WLC,
	}
	private lock lock_state;
	// 0 : NL
	// 1 : RLC
	// 2 : WLC
	// 3 : RLT
	// 4 : WLT
	// 5 : RLT_wLC

	public SharedObject(int id, Object objet){
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
	public void lock_read() {
		switch (this.lock_state){
			case NL :
				//this.obj = 
				Client.lock_read(id);
			case RLC :
				this.lock_state = lock.RLT;
				break;
			case WLC :
				this.lock_state = lock.RLT_WLC;
				break;
			default :
				;;
						
		}

	}

	// invoked by the user program on the client node
	public void lock_write() {
		switch (this.lock_state){
			case NL : 				
			case RLC :
				//this.obj = 
				Client.lock_write(id);	
			case WLC :
				this.lock_state = lock.WLT;
				break;
			default:
				;;
		}
	}

	// invoked by the user program on the client node
	public synchronized void unlock() {
		switch (this.lock_state){
			case RLT : 
				this.lock_state = lock.RLC;
				break;
			case WLT :
			case RLT_WLC:
				this.lock_state = lock.WLC;
				break;
			default:
				;;
		}
	}


	// callback invoked remotely by the server
	public synchronized Object reduce_lock() {
		switch (this.lock_state){
			case WLT :
			case WLC :
				this.lock_state = lock.RLC;
				break;
			case RLT_WLC :
				this.lock_state = lock.RLT;
				break;
			default :
				;;
		}
		return this;
	}

	// callback invoked remotely by the server
	public synchronized void invalidate_reader() {
		switch (this.lock_state){
			case RLC :
			case RLT :
				this.lock_state = lock.NL;
				break;
			default :
				;;
		}
	}

	public synchronized Object invalidate_writer() {
		switch (this.lock_state){
			case WLT :
			case WLC :
			case RLT_WLC :
				this.lock_state = lock.NL;
				break;
			default :
				;;
		}
		return this;
	}
}
