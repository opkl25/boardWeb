<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	
	String memberpwd = request.getParameter("memberpwd");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String midx = request.getParameter("midx");
	
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pass = "1234";
	
	Connection conn =null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	 try{
		 Class.forName("oracle.jdbc.driver.OracleDriver");
 		conn = DriverManager.getConnection(url,user,pass);
		 
		 String sql = " update member set "
		 		 +",memberpwd = '"+memberpwd+"' "
		 		 +",addr = '"+addr+"' "
		 		 +",phone = '"+phone+"' "
		 		 +",email = '"+email+"' "
		 		 +"where midx="+midx;
		 
		 
		 psmt = conn.prepareStatement(sql);
		 int result = psmt.executeUpdate();
		 
		 if(result>0){
			// out.print("<script>alert('수정완료!');</script>");
			response.sendRedirect("view.jsp?midx=+midx");
		 }else{
			 //out.print("<script>alert('수정실패!');</script>");
			 response.sendRedirect("list.jsp");
		 }
		 
	 }catch(Exception e){
		 e.printStackTrace();
	 }finally{
		 if(conn != null) conn.close();
		 if(psmt != null) psmt.close();
		 if(rs != null) rs.close();
	 }
%>
