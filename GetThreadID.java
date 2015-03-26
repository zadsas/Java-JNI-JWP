import java.io.IOException;

public class GetThreadID extends Thread {
    	public static native int get_tid();

    	static {
        	System.loadLibrary("GetThreadID");
    	}

	public void run() {
		int tid = get_tid();
		try {
			System.out.println("Thread started, TID=" + tid);
			Thread.sleep(60000);
			System.out.println("Thread finished, TID=" + tid);
		} catch (InterruptedException ex) {
			System.out.println("Thread interrupted, TID=" + tid);
			Thread.currentThread().interrupt();
		}
	}	

	public static void main(String[] args) throws InterruptedException {
		int tid = get_tid();
		System.out.println("Main thread, TID=" + tid);

		Thread t1 = new GetThreadID();
		Thread t2 = new GetThreadID();
		t1.start();
		t2.start();
		Thread.sleep(30000);
		t1.interrupt();
		t2.interrupt();
	}
}
