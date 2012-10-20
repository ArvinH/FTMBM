package yahooOpenHack.test.servlet;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import yahooOpenHack.test.model.ClientTemp;

/**
 * Servlet implementation class InsertPhotoInfo
 */
@WebServlet("/InsertPhotoInfo")
public class InsertPhotoInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private JSONObject finalResult = new JSONObject();
	private JSONArray tempArray = new JSONArray();
	String id = null;
	String title = null;
	String farm = null;
	String server = null;
	String secret = null;
	String takendate = null;
	String latitude = null;
	String longitude = null;
	String imgUrl = null;
	ClientTemp client = new ClientTemp("10.101.136.32", 9999);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPhotoInfo() {
        super();
        // TODO Auto-generated constructor stub
        client.ACT001_writeMsg("0\n");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		 
		client.ACT001_writeMsg("1#"+latitude+"#"+longitude+"#"+latitude+"#"+longitude+"#"+id+"#"+takendate+"#"+imgUrl+"#"+title+"\n");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
