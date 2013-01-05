package yahooOpenHack.test.model;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.mysql.jdbc.ResultSetMetaData;

public class SignUPModel {
	private Connection conn = null; 
	private Statement stmt = null; 
	private ResultSet rsid = null;
	private ResultSet rs = null; 
	private ResultSetMetaData md = null; 
	private PreparedStatement pst = null; 
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3307/test?useUnicode=true&characterEncoding=UTF-8";
	private String user = "mysql";
	private String passwd = "YOH6";

	public SignUPModel(){
		try {
			Class.forName(driver); 
			conn = DriverManager.getConnection(url, user, passwd);


		} catch (ClassNotFoundException e) {
			System.out.println("DriverClassNotFound :" + e.toString());
		} 
		catch (SQLException x) {
			System.out.println("Exception :" + x.toString());
		}
	}
	public void insertTable(String username, String passwd, String gender, String age){
		// create our java jdbc statement
		int id = 0;
		try {
			stmt = conn.createStatement();
			rsid = stmt.executeQuery("select COUNT(*) as numbers from Member");
			rsid.next();
			String currentNumbers = rsid.getString("numbers");
			if(Integer.parseInt(currentNumbers) == 0){
				id = 1;
			}
			else {
				id = Integer.parseInt(currentNumbers) + 1;
			}
			System.out.println(id+" "+username+" "+passwd+" "+gender+" "+age);
			stmt.executeUpdate("INSERT INTO Member " + "VALUES ("+id+", '"+username+"', '"+passwd+"', '"+gender+"', '"+age+"',NOW(),NOW())");	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}

	private void Close() {
		try {
			if (rs != null) {
				rsid.close();
				rs.close();
				rsid = null;
				rs = null;
			}
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
			if (pst != null) {
				pst.close();
				pst = null;
			}
		} catch (SQLException e) {
			System.out.println("Close Exception :" + e.toString());
		}
	}

}

