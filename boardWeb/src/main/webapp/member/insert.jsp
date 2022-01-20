<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h2>회원 등록</h2>
			<article>
				<form action="insertOk.jsp" method="post">
					<table border="1">
						<tr>
							<th>회원아이디</th>
							<td><input type="text" name="memberid"></td>
							<th>회원비밀번호</th>
							<td><input type="text" name="memberpwd"></td>
						</tr>
						<tr>
							<th>회원이름</th>
							<td><input type="text" name="membername"></td>
							<th>성별</th>
							<td>
							<input type="radio" name="gender" value="M">남
							<input type="radio" name="gender" value="F">여
							
							</td>
						</tr>
						<tr>
							<th>회원연락처</th>
							<td></td>
							<th>회원 이메일</th>
							<td></td>
						</tr>
					</table>
					<input type="button" value="취소" onclick="location.href='list.jsp'">
					<input type="submit" value="등록">
				</form>
			</article>
		</section>
	<%@include file="/footer.jsp" %>
</body>
</html>
