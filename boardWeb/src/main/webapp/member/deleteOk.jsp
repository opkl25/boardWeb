<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

	String midx = request.getParameter("midx");
	
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pass = "1234";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	 
	try{
		 Class.forName("oracle.jdbc.driver.OracleDriver");
 		 conn = DriverManager.getConnection(url,user,pass);
		 
		 String sql = " delete from member where midx="+midx;
		 		
		 
		 psmt = conn.prepareStatement(sql);
		 int result = psmt.executeUpdate();
		 
		 
		response.sendRedirect("list.jsp");
		
	 }catch(Exception e){
		 e.printStackTrace();
	 }finally{
		 if(conn != null) conn.close();
		 if(psmt != null) psmt.close();
	 }
%>