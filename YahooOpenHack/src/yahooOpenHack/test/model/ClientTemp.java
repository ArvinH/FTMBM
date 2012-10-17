package yahooOpenHack.test.model;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;

public class ClientTemp extends Thread {

	private Socket clientSocket = null;
	public ClientTemp(String addr, int port)
	{
		this.clientSocket = new Socket();
        InetSocketAddress isa = new InetSocketAddress(addr, port);
        try {
        	this.clientSocket.connect(isa, 10000);
            this.start();
        } catch (java.io.IOException e) {
            System.out.println("Socket連線有問題 !");
            System.out.println("IOException :" + e.toString());
        }
	}
	public void run() {
        while(this.clientSocket.isConnected()) {
			byte byte_buffer[] = new byte[2000];
	        try {
	        	InputStream reader = this.clientSocket.getInputStream();
	        	int inputLength = reader.read(byte_buffer);
	        	String strMessage = new String(byte_buffer,0,inputLength - 1);
				System.out.println(strMessage);
				sleep(20);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    }
	public void ACT001_writeMsg(String msg)
	{
		try {
			OutputStream out = this.clientSocket.getOutputStream();
			out.write(msg.getBytes());
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*
	public static void main(String[] args) {
		ClientTemp client = new ClientTemp("127.0.0.1", 9999);
		try {
			Thread.sleep(1000);
			client.ACT001_writeMsg("0\n");
			Thread.sleep(1000);
			client.ACT001_writeMsg("1 0 0 0 0\n");
			Thread.sleep(1000);
			client.ACT001_writeMsg("1 2 2 2 2\n");
			Thread.sleep(1000);
			client.ACT001_writeMsg("1 1 2 1 2\n");
			Thread.sleep(1000);
			client.ACT001_writeMsg("1 6 7 6 7\n");
			Thread.sleep(1000);
			client.ACT001_writeMsg("2 0 0 3 3\n");
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}*/

}
