<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="../api/select/logincheck.jsp">	
 	<label for="userid">아이디:</label><input type="text" name="userid">
 	<label for="password">비밀번호:</label><input type="text" name="password">
 	<input type="submit" value="로그인">
 	</form>
 	 <%-- 로그인 실패 시 에러 메시지가 있으면 표시 --%>
 	     <%
 	     String loginsuccess = (String)session.getAttribute("UserNum");	     
 	     %>
        <% String loginError = (String)session.getAttribute("loginError");%>
        <% if (loginError != null) { %>
            <p style="color: red;"><%= loginError %></p>
        <% } %>
 	<a href="http://localhost:8080/app/joinmembership.jsp">회원가입</a>
</body>
</html>