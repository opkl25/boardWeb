<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	//searchValue가 null이면 검색버튼을 누르지 않고 화면으로 돌아옴.
	String searchValue = request.getParameter("searchValue");
	String searchType = request.getParameter("searchType");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pass = "1234";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	try{
		
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,pass);
		String sql = "select * from member";
		
		
		
		if(searchValue != null && !searchValue.equals("")){
			if(searchType.equals("membername")){
				sql += " where membername = '"+searchValue+"'";	
			}else if(searchType.equals("addr")){
				sql += " where addr like '%"+searchValue+"%'";
			}
			
		}
		
		psmt = conn.prepareStatement(sql);
		
		rs = psmt.executeQuery();	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/base.css" rel="stylesheet">
</head>
<body>
<%@include file="/header.jsp" %>
	<section>
		<h2>게시글 목록</h2>
		<article>
		<div class="searchArea">
			<form action="list.jsp">
				<select name="searchType">
					<option value="membername" <%if(searchType !=null && searchType.equals("membername")) out.print("selected");%>>회원이름</option>
					<option value="addr" <%if(searchType !=null && searchType.equals("addr")) out.print("selected");%>>주소</option>
				</select>
				<input type="text" name="searchValue" <%if(searchValue !=null && !searchValue.equals("")) out.print("value='"+searchValue+"'");%>>
				<input type="submit" name="검색">
			</form>
		</div>
		<table border ="1">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<%
					while(rs.next()){
						%>
						<tr>
							<td><%= rs.getInt("midx") %></td>
							<td><a href="view.jsp?midx=<%= rs.getInt("midx")%>"><%= rs.getString("membername") %></a></td>
							<td><%= rs.getString("addr") %></td>
						</tr>
						
					<% 
						}
						/*
						
						각 회원명 클릭시 상세페이지 이동할 수 있도록 구현하세요.
						view.jsp
						회원 아이디,회원 비밀번호,회원명,주소,연락처,이메일 테이블로 출력(3행2열)
						
						*/
						
						
						%>
					
				
				
			</tbody>
		</table>
		<button onclick="location.href='insert.jsp'">등록</button>
		</article>
	</section>
	<%@include file="/footer.jsp" %>
</body>
</html>
<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{ //다쓴다음에는 반드시 반납.
		if(conn != null){
			conn.close();
			
		}
		if(psmt != null){
			psmt.close();
		}
		if(rs != null){
			rs.close();
		}
	}
	
	
%>
