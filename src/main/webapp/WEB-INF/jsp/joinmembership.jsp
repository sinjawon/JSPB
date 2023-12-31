<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/login.js" defer></script>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
</head>
<body>
 
 	<form action="../api/insert/joinmember.jsp">
 	<label for="name">이름:</label><input type="text" id="name">
 	<label for="nickname">닉네임:</label><input type="text" id="nickname"><button  onclick="logincheckID()">닉네임 중복체크</button>
 	<label for="userid">아이디:</label><input type="text" id="userid"><button  onclick="logincheckID()">아이디 중복체크</button>
 	<label for="password">비밀번호:</label><input type="text" id="password">
 	<label for="passwordcheck">비밀번호 확인:</label><input type="text" id="passwordcheck">
 	<input type="submit" value="가입">
 	</form>
</body>
</html>