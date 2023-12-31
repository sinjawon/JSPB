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
 	<a href="http://localhost:8080/app/joinmembership.jsp">회원가입</a>
</body>
</html>