package yahooOpenHack.test.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
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
import yahooOpenHack.test.model.Constant;
import yahooOpenHack.test.model.GetJSONResult;
import yahooOpenHack.test.model.SendAPIQuery;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class GetIP_Location
 */

@WebServlet("/GetIP_Location")
public class GetPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String id = null;
	String title = null;
	String farm = null;
	String server = null;
	String secret = null;
	String takendate = null;
	String latitude = null;
	String longitude = null;
	String imgUrl = null;
//	ClientTemp client = new ClientTemp("192.168.11.2", Constant.PORT);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPhoto() {
//		client.ACT001_writeMsg("0\n");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
/*		
		client.ACT001_writeMsg("2#"+21+"#"+21+"#"+122+"#"+122+"\n");
		while(client.getMsg().isEmpty()){
			System.out.println("\\");
		} 
		if(client.getMsg().getFirst().equals("nothing found")){
			System.out.println("nothing found");
		}
		else{
			for(int i = 0; i< client.getMsg().size(); i++){
		 System.out.println("ggggggggggggggggg"+client.getMsg().get(i).toString()+"gggggggggggggg");
			}
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		
		 id = URLDecoder.decode(request.getParameter("id"),"UTF-8");
		 title = URLDecoder.decode(request.getParameter("title"),"UTF-8");
		 farm = URLDecoder.decode(request.getParameter("farm"),"UTF-8");
		 server = URLDecoder.decode(request.getParameter("server"),"UTF-8");
		 secret = URLDecoder.decode(request.getParameter("secret"),"UTF-8");
		 takendate = URLDecoder.decode(request.getParameter("takendate"),"UTF-8");
		 latitude = URLDecoder.decode(request.getParameter("latitude"),"UTF-8");
		 longitude = URLDecoder.decode(request.getParameter("longitude"),"UTF-8");
		 imgUrl = "http://farm"+farm+".staticflickr.com/"+server+"/"+id+"_"+secret+".jpg";

	//	client.ACT001_writeMsg("1#"+latitude+"#"+longitude+"#"+latitude+"#"+longitude+"#"+id+"#"+takendate+"#"+imgUrl+"#"+title+"\n");
		
		System.out.println("id: "+id);
		System.out.println("imgUrl: "+imgUrl);
		response.setContentType("application/json");
		PrintWriter pw = response.getWriter();  
		JSONObject Result = new JSONObject();
		Result.put("id", id);
		Result.put("latitude", latitude);
		Result.put("longitude", longitude);
		Result.put("imgUrl", imgUrl);
		pw.println(Result);  
        pw.close();  
	}

}
