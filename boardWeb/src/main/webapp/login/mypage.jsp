<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="boardWeb.*" %>
<%
String memberid = request.getParameter("memberid");
String membername = request.getParameter("membername");

Connection conn= null;
PreparedStatement psmt= null;
ResultSet rs= null;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>회원이름</th>
			<td><%=membername %></td>
			<th>회원아이디</th>
			<td><%=memberid %></td>
		</tr>
	</table>
</body>
</html>