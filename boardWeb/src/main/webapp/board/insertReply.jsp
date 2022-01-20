<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardWeb.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.*"%>

<%
	request.setCharacterEncoding("UTF-8");

String bidx = request.getParameter("bidx");
String rcontent = request.getParameter("rcontent");


Member loginUser = (Member)session.getAttribute("loginUser");

int midx = loginUser.getMidx();

Connection conn =  null;
PreparedStatement psmt = null;
ResultSet rs = null;


try{
	conn = DBManager.getConnection();
	String  sql = "insert into reply(ridx,bidx,midx,rcontent,rdate)values(ridx_seq.nextval,?,?,?,sysdate)";
	
	psmt = conn.prepareStatement(sql);
	
	psmt.setInt(1,Integer.parseInt(bidx));
	psmt.setInt(2,midx);
	psmt.setString(3,rcontent);
	
	psmt.executeUpdate();
	
	sql = "select * from reply r, member m where r.midx = m.midx and r.ridx = (select max(ridx) from reply)";
	
	psmt = conn.prepareStatement(sql);
	
	rs = psmt.executeQuery();
	
	JSONArray list = new JSONArray();
	if(rs.next()){
		JSONObject jobj = new JSONObject();
		jobj.put("bidx",rs.getInt("bidx"));
		jobj.put("midx",rs.getInt("midx"));
		jobj.put("ridx",rs.getInt("ridx"));
		jobj.put("rcontent",rs.getString("rcontent"));
		jobj.put("membername",rs.getString("membername"));
		
		list.add(jobj);
	}
	
	
	out.print(list.toJSONString());
	
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBManager.close(psmt,conn,rs);
}
%>