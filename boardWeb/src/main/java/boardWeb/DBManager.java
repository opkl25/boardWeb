package boardWeb;

import java.sql.*;


public class DBManager {

	
	public static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	public static String user = "system";
	public static String pass = "1234";
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url,user,pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	   }
	
	public static void close(PreparedStatement psmt, Connection conn) {
		try {
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement psmt, Connection conn,ResultSet rs) {
		try {
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
			if(rs !=null) rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
