package yahooOpenHack.test.model;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.LinkedList;

import net.sf.json.JSONObject;

public class ClientTemp extends Thread {

	private Socket clientSocket = null;
	private String strMessage = null;
	private String tempNo = null;
	private String GroupNo = "0";
	private Boolean finish = false;
	private LinkedList<String> tempString = new LinkedList<String>();
	private LinkedList<String> linkedListInside = new LinkedList<String>();
	private LinkedList<LinkedList> linkedListOutside = new LinkedList<LinkedList>();
	public ClientTemp(String addr, int port)
	{
		this.clientSocket = new Socket();
        InetSocketAddress isa = new InetSocketAddress(addr, port);
        try {
        	this.clientSocket.connect(isa, 10000);
            this.start();
        } catch (java.io.IOException e) {
            System.out.println("Socket connection error !");
            System.out.println("IOException :" + e.toString());
        }
	}
	public void run() {
        while(this.clientSocket.isConnected()) {
        	
	        try {
	        	DataInputStream reader = new DataInputStream(this.clientSocket.getInputStream());
	        	while((strMessage = reader.readLine()) != null){
	        		tempString.add(strMessage);
	        	}
//	        	while((strMessage = reader.readLine()) != null)
	 //       	{
	        	for(int i=0; i < tempString.size(); i++){
	        	
	        		tempNo = strMessage.split("#")[0];
	        		if(!GroupNo.equals(tempNo)){
	        			GroupNo = tempNo;
	        			//add 
	        			linkedListOutside.add(linkedListInside);
	        			linkedListInside = new LinkedList<String>();
	        			linkedListInside.add(strMessage);
	        			System.out.println(strMessage);
	        		}
	        		else{
	        			linkedListInside.add(strMessage);
	        			System.out.println(strMessage);
	        		}
	        		if(i == (tempString.size() - 1)){
	        			finish = true;
	        		}
	        	}
	  //      	}
	        
	        	
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        finally{
	        	finish = true;
	        }
	        
        }
    }
	public Boolean isFinish(){
		return finish;
	}
	public LinkedList<LinkedList> getMsg(){
		
		return linkedListOutside;
	}
	public void clearLinkedList(){
		linkedListOutside.clear();
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
	public static void main(String[] args) {
		ClientTemp client = new ClientTemp("127.0.0.1", Constant.PORT);
		client.ACT001_writeMsg("0\n");
		client.ACT001_writeMsg("1#0#0#0#0#0xASJDJFFF001#2001/5/6#http://apple.com#cat\n");
		client.ACT001_writeMsg("1#2#2#2#2#0xASJDJFFF001#2051/5/6#http://www.google.com.tw#car\n");
		client.ACT001_writeMsg("1#1#2#1#2#0xASJDJFFF001#2601/5/6#http://www.google.com.tw#tree\n");
		client.ACT001_writeMsg("1#6#7#6#7#0xASJDJFFF001#20331/5/6#http://www.google.com.tw#pig\n");
		client.ACT001_writeMsg("1#6#6#6#6#0xASJDJFFF001#25601/5/6#http://www.google.com.tw#sun\n");
		client.ACT001_writeMsg("2#6#6#10.4#10.4\n");
		client.ACT001_writeMsg("1#0#0#0#0#0xASJDJFFF001#2001/5/6#http://apple.com#cat\n");
		client.ACT001_writeMsg("1#2#2#2#2#0xASJDJFFF001#2051/5/6#http://www.google.com.tw#car\n");
		client.ACT001_writeMsg("1#1#2#1#2#0xASJDJFFF001#2601/5/6#http://www.google.com.tw#tree\n");
		client.ACT001_writeMsg("1#6#7#6#7#0xASJDJFFF001#20331/5/6#http://www.google.com.tw#pig\n");
		client.ACT001_writeMsg("1#6#6#6#6#0xASJDJFFF001#25601/5/6#http://www.google.com.tw#sun\n");
		client.ACT001_writeMsg("2#0#0#4#4\n");
	}
}
