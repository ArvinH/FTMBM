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

public class GetDataModel {
	private Connection conn = null; 
	private Statement stmt = null; 
	private ResultSet rs = null; 
	private ResultSetMetaData md = null; 
	private PreparedStatement pst = null; 
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3307/test?useUnicode=true&characterEncoding=UTF-8";
	private String user = "mysql";
	private String passwd = "YOH6";
	private String selectSQL = "select * from image";
	private JSONArray queryResult = new JSONArray();
	private JSONObject tempResultObject = new JSONObject();
	private JSONArray tempResultArray = new JSONArray();
	private String GroupID = "0";
	public GetDataModel(){
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
	public JSONArray SelectTable() {
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(selectSQL);
			md = (ResultSetMetaData) rs.getMetaData();
			for (int i = 1; i <= md.getColumnCount(); i++) {
				System.out.print(md.getTableName(i)+".");
				System.out.print(md.getColumnName(i) + "\t\t");
			}
			System.out.println();
			
			while (rs.next()) {
				for (int i = 1; i <= md.getColumnCount(); i++) {
					tempResultObject.put(md.getColumnName(i), rs.getString(i));
				}
				
				if(!rs.getString("GroupId").equals(GroupID)){
					queryResult.add(tempResultArray);
					GroupID = rs.getString("GroupId");
					tempResultArray = new JSONArray();
					tempResultArray.add(tempResultObject);
				}
				else{
					tempResultArray.add(tempResultObject);
				}	
			}
			queryResult.add(tempResultArray);
		} catch (SQLException e) {
			System.out.println("DropDB Exception :" + e.toString());
		} finally {
			Close();
		}
		return queryResult;
	}

	private void Close() {
		try {
			if (rs != null) {
				rs.close();
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
