package yahooOpenHack.test.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;

import net.sf.json.JSONObject;

public class GetJSONResult {
   BufferedReader reader = null;
	public JSONObject get(HttpURLConnection conn){
		String inputLine = "";
		JSONObject jsonResult = null;
        try {
        	reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        	System.out.println("Response status : " + conn.getResponseMessage());
			while ((inputLine = reader.readLine()) != null){
			    System.out.println(inputLine);  
			    jsonResult = JSONObject.fromObject(inputLine);		
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        close();
        conn.disconnect();
		return jsonResult;
	}
	public void close(){
		try {
			reader.close();			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
