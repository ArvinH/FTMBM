package yahooOpenHack.test.model;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

public class SendAPIQuery {
	public HttpURLConnection Connect(String queryString){
		URL url;
		HttpURLConnection conn = null;
		try {
			url = new URL(queryString);
			conn = (HttpURLConnection)url.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded"); 
			conn.connect();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return conn;	
	}
}
