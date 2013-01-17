package yahooOpenHack.test.servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import yahooOpenHack.test.model.ClientTemp;
import yahooOpenHack.test.model.InsertDataModel;

/**
 * Servlet implementation class InsertPhotoInfo
 */
@WebServlet("/InsertPhotoInfo")
public class InsertPhotoInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String dropTable2 = "DROP TABLE Image ";
	private String createTable2 = "CREATE TABLE Image (" + 
			"    GroupId     INTEGER " +
		    "  , photoId     VARCHAR(30) " +
			"  , takenTime   VARCHAR(20) " +
			"  , imgURL      VARCHAR(100) " +
			"  , longitude   VARCHAR(20) " +
			"  , latitude    VARCHAR(20) " +
			"  , distance    VARCHAR(20) " +
			"  , time        VARCHAR(15)) ";
	private String insertdbTable2 = "insert into Image(GroupId,photoId,takenTime,imgURL,longitude,latitude,distance,time) " + 
		      "values(?,?,?,?,?,?,?,?)";
	private String[] listAttrTable2 = {"GroupId", "photoId", "takenTime", "imgURL", "longitude", "latitude", "distance", "time"};
	private String[] list = null;
	String id = null;
	String title = null;
	String farm = null;
	String server = null;
	String secret = null;
	String takendate = null;
	String latitude = null;
	String longitude = null;
	String imgUrl = null;
	ClientTemp client = new ClientTemp("192.168.1.160", 9999);
	String clientTime = null;
	int TimeDiff;

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
		 clientTime = URLDecoder.decode(request.getParameter("clientTime"),"UTF-8");
		 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 try {
			System.out.println(clientTime);
			Date CTime = dateFormat.parse(clientTime);
			Date TTime = dateFormat.parse(takendate);
			TimeDiff = Math.abs(CTime.getHours()-TTime.getHours());
			System.out.println(TimeDiff);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(TimeDiff <= 2){
		list = (latitude+"#"+longitude+"#"+latitude+"#"+longitude+"#"+id+"#"+takendate+"#"+imgUrl+"#"+title).split("#");
		//懶得改承駿的code，他寫得太複雜= =  之後再改
		InsertDataModel insertDatamodel = new InsertDataModel();
			if(insertDatamodel.isExist("Image")) {
			insertDatamodel.InsertTable(insertdbTable2, list);
		}
		else{
			insertDatamodel.CreateTabel("Image");
			insertDatamodel.InsertTable(insertdbTable2, list);
		}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		client.ACT001_writeMsg("3\n");
	}

}
