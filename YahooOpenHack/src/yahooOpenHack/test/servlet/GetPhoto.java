package yahooOpenHack.test.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yahooOpenHack.test.model.ClientTemp;
import yahooOpenHack.test.model.GetJSONResult;
import yahooOpenHack.test.model.SendAPIQuery;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class GetIP_Location
 */
@SuppressWarnings("restriction")
@WebServlet("/GetIP_Location")
public class GetPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClientTemp client = new ClientTemp("192.168.11.3", 9999);
	int count;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPhoto() {
    	client.ACT001_writeMsg("0\n");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		  int index = 0;
		  HttpURLConnection conn = null;
		  HttpURLConnection conn2 = null;
		  String appid = "63d0f7b2e9592d8f5ad413cc5c60e551";
		  String queryPhotoID = "http://query.yahooapis.com/v1/public/yql?q=select * from flickr.photos.search(50) where text=\"Cat\" and has_geo=1 and api_key="+appid+" limit 20 &format=json&diagnostics=true";
		  String queryPhotoInfo = new String();
		  queryPhotoID = queryPhotoID.replace(" ", "%20"); //要這樣才不會RETURN HTTP 505
		  
		  SendAPIQuery Send_API_query = new SendAPIQuery();
		  GetJSONResult getJSONResult = new GetJSONResult();
		  JSONObject IDResult = new JSONObject();
		  JSONObject InfoResult = new JSONObject();
		  conn = Send_API_query.Connect(queryPhotoID);
		        JSONObject jsonResultforID = getJSONResult.get(conn);
		        JSONObject jsonResultforInfo = null;
		        int length = jsonResultforID.getJSONObject("query").getJSONObject("results").getJSONArray("photo").size();
		       
		        while(index < length){ 
			    IDResult = jsonResultforID.getJSONObject("query").getJSONObject("results").getJSONArray("photo").getJSONObject(index);
		        queryPhotoInfo = "http://query.yahooapis.com/v1/public/yql?q=select id,title,location,dates,farm,server,secret from flickr.photos.info where photo_id="+IDResult.get("id")+" and api_key=\""+appid+"\"&format=json";
		        queryPhotoInfo = queryPhotoInfo.replace(" ", "%20");
		        conn2 = Send_API_query.Connect(queryPhotoInfo);
		        jsonResultforInfo = getJSONResult.get(conn2);
		        InfoResult = jsonResultforInfo.getJSONObject("query").getJSONObject("results").getJSONObject("photo");
		        System.out.println(InfoResult.get("id"));
		        System.out.println(InfoResult.get("title"));
		        System.out.println(InfoResult.get("farm"));
		        System.out.println(InfoResult.get("server"));
		        System.out.println(InfoResult.get("secret"));
		        System.out.println(InfoResult.getJSONObject("dates").get("taken")); 
		        System.out.println(InfoResult.getJSONObject("location").get("latitude"));
		        System.out.println(InfoResult.getJSONObject("location").get("longitude"));
		        index++;
		        }  
		        getJSONResult.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		String id = URLDecoder.decode(request.getParameter("id"),"UTF-8");
		String title = URLDecoder.decode(request.getParameter("title"),"UTF-8");
		String farm = URLDecoder.decode(request.getParameter("farm"),"UTF-8");
		String server = URLDecoder.decode(request.getParameter("server"),"UTF-8");
		String secret = URLDecoder.decode(request.getParameter("secret"),"UTF-8");
		String takendate = URLDecoder.decode(request.getParameter("takendate"),"UTF-8");
		String latitude = URLDecoder.decode(request.getParameter("latitude"),"UTF-8");
		String longitude = URLDecoder.decode(request.getParameter("longitude"),"UTF-8");
		
		
	/*	
		try {
			client.ACT001_writeMsg("1 "+latitude+" "+latitude+" "+longitude+" "+longitude+" "+"\n");
			client.sleep(1000);
			client.ACT001_writeMsg("2 "+latitude+" "+latitude+" "+longitude+" "+longitude+" "+"\n");
			client.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		count++;
		*/
		System.out.println(count);
		System.out.println("id: "+id);
		System.out.println("title: "+title);
		System.out.println("farm: "+farm);
		System.out.println("server: "+server);
		System.out.println("secret: "+secret);
		System.out.println("takenDate: "+takendate);
		System.out.println("latitude: "+latitude);
		System.out.println("longitude: "+longitude);		
	}

}
