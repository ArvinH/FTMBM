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

	public class InsertDataModel {
		private Connection conn = null; 
		private Statement stmt = null; 
		private ResultSet rs = null; 
		private ResultSetMetaData md = null; 
		private PreparedStatement pst = null; 
		private String driver = "com.mysql.jdbc.Driver";
		private String url = "jdbc:mysql://127.0.0.1:3307/test?useUnicode=true&characterEncoding=UTF-8";
		private String user = "mysql";
		private String passwd = "YOH6";
		private JSONArray queryResult = new JSONArray();
		private JSONObject tempResultObject = new JSONObject();
		private JSONArray tempResultArray = new JSONArray();
		private String GroupID = "0";
		public InsertDataModel(){
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
		public void CreateTabel(String createdbSQL){
			try 
		    { 
		      stmt = conn.createStatement(); 
		      stmt.executeUpdate(createdbSQL); 
		      
		    } 
		    catch(SQLException e) 
		    { 
		      System.out.println("CreateDB Exception :" + e.toString()); 
		    } 
		    finally 
		    { 
		      Close(); 
		    } 
		}
		public void InsertTable(String insertdbSQL, String[] list){
		 	try 
		    { 
		      pst = conn.prepareStatement(insertdbSQL); 
		      
		      int index = 1;
		      while(index <= list.length)
		      {
		    	  pst.setString(index, list[index - 1]);
		    	  index = index + 1;
		      }
		      pst.executeUpdate(); 
		    } 
		    catch(SQLException e) 
		    { 
		      System.out.println("InsertDB Exception :" + e.toString()); 
		    } 
		    finally 
		    { 
		      Close(); 
		    } 
		}
		public void DropTable(String dropdbSQL){
			try 
		    { 
		      stmt = conn.createStatement(); 
		      stmt.executeUpdate(dropdbSQL);
		    } 
		    catch(SQLException e) 
		    { 
		      System.out.println("DropDB Exception :" + e.toString()); 
		    } 
		    finally 
		    { 
		      Close(); 
		    } 
		}
		public boolean isExist(String tableName){
			  try { 
				  Statement stmt = conn.createStatement(); 
				  stmt.executeQuery( "select   count(*)   from   " + tableName); 
			  } 
			  catch(SQLException   e) 
			  { 
			      return false;
			  }
			  return true;
		}
		public void disconnection(){
			try {
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch(SQLException e){
				System.out.println("disconnection Exception :" + e.toString());
			}
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
